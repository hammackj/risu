# encoding: utf-8

require 'spec_helper'

module NessusDB
	module Models		
		describe Report do
			before(:all) do
				@report = Report.make
				@report.hosts.make(:start => "Fri May 13 17:52:18 2011")
					
				printf "%s\n\n", @report.inspect
			end
			
			it "should have a scan_date of Fri May 13 17:52:18 -0500 2011" do				
				Report.scan_date.should == "Fri May 13 17:52:18 -0500 2011"
			end
		end
	end
end
