require 'test_helper'
 
class ItemTest < ActiveSupport::TestCase	
	test "returns 13 risks for Item.risks.count" do
		assert Item.risks.count == 13, "GOT #{Item.risks.count}"
	end

	test "returns 9 risks for Item.critical_risks.count" do
		assert Item.critical_risks.all.count == 9, "GOT #{Item.critical_risks.count}"
	end			

	test "returns 1 risks for Item.high_risks.count" do
		assert Item.high_risks.all.count == 1
	end

	test "returns 1 for Item.medium_risks.count" do
		assert Item.medium_risks.all.count == 1
	end

	test "returns 1 for Item.low_risks.count" do
		assert Item.low_risks.all.count == 1
	end

	test "returns 1 risks for Item.info_risks.count" do
		assert Item.info_risks.all.count == 1
	end

	test "returns 12 risks for Item.risks_by_service" do
		assert Item.risks_by_service(100000).all.count == 12, "GOT #{Item.risks_by_service(100000).all.count}"
	end

	test "returns 2 risks for Item.risks_by_host" do
		assert Item.risks_by_host(100000).all.count == 2, "GOT #{Item.risks_by_host(100000).all.count}"
	end

	test "returns 8 risks for Item.risks_by_plugin" do
		assert Item.risks_by_plugin(100000).all.count == 8, "GOT #{Item.risks_by_plugin(100000).all.count}"
	end

	test "returns 8 for Item.critical_risks_unique.count" do
		assert Item.critical_risks_unique.all.count == 8, "GOT #{Item.critical_risks_unique.all.count}"
	end

	test "returns 1 for Item.high_risks_unique.count" do
		assert Item.high_risks_unique.all.count == 1
	end

	test "returns 1 for Item.high_risks_unique_sorted.count" do
		assert Item.high_risks_unique_sorted.all.count == 1
	end
	
	test "returns 8 for Item.critical_risks_unique_sorted.count" do
		assert Item.critical_risks_unique_sorted.all.count == 8, "GOT #{Item.critical_risks_unique_sorted.all.count}"
	end

	test "returns 1 for Item.medium_risks_unique.count" do
		assert Item.medium_risks_unique.all.count == 1
	end

	test "returns 1 for Item.medium_risks_unique_sorted.count" do
		assert Item.medium_risks_unique_sorted.all.count == 1
	end

	test "returns 1 for Item.low_risks_unique.count" do
		assert Item.low_risks_unique.all.count == 1
	end

	test "returns 1 for Item.low_risks_unique_sorted.count" do
		assert Item.low_risks_unique_sorted.all.count == 1
	end

	test "returns 1 for Item.info_risks_unique_sorted.count" do
		assert Item.info_risks_unique_sorted.all.count == 1
	end

	test "returns 1 for Item.info_risks_unique.count" do
		assert Item.info_risks_unique.all.count == 1, "GOT #{Item.info_risks_unique.all.count}"
	end

	# @todo this test sucks, hash the object instead
	test "returns a graph Item.risks_by_severity_graph" do
		assert Item.risks_by_severity_graph.class == StringIO
	end

	# @todo this test sucks, hash the object instead
	test "returns a graph Item.risks_by_service_graph" do
		assert Item.risks_by_service_graph.class == StringIO
	end

	test "returns 0 for Item.ms_update" do
		assert Item.ms_update.all.count == 0
	end

	test "returns 0 for Item.ms_patches" do
		assert Item.ms_patches.all.count == 0
	end
	
	test "returns 220 for Item.risks_by_service_graph_text.length" do
		assert Item.risks_by_service_graph_text.length == 220, "GOT #{Item.risks_by_service_graph_text.length}"
	end

	test "returns 1097 for Item.risks_by_severity_graph_text.length" do
		assert Item.risks_by_severity_graph_text.length == 1097, "GOT #{Item.risks_by_severity_graph_text.length}"
	end	
	
	test "returns 12 for Item.all_risks_unique_sorted.all.count" do
		assert Item.all_risks_unique_sorted.all.count == 12, "GOT #{Item.all_risks_unique_sorted.all.count}"
	end
	
end

# @todo need to rework this one
#			test "should include crit, high, medium, low and info risks for Item.risks.all" do
#				assert Item.risks.allinclude(@crit, @high, @med, @low, @info)
#			end



