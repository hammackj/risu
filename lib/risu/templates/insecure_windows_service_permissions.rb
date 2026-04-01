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
		class InsecureWindowsServicePermissions < Risu::Base::TemplateBase
			include TemplateHelper

			PLUGIN_ID = 65057

			def initialize
				@template_info =
				{
					:name => "insecure_windows_service_permissions",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates an Insecure Windows Service Permissions Report"
				}
			end

			def render output
				plugin = Plugin.find_by(:id => PLUGIN_ID)

				if plugin.nil? || plugin.items.nil? || plugin.items.count == 0
					text Report.classification.upcase, :align => :center
					text "\n"
					report_title Report.title
					report_subtitle "Insecure Windows Service Permissions"
					text "\n\n"
					text "No insecure Windows service permission findings were detected."
					return
				end

				items = Item.where(:plugin_id => PLUGIN_ID).where("severity >= 0")

				if items.count == 0
					text Report.classification.upcase, :align => :center
					text "\n"
					report_title Report.title
					report_subtitle "Insecure Windows Service Permissions"
					text "\n\n"
					text "No insecure Windows service permission findings were detected."
					return
				end

				# Title page
				text Report.classification.upcase, :align => :center
				text "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

				@output.font_size(24) do
					@output.text Report.title, :align => :left
				end
				@output.font_size(18) do
					@output.text "Insecure Windows Service Permissions", :align => :left
					@output.text "\n"
				end
				@output.font_size(14) do
					@output.text "This report was prepared by\n#{Report.author}", :align => :left
				end
				@output.font_size(10) do
					@output.text "\n\n"
					@output.text Report.scan_date.strftime('%B %d, %Y'), :align => :left
				end

				new_page

				# Overview
				heading1 "Overview"

				text "Insecure Windows service permissions allow non-privileged users to modify " \
					"service executables or configuration, potentially leading to local privilege " \
					"escalation. If a low-privileged user can replace a service executable or change " \
					"the binary path, they can execute arbitrary code as the service account, which " \
					"is often SYSTEM."
				text "\n"

				text "This is a common finding in environments where software was installed by " \
					"dragging files into place rather than using a proper installer, or where " \
					"default permissions were relaxed during troubleshooting."
				text "\n"

				heading2 "Impact"
				text "A local attacker or malware running as a standard user can escalate to SYSTEM " \
					"privileges by replacing or modifying a vulnerable service executable. This gives " \
					"full control of the host, including the ability to access credentials, install " \
					"persistence mechanisms, and move laterally through the network."
				text "\n"

				heading2 "Solution"
				text "Review and correct the file permissions on each identified service executable " \
					"and its parent directories:"
				text "\n"
				bullet_item "\u2022", 1, "Remove write permissions for non-administrative users and groups (Users, Everyone, Authenticated Users)"
				bullet_item "\u2022", 1, "Ensure service executables are owned by Administrators or SYSTEM"
				bullet_item "\u2022", 1, "Use icacls to audit and fix permissions: icacls \"C:\\path\\to\\service.exe\" /reset"
				bullet_item "\u2022", 1, "Reinstall affected software using the vendor's installer when possible"
				bullet_item "\u2022", 1, "Audit with: sc qc <service_name> to verify the binary path"
				text "\n"

				heading2 "References"
				definition "Nessus Plugin", "https://www.tenable.com/plugins/nessus/#{PLUGIN_ID}"
				definition "OWASP", "https://owasp.org/www-project-web-security-testing-guide/"
				definition "Microsoft", "https://learn.microsoft.com/en-us/windows/win32/services/service-security-and-access-rights"
				text "\n"

				new_page

				# Summary
				host_ids = items.map(&:host_id).uniq
				heading1 "Affected Systems Summary"

				text "#{host_ids.size} host#{'s' if host_ids.size != 1} with insecure service " \
					"permissions were identified."
				text "\n"

				headers = ["IP Address", "FQDN", "Operating System", "Insecure Services"]
				header_widths = {0 => 100, 1 => 130, 2 => (page_width - 100 - 130 - 60), 3 => 60}

				summary_data = []
				host_ids.each do |hid|
					host = Host.find_by(:id => hid)
					next if host.nil?

					service_count = items.where(:host_id => hid).count

					summary_data << [
						host.ip || "N/A",
						host.fqdn || "N/A",
						host.os || "N/A",
						service_count.to_s
					]
				end

				summary_data.sort_by! { |row| row[0] }

				@output.table([headers] + summary_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
					column(3).style(:align => :center)
				end

				text "\n"
				new_page

				# Detailed findings per host
				heading1 "Detailed Findings by Host"

				text "The following section lists each affected host with the specific services that " \
					"have insecure permissions. Review the plugin output to identify which executables " \
					"and directories need permission corrections."
				text "\n"

				grouped = items.group_by(&:host_id)

				grouped.each_with_index do |(host_id, host_items), idx|
					host = Host.find_by(:id => host_id)
					next if host.nil?

					heading2 host.ip

					host_info = [
						["IP Address", host.ip || "N/A"],
						["FQDN", host.fqdn || "N/A"],
						["NetBIOS", host.netbios || "N/A"],
						["Operating System", host.os || "N/A"],
						["MAC Address", host.mac || "N/A"]
					]

					@output.table(host_info, :header => false,
						:column_widths => {0 => 120, 1 => page_width - 120},
						:width => page_width) do
						cells.borders = [:top, :bottom, :left, :right]
						column(0).style(:font_style => :bold, :background_color => 'F5F5F5')
					end

					text "\n"

					host_items.each do |item|
						if item.plugin_output && !item.plugin_output.strip.empty?
							definition "Insecure Services", item.plugin_output.strip
							text "\n"
						end
					end

					@output.start_new_page if idx != grouped.size - 1
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
