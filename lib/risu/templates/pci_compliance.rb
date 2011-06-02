module Risu
	module Modules
		class PCICompliance < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "pci_compliance", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a PCI Compliance Overview Report"
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) { 
					output.text "PCI /DSS Complience Overview", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				@hosts_count = Host.find(:all, :conditions => ["pci_dss_compliance is not null"]).count
				@hosts_passed = Host.find(:all, :conditions => ["pci_dss_compliance like 'passed'"])
				@hosts_failed = Host.find(:all, :conditions => ["pci_dss_compliance like 'failed'"])

				output.font_size(20) {
					output.text "Summary\n", :style => :bold
				}

				output.text "Of #{@hosts_count} total hosts, #{@hosts_passed.count} passed and #{@hosts_failed.count} failed."

				output.text "\n\n"

				if @hosts_passed.length > 0
					output.font_size(20) { 
						output.fill_color "00FF00"
						output.text "PCI / DSS Compliant Hosts", :style => :bold
						output.fill_color "000000"
						}

					output.text "\n"

					@hosts_passed.each do |host|	
						output.text "#{host.ip} / #{host.fqdn} - passed\n"
					end unless @hosts_passed == nil

					output.start_new_page
				end

				if @hosts_failed.length > 0
					output.font_size(20) { 
						output.fill_color "FF0000"
						output.text "Non PCI / DSS Compliant Hosts", :style => :bold 
						output.fill_color "000000"
						}

					output.text "\n"

					@hosts_failed.each do |host|	
							host_id = host.id
							plugin = Plugin.find(:first, :conditions => { :id => 33929 })
							item = Item.find(:first, :conditions => { :host_id => host_id, :plugin_id => plugin.id })

							output.text "#{host.ip} / #{host.fqdn} - failed\n", :style => :bold
							output.text "Description:\n", :style => :bold
							output.text "#{plugin.description}\n"
							output.text "Plugin Output:\n", :style => :bold
							output.text "#{item.plugin_output}\n"

							output.text "\n"

					end unless @hosts_failed == nil

					output.start_new_page
				end

			end
		end
	end
end
