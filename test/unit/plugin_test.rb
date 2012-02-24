require 'test_helper'
 
class PluginTest < ActiveSupport::TestCase	
	test "returns 12 risks for Plugin.risks.count" do
		assert Plugin.risks.count == 12, "GOT #{Plugin.risks.count}"
	end

	test "returns 8 risks for Plugin.critical_risks.count" do
		assert Plugin.critical_risks.all.count == 8, "GOT #{Plugin.critical_risks.all.count}"
	end

	test "returns 1 risks for Plugin.high_risks.count" do
		assert Plugin.high_risks.all.count == 1
	end

	test "returns 1 for Plugin.medium_risks.count" do
		assert Plugin.medium_risks.all.count == 1
	end

	test "returns 1 for Plugin.low_risks.count" do
		assert Plugin.low_risks.all.count == 1
	end

	test "returns 1 risks for Plugin.info_risks.count" do
		assert Plugin.none_risks.all.count == 1
	end

	test "returns a graph Plugin.top_by_count_graph" do		
		assert Plugin.top_by_count_graph.class == StringIO
	end
end
