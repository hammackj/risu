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
		class HostInventory < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "host_inventory",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a Host Inventory Report"
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
					@output.text "Host Inventory Report", :align => :left
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

				text "This report provides a complete inventory of all hosts discovered during " \
					"the network assessment, including operating system identification, " \
					"authentication status, and finding counts by severity. This serves as a " \
					"baseline asset inventory and can be used to identify unknown or " \
					"unauthorized systems on the network."
				text "\n"

				# Network summary
				heading1 "Network Summary"

				auth_count = authenticated_count
				total = Host.count

				summary_stats = [
					["Total Hosts Discovered", total.to_s],
					["Authenticated Hosts", auth_count["auth"].to_s],
					["Unauthenticated Hosts", auth_count["unauth"].to_s],
					["Scan Date", Report.scan_date.strftime('%B %d, %Y')]
				]

				@output.table([["Metric", "Value"]] + summary_stats, :header => true,
					:column_widths => {0 => 300, 1 => page_width - 300},
					:width => page_width) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(1).style(:align => :center)
				end

				text "\n"

				# OS breakdown
				heading2 "Operating System Distribution"

				os_counts = {}
				Host.all.each do |host|
					os = host.os || "Unknown"
					# Simplify OS name for grouping
					os_short = case os
						when /Windows Server 2022/i then "Windows Server 2022"
						when /Windows Server 2019/i then "Windows Server 2019"
						when /Windows Server 2016/i then "Windows Server 2016"
						when /Windows Server 2012/i then "Windows Server 2012"
						when /Windows Server 2008/i then "Windows Server 2008"
						when /Windows Server 2003/i then "Windows Server 2003"
						when /Windows 11/i then "Windows 11"
						when /Windows 10/i then "Windows 10"
						when /Windows 8/i then "Windows 8"
						when /Windows 7/i then "Windows 7"
						when /Windows XP/i then "Windows XP"
						when /Windows/i then "Windows (Other)"
						when /Ubuntu/i then "Ubuntu Linux"
						when /Debian/i then "Debian Linux"
						when /CentOS/i then "CentOS Linux"
						when /Red Hat/i then "Red Hat Linux"
						when /Linux/i then "Linux (Other)"
						when /VMware ESXi/i then "VMware ESXi"
						when /FreeBSD/i then "FreeBSD"
						when /Cisco/i then "Cisco IOS"
						when /AIX/i then "AIX"
						when /Mac OS X|macOS/i then "macOS"
						else os.length > 40 ? os[0..39] + "..." : os
					end

					os_counts[os_short] = (os_counts[os_short] || 0) + 1
				end

				os_data = os_counts.sort_by { |_, count| -count }.map do |os, count|
					[os, count.to_s]
				end

				if os_data.any?
					os_headers = ["Operating System", "Count"]
					os_widths = {0 => (page_width - 60), 1 => 60}

					@output.table([os_headers] + os_data, :header => true, :column_widths => os_widths,
						:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
						row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
						cells.borders = [:top, :bottom, :left, :right]
						column(1).style(:align => :center)
					end

					text "\n"
				end

				# OS graphs
				if Host.windows_os_graph_has_data?
					new_page
					heading2 "Windows Server OS Distribution"
					@output.image Host.windows_os_graph, :width => 450, :height => 337, :position => :center
					text "\n"
				end

				if Host.other_os_graph_has_data?
					new_page
					heading2 "Non-Windows OS Distribution"
					@output.image Host.other_os_graph, :width => 450, :height => 337, :position => :center
					text "\n"
				end

				auth_coverage_graph_page
				top_hosts_graph_page

				new_page

				# Full inventory table
				heading1 "Host Inventory"

				headers = ["IP", "FQDN", "OS", "Auth", "C", "H", "M", "L"]
				header_widths = {
					0 => 75,
					1 => 95,
					2 => (page_width - 75 - 95 - 30 - 25 - 25 - 25 - 25),
					3 => 30,
					4 => 25,
					5 => 25,
					6 => 25,
					7 => 25
				}

				inventory_data = []

				Host.sorted.each do |host|
					# Auth status
					auth_prop = host.host_properties.where(:name => "Credentialed_Scan").first
					auth = if auth_prop.nil?
						"-"
					elsif auth_prop.value == "true"
						"Y"
					else
						"N"
					end

					# Finding counts
					crit = host.items.where(:severity => 4, :rollup_finding => false).count
					high = host.items.where(:severity => 3, :rollup_finding => false).count
					med = host.items.where(:severity => 2, :rollup_finding => false).count
					low = host.items.where(:severity => 1, :rollup_finding => false).count

					os = host.os || "Unknown"
					os = os[0..35] + "..." if os.length > 38

					inventory_data << [
						host.ip || "N/A",
						host.fqdn || "-",
						os,
						auth,
						crit > 0 ? crit.to_s : "-",
						high > 0 ? high.to_s : "-",
						med > 0 ? med.to_s : "-",
						low > 0 ? low.to_s : "-"
					]
				end

				@output.table([headers] + inventory_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(3).style(:align => :center)
					column(4).style(:align => :center)
					column(5).style(:align => :center)
					column(6).style(:align => :center)
					column(7).style(:align => :center)
				end

				text "\n"
				text "Legend: Auth = Authenticated Scan (Y/N), C = Critical, H = High, M = Medium, L = Low"

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
