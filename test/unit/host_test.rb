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

class HostTest < ActiveSupport::TestCase
	def setup
		setup_test_database

		@report = Report
		@report.title = "Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end

	test "returns 10.0.0.1 for Host.ip" do
		assert_equal Host.first.ip, "10.0.0.1"
	end

	test "returns sorted ips for Host.sorted" do
		assert Host.sorted.first.ip == "10.0.0.1" and Host.sorted[1].ip == "10.0.0.2"
	end

	test "returns 1 for Host.os_windows" do
		assert_equal Host.os_windows.to_a.count, 1
	end

	test "returns 1 for Host.os_windows_xp" do
		assert_equal Host.os_windows_xp.to_a.count, 1
	end

	test "returns 0 for Host.os_other" do
		assert_equal Host.os_other.to_a.count, 0
	end

	test "returns 1 for Host.os_linux" do
		assert_equal Host.os_linux.to_a.count, 1
	end

	test "returns a StringIO object from Host.top_vuln_graph" do
		assert_equal Host.top_vuln_graph.class, StringIO
	end

	test "returns a graph Host.other_os_graph" do
		assert Host.other_os_graph.class == StringIO
	end

	test "returns a graph Host.windows_os_graph" do
		assert Host.windows_os_graph.class == StringIO
	end

	test "returns 160 for Host.windows_os_graph_text.length" do
		assert Host.windows_os_graph_text.length == 160, "GOT #{Host.windows_os_graph_text} - #{Host.windows_os_graph_text.length}"
	end

	test "returns 0 for Host.unsupported_os_windows.length" do
		assert Host.unsupported_os_windows.length == 0, "GOT #{Host.unsupported_os_windows.length}"
	end

	test "returns 275 for Host.unsupported_os_text.length" do
		assert Host.unsupported_os_text == nil, "GOT #{Host.unsupported_os_text}"
	end

	test "returns 0 for Host.unsupported_os_aix.length" do
		assert Host.unsupported_os_aix.length == 0, "GOT #{Host.unsupported_os_aix.length}"
	end

	test "returns 0 for Host.unsupported_os_freebsd.length" do
		assert Host.unsupported_os_freebsd.length == 0, "GOT #{Host.unsupported_os_freebsd.length}"
	end

	test "returns 202 for Host.other_os_graph_text.length" do
		assert Host.other_os_graph_text.length == 190, "GOT #{Host.other_os_graph_text.length}"
	end

	test "should return 2 for Host.top_n_vulnerable(2)" do
		assert Host.top_n_vulnerable(2).count == 2, "GOT #{Host.top_n_vulnerable(2).count}"
	end

	test "should return 2 for Host.unique_hosts_with_critical" do
		assert Host.unique_hosts_with_critical.count == 2, "GOT #{Host.unique_hosts_with_critical.count}"
	end

	test "should return 1 for Host.unique_hosts_with_high" do
		assert Host.unique_hosts_with_high.count == 1, "GOT #{Host.unique_hosts_with_high.count}"
	end

	test "should return a String of ips for Host.ip_list" do
		assert Host.ip_list.class == String, "GOT #{Host.ip_list.class}"
	end

	test "should return a list of String of 17 length for Host.ip_list" do
		assert Host.ip_list.length == 17, "GOT #{Host.ip_list} - #{Host.ip_list.length}"
	end

	test "should build an array of 2 ips for Host.ip_list.split(\"\\n\").size" do
		assert Host.ip_list.split("\n").size == 2, "GOT #{Host.ip_list.split("\n")} - #{Host.ip_list.split("\n").size}"
	end

	test "should return 2 for Host.not_os_windows_98" do
		assert Host.not_os_windows_98.count == 2 , "GOT #{Host.not_os_windows_98.count}"
	end

	test "should return 2 for Host.not_os_windows_me" do
		assert Host.not_os_windows_me.count == 2 , "GOT #{Host.not_os_windows_me.count}"
	end

	test "should return 2 for Host.not_os_windows_95" do
		assert Host.not_os_windows_95.count == 2 , "GOT #{Host.not_os_windows_95.count}"
	end
end
