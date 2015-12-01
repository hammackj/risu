# Copyright (c) 2010-2015 Arxopia LLC.
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
		class TalkingPoints < Risu::Base::TemplateBase
			include TemplateHelper

			# Initializes the Talking Points Report
			def initialize ()
				@template_info =
				{
					:name => "talking_points",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a Talking Points Report"
				}
			end

			# Renders the Talking Points Report
			def render(output)
				report_classification

				report_title Report.title
				report_subtitle "Talking Points Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				# Number of hosts / score
				@output.text "There were #{Host.count} hosts identified, containing #{Item.critical_risks.to_a.count + Item.high_risks.to_a.count} critical and high risks findings. Of those there were #{Item.critical_risks.to_a.count} Critical risks, and #{Item.high_risks.to_a.count} High risks."

				@output.text "These critical and highs were discovered on #{Host.unique_hosts_with_critical_and_high_count} unique hosts. #{Item.risk_percent_rounded_text} of the total assessed computers were found to have an critical or high finding."

				# @TODO need vulnerable host count

				@output.text "\n\n\n"

				# Top Hosts with Findings
				#@TODO need this call

				@output.text "\n\n\n"

				# Notable Findings
				Item.top_10_table(@output)


				# Plugin_output keyword search?

				@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end


# # Copyright (c) 2010-2015 Arxopia LLC.
# # All rights reserved.
# #
# # Redistribution and use in source and binary forms, with or without
# # modification, are permitted provided that the following conditions are met:
# #
# #     * Redistributions of source code must retain the above copyright
# #       notice, this list of conditions and the following disclaimer.
# #     * Redistributions in binary form must reproduce the above copyright
# #       notice, this list of conditions and the following disclaimer in the
# #       documentation and/or other materials provided with the distribution.
# #     * Neither the name of the Arxopia LLC nor the names of its contributors
# #     	may be used to endorse or promote products derived from this software
# #     	without specific prior written permission.
# #
# # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# # ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# # WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# # DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# # INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# # LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# # OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# # LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# # OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# # OF THE POSSIBILITY OF SUCH DAMAGE.

# module Risu
# 	module Templates
# 		class TalkingPoints < Risu::Base::TemplateBase
# 			include TemplateHelper

# 			# Initializes the Talking Points Report
# 			def initialize ()
# 				@template_info =
# 				{
# 					:name => "talking_points",
# 					:author => "hammackj",
# 					:version => "0.0.1",
# 					:description => "Generates a Talking Points Report"
# 				}
# 			end

# 			# Renders the Talking Points Report
# 			def render(output)
# 				report_classification

# 				report_title Report.title
# 				report_subtitle "Talking Points Report"
# 				report_author "This report was prepared by\n#{Report.author}"

# 				@output.text "\n\n\n"

# 				@output.text "Scan Date:", :style => :bold
# 				@output.text "#{Report.scan_date}"
# 				@output.text "\n"

# 				# Number of hosts / score
# 				@output.text "There were #{Host.count} hosts identified, containing #{Item.critical_risks.to_a.count + Item.high_risks.to_a.count} critical and high risks findings. Of those there were #{Item.critical_risks.to_a.count} Critical risks, and #{Item.high_risks.to_a.count} High risks. were discovered on #{Host.unique_hosts_with_critical.count + Host.unique_hosts_with_high.count
# 				#{Item.risk_percent_rounded_text} of the total assessed computers were found to have an critical or high finding."

# 				#need vulnerable host count

# 				@output.text "\n\n\n"

# 				# Top Hosts with Findings
# 				#@TODO need this call

# 				@output.text "\n\n\n"

# 				# Notable Findings
# 				Item.top_10_table(@output)


# 				# Plugin_output keyword search?

# 				@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
# 			end
# 		end
# 	end
# end
