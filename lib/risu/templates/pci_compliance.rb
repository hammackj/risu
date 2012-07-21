# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		class PCICompliance < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "pci_compliance",
					:author => "hammackj",
					:version => "0.0.3",
					:description => "Generates a PCI Compliance Overview Report"
				}
			end

			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "PCI / DSS Compliance Overview", :align => :center
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
