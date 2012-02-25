require "spec_helper"

module Risu
	module Parsers
		module Nessus
			describe NessusDocument do
				before(:all) do
					@doc = NessusDocument.new "test_data/nessus_report_local.nessus"
					@fail_doc = NessusDocument.new "test_data/fail.nessus"
					@invalid_doc = NessusDocument.new "test_data/invalid_report.nessus"
				end
				
				it "should return true for NessusDocument.valid?" do				
					@doc.valid?.should == true
				end
		
				it "should return false for NessusDocument.valid? when the document doesn't exist" do
					@fail_doc.valid?.should == false
				end
		
				it "should return false for NessusDocument.valid? when the document is invalid" do
					@invalid_doc.valid?.should == false
				end
		
				it "should return true for NessusDocument.parse" do				
					@doc.parse.should == true
				end
				
				# @todo implement this correctly and cal fix_ips
				it "should return true for NessusDocument.fix_ips" do				
					@doc.valid?.should == true
				end
			end
		end
	end
end
