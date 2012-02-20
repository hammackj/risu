require 'spec_helper'

module Risu
	module Models		
		describe Plugin do
			before(:all) do
				@crit = Plugin.make(:risk_factor => "Critical")
				@high = Plugin.make(:risk_factor => "High")
				@med = Plugin.make(:risk_factor => "Medium")
				@low = Plugin.make(:risk_factor => "Low")
				@none = Plugin.make(:risk_factor => "None")
				
				@item1 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 35362))
				@item2 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 34477))
				@item3 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 35635))
				@item4 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 21564))
				@item5 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 38664))
				@item6 = Item.make(:severity => 3, :plugin => Plugin.make(:id => 42411))
				@item7 = Item.make(:severity => 3, :plugin => Plugin.make())
				@item8 = Item.make(:severity => 3, :plugin => Plugin.make(:plugin_name => "MS02-123: RANDOM"))
		
				#printf "\n%s\n%s\n%s\n%s\n%s\n", @crit.inspect, @high.inspect, @med.inspect, @low.inspect, @info.inspect			
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
			
			it "should include critical,high, medium, low and info risks for Plugin.risks" do				
				Plugin.risks.should include(@crit, @high, @med, @low, @none)
			end
			
			it "returns 5 risks for Plugin.risks.count" do
				Plugin.risks.count.should == 5
			end

			it "returns 1 risks for Plugin.high_risks.count" do
				Plugin.high_risks.all.count.should == 1
			end

			it "returns 1 for Plugin.medium_risks.count" do
				Plugin.medium_risks.all.count.should == 1
			end

			it "returns 1 for Plugin.low_risks.count" do
				Plugin.low_risks.all.count.should == 1
			end
			
			it "returns 1 risks for Plugin.info_risks.count" do
				Plugin.none_risks.all.count.should == 1
			end			

			it "returns a graph Plugin.top_by_count_graph" do
				Plugin.top_by_count_graph.class.should == StringIO
			end
		end
	end
end
