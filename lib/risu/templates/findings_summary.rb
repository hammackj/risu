module Risu
	module Modules
		class FindingsSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "findings_summary", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a findings summary report"
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

				output.font_size(20) { 
					output.fill_color "FF0000"
					output.text "High Findings", :style => :bold 
					output.fill_color "000000"
				}

				Item.high_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					output.text "#{count} - #{name}"
				end

				output.start_new_page

				output.font_size(20) { 
					output.fill_color "FF8040"
					output.text "Medium Findings", :style => :bold 
					output.fill_color "000000"
				}

				Item.medium_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					output.text "#{count} - #{name}"
				end

				output.start_new_page

				output.font_size(20) { 
					output.fill_color "0000FF"
					output.text "Low Findings", :style => :bold 
					output.fill_color "000000"
				}

				Item.low_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					output.text "#{count} - #{name}"
				end

				#Provides nothing
				#output.font_size(20) { 
				#	output.fill_color "008000"
				#	output.text "Low Findings", :style => :bold 
				#	output.fill_color "000000"
				#}
				#
				#Item.low_risks_unique_sorted.each do |item|
				#	name = Plugin.find_by_id(item.plugin_id).plugin_name
				#	count = Item.where(:plugin_id => item.plugin_id).count
				#
				#	output.text "#{count} - #{name}"
				#end

			end
		end
	end
end
