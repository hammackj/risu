# Copyright (c) 2010-2025 Jacob Hammack.
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
		class PluginSummaryTemplate < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "plugin_summary",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a report of single plugin for all hosts"
				}
            end
            
            PLUGIN_ID = 65057

			def print_findings(risks, text, color, last=false)
				if risks.length > 0
					title text, 18, color

					risks.each do |f|
						host = Host.find_by_id(f.host_id)
						plugin = Plugin.find_by_id(f.plugin_id)

						#references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)

						# output.font_size(16) do
						# 	text "#{plugin.plugin_name}\n"
						# end
                        
                        text "Host", :style => :bold
                        
                        host_string = "#{host.name}"
                        host_string << " (#{host.fqdn})" if host.fqdn != nil

                        text  host_string

						definition "Plugin output", f.plugin_output
						definition "Description", plugin.description.gsub(/[ ]{2,}/, " ") if plugin.description != nil
						definition "Synopsis", plugin.synopsis
						definition "CVSS Base Score", plugin.cvss_base_score
						definition "Exploit Available", plugin.exploit_available? ? "Yes" : "No"
						definition "Solution", plugin.solution
						definition "References", plugin.references.reference_string, :inline_format => true

						plugin_url = "http://www.tenablesecurity.com/plugins/index.php?view=single&id=#{plugin.id}"
						definition "Nessus Plugin", plugin_url, :inline_format => true, :link => plugin_url

                        @output.start_new_page
                        
					end

					@output.start_new_page if last == false
				end
			end

			def render output
				text Report.classification.upcase, :align => :center
				text "\n"

				plugin =Plugin.find_by_id(PLUGIN_ID)

				if plugin == nil
					puts "Unable to find #{PLUGIN_ID}."
					exit
				end

				report_title Report.title
				report_subtitle "Plugin Summary: #{plugin.plugin_name}"
				report_author "This report was prepared by\n#{Report.author}"
				text "\n\n\n"

                # If you uncomment the med/low change the true in high to false for a new page after it
                
                findings = Item.where(:plugin_id => PLUGIN_ID)

                puts findings.to_a.count

				print_findings(findings, "Plugin Summary", Risu::GRAPH_COLORS[0]) if findings.to_a.size != 0
				#print_technical_findings(Item.high_risks_unique, "High Findings", Risu::GRAPH_COLORS[1], true) if Item.high_risks_unique.to_a.size != 0
				#print_technical_findings(Item.medium_risks_unique, "Medium Findings", Risu::GRAPH_COLORS[2]) if Item.medium_risks_unique.to_a.size != 0
				#print_technical_findings(Item.low_risks_unique, "Low Findings", Risu::GRAPH_COLORS[3], true) if Item.low_risks_unique.to_a.size != 0

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
