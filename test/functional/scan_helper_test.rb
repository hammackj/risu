# Copyright (c) 2010-2026 Jacob Hammack.
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

class ScanHelperTest < ActiveSupport::TestCase
	include Risu::Templates::ScanHelper
	include Risu::Models

	def setup
		setup_test_database
	end

	test "authenticated_count should return a hash" do
		result = authenticated_count
		assert result.is_a?(Hash), "Should return a Hash"
	end

	test "authenticated_count should have auth key" do
		result = authenticated_count
		assert result.key?("auth"), "Should have 'auth' key"
	end

	test "authenticated_count should have unauth key" do
		result = authenticated_count
		assert result.key?("unauth"), "Should have 'unauth' key"
	end

	test "authenticated_count auth should be an integer" do
		result = authenticated_count
		assert result["auth"].is_a?(Integer), "auth count should be Integer"
	end

	test "authenticated_count unauth should be an integer" do
		result = authenticated_count
		assert result["unauth"].is_a?(Integer), "unauth count should be Integer"
	end

	test "authenticated_count should use HostProperty not plugin 19506" do
		# Verify by checking that the total matches HostProperty count
		prop_count = HostProperty.where(:name => "Credentialed_Scan").count
		result = authenticated_count
		total = result["auth"] + result["unauth"]
		assert_equal prop_count, total, "Total should match HostProperty Credentialed_Scan count"
	end

	test "scan_info_to_hash should parse plugin output" do
		output = "Credentialed checks : yes\nPatch management : WSUS"
		result = scan_info_to_hash(output)
		assert_equal "yes", result["credentialed_checks"]
		assert_equal "wsus", result["patch_management"]
	end

	test "scan_info_to_hash should handle empty input" do
		result = scan_info_to_hash("")
		assert result.is_a?(Hash)
		assert_equal 0, result.size
	end
end
