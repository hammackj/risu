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

class GraphTest < ActiveSupport::TestCase
	def setup
		setup_test_database
	end

	test "returns a StringIO for Item.exploitability_graph" do
		assert_equal StringIO, Item.exploitability_graph.class
	end

	test "returns a StringIO for Item.findings_by_age_graph" do
		assert_equal StringIO, Item.findings_by_age_graph.class
	end

	test "returns a StringIO for Item.top_hosts_by_finding_count_graph" do
		assert_equal StringIO, Item.top_hosts_by_finding_count_graph.class
	end

	test "returns a StringIO for Item.top_hosts_by_finding_count_graph with custom limit" do
		assert_equal StringIO, Item.top_hosts_by_finding_count_graph(5).class
	end

	test "returns a StringIO for Host.auth_coverage_graph" do
		assert_equal StringIO, Host.auth_coverage_graph.class
	end
end
