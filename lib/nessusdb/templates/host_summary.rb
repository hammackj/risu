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

headers = ["Hostname","Total", "High", "Medium", "Low", "Info"]
header_widths = {0 => 137, 1 => 75, 2 => 75, 3 => 75, 4 => 75, 5 => 75}

puts Host.sorted.class

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

table(results, :headers => headers, 
							:column_widths => header_widths, 
							:border_style => :grid, 
							:header_color => 'D0D0D0',
							:row_colors => ['ffffff', 'E5E5E5'])
#							:row_colors => ['D0D0D0','E5E5E5'])
							
							
