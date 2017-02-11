# Copyright (c) 2010-2017 Jacob Hammack.
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
		class FindingsSummary < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "findings_summary",
					:author => "hammackj",
					:version => "0.0.4",
					:renderer => "PDF",
					:description => "Generates a findings summary report"
				}
			end

			def print_risk_title (text, color)
				@output.font_size(20) do
					@output.fill_color color.gsub('#', '')
					@output.text text, :style => :bold
					@output.fill_color "000000"
				end
			end

			def print_risk_summary(risks, text, color)
				print_risk_title(text, color) if risks.length != 0

				risks.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					text "#{count} - #{name}"
				end
			end

			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Findings Summary Report"
				report_author "This report was prepared by\n#{Report.author}"
				text "\n\n\n"

				print_risk_summary(Item.critical_risks_unique_sorted, "Critical Findings", Risu::GRAPH_COLORS[0])
				print_risk_summary(Item.high_risks_unique_sorted, "High Findings", Risu::GRAPH_COLORS[1])
				print_risk_summary(Item.medium_risks_unique_sorted, "Medium Findings", Risu::GRAPH_COLORS[2])
				print_risk_summary(Item.low_risks_unique_sorted, "Low Findings", Risu::GRAPH_COLORS[3])
				print_risk_summary(Item.info_risks_unique_sorted, "Informational Findings", Risu::GRAPH_COLORS[4])
			end
		end
	end
end
