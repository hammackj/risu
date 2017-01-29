# Copyright (c) 2010-2017 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		module SharesTemplateHelper

			#
			def anon_ftp_count
				begin
					return Item.where(:plugin_id => Plugin.where(:plugin_name => "Anonymous FTP Enabled").first.id).count
				rescue => e
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
				rescue => e
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
