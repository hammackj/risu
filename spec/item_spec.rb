# encoding: utf-8

require 'spec_helper'

module NessusDB
	module Models		
		describe Item do
			before(:all) do
				@crit = Item.make(:severity => 3)
				@high = Item.make(:severity => 2)
				@med = Item.make(:severity => 1)
				@low = Item.make(:severity => 0)
					
				printf "%s\n%s\n%s\n%s\n\n", @crit.inspect, @high.inspect, @med.inspect, @low.inspect
							
			end
			
			it "should include critical, high, medium and low	risks for Item.risks.all" do				
				Item.risks.all.should include(@crit, @high, @med, @low)
			end
			
			it "returns 4 risks for Item.risks.count" do
				Item.risks.count.should == 4
			end

			it "returns 1 risks for Item.critical_risks.count" do
				Item.critical_risks.all.count.should == 1
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

			it "returns 4 risks for Item.risks_by_service" do
				Item.risks_by_service(100000).all.count.should == 4
			end

			it "returns 2 risks for Item.risks_by_host" do
				Item.risks_by_host(100000).all.count.should == 2
			end

			it "returns 1 risks for Item.risks_by_plugin" do
				Item.risks_by_plugin(100000).all.count.should == 1
			end

			it "returns 1 for Item.critical_risks_unique.count" do
				Item.critical_risks_unique.all.count.should == 1
			end

			it "returns 1 for Item.high_risks_unique.count" do
				Item.high_risks_unique.all.count.should == 1
			end

			it "returns 1 for Item.medium_risks_unique.count" do
				Item.medium_risks_unique.all.count.should == 1
			end

			it "returns 2015 for Item.low_risks_unique.count" do
				Item.low_risks_unique.all.count.should == 1
			end
		end
	end
end
