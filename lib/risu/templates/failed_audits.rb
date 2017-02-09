# Copyright (c) 2010-2013 Arxopia LLC.
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
