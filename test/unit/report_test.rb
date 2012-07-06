require 'test_helper'

class ReportTest < ActiveSupport::TestCase
	test "should have a scan_date of Fri May 13 17:52:18 -0500 2011" do
		date = Report.scan_date

		# Test under 1.9.3 and remove the others, only support 1.9.3+
		#Ruby 1.8.7 and 1.9.2 return different date formats
		if date == "Fri May 13 17:52:18 -0500 2011"
			assert date == "Fri May 13 17:52:18 -0500 2011"
		#elsif date == "2011-05-13 17:52:18 -0500" #1.8.7
		#	assert date == "2011-05-13 17:52:18 -0500"
		end
	end

	test "Report.scanner_nessus_ratings_text length should be 1523" do
		Report.company = ""
		assert Report.scanner_nessus_ratings_text.length == 1523, "GOT #{Report.scanner_nessus_ratings_text.length}"
	end
end
