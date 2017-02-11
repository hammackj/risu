# Copyright (c) 2010-2017 Jacob Hammack.
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
		module SharesTemplateHelper

			#
			def anon_ftp_count
				begin
					return Item.where(:plugin_id => Plugin.where(:plugin_name => "Anonymous FTP Enabled").first.id).count
				rescue
					return 0
				end
			end

			#
			def anon_ftp_section

				if anon_ftp_count() <= 0
					return
				end

				heading2 "Anonymous FTP Detection"

				findings =  Item.where(:plugin_id => Plugin.where(:plugin_name => "Anonymous FTP Enabled").first.id)

				findings.each do |finding|
					host = Host.find_by_id(finding.host_id)

					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if host.fqdn != nil

					text "Host", :style => :bold
					text host_string

					text "\n"

					text "Plugin Output", :style => :bold
					text finding.plugin_output

					text "\n"
				end
			end

			#
			def anon_smb_query
				return Item.where(:plugin_id => Plugin.where(:plugin_name => "Microsoft Windows SMB Shares Unprivileged Access").first.id)
			end

			#
			def anon_smb_count
				count = 0
				begin
					anon_smb_query().each do |finding|
						host = Host.find_by_id(finding.host_id)

						login = host.host_properties.where(:name => 'smb-login-used').first.value
						login = login.split("\\")[1] if login.include?("\\")

						if finding.plugin_output.include?("The following shares can be accessed as #{login}")
							# If the output was collect via the username that is authenitcated skip it.
							next
						end

						count = count + 1
					end
				rescue
					return 0
				end

				return count
			end

			#
			def anon_smb_section
				if anon_smb_count() <= 0
					return
				end

				heading2 "Anonymous SMB Share Detection"

				anon_smb_query().each do |finding|
					host = Host.find_by_id(finding.host_id)

					login = host.host_properties.where(:name => 'smb-login-used').first.value
					login = login.split("\\")[1] if login.include?("\\")

					if finding.plugin_output.include?("The following shares can be accessed as #{login}")
						# If the output was collect via the username that is authenitcated skip it.
						next
					end

					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if host.fqdn != nil

					text "Host", :style => :bold
					text host_string

					text "\n"

					text "Plugin Output", :style => :bold
					text finding.plugin_output

					text "\n"
				end
			end

			def shares_section
				poor_count = 0

				anon_ftp_text = ""
				anon_smb_text = ""

				v_anon_smb_count = 0
				v_anon_ftp_count = 0

				begin
					v_anon_ftp_count = anon_ftp_count()
				rescue Exception => e
				end

				begin
					v_anon_smb_count = anon_smb_count()
				rescue Exception => e
				end

				if v_anon_ftp_count > 1
					anon_ftp_text = "Anonymous FTP was detected as being enabled on #{anon_ftp_count} network nodes. Anonymous FTP allows anyone to access files stored on the FTP server, depending on the server's configuration also write files. "
					poor_count = poor_count + 1
				elsif v_anon_ftp_count == 1
					anon_ftp_text = "Anonymous FTP was detected as being enabled on #{anon_ftp_count} network node. Anonymous FTP allows anyone to access files stored on the FTP server, depending on the server's configuration also write files. "
					poor_count = poor_count + 1
				end

				if v_anon_smb_count > 1
					anon_smb_text = "Anonymous SMB shares were detected on #{anon_smb_count} network nodes. These shares also were found to have read and write access enabled. "
					poor_count = poor_count + 1
				elsif v_anon_smb_count == 1
					anon_smb_text = "Anonymous SMB shares were detected on #{anon_smb_count} network node. These shares also were found to have read and write access enabled. "
					poor_count = poor_count + 1
				end

				anonymous_access_text = "Allowing anonymous access to a file server can lead to information disclosures and other security violations. Each instance should be evaluated and removed or noted in the network's security policy.\n"

				heading1 "Other Findings of Interest" if poor_count > 0

				#Anon ftp/smb + clear text
				@output.text anon_ftp_text + anon_smb_text + anonymous_access_text if v_anon_ftp_count > 0 || v_anon_smb_count > 0
				@output.text "\n"
				@output.text "\n"
			end

			def shares_appendix_section
				anon_ftp_section
				anon_smb_section
			end

			#
			def shares_section_has_findings?
				poor_count = 0

				anon_ftp_text = ""
				anon_smb_text = ""

				v_anon_smb_count = 0
				v_anon_ftp_count = 0

				begin
					v_anon_ftp_count = anon_ftp_count()
				rescue Exception => e
				end

				begin
					v_anon_smb_count = anon_smb_count()
				rescue Exception => e
				end

				if v_anon_ftp_count >= 1
					poor_count = poor_count + 1
				end

				if v_anon_smb_count >= 1
					poor_count = poor_count + 1
				end

				if poor_count >= 1
					return true
				else
					return false
				end
			end
		end
	end
end
