require 'risu'

ActiveRecord::Migration.verbose = false

module Risu
	module Parsers
		module Nessus

			# NessusSaxListener
			#
			# @author Jacob Hammack <jacob.hammack@hammackj.com>
			class NessusSaxListener
				include LibXML::XML::SaxParser::Callbacks

				# Sets up a array of all valid xml fields
				#
				def initialize
					@vals = Hash.new

					@valid_references = Array[
						"cpe", "bid", "see_also", "xref", "cve", "iava", "msft",
						"osvdb", "cert", "edb-id", "rhsa", "secunia", "suse", "dsa",
						"owasp", "cwe", "iadb", "iavt"]

					@valid_elements = Array["ReportItem", "plugin_version", "risk_factor",
						"description", "cvss_base_score", "solution", "item", "plugin_output", "tag", "synopsis", "plugin_modification_date",
						"FamilyName", "FamilyItem", "Status", "vuln_publication_date", "ReportHost", "HostProperties", "preferenceName",
						"preferenceValues", "preferenceType", "fullName", "pluginId", "pluginName", "selectedValue", "selectedValue",
						"name", "value", "preference", "plugin_publication_date", "cvss_vector", "patch_publication_date",
						"NessusClientData_v2", "Policy", "PluginName", "ServerPreferences", "policyComments", "policyName", "PluginItem",
						"Report", "Family", "Preferences", "PluginsPreferences", "FamilySelection", "IndividualPluginSelection", "PluginId",
						"pci-dss-compliance", "exploitability_ease", "cvss_temporal_vector", "exploit_framework_core", "cvss_temporal_score",
						"exploit_available", "metasploit_name", "exploit_framework_canvas", "canvas_package", "exploit_framework_metasploit",
						"plugin_type", "exploithub_sku", "exploit_framework_exploithub", "stig_severity", "plugin_name", "fname",
						]

						@valid_elements = @valid_elements + @valid_references

						# This makes adding new host properties really easy, except for the
						#MS patch numbers, this are handled differently.
						@valid_host_properties = {
							"HOST_END" => :end,
							"mac-address" => :mac,
							"HOST_START" => :start,
							"operating-system" => :os,
							"host-ip" => :ip,
							"host-fqdn" => :fqdn,
							"netbios-name" => :netbios,
							"local-checks-proto" => :local_checks_proto,
							"smb-login-used" => :smb_login_used,
							"ssh-auth-meth" => :ssh_auth_meth,
							"ssh-login-used" => :ssh_login_used,
							"pci-dss-compliance" => :pci_dss_compliance,
							"pci-dss-compliance:" => :pci_dss_compliance_ , #I think this is a Tenable bug~
							"pcidss:compliance:failed" => :pcidss_compliance_failed,
							"pcidss:compliance:passed" => :pcidss_compliance_passed,
							"pcidss:deprecated_ssl" => :pcidss_deprecated_ssl,
							"pcidss:expired_ssl_certificate" => :pcidss_expired_ssl_certificate,
							"pcidss:high_risk_flaw" => :pcidss_high_risk_flaw,
							"pcidss:medium_risk_flaw" => :pcidss_medium_risk_flaw,
							"pcidss:reachable_db" => :pcidss_reachable_db,
							"pcidss:www:xss" => :pcidss_www_xss,
							"pcidss:directory_browsing" => :pcidss_directory_browsing,
							"pcidss:known_credentials" => :pcidss_known_credentials,
							"pcidss:compromised_host:worm" => :pcidss_compromised_host_worm,
							"system-type" => :system_type,
							"pcidss:obsolete_operating_system" => :pcidss_obsolete_operating_system,
							"pcidss:dns_zone_transfer" => :pcidss_dns_zone_transfer,
							"pcidss:unprotected_mssql_db" => :pcidss_unprotected_mssql_db,
							"pcidss:obsolete_software" => :pcidss_obsolete_software,
							"pcidss:www:sql_injection" => :pcidss_www_sql_injection,
							"pcidss:backup_files" => :pcidss_backup_files,
							"fname" => :fname
						}
				end

				# Callback for when the start of a xml element is reached
				#
				# @param element XML element
				# @param attributes Attributes for the XML element
				def on_start_element(element, attributes)
					@tag = element
					@vals[@tag] = ""

					if !@valid_elements.include?(element)
						puts "New XML element detected: #{element}. Please report this to #{Risu::EMAIL}"
					end

					case element
						when "Policy"
							@policy = Risu::Models::Policy.create
							@policy.save
						when "preference"
							@sp = @policy.server_preferences.create
							@sp.save
						when "item"
							@item = @policy.plugins_preferences.create
							@item.save
						when "FamilyItem"
							@family = @policy.family_selections.create
							@family.save
						when "PluginItem"
							@plugin_selection = @policy.individual_plugin_selections.create
							@plugin_selection.save
						when "Report"
							@report = @policy.reports.create
							@report.name = attributes["name"]
							@report.save
						when "ReportHost"
							@rh = @report.hosts.create
							@rh.name = attributes["name"]
							@rh.save
						when "tag"
							@attr = nil

							if attributes["name"] =~ /[M|m][S|s]\d{2,}-\d{2,}/
								@attr = if attributes["name"] =~ /[M|m][S|s]\d{2,}-\d{2,}/
										attributes["name"]
									else
										nil
									end
							else
								@attr = if @valid_host_properties.keys.include?(attributes["name"])
										attributes["name"]
									else
										nil
									end
							end

							puts "New HostProperties attribute: #{attributes["name"]}. Please report this to jacob.hammack@hammackj.com\n" if @attr.nil?
						when "ReportItem"
							@vals = Hash.new # have to clear this out or everything has the same references
							@ri = @rh.items.create
							if attributes["pluginID"] == "0"
								@plugin = Risu::Models::Plugin.find_or_create_by_id(1)
							else
								@plugin = Risu::Models::Plugin.find_or_create_by_id(attributes["pluginID"])
							end

							@ri.port	= attributes["port"]
							@ri.svc_name = attributes["svc_name"]
							@ri.protocol = attributes["protocol"]
							@ri.severity = attributes["severity"]

							@ri.plugin_id = @plugin.id
							@plugin.plugin_name = attributes["pluginName"]
							@plugin.family_name = attributes["pluginFamily"]
							@plugin.save
							@ri.save
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

				# Called when the end of the xml element is reached
				#
				# @param element
				def on_end_element(element)
					@tag = nil
					case element
						when "policyName"
							@policy.attributes = {
								:name => @vals["policyName"]
							}

							@policy.save
						when "policyComments"
							@policy.attributes = {
								:comments => @vals["policyComments"]
							}

							@policy.save
						when "preference"
							@sp.attributes = {
								:name => @vals["name"],
								:value => @vals["value"]
							}
							@sp.save

							#This takes a really long time, there is about 34,000 pluginIDs in this
							#field and it takes about 36 minutes to parse just this info =\
							#lets prepopulate the plugins table with the known pluginid's
							#if @vals["name"] == "plugin_set"
							#	 @all_plugins = @vals["value"].split(";")
							#
							#	 @all_plugins.each { |p|
							#			@plug = Plugin.find_or_create_by_id(p)
							#			@plug.save
							#	 }
							#end
						when "item"
							@item.attributes = {
								:plugin_name => @vals["pluginName"],
								:plugin_id => @vals["pluginId"],
								:fullname => @vals["fullName"],
								:preference_name => @vals["preferenceName"],
								:preference_type => @vals["preferenceType"],
								:preference_values => @vals["preferenceValues"],
								:selected_values => @vals["selectedValue"]
							}

							@item.save
						when "FamilyItem"
							@family.attributes = {
								:family_name => @vals["FamilyName"],
								:status => @vals["Status"]
							}

							@family.save
						when "PluginItem"
							@plugin_selection.attributes = {
								:plugin_id => @vals["PluginId"],
								:plugin_name => @vals["PluginName"],
								:family => @vals["Family"],
								:status => @vals["Status"]
							}

							@plugin_selection.save
						when "tag"
							if @attr =~ /[M|m][S|s]\d{2}-\d{2,}/
								@patch = @rh.patches.create
								@patch.name = @attr
								@patch.value = @vals['tag']
								@patch.save
							else
								@rh.attributes = {@valid_host_properties[@attr] => @vals["tag"].gsub("\n", ",") } if @valid_host_properties.keys.include?(@attr)
								@rh.save
							end if @attr != nil
						#We cannot handle the references in the same block as the rest of the ReportItem tag because
						#there tends to be more than of the different types of reference per ReportItem, this causes issue for a sax
						#parser. To solve this we do the references before the final plugin data, Valid references must be added
						#the @valid_reference array at the top to be parsed.
						# *@valid_reference, does a 'when' on each element of the @valid_references array, pure magic
						when *@valid_references
							@ref = @plugin.references.create
							@ref.reference_name = element
							@ref.value = @vals["#{element}"]
							@ref.save
						when "ReportItem"
							@ri.plugin_output = @vals["plugin_output"]
							@ri.plugin_name = @vals["plugin_name"]
							@ri.save

							@plugin.attributes = {
								:solution => @vals["solution"],
								:risk_factor => @vals["risk_factor"],
								:description => @vals["description"],
								:plugin_publication_date => @vals["plugin_publication_date"],
								:plugin_modification_date => @vals["plugin_modification_date"],
								:synopsis => @vals["synopsis"],
								:plugin_type => @vals["plugin_type"],
								:cvss_vector => @vals["cvss_vector"],
								:cvss_base_score => @vals["cvss_base_score"],
								:vuln_publication_date => @vals["vuln_publication_date"],
								:plugin_version => @vals["plugin_version"],
								:cvss_temporal_score => @vals["cvss_temporal_score"],
								:cvss_temporal_vector => @vals["cvss_temporal_vector"],
								:exploitability_ease => @vals["exploitability_ease"],
								:exploit_framework_core => @vals["exploit_framework_core"],
								:exploit_available => @vals["exploit_available"],
								:exploit_framework_metasploit => @vals["exploit_framework_metasploit"],
								:metasploit_name => @vals["metasploit_name"],
								:exploit_framework_canvas => @vals["exploit_framework_canvas"],
								:canvas_package => @vals["canvas_package"],
								:exploit_framework_exploithub => @vals["exploit_framework_exploithub"],
								:exploithub_sku => @vals["exploithub_sku"],
								:stig_severity => @vals["stig_severity"],
								:fname => @vals["fname"]
							}
							@plugin.save
					end
				end
			end
		end
	end
end
