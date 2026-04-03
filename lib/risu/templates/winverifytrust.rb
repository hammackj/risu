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
		class WinVerifyTrust < Risu::Base::TemplateBase
			include TemplateHelper

			PLUGIN_ID = 166555

			def initialize
				@template_info =
				{
					:name => "winverifytrust",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a WinVerifyTrust Signature Validation (CVE-2013-3900) Report"
				}
			end

			def render output
				plugin = Plugin.find_by(:id => PLUGIN_ID)

				if plugin.nil? || plugin.items.nil? || plugin.items.count == 0
					text Report.classification.upcase, :align => :center
					text "\n"
					report_title Report.title
					report_subtitle "WinVerifyTrust Signature Validation"
					text "\n\n"
					text "No WinVerifyTrust signature validation findings were detected."
					return
				end

				items = Item.where(:plugin_id => PLUGIN_ID).where("severity >= 0")

				if items.count == 0
					text Report.classification.upcase, :align => :center
					text "\n"
					report_title Report.title
					report_subtitle "WinVerifyTrust Signature Validation"
					text "\n\n"
					text "No WinVerifyTrust signature validation findings were detected."
					return
				end

				# Title page
				text Report.classification.upcase, :align => :center
				text "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

				@output.font_size(24) do
					@output.text Report.title, :align => :left
				end
				@output.font_size(18) do
					@output.text "WinVerifyTrust Signature Validation", :align => :left
					@output.text "CVE-2013-3900 Mitigation (EnableCertPaddingCheck)", :align => :left
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

				text "CVE-2013-3900 is a vulnerability in the Windows WinVerifyTrust function that " \
					"handles Windows Authenticode signature verification for Portable Executable (PE) " \
					"files. The vulnerability allows an attacker to append malicious content to a signed " \
					"executable without invalidating its digital signature."
				text "\n"

				text "Microsoft released a patch in 2013 that added stricter signature validation via " \
					"the EnableCertPaddingCheck registry key, but left it disabled by default to avoid " \
					"breaking compatibility. This means that even fully patched Windows systems remain " \
					"vulnerable unless the registry key is explicitly enabled."
				text "\n"

				text "This vulnerability has been actively exploited in the wild, notably by threat " \
					"actors embedding malicious code into signed installers and utilities. Because the " \
					"file retains its valid signature, it can bypass application whitelisting, endpoint " \
					"protection, and manual verification."
				text "\n"

				heading2 "Impact"
				text "An attacker can modify signed executables to include malicious payloads while " \
					"maintaining a valid digital signature. This allows:"
				text "\n"
				bullet_item "\u2022", 1, "Bypassing application whitelisting and code signing enforcement"
				bullet_item "\u2022", 1, "Evading endpoint detection that trusts signed binaries"
				bullet_item "\u2022", 1, "Trojanizing legitimate vendor installers for supply chain attacks"
				bullet_item "\u2022", 1, "Maintaining persistence via signed malicious executables"
				text "\n"

				heading2 "Solution"
				text "Enable the EnableCertPaddingCheck registry key on all Windows systems. This " \
					"can be deployed via Group Policy Preferences or a startup script."
				text "\n"

				heading3 "Registry Fix"
				@output.font_size(7) do
					@output.text "[HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Cryptography\\Wintrust\\Config]", :font => "Courier"
					@output.text "\"EnableCertPaddingCheck\"=\"1\"", :font => "Courier"
					@output.text "", :font => "Courier"
					@output.text "[HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Cryptography\\Wintrust\\Config]", :font => "Courier"
					@output.text "\"EnableCertPaddingCheck\"=\"1\"", :font => "Courier"
				end
				text "\n"

				text "Both the 32-bit and 64-bit registry keys must be set. A reboot is required " \
					"for the change to take effect."
				text "\n"

				heading3 "Group Policy Deployment"
				bullet_item "\u2022", 1, "Create a .reg file with the keys above"
				bullet_item "\u2022", 1, "Deploy via Group Policy Preferences > Registry or a Computer Startup Script"
				bullet_item "\u2022", 1, "Alternatively, use PowerShell:"
				text "\n"
				@output.font_size(7) do
					@output.text 'New-Item -Path "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config" -Force', :font => "Courier"
					@output.text 'Set-ItemProperty -Path "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config" -Name "EnableCertPaddingCheck" -Value "1" -Type String', :font => "Courier"
					@output.text 'New-Item -Path "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config" -Force', :font => "Courier"
					@output.text 'Set-ItemProperty -Path "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config" -Name "EnableCertPaddingCheck" -Value "1" -Type String', :font => "Courier"
				end
				text "\n"

				heading3 "Verification"
				text "After applying the fix, verify with:"
				text "\n"
				@output.font_size(7) do
					@output.text 'reg query "HKLM\Software\Microsoft\Cryptography\Wintrust\Config" /v EnableCertPaddingCheck', :font => "Courier"
					@output.text 'reg query "HKLM\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config" /v EnableCertPaddingCheck', :font => "Courier"
				end
				text "\n"
				text "Both should return a value of 1."
				text "\n"

				heading2 "References"
				definition "CVE-2013-3900", "https://www.cvedetails.com/cve/CVE-2013-3900/"
				definition "Microsoft Advisory", "https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2013-3900"
				definition "Nessus Plugin", "https://www.tenable.com/plugins/nessus/#{PLUGIN_ID}"
				text "\n"

				new_page

				# Affected systems
				host_ids = items.map(&:host_id).uniq
				heading1 "Affected Systems"

				text "#{host_ids.size} host#{'s' if host_ids.size != 1} are missing the " \
					"EnableCertPaddingCheck registry mitigation."
				text "\n"

				headers = ["IP Address", "FQDN", "NetBIOS", "Operating System"]
				header_widths = {0 => 100, 1 => 130, 2 => 100, 3 => (page_width - 100 - 130 - 100)}

				host_data = []
				host_ids.each do |hid|
					host = Host.find_by(:id => hid)
					next if host.nil?

					host_data << [
						host.ip || "N/A",
						host.fqdn || "N/A",
						host.netbios || "N/A",
						host.os || "N/A"
					]
				end

				host_data.sort_by! { |row| row[0] }

				@output.table([headers] + host_data, :header => true, :column_widths => header_widths,
					:width => page_width, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
