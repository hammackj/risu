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


module Risu
	module Templates
		class Top25 < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize
				@template_info =
				{
					:name => "top_25",
					:author => "hammackj",
					:version => "0.0.3",
					:renderer => "PDF",
					:description => "Generates a Top 25 Remediation report"
				}
			end

			#
			#
			def render output
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
				header_widths =
				{
					0 => (page_width * 0.50),
					1 => (page_width * 0.10),
					2 => (page_width * 0.15),
					3 => (page_width * 0.10),
					4 => (page_width * 0.15)
				}

				#Plugin.where(:risk_factor => "Critical").order(:risk_score).limit(25).reverse_order.each do |plugin|
				Plugin.joins(:items).where(:items => {severity: 4}).order(:risk_score).group(:plugin_id).limit(25).reverse_order.each do |plugin|
					row = Array.new

					name = plugin.plugin_name
					vulns = Item.where(:plugin_id => plugin.id).count

					if plugin.exploitability_ease == "Exploits are available"
						exploitability = "Yes"
					else
						exploitability = "No"
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
