module Risu
	module Modules
		class FindingsSummaryWithPluginID < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "findings_summary_with_pluginid", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Geneates a Findings Summary with Nessus Plugin ID"
				}
			end
			
			#
			#
			def render(output)
				text Report.classification, :align => :center
				text "\n"

				font_size(22) { text Report.title, :align => :center }
				font_size(18) { 
					text "Findings Summary Report", :align => :center
					text "\n"
					text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n\n\n"

				font_size(20) { 
					fill_color "FF0000"
					text "High Findings", :style => :bold 
					fill_color "000000"
				}

				Item.high_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					text "#{count} - #{name} - #{item.plugin_id}"
				end

				start_new_page

				font_size(20) { 
					fill_color "FF8040"
					text "Medium Findings", :style => :bold 
					fill_color "000000"
				}

				Item.medium_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					text "#{count} - #{name} - #{item.plugin_id}"
				end

				start_new_page

				font_size(20) { 
					fill_color "0000FF"
					text "Low Findings", :style => :bold 
					fill_color "000000"
				}

				Item.low_risks_unique_sorted.each do |item|
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					text "#{count} - #{name} - #{item.plugin_id}"
				end

				#Provides nothing
				#font_size(20) { 
				#	fill_color "008000"
				#	text "Low Findings", :style => :bold 
				#	fill_color "000000"
				#}
				#
				#Item.low_risks_unique_sorted.each do |item|
				#	name = Plugin.find_by_id(item.plugin_id).plugin_name
				#	count = Item.where(:plugin_id => item.plugin_id).count
				#
				#	text "#{count} - #{name}"
				#end
			end
		end
	end
end
