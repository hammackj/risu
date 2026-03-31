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

class RootCauseTest < ActiveSupport::TestCase
	include Risu::Models

	def setup
		setup_test_database
	end

	def find_root_cause_processor
		Risu::Base::PostProcessBase.possible_postprocesses.find { |klass|
			klass.name =~ /RootCauses$/
		}
	end

	test "RootCause postprocessor should exist" do
		assert find_root_cause_processor != nil, "RootCauses postprocessor not found"
	end

	test "RootCause should have description" do
		instance = find_root_cause_processor.new
		assert_equal "Root Cause Mapper", instance.info[:description]
	end

	test "RootCause should have plugin_id of 0" do
		instance = find_root_cause_processor.new
		assert_equal 0, instance.info[:plugin_id]
	end

	test "RootCause run should not raise errors" do
		instance = find_root_cause_processor.new
		assert_nothing_raised { instance.run }
	end

	test "RootCause should map plugin 34477 to Vendor Patch" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(34477)
		assert_equal "Vendor Patch", plugin.root_cause, "GOT #{plugin.root_cause}"
	end

	test "RootCause should map plugin 35362 to Vendor Patch" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(35362)
		assert_equal "Vendor Patch", plugin.root_cause, "GOT #{plugin.root_cause}"
	end

	test "RootCause should map plugin 42411 to Configuration" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(42411)
		assert_equal "Configuration", plugin.root_cause, "GOT #{plugin.root_cause}"
	end

	test "RootCause should map plugin 38664 to Vendor Patch" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(38664)
		assert_equal "Vendor Patch", plugin.root_cause, "GOT #{plugin.root_cause}"
	end

	test "RootCause should map plugin 35635 to Vendor Patch" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(35635)
		assert_equal "Vendor Patch", plugin.root_cause, "GOT #{plugin.root_cause}"
	end

	test "RootCause should not set root_cause for unmapped plugins" do
		instance = find_root_cause_processor.new
		instance.run
		plugin = Plugin.find_by_id(21564)
		assert plugin.root_cause == nil, "GOT #{plugin.root_cause}"
	end
end
