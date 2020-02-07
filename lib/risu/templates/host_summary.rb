# Copyright (c) 2010-2020 Jacob Hammack.
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
		class HostSummary < Risu::Base::TemplateBase
			include TemplateHelper

			#
			def initialize
				@template_info =
				{
					:name => "host_summary",
					:author => "hammackj",
					:version => "0.0.3",
					:renderer => "PDF",
					:description => "Generates a Host Summary Report"
				}
			end

			#
			#
			def render output
				@output.text Report.classification.upcase, :align => :center
				@output.text "\n"

				report_title Report.title
				report_subtitle "Host Summary Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				results = Array.new

				headers = ["Hostname", "Total", "Critical", "High", "Medium", "Low", "Info"]
				header_widths = {0 => 230, 1 => 46, 2 => 46, 3 => 46, 4 => 47, 5 => 46, 6 => 46}

				Host.sorted.each do |host|
					row = Array.new

					total  = Item.risks.where(:host_id => host.id).count
					crit = Item.critical_risks.where(:host_id => host.id).count
					high = Item.high_risks.where(:host_id => host.id).count
					medium = Item.medium_risks.where(:host_id => host.id).count
					low = Item.low_risks.where(:host_id => host.id).count
					info = Item.info_risks.where(:host_id => host.id).count

					host_name = host.name
					host_name = "#{host.name} (#{host.netbios})" if host.netbios != nil

					row.push(host_name)
					row.push(total)
					row.push(crit)
					row.push(high)
					row.push(medium)
					row.push(low)
					row.push(info)

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
