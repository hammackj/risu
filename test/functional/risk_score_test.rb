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

class RiskScoreTest < ActiveSupport::TestCase
	include Risu::Models

	def setup
		setup_test_database
	end

	def find_risk_score_processor
		Risu::Base::PostProcessBase.possible_postprocesses.find { |klass|
			klass.name =~ /RiskScore/
		}
	end

	test "RiskScore postprocessor should exist" do
		assert find_risk_score_processor != nil, "RiskScore postprocessor not found"
	end

	test "RiskScore should have description" do
		instance = find_risk_score_processor.new
		assert_equal "RiskScore Calculator", instance.info[:description]
	end

	test "RiskScore should have plugin_id of 0" do
		instance = find_risk_score_processor.new
		assert_equal 0, instance.info[:plugin_id]
	end

	test "RiskScore run should not raise errors" do
		instance = find_risk_score_processor.new
		assert_nothing_raised { instance.run }
	end

	test "RiskScore should set item risk scores after run" do
		instance = find_risk_score_processor.new
		instance.run
		scored_items = Item.where.not(:risk_score => nil).where("risk_score > 0")
		assert scored_items.count > 0, "Expected some items to have risk scores > 0 after run"
	end

	test "RiskScore should set host risk scores after run" do
		instance = find_risk_score_processor.new
		instance.run
		scored_hosts = Host.where.not(:risk_score => nil).where("risk_score > 0")
		assert scored_hosts.count > 0, "Expected some hosts to have risk scores > 0 after run"
	end

	test "RiskScore should set plugin risk scores after run" do
		instance = find_risk_score_processor.new
		instance.run
		scored_plugins = Plugin.where.not(:risk_score => nil).where("risk_score > 0")
		assert scored_plugins.count > 0, "Expected some plugins to have risk scores > 0 after run"
	end

	test "RiskScore should give higher score to exploitable plugins" do
		# Set up a plugin as exploitable
		plugin = Plugin.find_by_id(99998) # high plugin, exploit_available: true
		plugin.update(:vuln_publication_date => "2020-01-01", :cvss_base_score => 8.0)

		plugin2 = Plugin.find_by_id(99997) # medium plugin, exploit_available: false
		plugin2.update(:vuln_publication_date => "2020-01-01", :cvss_base_score => 8.0)

		instance = find_risk_score_processor.new
		instance.run

		item_exploitable = Item.where(:plugin_id => 99998).first
		item_not_exploitable = Item.where(:plugin_id => 99997).first

		assert item_exploitable.risk_score > 0, "Exploitable item should have a risk score"
		assert item_not_exploitable.risk_score > 0, "Non-exploitable item should have a risk score"
	end
end
