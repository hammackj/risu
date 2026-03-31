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
		class HostFindingsSummary < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize
				@template_info =
				{
					:name => "host_findings_summary",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a report of all hosts with a finding summary under each"
				}
			end

			#
			#
			def render output
				@output.font_size 10

				report_classification

				report_title Report.title
				report_subtitle "Host Findings Summary Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				Host.sorted.each do |host|
					crit = Item.critical_risks.where(:host_id => host.id).count
					high = Item.high_risks.where(:host_id => host.id).count
					medium = Item.medium_risks.where(:host_id => host.id).count
					low = Item.low_risks.where(:host_id => host.id).count
					info = Item.info_risks.where(:host_id => host.id).count
					total = crit + high + medium + low + info

					next if total == 0

					host_string = "#{host.ip}"
					host_string << " (#{host.fqdn})" if host.fqdn != nil

					@output.font_size(16) do
						output.text "#{host_string}", :style => :bold
					end

					@output.text "\n"

					authenticated = nil
					if host.host_properties.where(:name => "Credentialed_Scan").first != nil
						authenticated = host.host_properties.where(:name => "Credentialed_Scan").first.value
					end

					host_info = []
					host_info << ["Hostname", host.name || "N/A"]
					host_info << ["FQDN", host.fqdn || "N/A"]
					host_info << ["MAC Address", host.mac || "N/A"]
					host_info << ["Authenticated", authenticated || "N/A"]

					output.table(host_info, :column_widths => {0 => 130, 1 => 380}, :row_colors => ['ffffff', 'E5E5E5']) do
						column(0).style(:font_style => :bold)
						cells.borders = [:top, :bottom, :left, :right]
					end

					@output.text "\n"

					headers = ["Total", "Critical", "High", "Medium", "Low", "Info"]
					header_widths = {0 => 85, 1 => 85, 2 => 85, 3 => 85, 4 => 85, 5 => 85}

					summary_row = [total, crit, high, medium, low, info]

					output.table([headers] + [summary_row], :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'E5E5E5']) do
						row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
						cells.borders = [:top, :bottom, :left, :right]
					end

					@output.text "\n"

					if host.items.critical_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) do
							output.fill_color "551A8B"
							output.text "Critical Findings", :style => :bold
							output.fill_color "000000"
						end

						host.items.critical_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end

						@output.text "\n"
					end

					if host.items.high_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "FF0000"
							output.text "High Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.high_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end

						@output.text "\n"
					end

					if host.items.medium_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "FF8040"
							output.text "Medium Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.medium_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end

						@output.text "\n"
					end

					if host.items.low_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "0000FF"
							output.text "Low Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.low_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end

						@output.text "\n"
					end

					if host.items.info_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "008000"
							output.text "Informational Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.info_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end

						@output.text "\n"
					end

					@output.text "\n"
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
