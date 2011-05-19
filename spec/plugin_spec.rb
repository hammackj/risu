# encoding: utf-8

require 'spec_helper'

module NessusDB
	module Models		
		describe Plugin do
			before(:all) do
				@crit = Plugin.make(:risk_factor => "Critical")
				@high = Plugin.make(:risk_factor => "High")
				@med = Plugin.make(:risk_factor => "Medium")
				@low = Plugin.make(:risk_factor => "Low")
				@none = Plugin.make(:risk_factor => "None")
				
				printf "%s\n%s\n%s\n%s\n%s\n", @crit.inspect, @high.inspect, @med.inspect, @low.inspect, @info.inspect
							
			end
			
			it "should include critical,high, medium, low and info risks for Plugin.risks" do				
				Plugin.risks.should include(@crit, @high, @med, @low, @none)
			end
			
			it "returns 5 risks for Item.risks.count" do
				Plugin.risks.count.should == 5
			end

			it "returns 1 risks for Item.high_risks.count" do
				Plugin.high_risks.all.count.should == 1
			end

			it "returns 1 for Item.medium_risks.count" do
				Plugin.medium_risks.all.count.should == 1
			end

			it "returns 1 for Item.low_risks.count" do
				Plugin.low_risks.all.count.should == 1
			end
			
			it "returns 1 risks for Item.info_risks.count" do
				Plugin.none_risks.all.count.should == 1
			end			

			it "returns a graph Item.top_by_count_graph" do
				Plugin.top_by_count_graph.class.should == StringIO
			end
		end
	end
end
