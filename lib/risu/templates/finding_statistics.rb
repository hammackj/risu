module Risu
	module Templates
		class FindingStatistics < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "finding_statistics", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates report finding statistics"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Finding Statistics", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				output.text "Scan Date:", :style => :bold
				output.text "#{Report.scan_date}"
				output.text "\n"

				headers = ["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"]
				data = [Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]

				output.table([headers] + [data], :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

			end
		end
	end
end



