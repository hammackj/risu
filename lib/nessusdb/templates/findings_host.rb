text Report.classification, :align => :center
text "\n"

font_size(22) { text Report.title, :align => :center }
font_size(18) { 
	text "Findings Summary Report", :align => :center
	text "\n"
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

Host.sorted.each do |host|
	if host.items.high_risks_unique_sorted.all.size > 0 or host.items.medium_risks_unique_sorted.all.size > 0
		font_size(20) { 
			text "#{host.ip} - #{host.fqdn}", :style => :bold 
			}
	end
	
	if host.items.high_risks_unique_sorted.all.size > 0
		font_size(18) { 
			fill_color "FF0000"
			text "High Findings", :style => :bold 
			fill_color "000000"
		}
	
		host.items.high_risks_unique_sorted.each do |item|
			name = Plugin.find_by_id(item.plugin_id).plugin_name
			text "#{name}"
		end
	end
	
	if host.items.medium_risks_unique_sorted.all.size > 0
		font_size(18) { 
			fill_color "FF8040"
			text "Medium Findings", :style => :bold 
			fill_color "000000"
		}
	
		host.items.medium_risks_unique_sorted.each do |item|
			name = Plugin.find_by_id(item.plugin_id).plugin_name
			text "#{name}"
		end
	end
	
	if host.items.high_risks_unique_sorted.all.size > 0 or host.items.medium_risks_unique_sorted.all.size > 0
		text "\n"
	end
end
