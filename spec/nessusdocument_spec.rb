require "spec_helper"

module NessusDB
	describe NessusDocument do
		before(:all) do
			@doc = NessusDocument.new "test_data/nessus_report_local.nessus"									
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
		
		it "should return true for NessusDocument.valid?" do				
			@doc.valid?.should == true
		end
		
		it "should return true for NessusDocument.parse" do				
			@doc.parse.should == true
		end
		
		# @todo implement this
		it "should return true for NessusDocument.fix_ips" do				
			@doc.valid?.should == true
		end		
	end
end
