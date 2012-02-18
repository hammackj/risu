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
end
