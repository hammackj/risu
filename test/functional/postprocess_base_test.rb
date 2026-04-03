# Copyright (c) 2010-2026 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'test_helper'

class PostProcessBaseTest < ActiveSupport::TestCase
	include Risu::Models

	def setup
		setup_test_database
	end

	test "PostProcessBase should register subclasses" do
		assert Risu::Base::PostProcessBase.possible_postprocesses.size > 0
	end

	test "PostProcessBase equality with matching plugin_ids" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 100 }
		b.info = { :plugin_id => 100 }
		assert a == b
	end

	test "PostProcessBase inequality with different plugin_ids" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 100 }
		b.info = { :plugin_id => 200 }
		assert a != b
	end

	test "PostProcessBase equality returns false when info is nil" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = nil
		b.info = { :plugin_id => 100 }
		assert a != b
	end

	test "PostProcessBase equality returns false when other is nil" do
		a = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 100 }
		assert a != nil
	end

	test "PostProcessBase spaceship operator less than" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 100 }
		b.info = { :plugin_id => 200 }
		assert_equal(-1, a <=> b)
	end

	test "PostProcessBase spaceship operator greater than" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 200 }
		b.info = { :plugin_id => 100 }
		assert_equal 1, a <=> b
	end

	test "PostProcessBase spaceship operator equal" do
		a = Risu::Base::PostProcessBase.new
		b = Risu::Base::PostProcessBase.new
		a.info = { :plugin_id => 100 }
		b.info = { :plugin_id => 100 }
		assert_equal 0, a <=> b
	end

	test "PostProcessBase calculate_severity returns higher severity" do
		pp = Risu::Base::PostProcessBase.new
		assert_equal 4, pp.calculate_severity(2, 4)
	end

	test "PostProcessBase calculate_severity returns current when higher" do
		pp = Risu::Base::PostProcessBase.new
		assert_equal 4, pp.calculate_severity(4, 2)
	end

	test "PostProcessBase has_findings returns false with no matching items" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = { :plugin_ids => [-999999] }
		assert_equal false, pp.has_findings
	end

	test "PostProcessBase has_findings returns true with matching items" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = { :plugin_ids => [99999] }
		assert_equal true, pp.has_findings
	end

	test "PostProcessBase has_host_findings returns true for host with items" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = { :plugin_ids => [99999] }
		assert_equal true, pp.has_host_findings(Host.first.id)
	end

	test "PostProcessBase has_host_findings returns false for host without items" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = { :plugin_ids => [-999999] }
		assert_equal false, pp.has_host_findings(Host.first.id)
	end

	test "PostProcessBase run skips when no findings exist" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888888,
			:plugin_name => "Test Rollup",
			:item_name => "Test Item",
			:plugin_ids => [-777777, -777778]
		}
		item_count_before = Item.count
		pp.run
		assert_equal item_count_before, Item.count, "No items should be created when no findings match"
	end

	test "PostProcessBase create_item creates a new item" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888888,
			:item_name => "Test Rollup Item"
		}
		item_count_before = Item.count
		pp.create_item(Host.first.id, 4)
		assert_equal item_count_before + 1, Item.count
	end

	test "PostProcessBase create_item sets rollup_finding to true" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888888,
			:item_name => "Test Rollup Item"
		}
		pp.create_item(Host.first.id, 4)
		item = Item.where(:plugin_id => -888888).first
		assert_equal true, item.rollup_finding
	end

	test "PostProcessBase create_plugin creates a new plugin" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888888,
			:plugin_name => "Test Rollup Plugin",
			:description => "Test description",
			:plugin_ids => [99999, 99998]
		}
		pp.create_plugin
		plugin = Plugin.find_by_id(-888888)
		assert plugin != nil, "Rollup plugin should be created"
		assert_equal "Test Rollup Plugin", plugin.plugin_name
	end

	test "PostProcessBase create_plugin sets rollup to true" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888889,
			:plugin_name => "Test Rollup",
			:description => "Test",
			:plugin_ids => [99999]
		}
		pp.create_plugin
		plugin = Plugin.find_by_id(-888889)
		assert_equal true, plugin.rollup
	end

	test "PostProcessBase create_plugin inherits highest risk factor" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888890,
			:plugin_name => "Test Rollup",
			:description => "Test",
			:plugin_ids => [99999, 99998, 99997]
		}
		pp.create_plugin
		plugin = Plugin.find_by_id(-888890)
		assert_equal "Critical", plugin.risk_factor, "GOT #{plugin.risk_factor}"
	end

	test "PostProcessBase create_plugin inherits highest cvss score" do
		pp = Risu::Base::PostProcessBase.new
		pp.info = {
			:plugin_id => -888891,
			:plugin_name => "Test Rollup",
			:description => "Test",
			:plugin_ids => [99999, 99998, 99997]
		}
		pp.create_plugin
		plugin = Plugin.find_by_id(-888891)
		assert_equal 10.0, plugin.cvss_base_score.to_f, "GOT #{plugin.cvss_base_score}"
	end

	test "each postprocessor should respond to run" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			assert instance.respond_to?(:run), "#{klass.name} does not respond to run"
		end
	end

	test "each postprocessor with plugin_ids should have an Array" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			next if instance.info[:plugin_ids].nil?
			assert instance.info[:plugin_ids].is_a?(Array), "#{klass.name} plugin_ids is not an Array"
		end
	end

	test "each postprocessor plugin_ids should all be Integers" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			next if instance.info[:plugin_ids].nil?
			instance.info[:plugin_ids].each do |pid|
				assert pid.is_a?(Integer), "#{klass.name} has non-Integer plugin_id: #{pid} (#{pid.class})"
			end
		end
	end

	test "each postprocessor should have no duplicate plugin_ids" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			next if instance.info[:plugin_ids].nil?
			ids = instance.info[:plugin_ids]
			dupes = ids.select { |id| ids.count(id) > 1 }.uniq
			assert dupes.empty?, "#{klass.name} has duplicate plugin_ids: #{dupes}"
		end
	end
end
