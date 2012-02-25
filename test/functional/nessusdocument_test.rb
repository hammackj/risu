require 'test_helper'

class NessusDocumentTest < ActiveSupport::TestCase	
		
	test "should return false for NessusDocument.valid? when the document doesn't exist" do
		fail_doc = Risu::Parsers::Nessus::NessusDocument.new "test_data/non_existant_nessus_file.nessus"
		assert fail_doc.valid? == false
	end
	
	test "should return false for NessusDocument.valid? when the document is invalid" do
		invalid_nessus_file = "
		<?xml version=\"1.0\"?>
		<NessusClientData>
			<Policy>
				<policyName>Fake Policy</policyName>
				<policyComments/>
				<Preferences>
					<ServerPreferences></ServerPreferences>
			</Policy>
		</NessusClientData"
		
		invalid_doc = Risu::Parsers::Nessus::NessusDocument.new invalid_nessus_file
		assert invalid_doc.valid? == false
	end
end
