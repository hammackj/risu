module Risu
	module Modules
		class MSUpdateSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "ms_update_summary", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a Microsoft Update Summary Report"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) { 
					output.text "Microsoft Update Summary", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				output.font_size(12)

				results = Array.new

				headers = ["Hostname","Operating System", "Windows Update Status"]
				header_widths = {0 => 108, 1 => 264, 2 => 140}

				Item.ms_update.each do |item|
					host = Host.find_by_id(item.host_id)

					if host == nil
						next
					end

					row = Array.new
					row.push(host.name)
					row.push(host.os)

					if item.plugin_output =~ /'Automatic Updates' are disabled/
						row.push("Disabled")
					else
						row.push("Enabled")
					end

					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', '336699']) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

			end
		end
	end
end
