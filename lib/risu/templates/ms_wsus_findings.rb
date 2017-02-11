# Copyright (c) 2010-2017 Jacob Hammack.
<<<<<<< HEAD
=======
# All rights reserved.
>>>>>>> master
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

module Risu
	module Templates
		class MSWSUSFindingsTemplate < Risu::Base::TemplateBase

			# Initializes the template loading meta-data
			#
			def initialize
				@template_info =
				{
					:name => "ms_wsus_findings",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a report based on the findings of the Patch Management: WSUS Report plugin"
				}
			end

			# Called during the rendering process
			#
			def render output
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
