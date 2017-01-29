# Copyright (c) 2010-2017 Arxopia LLC.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	module Templates
		class PCICompliance < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "pci_compliance",
					:author => "hammackj",
					:version => "0.0.6",
					:renderer => "PDF",
					:description => "Generates a PCI Compliance Overview Report"
				}
			end

			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "PCI / DSS Compliance Overview"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				#@hosts_count = Host.find(:all, :conditions => ["pci_dss_compliance is not null"]).count
				@hosts_count = HostProperty.where(:name => "pci-dss-compliance").count
				#@hosts_passed = Host.find(:all, :conditions => ["pci_dss_compliance like 'passed'"])
				@hosts_passed = HostProperty.where(:name => "pci-dss-compliance").where(:value => "passed")
				#@hosts_failed = Host.find(:all, :conditions => ["pci_dss_compliance like 'failed'"])
				@hosts_failed = HostProperty.where(:name => "pci-dss-compliance").where(:value => "failed")

				output.font_size(20) do
					output.text "Summary\n", :style => :bold
				end

				text "Of #{@hosts_count} total hosts, #{@hosts_passed.count} passed and #{@hosts_failed.count} failed."

				text "\n\n"

				if @hosts_passed.length > 0
					output.font_size(20) do
						output.fill_color "00FF00"
						output.text "PCI / DSS Compliant Hosts", :style => :bold
						output.fill_color "000000"
					end

					output.text "\n"

					@hosts_passed.each do |host_prop|
						host = host_prop.host
						text "#{host.ip} / #{host.fqdn} - passed\n"
					end unless @hosts_passed == nil

					output.start_new_page
				end

				if @hosts_failed.length > 0
					output.font_size(20) do
						output.fill_color "FF0000"
						output.text "Non PCI / DSS Compliant Hosts", :style => :bold
						output.fill_color "000000"
					end

					text "\n"

					@hosts_failed.each do |host_prop|
						host_id = host_prop.host_id
						host = host_prop.host
						plugin = Plugin.find(:first, :conditions => { :id => 33929 })
						item = Item.find(:first, :conditions => { :host_id => host_id, :plugin_id => plugin.id })

						output.text "#{host.ip} / #{host.fqdn} - failed\n", :style => :bold
						output.text "Description:\n", :style => :bold
						output.text "#{plugin.description}\n"
						output.text "Plugin Output:\n", :style => :bold
						output.text "#{item.plugin_output}\n"

						text "\n"

					end unless @hosts_failed == nil

					output.start_new_page
				end

			end
		end
	end
end
