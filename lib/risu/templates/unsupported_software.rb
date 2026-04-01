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
		class UnsupportedSoftware < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "unsupported_software",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates an Unsupported / End-of-Life Software Report"
				}
			end

			def render output
				text Report.classification.upcase, :align => :center
				text "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

				@output.font_size(24) do
					@output.text Report.title, :align => :left
				end
				@output.font_size(18) do
					@output.text "Unsupported / End-of-Life Software", :align => :left
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

				heading1 "Overview"

				text "Unsupported or end-of-life software is software that the vendor no longer provides " \
					"security patches or updates for. Running unsupported software poses a significant " \
					"risk because any newly discovered vulnerabilities will never be patched, leaving " \
					"systems permanently exposed."
				text "\n"

				text "This report identifies all unsupported software detected during the vulnerability " \
					"assessment. Each entry should be evaluated for upgrade or replacement as part of " \
					"the organization's patch management and lifecycle planning."
				text "\n"

				# Find all plugins flagged as unsupported_by_vendor
				unsupported_plugins = Plugin.where(:unsupported_by_vendor => true)

				# Also find plugins with "Unsupported" or "SEoL" in the name that may not have the flag
				name_match = Plugin.where("plugin_name LIKE '%Unsupported%' OR plugin_name LIKE '%SEoL%'")

				# Merge and deduplicate
				all_plugin_ids = (unsupported_plugins.pluck(:id) + name_match.pluck(:id)).uniq

				# Filter to only plugins that have actual findings
				active_plugins = all_plugin_ids.select do |pid|
					Item.where(:plugin_id => pid).where("severity >= 0").count > 0
				end

				if active_plugins.empty?
					heading1 "Results"
					text "No unsupported or end-of-life software was detected on the network."
					@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
					return
				end

				# Summary table
				heading1 "Summary"

				text "#{active_plugins.size} unsupported software " \
					"finding#{'s' if active_plugins.size != 1} were identified across the network."
				text "\n"

				headers = ["Finding", "Severity", "Affected Hosts"]
				header_widths = {0 => (page_width - 60 - 80), 1 => 80, 2 => 60}

				summary_data = []
				active_plugins.each do |pid|
					plugin = Plugin.find_by(:id => pid)
					next if plugin.nil?

					host_count = Item.where(:plugin_id => pid).where("severity >= 0").map(&:host_id).uniq.size
					severity = plugin.risk_factor || "N/A"

					summary_data << [
						Item.scrub_plugin_name(plugin.plugin_name),
						severity,
						host_count.to_s
					]
				end

				# Sort by severity
				severity_order = {"Critical" => 0, "High" => 1, "Medium" => 2, "Low" => 3, "None" => 4, "N/A" => 5}
				summary_data.sort_by! { |row| [severity_order[row[1]] || 5, -row[2].to_i] }

				@output.table([headers] + summary_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(2).style(:align => :center)
				end

				text "\n"
				new_page

				# Detailed findings
				heading1 "Detailed Findings"

				active_plugins.each_with_index do |pid, idx|
					plugin = Plugin.find_by(:id => pid)
					next if plugin.nil?

					items = Item.where(:plugin_id => pid).where("severity >= 0")
					next if items.count == 0

					heading2 Item.scrub_plugin_name(plugin.plugin_name)

					# Plugin metadata
					meta = [
						["Plugin ID", pid.to_s],
						["Severity", plugin.risk_factor || "N/A"],
						["CVSS Score", plugin.cvss_base_score.to_s]
					]

					@output.table(meta, :header => false,
						:column_widths => {0 => 120, 1 => page_width - 120},
						:width => page_width) do
						cells.borders = [:top, :bottom, :left, :right]
						column(0).style(:font_style => :bold, :background_color => 'F5F5F5')
					end

					text "\n"

					if plugin.description
						definition "Description", plugin.description.gsub(/[ ]{2,}/, " ")
					end

					if plugin.solution
						definition "Solution", plugin.solution
					end

					text "\n"

					# Affected hosts table
					host_headers = ["IP Address", "FQDN", "Operating System", "Port"]
					host_widths = {0 => 100, 1 => 130, 2 => (page_width - 100 - 130 - 50), 3 => 50}

					host_data = []
					items.each do |item|
						host = Host.find_by(:id => item.host_id)
						next if host.nil?

						host_data << [
							host.ip || "N/A",
							host.fqdn || "N/A",
							host.os || "N/A",
							item.port.to_s
						]
					end

					host_data.uniq!
					host_data.sort_by! { |row| row[0] }

					@output.table([host_headers] + host_data, :header => true, :column_widths => host_widths,
						:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
						row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
						cells.borders = [:top, :bottom, :left, :right]
					end

					text "\n"

					@output.start_new_page if idx != active_plugins.size - 1
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
