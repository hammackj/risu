module Risu
	module Modules
		class FindingsHost < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "findings_host", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a findings report by host"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) { 
					output.text "Findings Summary Report", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				Host.sorted.each do |host|
					if host.items.high_risks_unique_sorted.all.size > 0 or host.items.medium_risks_unique_sorted.all.size > 0
						output.font_size(20) { 
							output.text "#{host.ip} - #{host.fqdn}", :style => :bold 
							}
					end

					if host.items.high_risks_unique_sorted.all.size > 0
						output.font_size(18) { 
							output.fill_color "FF0000"
							output.text "High Findings", :style => :bold 
							output.fill_color "000000"
						}

						host.items.high_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end
					end

					if host.items.medium_risks_unique_sorted.all.size > 0
						output.font_size(18) { 
							output.fill_color "FF8040"
							output.text "Medium Findings", :style => :bold 
							output.fill_color "000000"
						}

						host.items.medium_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end
					end

					if host.items.high_risks_unique_sorted.all.size > 0 or host.items.medium_risks_unique_sorted.all.size > 0
						output.text "\n"
					end
				end

			end
		end
	end
end
