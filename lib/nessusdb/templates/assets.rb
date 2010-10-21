text findings.classification, :align => :center
text "\n"

font_size(22) { text findings.title, :align => :center }
font_size(18) { 
	text "Networked Assets", :align => :center
	text "\n"
	text "This report was prepared by\n#{findings.author}", :align => :center
}

text "\n\n"

@hosts = Host.find(:all)

@hosts.each do |host|
	text "Name: #{host.name}\n"
	text "FQDN: #{host.fqdn}\n" unless host.fqdn == nil
	text "IP Address: #{host.ip}\n" unless host.ip == nil
	text "NetBios: #{host.netbios}\n" unless host.netbios == nil
	text "Mac Address: #{host.mac}\n" unless host.mac == nil
	text "Operation System: #{host.os}\n\n" unless host.os == nil
end