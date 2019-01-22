# Copyright (c) 2010-2019 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'test_helper'

class NessusDocumentTest < ActiveSupport::TestCase

	def setup
		setup_test_database
	end

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
