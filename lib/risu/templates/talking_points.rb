# Copyright (c) 2010-2025 Jacob Hammack.
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
		class TalkingPoints < Risu::Base::TemplateBase
			include TemplateHelper

			# Initializes the Talking Points Report
			def initialize
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
			def render output
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


# module Risu
# 	module Templates
# 		class TalkingPoints < Risu::Base::TemplateBase
# 			include TemplateHelper

# 			# Initializes the Talking Points Report
# 			def initialize
# 				@template_info =
# 				{
# 					:name => "talking_points",
# 					:author => "hammackj",
# 					:version => "0.0.1",
# 					:description => "Generates a Talking Points Report"
# 				}
# 			end

# 			# Renders the Talking Points Report
# 			def render output
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
