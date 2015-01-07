# Copyright (c) 2010-2015 Arxopia LLC.
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
		class FindingsSummaryWithPluginID < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "findings_summary_with_pluginid",
					:author => "hammackj",
					:version => "0.0.5",
					:renderer => "PDF",
					:description => "Generates a Findings Summary with Nessus Plugin ID"
				}
			end

			#
			#
			def print_risk_summary_with_plugin_id(risks, text, color)
				@output.font_size(20) do
					@output.fill_color color.gsub('#', '')
					@output.text text, :style => :bold
					@output.fill_color "000000"
				end

				risks.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					text "#{count} - #{name} - #{item.plugin_id}"
				end				
			end			

			#
			#
			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Findings Summary Report"
				report_author "This report was prepared by\n#{Report.author}"
				text "\n\n\n"

				print_risk_summary_with_plugin_id(Item.critical_risks_unique_sorted, "Critical Findings", Risu::GRAPH_COLORS[0])
				print_risk_summary_with_plugin_id(Item.high_risks_unique_sorted, "High Findings", Risu::GRAPH_COLORS[1])
				print_risk_summary_with_plugin_id(Item.medium_risks_unique_sorted, "Medium Findings", Risu::GRAPH_COLORS[2])
				print_risk_summary_with_plugin_id(Item.low_risks_unique_sorted, "Low Findings", Risu::GRAPH_COLORS[3])
				print_risk_summary_with_plugin_id(Item.info_risks_unique_sorted, "Informational Findings", Risu::GRAPH_COLORS[4])
			end
		end
	end
end
