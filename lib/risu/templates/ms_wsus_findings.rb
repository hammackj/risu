# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.
#
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
	module Templates
		class MSWSUSFindingsTemplate < Risu::Base::TemplateBase

			# Initializes the template loading meta-data
			#
			def initialize ()
				@template_info =
				{
					:name => "ms_wsus_findings",
					:author => "hammackj",
					:version => "0.0.1",
					:description => "Generates a report based on the findings of the Patch Management: WSUS Report plugin"
				}
			end

			# Called during the rendering process
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Patch Management: WSUS Report", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				output.font_size 12

				results = Item.where(:plugin_id => 58133)

				results.each do |item|
					if item.plugin_output == nil
						next
					end

					if item.plugin_output =~ /This system is not managed by or has not yet reported to the WSUS server./
						next
					end

					item.plugin_output.scan(/\+ WSUS Computer Information \r?\n?\r?\n?\r?\n?    FQDN : (.*)\r?\n?    IP Address : (.*)\r?\n?    Last Sync Time : (.*)\r?\n?    Last Reported Status : (.*)\r?\n?    Last Sync Result : (.*)$/).each do
						|fqdn, ip, last_sync_time, last_reported_status, last_sync_result|

						output.text "Host: #{ip} (#{fqdn})"
						output.text "Last Sync Time: #{last_sync_time}"
						output.text "Last Reported Status: #{last_reported_status}"
						output.text "Last Sync Result: #{last_sync_result}"
					end

					output.text "\n"

					output.font_size 10

					item.plugin_output.scan(/^\d* :(.*)\n    Patch State : (.*)\n    Microsoft KB : (.*)\n    severity : (.*)\n    Bulletin Date : (.*)\n    Patch Link : (.*)\n    Description : (.*)\n\r?\n?/).each do
						|name, patch_state, kb, severity, date, link, description|
						output.text "Name: #{name}"
						output.text "State: #{patch_state}"
						output.text "Severity: #{severity}"
						output.text "Release date: #{date}"
						output.text "Link: #{link}"
						output.text "Description: #{description}"
						output.text "\n"
					end
				end
			end
		end
	end
end

