# Copyright (c) 2010-2017 Jacob Hammack.
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
		class ExecSummary < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "exec_summary",
					:author => "hammackj",
					:version => "0.0.5",
					:renderer => "PDF",
					:description => "Generates a simple executive summary."
				}
			end

			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				report_title Report.title
				report_subtitle "Executive Summary"
				report_author "This report was prepared by\n#{Report.author}"

				output.text "\n\n\n"

				output.text "Scan Date:", :style => :bold
				output.text "#{Report.scan_date}"
				output.text "\n"

				output.text "This report contains the results of a security audit performed on #{Report.scan_date}. It contains confidential information about the state of your network. Access to this information by unauthorized personnel may allow them to compromise your network.\n\n"

				output.text "A total of #{Host.count} hosts were found and scanned for vulnerabilities.\n\n"

				output.text "There were #{Item.risks.count} vulnerabilities found during this scan. Of these, #{Item.critical_risks.count} were critical vulnerabilities,#{Item.high_risks.count} were high vulnerabilities, #{Item.medium_risks.count} were medium vulnerabilities, #{Item.low_risks.count} were low vulnerabilities and #{Item.info_risks.count} were information findings.\n\n"

				output.text "Scan Statistics", :style => :bold
				output.text "\n"

				output.table([[
					"Number of hosts",
					"Number of risks",
					"Critical Risks",
					"High Risks",
					"Medium Risks",
					"Low Risks",
					"Info Risks"],
				[
					Host.count,
					Item.risks.count,
					Item.critical_risks.count,
					Item.high_risks.count,
					Item.medium_risks.count,
					Item.low_risks.count,
					Item.info_risks.count]],
				:cell_style => { :padding =>12 }, :width => output.bounds.width)
				output.text "\n\n\n"

				output.text "Graphs of key finding statistics", :style => :bold
				output.text "\n\n\n"

				cury = output.y
				output.image Item.risks_by_severity_graph, :width => 250, :at => [output.bounds.left, cury]
				output.image Host.top_vuln_graph(10), :width => 250, :at => [output.bounds.right - 250, cury]
				output.move_down 50

				output.start_new_page
				
				cury = output.y
				output.image Item.risks_by_service_graph(10), :width => 250, :at => [output.bounds.left, cury]
				output.image Host.other_os_graph, :width => 250, :at => [output.bounds.right - 250, cury]
				output.move_down 250

				cury = output.y

				output.image Host.windows_os_graph, :width => 250, :at => [output.bounds.left, cury]
				output.image Item.stigs_severity_graph, :width => 250, :at => [output.bounds.right - 250, cury]
			end
		end
	end
end
