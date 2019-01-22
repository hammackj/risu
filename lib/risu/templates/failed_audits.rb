# Copyright (c) 2010-2019 Jacob Hammack.
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
		class FailedAudits < Risu::Base::TemplateBase
			include TemplateHelper

			# Initializes the template loading meta data
			#
			def initialize
				@template_info =
				{
					:name => "failed_audits",
					:author => "abenson",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Failed Audit Checks"
				}
			end

			def print_header(size, text, color)
				oldcolor = @output.fill_color
				@output.font_size(size) do
					@output.fill_color color
					@output.text text, :style => :bold
					@output.fill_color oldcolor
				end
			end

			# Called during the rendering process
			#
			def render output
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Failed Audit Checks"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				text "Verify each finding. The compliance audits only look for exact matches. For example, if the policy value for minimum password length is 8, and the actual value is 10, this finding can be ignored."

				text "\n\n\n"

				Host.all.each do |h|
					print_header(20, "#{h.name} (#{h.ip})", "000000")

					if h.items.where(:cm_compliance_result => "FAILED").count > 0
						data = [["Name", "Policy", "Value"]]
						h.items.where(:cm_compliance_result => "FAILED").each do |cm|
							data += [[cm.cm_compliance_check_name, cm.cm_compliance_policy_value, cm.cm_compliance_actual_value]]
						end

						output.table(data, :header => true) do
							row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
							cells.borders = [:top, :bottom, :left, :right]
						end
						text "\n"

					elsif h.items.where(:cm_compliance_result => "PASSED").count > 0
						text "Host passed all audits."
					else
						text "Audits were not conducted on host."
					end
				end

				text "\n\n\n"

				output.start_new_page
			end
		end
	end
end
