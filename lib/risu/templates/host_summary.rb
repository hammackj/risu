module Risu
	module Modules
		class HostSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "host_summary", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a Host Summary Report"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Host Summary Report", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				results = Array.new

				headers = ["Hostname", "Total", "High", "Medium", "Low", "Info"]
				header_widths = {0 => 137, 1 => 75, 2 => 75, 3 => 75, 4 => 75, 5 => 75}

				Host.sorted.each do |host|
					row = Array.new

					total  = Item.risks.where(:host_id => host.id).count
					high = Item.high_risks.where(:host_id => host.id).count
					medium = Item.medium_risks.where(:host_id => host.id).count
					low = Item.low_risks.where(:host_id => host.id).count
					info = Item.info_risks.where(:host_id => host.id).count

					row.push(host.name)
					row.push(total)
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
			end
		end
	end
end
