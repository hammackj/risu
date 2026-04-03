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
		class PatchAgePriority < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "patch_age_priority",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a Patch Age / Remediation Priority Report"
				}
			end

			def render output
				# Title page
				text Report.classification.upcase, :align => :center
				text "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

				@output.font_size(24) do
					@output.text Report.title, :align => :left
				end
				@output.font_size(18) do
					@output.text "Patch Age Priority Report", :align => :left
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

				text "This report ranks critical and high severity findings by how long the " \
					"vulnerability has been publicly known. Older unpatched vulnerabilities " \
					"represent a greater risk because attackers have had more time to develop " \
					"exploits, and many are already integrated into automated attack tools " \
					"and malware kits."
				text "\n"

				text "A vulnerability that has been public for years with a patch available " \
					"indicates a gap in the organization's patch management process. These " \
					"should be prioritized alongside newly disclosed critical findings."
				text "\n"

				# Collect findings with vuln_publication_date
				findings = []
				today = Date.today

				Item.where(:severity => [3, 4]).where(:rollup_finding => false).select("DISTINCT plugin_id").each do |item|
					plugin = Plugin.find_by(:id => item.plugin_id)
					next if plugin.nil?
					next if plugin.vuln_publication_date.nil?

					days_old = (today - plugin.vuln_publication_date.to_date).to_i
					host_count = Item.where(:plugin_id => plugin.id).where("severity >= 0").map(&:host_id).uniq.size

					findings << {
						:plugin => plugin,
						:days_old => days_old,
						:host_count => host_count
					}
				end

				# Also check medium findings with very old patch dates
				Item.where(:severity => 2).where(:rollup_finding => false).select("DISTINCT plugin_id").each do |item|
					plugin = Plugin.find_by(:id => item.plugin_id)
					next if plugin.nil?
					next if plugin.vuln_publication_date.nil?

					days_old = (today - plugin.vuln_publication_date.to_date).to_i
					next if days_old < 365 # Only include medium findings older than 1 year

					host_count = Item.where(:plugin_id => plugin.id).where("severity >= 0").map(&:host_id).uniq.size

					findings << {
						:plugin => plugin,
						:days_old => days_old,
						:host_count => host_count
					}
				end

				if findings.empty?
					heading1 "Results"
					text "No critical or high severity findings with known vulnerability publication dates were found."
					@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
					return
				end

				# Sort by age descending
				findings.sort_by! { |f| -f[:days_old] }

				# Age brackets
				brackets = {
					"Over 3 years" => findings.select { |f| f[:days_old] > 1095 },
					"1 - 3 years" => findings.select { |f| f[:days_old] > 365 && f[:days_old] <= 1095 },
					"6 months - 1 year" => findings.select { |f| f[:days_old] > 180 && f[:days_old] <= 365 },
					"3 - 6 months" => findings.select { |f| f[:days_old] > 90 && f[:days_old] <= 180 },
					"Under 3 months" => findings.select { |f| f[:days_old] <= 90 }
				}

				oldest = findings.first
				ages = findings.map { |f| f[:days_old] }
				avg_age = ages.sum / ages.size

				# Statistics
				heading1 "Patch Age Statistics"

				stats = [
					["Total Findings with Known Dates", findings.size.to_s],
					["Oldest Unpatched Vulnerability", "#{oldest[:days_old]} days (#{(oldest[:days_old] / 365.0).round(1)} years)"],
					["Average Patch Age", "#{avg_age} days (#{(avg_age / 365.0).round(1)} years)"],
					["Over 3 Years Old", brackets["Over 3 years"].size.to_s],
					["1 - 3 Years Old", brackets["1 - 3 years"].size.to_s],
					["6 Months - 1 Year Old", brackets["6 months - 1 year"].size.to_s],
					["3 - 6 Months Old", brackets["3 - 6 months"].size.to_s],
					["Under 3 Months Old", brackets["Under 3 months"].size.to_s]
				]

				@output.table([["Metric", "Value"]] + stats, :header => true,
					:column_widths => {0 => 300, 1 => page_width - 300},
					:width => page_width) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(1).style(:align => :center)
				end

				text "\n"
				new_page

				# Priority table
				heading1 "Remediation Priority"

				text "The following findings are sorted by patch age (oldest first). Findings " \
					"that have been public the longest with patches available represent the " \
					"greatest gap in patch management."
				text "\n"

				headers = ["Finding", "Severity", "CVSS", "Published", "Age (days)", "Hosts"]
				header_widths = {
					0 => (page_width - 55 - 40 - 65 - 55 - 40),
					1 => 55,
					2 => 40,
					3 => 65,
					4 => 55,
					5 => 40
				}

				table_data = findings.first(50).map do |f|
					plugin = f[:plugin]
					pub_date = plugin.vuln_publication_date.strftime('%Y-%m-%d') rescue "N/A"
					[
						Item.scrub_plugin_name(plugin.plugin_name),
						plugin.risk_factor || "N/A",
						plugin.cvss_base_score.to_s,
						pub_date,
						f[:days_old].to_s,
						f[:host_count].to_s
					]
				end

				@output.table([headers] + table_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(2).style(:align => :center)
					column(4).style(:align => :center)
					column(5).style(:align => :center)
				end

				text "\n"
				new_page

				# Age bracket breakdown
				heading1 "Findings by Age Bracket"

				brackets.each do |bracket_name, bracket_findings|
					next if bracket_findings.empty?

					heading2 "#{bracket_name} (#{bracket_findings.size} finding#{'s' if bracket_findings.size != 1})"

					bracket_data = bracket_findings.map do |f|
						plugin = f[:plugin]
						[
							Item.scrub_plugin_name(plugin.plugin_name),
							plugin.risk_factor || "N/A",
							f[:host_count].to_s
						]
					end

					bracket_headers = ["Finding", "Severity", "Hosts"]
					bracket_widths = {0 => (page_width - 60 - 45), 1 => 60, 2 => 45}

					@output.table([bracket_headers] + bracket_data, :header => true, :column_widths => bracket_widths,
						:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
						row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
						cells.borders = [:top, :bottom, :left, :right]
						column(2).style(:align => :center)
					end

					text "\n"
				end

				new_page

				# Detailed findings with host breakdown
				heading1 "Detailed Findings"

				findings.each_with_index do |f, idx|
					plugin = f[:plugin]
					items = Item.where(:plugin_id => plugin.id).where("severity >= 0")
					next if items.count == 0

					hosts = items.group_by(&:host_id)

					heading2 Item.scrub_plugin_name(plugin.plugin_name)

					pub_date = plugin.vuln_publication_date.strftime('%Y-%m-%d') rescue "N/A"
					meta = [
						["Plugin ID", plugin.id.to_s],
						["Severity", plugin.risk_factor || "N/A"],
						["CVSS Score", plugin.cvss_base_score.to_s],
						["Published", pub_date],
						["Age", "#{f[:days_old]} days (#{(f[:days_old] / 365.0).round(1)} years)"],
						["Affected Hosts", hosts.size.to_s]
					]

					@output.table(meta, :header => false,
						:column_widths => {0 => 120, 1 => page_width - 120},
						:width => page_width) do
						cells.borders = [:top, :bottom, :left, :right]
						column(0).style(:font_style => :bold, :background_color => 'F5F5F5')
					end

					text "\n"

					hostlist = []
					hosts.each do |host_id, _|
						host = Host.find_by(:id => host_id)
						next if host.nil?
						hs = host.ip.to_s
						hs << " (#{host.fqdn})" if host.fqdn
						hostlist << hs
					end

					definition "Affected Hosts", hostlist.join(", ")

					definition "Synopsis", plugin.synopsis if plugin.synopsis
					definition "Solution", plugin.solution if plugin.solution

					text "\n"
					@output.start_new_page if idx != findings.size - 1
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
