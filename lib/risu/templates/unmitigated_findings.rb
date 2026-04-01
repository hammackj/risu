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
		class UnmitigatedFindings < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "unmitigated_findings",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates an Unmitigated Findings Report from risu_db_diff output"
				}

				@config = Risu::Base::EngagementConfig.new
			end

			SEVERITY_COLORS = {
				'Critical' => 'C0392B',
				'High' => 'D35400',
				'Medium' => 'F1C40F',
				'Low' => '27AE60',
				'Info' => '888888'
			}.freeze

			MIN_SEVERITY = 2 # Medium and above

			def load_findings
				require 'csv'
				file = @config.engagement["unmitigated_file"]
				return [] if file.nil? || !File.exist?(file)

				severity_order = { 4 => "Critical", 3 => "High", 2 => "Medium", 1 => "Low", 0 => "Info" }

				raw = []
				CSV.foreach(file, headers: true) do |row|
					sev = row["severity"].to_i
					next if sev < MIN_SEVERITY

					raw << {
						host: row["host"],
						mac: row["mac"],
						plugin_name: row["plugin_name"],
						severity: sev,
						severity_label: severity_order[sev] || "Info",
						since: @config.previous_scan_date || row["unpatch_since"] || "unknown"
					}
				end

				raw
			end

			# Group by finding, enrich from current DB
			def build_finding_details(raw)
				grouped = raw.group_by { |r| r[:plugin_name] }

				findings = grouped.map do |plugin_name, instances|
					worst_sev = instances.max_by { |i| i[:severity] }

					# Look up plugin in current DB by name
					plugin = Plugin.where(:plugin_name => plugin_name).first

					hosts = instances.map { |i| { ip: i[:host], mac: i[:mac] } }.uniq { |h| [h[:ip], h[:mac]] }

					{
						plugin_name: plugin_name,
						severity: worst_sev[:severity],
						severity_label: worst_sev[:severity_label],
						since: worst_sev[:since],
						host_count: hosts.size,
						hosts: hosts,
						plugin: plugin
					}
				end

				# Sort by severity desc, then CVSS desc, then host count desc
				findings.sort_by do |f|
					cvss = f[:plugin] ? f[:plugin].cvss_base_score.to_f : 0.0
					[-(f[:severity]), -cvss, -(f[:host_count])]
				end
			end

			def render output
				raw = load_findings

				# Title page
				text Report.classification.upcase, :align => :center
				text "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

				@output.font_size(24) do
					@output.text Report.title, :align => :left
				end
				@output.font_size(18) do
					@output.text "Unmitigated Findings Report", :align => :left
					@output.text "\n"
				end
				@output.font_size(14) do
					@output.text "This report was prepared by\n#{Report.author}", :align => :left
				end
				@output.font_size(10) do
					@output.text "\n\n"
					@output.text Report.scan_date.strftime('%B %d, %Y'), :align => :left
				end

				new_page

				# Overview
				heading1 "Overview"

				previous = @config.previous_scan_date || "the previous assessment"

				text "This report identifies findings that were present in both the #{previous} " \
					"assessment and the current assessment. These unmitigated findings represent " \
					"vulnerabilities that have persisted across scan cycles without remediation."
				text "\n"

				text "Persistent unmitigated vulnerabilities are a significant concern because " \
					"they indicate gaps in the patch management and remediation process. The longer " \
					"a known vulnerability remains unpatched, the greater the window of opportunity " \
					"for an attacker to exploit it. Findings are matched on IP address, MAC address, " \
					"and plugin name to ensure accurate tracking across assessments."
				text "\n"

				if raw.empty?
					heading1 "Results"
					text "No unmitigated findings were identified, or no diff file was configured. " \
						"Set the unmitigated_file path in risu_engagement.yml to enable this report."
					@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
					return
				end

				findings = build_finding_details(raw)

				# Statistics
				all_hosts = raw.map { |r| [r[:host], r[:mac]] }.uniq
				crit_count = findings.count { |f| f[:severity] == 4 }
				high_count = findings.count { |f| f[:severity] == 3 }
				med_count = findings.count { |f| f[:severity] == 2 }

				heading1 "Summary"

				stats = [
					["Total Unmitigated Findings", findings.size.to_s],
					["Affected Hosts", all_hosts.size.to_s],
					["Critical Findings", crit_count.to_s],
					["High Findings", high_count.to_s],
					["Medium Findings", med_count.to_s],
					["Previous Assessment", previous]
				]

				@output.table([["Metric", "Value"]] + stats, :header => true,
					:column_widths => {0 => 300, 1 => page_width - 300},
					:width => page_width) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(1).style(:align => :center)
				end

				text "\n"

				# Summary table
				heading2 "Findings by Severity"

				headers = ["Finding", "Severity", "CVSS", "Hosts", "Since"]
				header_widths = {
					0 => (page_width - 60 - 45 - 40 - 55),
					1 => 60,
					2 => 45,
					3 => 40,
					4 => 55
				}

				summary_data = findings.map do |f|
					cvss = f[:plugin] ? f[:plugin].cvss_base_score.to_s : "N/A"
					[
						Item.scrub_plugin_name(f[:plugin_name]),
						f[:severity_label],
						cvss,
						f[:host_count].to_s,
						f[:since]
					]
				end

				@output.table([headers] + summary_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(2).style(:align => :center)
					column(3).style(:align => :center)

					# Color severity
					summary_data.each_with_index do |row_data, idx|
						column(1).row(idx + 1).style(
							:text_color => SEVERITY_COLORS[row_data[1]] || '000000',
							:font_style => :bold
						)
					end
				end

				text "\n"
				new_page

				# Detailed findings
				heading1 "Detailed Findings"

				findings.each_with_index do |f, idx|
					plugin = f[:plugin]

					heading2 Item.scrub_plugin_name(f[:plugin_name])

					# Metadata table — pull from current DB when available
					cvss = plugin ? plugin.cvss_base_score.to_s : "N/A"
					exploit = plugin && plugin.exploit_available == true ? "Yes" : "No"
					plugin_id = plugin ? plugin.id.to_s : "N/A"

					meta = [
						["Severity", f[:severity_label]],
						["CVSS Score", cvss],
						["Exploit Available", exploit],
						["Affected Hosts", f[:host_count].to_s],
						["Unpatched Since", f[:since]]
					]

					@output.table(meta, :header => false,
						:column_widths => {0 => 120, 1 => page_width - 120},
						:width => page_width) do
						cells.borders = [:top, :bottom, :left, :right]
						column(0).style(:font_style => :bold, :background_color => 'F5F5F5')
					end

					text "\n"

					# Affected hosts table
					host_headers = ["IP Address", "MAC Address"]
					host_widths = {0 => 150, 1 => page_width - 150}

					host_data = f[:hosts].sort_by { |h| h[:ip] }.map do |h|
						[h[:ip], h[:mac]]
					end

					@output.table([host_headers] + host_data, :header => true, :column_widths => host_widths,
						:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
						row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
						cells.borders = [:top, :bottom, :left, :right]
					end

					text "\n"

					# Plugin details from current DB
					if plugin
						definition "Synopsis", plugin.synopsis if plugin.synopsis

						if plugin.description
							definition "Description", plugin.description.gsub(/[ ]{2,}/, " ")
						end

						definition "Solution", plugin.solution if plugin.solution

						refs = plugin.references.reference_string
						if refs && !refs.strip.empty?
							definition "References", refs, :inline_format => true
						end
					end

					text "\n"
					@output.start_new_page if idx != findings.size - 1
				end

				findings_trend_graph_page

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
