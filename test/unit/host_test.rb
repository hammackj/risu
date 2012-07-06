require 'test_helper'

class HostTest < ActiveSupport::TestCase
	test "returns 10.0.0.1 for Host.ip" do
		assert_equal Host.first.ip, "10.0.0.1"
	end

	test "returns sorted ips for Host.sorted" do
		assert Host.sorted.first.ip == "10.0.0.1" and Host.sorted[1].ip == "10.0.0.2"
	end

	test "returns 1 for Host.os_windows" do
		assert_equal Host.os_windows.all.count, 1
	end

	test "returns 1 for Host.os_windows_xp" do
		assert_equal Host.os_windows_xp.all.count, 1
	end

	test "returns 0 for Host.os_other" do
		assert_equal Host.os_other.all.count, 0
	end

	test "returns 1 for Host.os_linux" do
		assert_equal Host.os_linux.all.count, 1
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
		assert Host.windows_os_graph_text.length == 163, "GOT #{Host.windows_os_graph_text.length}"
	end

	test "returns 0 for Host.unsupported_os_windows.length" do
		assert Host.unsupported_os_windows.length == 0, "GOT #{Host.unsupported_os_windows.length}"
	end

	test "returns 275 for Host.unsupported_os_text.length" do
		assert Host.unsupported_os_text.length == 275, "GOT #{Host.unsupported_os_text.length}"
	end

	test "returns 0 for Host.unsupported_os_aix.length" do
		assert Host.unsupported_os_aix.length == 0, "GOT #{Host.unsupported_os_aix.length}"
	end

	test "returns 0 for Host.unsupported_os_freebsd.length" do
		assert Host.unsupported_os_freebsd.length == 0, "GOT #{Host.unsupported_os_freebsd.length}"
	end

	test "returns 186 for Host.other_os_graph_text.length" do
		assert Host.other_os_graph_text.length == 186, "GOT #{Host.other_os_graph_text.length}"
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
end
