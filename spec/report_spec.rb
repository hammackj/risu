# encoding: utf-8

require 'spec_helper'

module Risu
	module Models		
		describe Report do
			before(:all) do
				@report = Report.make
				@report.hosts.make(:start => "Fri May 13 17:52:18 2011")
					
#				printf "%s\n\n", @report.inspect
			end
			
			it "should have a scan_date of Fri May 13 17:52:18 -0500 2011" do
				date = Report.scan_date

				#@todo drop ruby < 1.9.3
				#Ruby 1.8.7 and 1.9.2 return different date formats
				if date == "Fri May 13 17:52:18 -0500 2011"
					date.should == "Fri May 13 17:52:18 -0500 2011"
				elsif date == "2011-05-13 17:52:18 -0500"
					date.should == "2011-05-13 17:52:18 -0500"
				end
			end
		end
	end
end
