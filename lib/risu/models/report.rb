# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
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

module Risu
	module Models

		# Report Model
		#
		class Report < ActiveRecord::Base
		  has_many :hosts
		  belongs_to :policy

			class << self

				attr_accessor :title, :author, :company, :classification

				#
				#@scan_date = Host.where("start is not null").first[:start].to_s
				#
				def scan_date
					Host.where("start IS NOT NULL").first[:start]
				end

				#
				# @todo comment this
				#
				def scanner_nessus_ratings_text
					text = "The vulnerability scanner used by #{Report.company} rates the findings as follows: High, Medium, Low and Informational. High findings represents a security hole, initially this is the highest rating a risk can get.  These generally represent vulnerabilities that can lead to full system compromise due to missing security patches. High findings should be re-mediated first as they generally leave the network wide open. Medium findings are considered a security warning; these are not as severe as high but should be evaluated on a risk-by-risk basis. These are typically configuration errors that can lead to information disclosures such as usernames, passwords, and configuration settings. Low findings are identified as security notes; these provide information the scanner discovered during the scanning process. The information includes items such as hostname, domain name, and MAC address. Open Port findings represent the open ports on each system that the scanner found during the scan process. These should be evaluated against firewall settings to test the firewall configurations.\n\n"
					text << "After the scanner is complete, the scanner evaluates each finding and bases it on the Common Vulnerability Scoring System (CVSS) score assigned to each finding. Any findings with a CVSS base score of 10 are upgraded to a Critical finding. These represent vulnerabilities that are trivial to gain administrator access to the system, with little to no effort. For more information on the CVSS scoring system please visit: http://nvd.nist.gov/cvss.cfm.\n\n"

					return text
				end
			end
		end
	end
end
