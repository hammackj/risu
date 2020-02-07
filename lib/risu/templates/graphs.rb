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
		class Graphs < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize
				@template_info =
				{
					:name => "graphs",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a report with all the graphs in it",
					:scanner => "Nessus"
				}
			end

			#
			#
			def render output
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(24) do
					output.text Report.title, :align => :center
				end

				output.font_size(18) do
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				end

				output.text "\n\n\n"

				output.start_new_page

				output.image Item.risks_by_severity_graph, :width => 500, :height => 375, :position => :center
				output.text Item.risks_by_severity_graph_text

				output.start_new_page

				output.image Item.risks_by_service_graph(10), :width => 500, :height => 375, :position => :center
				output.text Item.risks_by_service_graph_text

				output.start_new_page

				output.image Plugin.top_by_count_graph(10), :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Host.top_vuln_graph(10), :width => 500, :height => 375, :position => :center

				other_os_graph_page

				windows_os_graph_page

				output.image Item.stigs_severity_graph, :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Plugin.root_cause_graph, :width => 500, :height => 375, :position => :center
				output.text Plugin.root_cause_graph_text
			end
		end
	end
end
