# Copyright (c) 2010-2017 Arxopia LLC.
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
		class MSUpdateSummary < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "ms_update_summary",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a Microsoft Update Summary Report"
				}
			end

			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Microsoft Update Summary", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				output.font_size(12)

				results = Array.new

				headers = ["Hostname","Operating System", "Windows Update Status"]
				header_widths = {0 => 108, 1 => 264, 2 => 140}

				Item.ms_update.each do |item|
					host = Host.find_by_id(item.host_id)

					if host == nil
						next
					end

					row = Array.new
					row.push(host.name)
					row.push(host.os)

					if item.plugin_output =~ /'Automatic Updates' are disabled/
						row.push("Disabled")
					else
						row.push("Enabled")
					end

					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['FFFFFF', '336699']) do
					row(0).style(:font_style => :bold, :background_color => 'CCCCCC')
					cells.borders = [:top, :bottom, :left, :right]
				end

			end
		end
	end
end
