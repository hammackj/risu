# Copyright (c) 2010-2016 Arxopia LLC.
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

require 'set'

ActiveRecord::Migration.verbose = false

module Risu
	module Parsers
		module Nessus

			# NessusSaxListener
			class NessusSaxListener
				include LibXML::XML::SaxParser::Callbacks

				attr_accessor :new_tags

				# An array of valid reference element names
				VALID_REFERENCES = Set.new(%w[
					cpe bid see_also xref cve iava msft
					osvdb cert edb-id rhsa secunia suse dsa
					owasp cwe iavb iavt cisco-sa ics-alert
					cisco-bug-id cisco-sr cert-vu vmsa apple-sa
					icsa cert-cc msvr usn hp glsa freebsd tra
				])

				# An array of valid host properties
				VALID_HOST_PROPERTIES = Set.new(%w[
					HOST_END mac-address HOST_START operating-system host-ip host-fqdn netbios-name
					local-checks-proto smb-login-used ssh-auth-meth ssh-login-used pci-dss-compliance
					pci-dss-compliance: system-type bios-uuid pcidss:compliance:failed pcidss:compliance:passed
					pcidss:deprecated_ssl pcidss:expired_ssl_certificate pcidss:high_risk_flaw pcidss:medium_risk_flaw
					pcidss:reachable_db pcidss:www:xss pcidss:directory_browsing pcidss:known_credentials
					pcidss:compromised_host:worm pcidss:obsolete_operating_system pcidss:dns_zone_transfer
					pcidss:unprotected_mssql_db pcidss:obsolete_software pcidss:www:sql_injection pcidss:backup_files
					traceroute-hop-0 traceroute-hop-1 traceroute-hop-2 operating-system-unsupported patch-summary-total-cves
					pcidss:insecure_http_methods LastUnauthenticatedResults LastAuthenticatedResults cpe-0 cpe-1
					cpe-2 cpe-3 Credentialed_Scan policy-used UnsupportedProduct:microsoft:windows_xp::sp2
					UnsupportedProduct:microsoft:windows_xp UnsupportedProduct:microsoft:windows_2000 UnsupportedProduct
					mcafee-epo-guid
				])

				# An array of all valid elements expected during parsing
				VALID_ELEMENTS = VALID_REFERENCES \
					+ Set.new(%w[ReportItem plugin_version risk_factor
					description cvss_base_score solution item plugin_output tag synopsis plugin_modification_date
					FamilyName FamilyItem Status vuln_publication_date ReportHost HostProperties preferenceName
					preferenceValues preferenceType fullName pluginId pluginName selectedValue selectedValue
					name value preference plugin_publication_date cvss_vector patch_publication_date
					NessusClientData_v2 Policy PluginName ServerPreferences policyComments policyName PluginItem
					Report Family Preferences PluginsPreferences FamilySelection IndividualPluginSelection PluginId
					pci-dss-compliance exploitability_ease cvss_temporal_vector exploit_framework_core cvss_temporal_score
					exploit_available metasploit_name exploit_framework_canvas canvas_package exploit_framework_metasploit
					plugin_type exploithub_sku exploit_framework_exploithub stig_severity plugin_name fname always_run
					cm:compliance-info cm:compliance-actual-value cm:compliance-check-id cm:compliance-policy-value
					cm:compliance-audit-file cm:compliance-check-name cm:compliance-result cm:compliance-output policyOwner
					visibility script_version attachment policy_comments d2_elliot_name exploit_framework_d2_elliot
					exploited_by_malware compliance cm:compliance-reference cm:compliance-see-also cm:compliance-solution
					agent potential_vulnerability in_the_news exploited_by_nessus unsupported_by_vendor default_account
				])

				# TODO: documentation. These are never used in the class
				VALID_HOST_PROPERTIES_REGEX = [
					"patch-summary-cve-num", "patch-summary-cves", "patch-summary-txt", "cpe-\d+", "KB\d+"
				]

				# Map of host properties to symbols for use with ActiveRecord
				#   interfaces
				#
				# These are the more commonly used host properties,
				#   mapping them here to store in the host table
				HOST_PROPERTIES_MAPPING = {
					"HOST_END" => :end,
					"mac-address" => :mac,
					"HOST_START" => :start,
					"operating-system" => :os,
					"host-ip" => :ip,
					"host-fqdn" => :fqdn,
					"netbios-name" => :netbios
				}

				# Used to map element names to private methods so
				#   that the methods can be called when the parser
				#   encounters the opening of an element.
				#
				# {"ElementName" => :start_method_to_be_called}
				#
				# @example call #start_policy for a "Policy" element
				#   element = "Policy"
				#   send(DYNAMIC_START_METHOD_NAMES[element], element, attributes)
				#
				# @param element [String] the element name starting to be parsed
				# @param attributes [Array<Hash{Sring=>String}>] the array of
				#   key value pairs for the element that is starting to be parsed
				DYNAMIC_START_METHOD_NAMES = {
					"Policy" => :start_policy,
					"preference" => :start_preference,
					"item" => :start_item,
					"FamilyItem" => :start_family_item,
					"PluginItem" => :start_plugin_item,
					"Report" => :start_report,
					"ReportHost" => :start_report_host,
					"tag" => :start_tag,
					"ReportItem" => :start_report_item,
					"attachment" => :start_attachment
				}

				# @see DYNAMIC_START_MEHTOD_NAMES
				#
				# @note only one argument for the methods
				#
				# @example call #end_policy_name for a "policyName" element
				#   element = "policyName"
				#   send(DYNAMIC_END_METHOD_NAMES[element], element)
				#
				# @param element [String] the name of the element ending
				DYNAMIC_END_METHOD_NAMES = {
					"policyName" => :end_policy_name,
					"policyComments" => :end_policy_comments,
					"policy_comments" => :end_policy_comments,
					"policyOwner" => :end_policy_owner,
					"visibility" => :end_visibility,
					"preference" => :end_preference,
					"item" => :end_item,
					"FamilyItem" => :end_family_item,
					"PluginItem" => :end_plugin_item,
					"tag" => :end_tag,
					"ReportItem" => :end_report_item,
					"attachment" => :end_attachment
				}

				private_constant :DYNAMIC_END_METHOD_NAMES, :DYNAMIC_START_METHOD_NAMES,
					:HOST_PROPERTIES_MAPPING, :VALID_HOST_PROPERTIES_REGEX, :VALID_HOST_PROPERTIES,
					:VALID_ELEMENTS, :VALID_REFERENCES

				# vals tracks state for elements encountered during parsing
				def initialize
					@vals = Hash.new
					@new_tags = Array.new
				end

				# Callback for when the start of a XML element is reached
				#
				# @param element XML element
				# @param attributes Attributes for the XML element
				def on_start_element(element, attributes)
					@tag = element
					@vals[@tag] = ""

					if !VALID_ELEMENTS.include?(element)
						@new_tags << "New XML element detected: #{element}. Please report this at #{Risu::GITHUB}/issues/new or via email to #{Risu::EMAIL}"
					end

					if DYNAMIC_START_METHOD_NAMES.key?(element)
						# Dynamic dispatch to private instance "policyComments"methods in the const hash
						#   DYNAMIC_START_METHOD_NAMES where {"element" => :start_element}
						send(DYNAMIC_START_METHOD_NAMES[element], element, attributes)
					end
				end

				# Called when the inner text of a element is reached
				#
				# @param text
				def on_characters(text)
					if @vals[@tag] == nil then
						@vals[@tag] = text
					else
						@vals[@tag] << text
					end
				end

				# Called when the end of the XML element is reached
				#
				# @param element
				def on_end_element(element)
					@tag = nil

					if DYNAMIC_END_METHOD_NAMES.key?(element)
						# Dynamic dispatch to private instance methods in the const hash
						#   DYNAMIC_END_METHOD_NAMES where {"element" => :end_element}
						send(DYNAMIC_END_METHOD_NAMES[element], element)
					elsif VALID_REFERENCES.include?(element)
						end_valid_reference(element)
					end
				end

				private

				# Dynamic dispatch start element methods
				def start_policy(_element, _attributes)
					@policy = Risu::Models::Policy.create
				end

				def start_preference(_element, _attributes)
					@sp = @policy.server_preferences.create
				end

				def start_item(_element, _attributes)
					@item = @policy.plugins_preferences.create
				end

				def start_family_item(_element, _attributes)
					@family = @policy.family_selections.create
				end

				def start_plugin_item(_element, _attributes)
					@plugin_selection = @policy.individual_plugin_selections.create
				end

				def start_report(_element, attributes)
					@report = @policy.reports.create(:name => attributes["name"])
				end

				def start_report_host(_element, attributes)
					@rh = @report.hosts.create(:name => attributes["name"])
				end

				def start_tag(_, attributes)
					@attr = nil
					@hp = @rh.host_properties.create

					if attributes["name"] =~ /[M|m][S|s]\d{2,}-\d{2,}/
						@attr = attributes["name"]
					#Ugly as fuck. Really this needs to be rewritten. Fuck.
					elsif attributes['name'] =~ /
									(?:patch-summary-cve-num)
									| (?:patch-summary-cves)
									| (?:patch-summary-txt)
									| (?:cpe-\d+)
									| (?:KB\d+)
								/x
						@attr = attributes["name"]
					elsif VALID_HOST_PROPERTIES.include?(attributes["name"])
						@attr = attributes["name"]
					end

					# implicit nil check?
					if attributes["name"] !~ /(netstat-(?:established|listen)-(?:tcp|udp)\d+-\d+)/ \
							&& attributes["name"] !~ /traceroute-hop-\d+/ \
							&& @attr.nil?
						@new_tags << "New HostProperties attribute: #{attributes["name"]}. Please report this at #{Risu::GITHUB}/issues/new or via email to #{Risu::EMAIL}\n"
					end
				end

				def start_report_item(_element, attributes)
					@vals = Hash.new # have to clear this out or everything has the same references

					if attributes["pluginID"] == "0"
						@plugin = Risu::Models::Plugin.find_or_create_by(:id => 1)
					else
						@plugin = Risu::Models::Plugin.find_or_create_by(:id => attributes["pluginID"]) do |plugin|
							plugin.plugin_name = attributes["pluginName"]
							plugin.family_name = attributes["pluginFamily"]
						end
					end

					@ri = @rh.items.create(:port => attributes["port"],
									:svc_name => attributes["svc_name"],
									:protocol => attributes["protocol"],
									:severity => attributes["severity"],
									:plugin_id => @plugin.id
								)

					@plugin.save
				end

				def start_attachment(_element, attributes)
					@attachment = @ri.attachments.create(:name => attributes['name'], :ttype => attributes['type'])
				end

				# Dynamic dispatch end element methods
				def end_policy_name(_)
					@policy.update(:name => @vals["policyName"])
				end

				def end_policy_comments(element)
					return unless element == "policyComments" || element == "policy_comments"
					@policy.update(:comments => @vals[element])
				end

				def end_policy_owner(_)
					@policy.update(:owner => @vals["policyOwner"])
				end

				def end_visibility(_)
					@policy.update(:visibility => @vals["visibility"])
				end

				def end_preference(_)
					@sp.update(:name => @vals["name"], :value => @vals["value"])
				end

					# This takes a really long time, there is about 34,000 pluginIDs in this
					# field and it takes about 36 minutes to parse just this info =\
					# lets pre-populate the plugins table with the known plugin_id's
					#
					# if @vals["name"] == "plugin_set"
					# 	 @all_plugins = @vals["value"].split(";")
					#
					# 	 @all_plugins.each { |p|
					# 			@plug = Plugin.find_or_create_by_id(p)
					# 			@plug.save
					# 	 }
					# end
				def end_item(_)
					@item.update(:plugin_name => @vals["pluginName"],
						:plugin_id => @vals["pluginId"], :fullname => @vals["fullName"],
						:preference_name => @vals["preferenceName"],
						:preference_type => @vals["preferenceType"],
						:preference_values => @vals["preferenceValues"],
						:selected_values => @vals["selectedValue"])
				end

				def end_family_item(_)
					@family.update( :family_name => @vals["FamilyName"],
						:status => @vals["Status"])
				end

				def end_plugin_item(_)
					@plugin_selection.update(:plugin_id => @vals["PluginId"],
						:plugin_name => @vals["PluginName"],
						:family => @vals["Family"], :status => @vals["Status"])
				end

				def end_tag(_)
					return if @attr.nil?

					if @attr =~ /[M|m][S|s]\d{2}-\d{2,}/
						@patch = @rh.patches.create(:name => @attr, :value => @vals['tag'])
					else
						if HOST_PROPERTIES_MAPPING.key?(@attr)
							@rh.update(HOST_PROPERTIES_MAPPING[@attr] => @vals["tag"].gsub("\n", ","))
						end

						@hp.update(:name => @attr, :value => @vals['tag'])
					end
				end

				#We cannot handle the references in the same block as the rest of the ReportItem tag because
				#there tends to be more than of the different types of reference per ReportItem, this causes issue for a sax
				#parser. To solve this we do the references before the final plugin data, Valid references must be added
				#the VALID_REFERENCE set at the top to be parsed.
				def end_valid_reference(element)
					@ref = @plugin.references.create(:reference_name => element, :value => @vals["#{element}"])
				end

				def end_report_item(_)
					@ri.update(:plugin_output => @vals["plugin_output"],
						:plugin_name => @vals["plugin_name"],
						:cm_compliance_info => @vals["cm:compliance-info"],
						:cm_compliance_actual_value => @vals["cm:compliance-actual-value"],
						:cm_compliance_check_id => @vals["cm:compliance-check-id"],
						:cm_compliance_policy_value => @vals["cm:compliance-policy-value"],
						:cm_compliance_audit_file => @vals["cm:compliance-audit-file"],
						:cm_compliance_check_name => @vals["cm:compliance-check-name"],
						:cm_compliance_result => @vals["cm:compliance-result"],
						:cm_compliance_output => @vals["cm:compliance-output"],
						:cm_compliance_reference => @vals["cm:compliance-reference"],
						:cm_compliance_see_also => @vals["cm:compliance-see-also" ],
						:cm_compliance_solution => @vals["cm:compliance-solution"]
					)

					@plugin.update(:solution => @vals["solution"],
						:risk_factor => @vals["risk_factor"],
						:description => @vals["description"],
						:plugin_publication_date => @vals["plugin_publication_date"],
						:plugin_modification_date => @vals["plugin_modification_date"],
						:synopsis => @vals["synopsis"],
						:plugin_type => @vals["plugin_type"],
						:cvss_vector => @vals["cvss_vector"],
						:cvss_base_score => @vals["cvss_base_score"].to_f,
						:vuln_publication_date => @vals["vuln_publication_date"],
						:plugin_version => @vals["plugin_version"],
						:cvss_temporal_score => @vals["cvss_temporal_score"],
						:cvss_temporal_vector => @vals["cvss_temporal_vector"],
						:exploitability_ease => @vals["exploitability_ease"],
						:exploit_framework_core => @vals["exploit_framework_core"],
						:exploit_available => @vals["exploit_available"] == "true",
						:exploit_framework_metasploit => @vals["exploit_framework_metasploit"],
						:metasploit_name => @vals["metasploit_name"],
						:exploit_framework_canvas => @vals["exploit_framework_canvas"],
						:canvas_package => @vals["canvas_package"],
						:exploit_framework_exploithub => @vals["exploit_framework_exploithub"],
						:exploithub_sku => @vals["exploithub_sku"],
						:stig_severity => @vals["stig_severity"],
						:fname => @vals["fname"],
						:always_run => @vals["always_run"],
						:script_version => @vals["script_version"],
						:exploited_by_malware => @vals["exploited_by_malware"],
						:compliance => @vals["compliance"],
						:agent => @vals["agent"]
					)
				end

				def end_attachment(_)
					@attachment.update(:ahash => @vals['attachment'])
				end
			end
		end
	end
end
