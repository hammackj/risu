text Report.classification, :align => :center
text "\n"

font_size(22) { text Report.title, :align => :center }
font_size(18) { 
	text "Missing Microsoft Patch Summary", :align => :center
	text "\n"
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

Item.ms_patches.each do |item|
	host = Host.find_by_id(item.host_id)
	
	if host == nil
		next
	end
	
	if host.name != nil
		text "Host:", :style => :bold 
		text host.name
	end
	
	if host.os != nil
		text "OS:", :style => :bold
		text host.os
	end
	
	if host.mac != nil
		text "Mac:", :style => :bold
		text host.mac
	end
	text "\n"
	text item.plugin_output
	text "\n"
end
