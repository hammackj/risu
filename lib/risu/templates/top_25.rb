# Copyright (c) 2010-2013 Arxopia LLC.
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
	module Templates
		class Top25 < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "top_25",
					:author => "hammackj",
					:version => "0.0.1",
					:description => "Generates a Top 25 Remediation report"
				}
			end

			#
			#
			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Top 25 Remediations"
				report_author "This report was prepared by\n#{Report.author}"
				text "\n\n\n"

				results = Array.new

				headers = ["Remediations", "Vulns", "Exploitability", "Assets", "RiskScore"]

				page_width = output.bounds.width

				#header_widths = {0 => 255, 1 => 56, 2 => 56, 3 => 56, 4 => 57}
				header_widths = {
					0 => (page_width * 0.50),
					1 => (page_width * 0.10),
					2 => (page_width * 0.15),
					3 => (page_width * 0.10),
					4 => (page_width * 0.15)
				}

				Plugin.where(:risk_factor => "Critical").order(:risk_score).limit(25).reverse_order.each do |plugin|
					row = Array.new

					name = plugin.plugin_name
					vulns = Item.where(:plugin_id => plugin.id).count


					if plugin.exploitability_ease == "Exploits are available"
						exploitability = "T"
					else
						exploitability = "F"
					end

					assets = 0

					if Item.where(:plugin_id => plugin.id).group(:host_id) != nil
						assets = Item.where(:plugin_id => plugin.id).group(:host_id).to_a.count
					end

					# vuln_pub_days = 1

					# vuln_pub_days = (DateTime.now.to_date - plugin.vuln_publication_date.to_date).to_i if plugin.vuln_publication_date != nil

					# risk = (plugin.cvss_base_score.to_f * vuln_pub_days)  * assets
					risk = plugin.risk_score

					row.push(name)
					row.push(vulns)
					row.push(exploitability)
					row.push(assets)
					row.push(risk)

					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
