text Report.classification, :align => :center
text "\n"

font_size(22) { text Report.title, :align => :center }
font_size(18) { 
	text "Critical and High Findings", :align => :center
	text "\n"
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

unique_risks = Array.new
unique_risks << Hash[:title => "Critical Findings", :color => "FF0000", :values => Item.critical_risks_unique]
unique_risks << Hash[:title => "High Findings", :color => "FF8040", :values => Item.high_risks_unique]

unique_risks.each do |h|
	if h[:values].length > 1
		font_size(20) { 
			fill_color h[:color]
			text h[:title], :style => :bold 
			fill_color "000000"
			}
		
		text "\n"
		
		h[:values].each do |f|
			hosts = Item.where(:plugin_id => f.plugin_id)
      plugin = Plugin.find_by_id(f.plugin_id)
      #references = Reference.find(:all, :group => :value, :order => :reference_name, :order => :reference_name, :conditions => {:plugin_id => plugin.id})
			references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)
			
			font_size(16) { text "#{plugin.plugin_name}\n" }

    	if hosts.length > 1
				text "Hosts", :style => :bold
			else
				text "Host", :style => :bold
			end

			hostlist = Array.new
			hosts.each do |host|
				h = Host.find_by_id(host.host_id)
				hostlist << h.name
			end

			text hostlist.join(', ')

			if f.plugin_output != nil
				text "\nPlugin output", :style => :bold
				text f.plugin_output
			end
		
			if plugin.description != nil
				text "\nDescription", :style => :bold
				text plugin.description
			end
		
			if plugin.synopsis != nil
				text "\nSynopsis", :style => :bold
				text plugin.synopsis
			end			
		
			if plugin.cvss_base_score != nil
				text "\nCVSS Base Score", :style => :bold
				text plugin.cvss_base_score
			end
			
			if plugin.exploit_available != nil
				text "\nExploit Available", :style => :bold
				text plugin.exploit_available
			end
		
			if plugin.solution != nil
				text "\nSolution", :style => :bold
				text plugin.solution
			end
					
	    if references.size != 0
	      text "\nReferences", :style => :bold
	      references.each { |ref|
	        ref_text = sprintf "%s: %s\n", ref.reference_name, ref.value
	        text ref_text
	      }
				text "nessuspluginid: #{f.plugin_id}"
	    end
				text "\n"
		end
	end
	
	start_new_page unless h[:values] == nil
end

number_pages "<page> of <total>", [bounds.right - 75, 0]
