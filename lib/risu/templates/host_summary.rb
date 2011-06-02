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
				text Report.classification, :align => :center
				text "\n"

				font_size(22) { text Report.title, :align => :center }
				font_size(18) {
					text "Host Summary Report", :align => :center
					text "\n"
					text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n\n\n"

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

				table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end
			end
		end
	end
end
