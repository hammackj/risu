# Copyright (c) 2010-2017 Arxopia LLC.
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

class PluginTest < ActiveSupport::TestCase
	def setup
		setup_test_database
	end

	test "returns 12 risks for Plugin.risks.count" do
		assert Plugin.risks.count == 12, "GOT #{Plugin.risks.count}"
	end

	test "returns 8 risks for Plugin.critical_risks.count" do
		assert Plugin.critical_risks.to_a.count == 8, "GOT #{Plugin.critical_risks.to_a.count}"
	end

	test "returns 1 risks for Plugin.high_risks.count" do
		assert Plugin.high_risks.to_a.count == 1
	end

	test "returns 1 for Plugin.medium_risks.count" do
		assert Plugin.medium_risks.to_a.count == 1
	end

	test "returns 1 for Plugin.low_risks.count" do
		assert Plugin.low_risks.to_a.count == 1
	end

	test "returns 1 risks for Plugin.info_risks.count" do
		assert Plugin.none_risks.to_a.count == 1
	end

	test "returns a graph Plugin.top_by_count_graph" do
		assert Plugin.top_by_count_graph.class == StringIO
	end

	test "returns 1 risk for Plugin.where(:exploit_framework_d2_elliot =>true).count" do
		assert Plugin.where(:exploit_framework_d2_elliot => true).count == 1, "GOT #{Plugin.where(:exploit_framework_d2_elliot => true).count}"
	end

	test "returns 1 risk for Plugin.where(:d2_elliot_name => 'Sample Exploit Name').count" do
		assert Plugin.where(:d2_elliot_name => "Sample Exploit Name").count == 1, "GOT #{Plugin.where(:d2_elliot_name => "Sample Exploit Name").count}"
	end

	test "return 1 risk for Plugin.where(:exploited_by_malware => 'true').count" do
		assert Plugin.where(:exploited_by_malware => "true").count == 1, "GOT #{Plugin.where(:exploited_by_malware => 'true').count}"
	end

	test "return 1 risk for Plugin.where(:potential_vulnerability => true).count" do
		assert Plugin.where(:potential_vulnerability => true).count == 1, "GOT #{Plugin.where(:potential_vulnerability => true).count}"
	end

	test "return 1 risk for Plugin.in_the_news.count" do
		assert Plugin.in_the_news.count == 1, "GOT #{Plugin.in_the_news.count}"
	end
end
