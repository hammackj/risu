module Risu
	module Modules
		class Assests < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "assets", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a Assets Summary Report"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) do
					output.text Report.title, :align => :center 
				end
				
				output.font_size(18) do
					output.text "Networked Assets", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				end

				output.text "\n\n"

				Host.sorted.each do |host|
					output.text "Name: #{host.name}\n"
					output.text "FQDN: #{host.fqdn}\n" unless host.fqdn == nil
					output.text "IP Address: #{host.ip}\n" unless host.ip == nil
					output.text "NetBios: #{host.netbios}\n" unless host.netbios == nil
					output.text sprintf "Mac Address: %s\n", host.mac.chomp.gsub("\n", ", ") unless host.mac == nil
					output.text sprintf "Operation System: %s\n", host.os.chomp.gsub("\n", "/") unless host.os == nil
					output.text "\n"
				end
			end
		end
	end
end

