# Copyright (c) 2010-2014 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		class MaliciousProcessDetection < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "malicious_process_detection",
					:author => "hammackj",
					:version => "0.0.1",
					:description => "Generates a Malicious Process Detection Report"
				}
			end

			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Malicious Process Detection Findings"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				unique_risks = Array.new
				unique_risks << Hash[:title => "Malicious Processes", :color => "9B30FF", :values => Item.where(:plugin_id => 59275)] if Item.where(:plugin_id => 59275).count != 0

				unique_risks.each_with_index do |h, index|
					if h[:values].length > 0

						output.font_size(18) do
							output.fill_color h[:color]
							text h[:title], :style => :bold
							output.fill_color "000000"
						end

						text "\n"

						h[:values].each do |f|
							plugin = Plugin.find_by_id(f.plugin_id)

							references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)

							output.font_size(16) do
								text "#{plugin.plugin_name}\n"
							end

							text "Host", :style => :bold

							ho = Host.find_by_id(f.host_id)

							host_string = "#{ho.name}"
							host_string << " (#{ho.fqdn})" if ho.fqdn != nil

							text host_string

							if f.plugin_output != nil
								text "\nPlugin output", :style => :bold
								text f.plugin_output
							end

							if plugin.description != nil
								text "\nDescription", :style => :bold
								text plugin.description.gsub(/[ ]{2,}/, " "), :inline_format => true
							end

							if plugin.synopsis != nil
								text "\nSynopsis", :style => :bold
								text plugin.synopsis
							end

							if plugin.cvss_base_score != nil
								text "\nCVSS Base Score", :style => :bold
								text plugin.cvss_base_score
							end

							if plugin.exploit_available != nil
								text "\nExploit Available", :style => :bold

								if plugin.exploit_available == "true"
									text "Yes"
								else
									text "No"
								end
							end

							if plugin.solution != nil
								text "\nSolution", :style => :bold
								text plugin.solution
							end

							if references.size != 0
								text "\nReferences", :style => :bold
								text plugin.references.reference_string, :inline_format => true
								plugin_url = "http://www.tenablesecurity.com/plugins/index.php?view=single&id=#{plugin.id}"
								text "<b>nessus_plugin</b>: #{plugin_url}", :inline_format => true, :link => plugin_url
							end

							text "\n"
						end
					end

					output.start_new_page if unique_risks[index+1] != nil
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
