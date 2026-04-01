# Copyright (c) 2010-2026 Jacob Hammack.
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
		module GraphTemplateHelper

			#
			def other_os_graph_page
				if Host.other_os_graph_has_data?
					new_page
					@output.image Host.other_os_graph, :width => 500, :height => 375, :position => :center
					text Host.other_os_graph_text
				end
			end

			#
			def windows_os_graph_page
				if Host.windows_os_graph_has_data?
					new_page
					@output.image Host.windows_os_graph, :width => 500, :height => 375, :position => :center
					text Host.windows_os_graph_text
				end
			end

			def windows_client_os_graph_page
				if Host.windows_client_os_graph_has_data?
					new_page
					@output.image Host.windows_client_os_graph, :width => 500, :height => 375, :position => :center
					text Host.windows_client_os_graph_text
				end
			end

			#
			def root_cause_graph_page
				new_page
				@output.image Plugin.root_cause_graph, :width => 500, :height => 375, :position => :center
				text Plugin.root_cause_graph_text
			end

			#
			def risks_by_service_graph_page
				new_page
				@output.image Item.risks_by_service_graph(5), :width => 500, :height => 375, :position => :center
				text Item.risks_by_service_graph_text
			end

			#
			def risks_by_severity_graph_page
				new_page
				@output.image Item.risks_by_severity_graph, :width => 500, :height => 375, :position => :center
				text Item.risks_by_severity_graph_text, :inline_format => true
			end

			#
			def exploitability_graph_page
				new_page
				@output.image Item.exploitability_graph, :width => 500, :height => 375, :position => :center
				text "This chart shows the proportion of findings that have known public " \
					"exploits available versus those that do not. Exploitable findings " \
					"should be prioritized for remediation as they can be leveraged by " \
					"attackers using readily available tools."
			end

			#
			def findings_by_age_graph_page
				new_page
				@output.image Item.findings_by_age_graph, :width => 500, :height => 375, :position => :center
				text "This chart shows critical and high severity findings grouped by how " \
					"long the vulnerability has been publicly known. Older unpatched " \
					"findings indicate gaps in the patch management cycle and represent " \
					"increased risk due to the availability of mature exploits."
			end

			#
			def top_hosts_graph_page
				new_page
				@output.image Item.top_hosts_by_finding_count_graph, :width => 500, :height => 375, :position => :center
				text "This chart shows the hosts with the highest number of findings. " \
					"These systems should be prioritized for remediation as they " \
					"represent the largest concentration of risk on the network."
			end

			#
			def auth_coverage_graph_page
				new_page
				@output.image Host.auth_coverage_graph, :width => 500, :height => 375, :position => :center
				text "This chart shows the proportion of hosts that were scanned with " \
					"authentication credentials versus those that were not. Authenticated " \
					"scans provide significantly deeper coverage and more accurate results. " \
					"Unauthenticated hosts may have undetected vulnerabilities."
			end

			#
			def findings_trend_graph_page
				config = Risu::Base::EngagementConfig.new
				graph = config.findings_trend_graph
				return if graph.nil?

				previous = config.previous_scan_date || "the previous assessment"

				new_page
				@output.image graph, :width => 500, :height => 375, :position => :center
				text "This chart compares the current assessment to the #{previous} assessment. " \
					"Persistent findings are vulnerabilities that were present in both scans and " \
					"remain unresolved. New findings were not present in the previous scan. " \
					"A high number of persistent findings indicates remediation gaps."
			end
		end
	end
end
