# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

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
