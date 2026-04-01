# Copyright (c) 2010-2026 Jacob Hammack.
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
		class UnsupportedOS < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "unsupported_os",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates an Unsupported / End-of-Life Operating System Report"
				}
			end

			def unsupported_os_entry(os_name, hosts, eol_date, reference_url)
				return if hosts.size == 0

				heading2 "#{os_name} (#{hosts.size} #{hosts.size == 1 ? 'host' : 'hosts'})"

				text "#{os_name} is an unsupported operating system; the vendor has stopped providing " +
					"security updates as of #{eol_date}. These systems should be upgraded or replaced as soon as possible."
				text "\n"

				headers = ["IP Address", "FQDN", "NetBIOS", "Operating System"]
				header_widths = {0 => 100, 1 => 130, 2 => 100, 3 => 182}

				data = []
				hosts.each do |host|
					row = []
					row.push(host.ip || "N/A")
					row.push(host.fqdn || "N/A")
					row.push(host.netbios || "N/A")
					row.push(host.os || "N/A")
					data.push(row)
				end

				table headers, header_widths, data
				text "\n"
				text "Reference: #{reference_url}", :size => 8
				text "\n"
			end

			def unsupported_os_plugin_entry(os_name, plugin_id, eol_date, reference_url)
				plugin = Plugin.find_by(:id => plugin_id)
				return if plugin.nil?

				items = Item.where(:plugin_id => plugin_id)
				return if items.count == 0

				host_ids = items.map(&:host_id).uniq
				hosts = Host.where(:id => host_ids)

				heading2 "#{os_name} (#{hosts.size} #{hosts.size == 1 ? 'host' : 'hosts'})"

				text "#{os_name} is an unsupported operating system; the vendor has stopped providing " +
					"security updates as of #{eol_date}. These systems should be upgraded or replaced as soon as possible."
				text "\n"

				headers = ["IP Address", "FQDN", "NetBIOS", "Operating System"]
				header_widths = {0 => 100, 1 => 130, 2 => 100, 3 => 182}

				data = []
				hosts.each do |host|
					row = []
					row.push(host.ip || "N/A")
					row.push(host.fqdn || "N/A")
					row.push(host.netbios || "N/A")
					row.push(host.os || "N/A")
					data.push(row)
				end

				table headers, header_widths, data
				text "\n"
				text "Reference: #{reference_url}", :size => 8
				text "\n"
			end

			def render output
				report_classification

				report_title Report.title
				report_subtitle "Unsupported / End-of-Life Operating Systems"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				if !Host.unsupported_os?
					text "No unsupported operating systems were detected on the network."
					@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
					return
				end

				text Host.unsupported_os_text
				text "\n"

				heading1 "Affected Systems by Operating System"
				text "\n"

				lifecycle_url = "https://learn.microsoft.com/en-us/lifecycle/"

				# Windows
				unsupported_os_entry("Windows NT", Host.os_windows_nt, "December 2004", lifecycle_url)
				unsupported_os_entry("Windows 95", Host.os_windows_95, "December 2001", lifecycle_url)
				unsupported_os_entry("Windows 98", Host.os_windows_98, "July 2006", lifecycle_url)
				unsupported_os_entry("Windows ME", Host.os_windows_me, "July 2006", lifecycle_url)
				unsupported_os_entry("Windows 2000", Host.os_windows_2k, "July 2010", lifecycle_url)
				unsupported_os_entry("Windows XP", Host.os_windows_xp, "April 2014", lifecycle_url)
				unsupported_os_entry("Windows Server 2003", Host.os_windows_2k3, "July 2015", lifecycle_url)
				unsupported_os_entry("Windows Vista", Host.os_windows_vista, "April 2017", lifecycle_url)
				unsupported_os_entry("Windows 7", Host.os_windows_7, "January 2020", lifecycle_url)
				# Merge OS string and plugin-based detection for Server 2008
				w2k8_hosts = Host.os_windows_2k8.to_a
				plugin_2008 = Plugin.find_by(:id => 192782)
				if plugin_2008
					plugin_host_ids = Item.where(:plugin_id => 192782).map(&:host_id).uniq
					plugin_hosts = Host.where(:id => plugin_host_ids).to_a
					w2k8_hosts = (w2k8_hosts + plugin_hosts).uniq(&:id)
				end
				unsupported_os_entry("Windows Server 2008", w2k8_hosts, "January 2020", lifecycle_url)
				# Merge OS string and plugin-based detection for Server 2012
				w2k12_hosts = Host.os_windows_2k12.to_a
				plugin_2012 = Plugin.find_by(:id => 192813)
				if plugin_2012
					plugin_host_ids = Item.where(:plugin_id => 192813).map(&:host_id).uniq
					plugin_hosts = Host.where(:id => plugin_host_ids).to_a
					w2k12_hosts = (w2k12_hosts + plugin_hosts).uniq(&:id)
				end
				unsupported_os_entry("Windows Server 2012", w2k12_hosts, "October 2023", lifecycle_url)

				# AIX
				unsupported_os_entry("AIX 5.x", Host.os_aix.where("OS LIKE 'AIX 5.%'"), "April 2011",
					"https://www.ibm.com/support/pages/aix-support-lifecycle-information")

				# FreeBSD
				unsupported_os_entry("FreeBSD 5.x", Host.os_freebsd.where("OS LIKE 'FreeBSD 5.%'"), "May 2008",
					"https://www.freebsd.org/security/")

				# Debian
				unsupported_os_plugin_entry("Debian 8 (Jessie)", 201420, "June 2020",
					"https://wiki.debian.org/LTS")

				# Ubuntu
				unsupported_os_plugin_entry("Ubuntu 14.04 LTS", 201408, "April 2024",
					"https://ubuntu.com/about/release-cycle")

				unsupported_os_plugin_entry("Ubuntu 18.04 LTS", 201456, "May 2023",
					"https://ubuntu.com/about/release-cycle")

				@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
