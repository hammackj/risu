text Report.classification, :align => :center
text "\n"

font_size(22) { text Report.title, :align => :center }
font_size(18) { 
	text "Microsoft Update Summary", :align => :center
	text "\n"
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

font_size(12)

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

table(results, :headers => headers, 
							:column_widths => header_widths, 
							:border_style => :grid, 
							:header_color => 'cccccc',
							:row_colors => ['ffffff', '336699'])
