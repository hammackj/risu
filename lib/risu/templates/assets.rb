module NaslTidy
	module Modules
		class Assests < Risu::Base::TemplateBase
			#
			#
			def initialize ()
				@module_info = 
				{ 
					:name => "assets", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a Assets Summary Report"
				}
			end
			
			#
			#
			def render
				text Report.classification, :align => :center
				text "\n"

				font_size(22) { 
					text Report.title, :align => :center 
				}
				
				font_size(18) { 
					text "Networked Assets", :align => :center
					text "\n"
					text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n\n"

				Host.sorted.each do |host|
					text "Name: #{host.name}\n"
					text "FQDN: #{host.fqdn}\n" unless host.fqdn == nil
					text "IP Address: #{host.ip}\n" unless host.ip == nil
					text "NetBios: #{host.netbios}\n" unless host.netbios == nil
					text sprintf "Mac Address: %s\n", host.mac.chomp.gsub("\n", ", ") unless host.mac == nil
					text sprintf "Operation System: %s\n", host.os.chomp.gsub("\n", "/") unless host.os == nil
					text "\n"
				end
			end
		end
	end
end

