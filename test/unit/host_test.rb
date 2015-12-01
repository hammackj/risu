# Copyright (c) 2010-2015 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

require 'test_helper'

class HostTest < ActiveSupport::TestCase
	def setup
		setup_test_database
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

	test "returns 163 for Host.windows_os_graph_text.length" do
		#puts "|#{Host.windows_os_graph_text}|"
		assert Host.windows_os_graph_text.length == 163, "GOT #{Host.windows_os_graph_text} - #{Host.windows_os_graph_text.length}"
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

	test "returns 199 for Host.other_os_graph_text.length" do
		assert Host.other_os_graph_text.length == 199, "GOT #{Host.other_os_graph_text.length}"
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
