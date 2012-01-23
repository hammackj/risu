module Risu
	module Modules
		class Graphs < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "graphs",
					:author => "hammackj",
					:version => "0.0.1",
					:description => "Generates a report with all the graphs in it",
					:scanner => "Nessus"
				}
			end

			#
			#
			def render(output)
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

				output.start_new_page

				output.image Item.risks_by_service_graph(10), :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Plugin.top_by_count_graph(10), :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Host.top_vuln_graph(10), :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Host.other_os_graph, :width => 500, :height => 375, :position => :center

				output.start_new_page

				output.image Host.windows_os_graph, :width => 500, :height => 375, :position => :center
			end
		end
	end
end
