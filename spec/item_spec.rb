# encoding: utf-8
 	
require 'spec_helper'

module Risu
	module Models
		describe Item do
			before(:all) do
				@high = Item.make(:severity => 3)
				@med = Item.make(:severity => 2)
				@low = Item.make(:severity => 1)
				@info = Item.make(:severity => 0)

				printf "\n%s\n%s\n%s\n%s\n", @high.inspect, @med.inspect, @low.inspect, @info.inspect
			end
			
			after(:all) do
				Report.delete_all
				Host.delete_all
				Plugin.delete_all
				Item.delete_all
				FamilySelection.delete_all
				IndividualPluginSelection.delete_all
				PluginsPreference.delete_all
				Policy.delete_all
				Reference.delete_all
				ServerPreference.delete_all
				Version.delete_all
			end

			it "should include high, medium, low and info risks for Item.risks.all" do
				Item.risks.all.should include(@high, @med, @low, @info)
			end

			it "returns 4 risks for Item.risks.count" do
				Item.risks.count.should == 4
			end

			it "returns 1 risks for Item.high_risks.count" do
				Item.high_risks.all.count.should == 1
			end

			it "returns 1 for Item.medium_risks.count" do
				Item.medium_risks.all.count.should == 1
			end

			it "returns 1 for Item.low_risks.count" do
				Item.low_risks.all.count.should == 1
			end

			it "returns 1 risks for Item.info_risks.count" do
				Item.info_risks.all.count.should == 1
			end

			it "returns 4 risks for Item.risks_by_service" do
				Item.risks_by_service(100000).all.count.should == 4
			end

			it "returns 2 risks for Item.risks_by_host" do
				Item.risks_by_host(100000).all.count.should == 2
			end

			it "returns 1 risks for Item.risks_by_plugin" do
				Item.risks_by_plugin(100000).all.count.should == 1
			end

			it "returns 1 for Item.high_risks_unique.count" do
				Item.high_risks_unique.all.count.should == 1
			end

			it "returns 1 for Item.high_risks_unique_sorted.count" do
				Item.high_risks_unique_sorted.all.count.should == 1
			end

			it "returns 1 for Item.medium_risks_unique.count" do
				Item.medium_risks_unique.all.count.should == 1
			end

			it "returns 1 for Item.medium_risks_unique_sorted.count" do
				Item.medium_risks_unique_sorted.all.count.should == 1
			end

			it "returns 1 for Item.low_risks_unique.count" do
				Item.low_risks_unique.all.count.should == 1
			end

			it "returns 1 for Item.low_risks_unique_sorted.count" do
				Item.low_risks_unique_sorted.all.count.should == 1
			end

			it "returns 1 for Item.info_risks_unique_sorted.count" do
				Item.info_risks_unique_sorted.all.count.should == 1
			end

			it "returns 1 for Item.info_risks_unique.count" do
				Item.info_risks_unique.all.count.should == 1
			end

			it "returns a graph Item.risks_by_severity_graph" do
				Item.risks_by_severity_graph.class.should == StringIO
			end

			it "returns a graph Item.risks_by_service_graph" do
				Item.risks_by_service_graph.should be_a_kind_of StringIO
			end

			it "returns 0 for Item.ms_update" do
				Item.ms_update.all.count.should == 0
			end

			it "returns 0 for Item.ms_patches" do
				Item.ms_patches.all.count.should == 0
			end
		end
	end
end
