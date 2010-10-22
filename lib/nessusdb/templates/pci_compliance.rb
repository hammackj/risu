text findings.classification, :align => :center
text "\n"

font_size(22) { text findings.title, :align => :center }
font_size(18) { 
	text "PCI /DSS Complience Overview", :align => :center
	text "\n"
	text "This report was prepared by\n#{findings.author}", :align => :center
}

text "\n\n\n"

@hosts_count = Host.find(:all, :conditions => ["pci_dss_compliance is not null"]).count
@hosts_passed = Host.find(:all, :conditions => ["pci_dss_compliance like 'passed'"])
@hosts_failed = Host.find(:all, :conditions => ["pci_dss_compliance like 'failed'"])

font_size(20) {
	text "Summary\n", :style => :bold
}

text "Of #{@hosts_count} total hosts, #{@hosts_passed.count} passed and #{@hosts_failed.count} failed."

text "\n\n"

if @hosts_passed.length > 0
	font_size(20) { 
		fill_color "00FF00"
		text "PCI / DSS Compliant Hosts", :style => :bold
		fill_color "000000"
		}
	
	text "\n"
	
	@hosts_passed.each do |host|	
		text "#{host.ip} / #{host.fqdn} - passed\n"
	end unless @hosts_passed == nil
	
	start_new_page
end

if @hosts_failed.length > 0
	font_size(20) { 
		fill_color "FF0000"
		text "Non PCI / DSS Compliant Hosts", :style => :bold 
		fill_color "000000"
		}
	
	text "\n"
	
	@hosts_failed.each do |host|	
			host_id = host.id
			plugin = Plugin.find(:first, :conditions => { :id => 33929 })
			item = Item.find(:first, :conditions => { :host_id => host_id, :plugin_id => plugin.id })

			text "#{host.ip} / #{host.fqdn} - failed\n", :style => :bold
			text "Description:\n", :style => :bold
			text "#{plugin.description}\n"
			text "Plugin Output:\n", :style => :bold
			text "#{item.plugin_output}\n"

			text "\n"

	end unless @hosts_failed == nil
	
	start_new_page
end
