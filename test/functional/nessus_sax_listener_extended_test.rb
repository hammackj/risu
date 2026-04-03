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

require 'test_helper'

class NessusSaxListenerExtendedTest < ActiveSupport::TestCase
	include Risu::Models

	def setup
		setup_test_database(false)
	end

	def build_xml_with_plugin_details
		builder = Nokogiri::XML::Builder.new do |xml|
			xml.NessusClientData_v2 do
				xml.Policy do
					xml.policyName "TestPolicy"
					xml.Preferences do
						xml.ServerPreferences do
							xml.preference do
								xml.name "max_hosts"
								xml.value "30"
							end
							xml.preference do
								xml.name "max_checks"
								xml.value "4"
							end
						end

						xml.PluginsPreferences do
							xml.item do
								xml.pluginName "Test Plugin Pref"
								xml.pluginId "12345"
								xml.fullName "Test Plugin Pref[entry]:Setting"
								xml.preferenceName "Setting"
								xml.preferenceType "entry"
								xml.preferenceValues "default_value"
								xml.selectedValue "custom_value"
							end
						end
					end

					xml.FamilySelection do
						xml.FamilyItem do
							xml.FamilyName "Windows"
							xml.Status "enabled"
						end
					end

					xml.IndividualPluginSelection do
						xml.PluginItem do
							xml.PluginId "99999"
							xml.PluginName "Test Individual Plugin"
							xml.Family "Test Family"
							xml.Status "enabled"
						end
					end
				end

				xml.Report(:name => "FullTestReport") do
					xml.ReportHost(:name => "192.168.1.100") do
						xml.HostProperties do
							xml.tag(:name => "HOST_START") { xml.text "Thu Jul 7 14:00:00 2011" }
							xml.tag(:name => "HOST_END") { xml.text "Thu Jul 7 15:00:00 2011" }
							xml.tag(:name => "host-ip") { xml.text "192.168.1.100" }
							xml.tag(:name => "host-fqdn") { xml.text "test.example.com" }
							xml.tag(:name => "netbios-name") { xml.text "TESTHOST" }
							xml.tag(:name => "mac-address") { xml.text "00:11:22:33:44:55" }
							xml.tag(:name => "operating-system") { xml.text "Microsoft Windows 10 Pro" }
							xml.tag(:name => "MS19-01") { xml.text "KB1234567" }
						end

						xml.ReportItem(:port => "445", :svc_name => "cifs", :protocol => "tcp",
							:severity => "4", :pluginName => "Critical SMB Vuln",
							:pluginFamily => "Windows", :pluginID => "100001") do

							xml.risk_factor "Critical"
							xml.synopsis "A critical vulnerability exists."
							xml.description "This is a detailed description of the vulnerability."
							xml.solution "Apply the vendor patch."
							xml.plugin_publication_date "2020/01/15"
							xml.plugin_modification_date "2020/06/01"
							xml.vuln_publication_date "2019/12/01"
							xml.cvss_base_score "10.0"
							xml.cvss_vector "AV:N/AC:L/Au:N/C:C/I:C/A:C"
							xml.cvss_temporal_score "8.7"
							xml.cvss_temporal_vector "E:F/RL:OF/RC:C"
							xml.exploit_available "true"
							xml.exploit_framework_metasploit "true"
							xml.metasploit_name "exploit/windows/smb/test"
							xml.exploit_framework_canvas "true"
							xml.canvas_package "CANVAS"
							xml.exploitability_ease "Exploits are available"
							xml.plugin_type "remote"
							xml.plugin_version "1.0"
							xml.stig_severity "I"
							xml.fname "test_plugin.nasl"
							xml.always_run "false"
							xml.script_version "1.0"
							xml.compliance "false"
							xml.plugin_output "The remote host is vulnerable."
							xml.plugin_name "Critical SMB Vulnerability"
							xml.cve "CVE-2019-12345"
							xml.cve "CVE-2019-12346"
							xml.bid "12345"
							xml.xref "MSFT:MS19-001"
						end

						xml.ReportItem(:port => "80", :svc_name => "www", :protocol => "tcp",
							:severity => "2", :pluginName => "Medium HTTP Vuln",
							:pluginFamily => "Web Servers", :pluginID => "100002") do

							xml.risk_factor "Medium"
							xml.synopsis "A medium vulnerability exists."
							xml.description "Medium severity finding."
							xml.solution "Update the web server."
							xml.cvss_base_score "5.0"
							xml.exploit_available "false"
							xml.plugin_type "remote"
							xml.plugin_output "The web server has an issue."
							xml.plugin_name "Medium HTTP Vulnerability"
						end

						xml.ReportItem(:port => "0", :svc_name => "general", :protocol => "tcp",
							:severity => "0", :pluginName => "Info Plugin",
							:pluginFamily => "General", :pluginID => "0") do

							xml.risk_factor "None"
							xml.description "Informational finding."
							xml.plugin_name "Informational Plugin"
						end
					end

					xml.ReportHost(:name => "192.168.1.101") do
						xml.HostProperties do
							xml.tag(:name => "host-ip") { xml.text "192.168.1.101" }
							xml.tag(:name => "operating-system") { xml.text "Linux Kernel 5.4" }
						end

						xml.ReportItem(:port => "22", :svc_name => "ssh", :protocol => "tcp",
							:severity => "3", :pluginName => "SSH Vuln",
							:pluginFamily => "General", :pluginID => "100003") do

							xml.risk_factor "High"
							xml.synopsis "An SSH vulnerability."
							xml.description "SSH is vulnerable."
							xml.solution "Update SSH."
							xml.cvss_base_score "7.5"
							xml.exploit_available "false"
							xml.plugin_name "SSH Vulnerability"
						end
					end
				end
			end
		end

		builder.to_xml
	end

	def parse_xml(xml)
		listener = Risu::Parsers::Nessus::NessusSaxListener.new
		parser = Nokogiri::XML::SAX::Parser.new(listener)
		parser.parse(xml)
		listener
	end

	test "should parse multiple hosts" do
		parse_xml(build_xml_with_plugin_details)
		assert_equal 2, Host.count, "GOT #{Host.count}"
	end

	test "should parse host IP from host properties" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "192.168.1.100", host.ip
	end

	test "should parse host FQDN" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "test.example.com", host.fqdn
	end

	test "should parse host netbios name" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "TESTHOST", host.netbios
	end

	test "should parse host MAC address" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "00:11:22:33:44:55", host.mac
	end

	test "should parse host operating system" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "Microsoft Windows 10 Pro", host.os
	end

	test "should parse host end time" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal "20110707", host.end.strftime("%Y%m%d")
	end

	test "should create correct number of items for host" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		assert_equal 3, host.items.count, "GOT #{host.items.count}"
	end

	test "should parse plugin risk factor" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "Critical", plugin.risk_factor
	end

	test "should parse plugin CVSS base score" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal 10.0, plugin.cvss_base_score.to_f
	end

	test "should parse plugin CVSS vector" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "AV:N/AC:L/Au:N/C:C/I:C/A:C", plugin.cvss_vector
	end

	test "should parse plugin CVSS temporal score" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "8.7", plugin.cvss_temporal_score
	end

	test "should parse exploit_available as boolean true" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal true, plugin.exploit_available
	end

	test "should parse exploit_available as boolean false" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100002)
		assert_equal false, plugin.exploit_available
	end

	test "should parse exploit framework metasploit" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "true", plugin.exploit_framework_metasploit
	end

	test "should parse metasploit name" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "exploit/windows/smb/test", plugin.metasploit_name
	end

	test "should parse exploit framework canvas" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "true", plugin.exploit_framework_canvas
	end

	test "should parse plugin synopsis" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "A critical vulnerability exists.", plugin.synopsis
	end

	test "should parse plugin description" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "This is a detailed description of the vulnerability.", plugin.description
	end

	test "should parse plugin solution" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "Apply the vendor patch.", plugin.solution
	end

	test "should parse plugin type" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "remote", plugin.plugin_type
	end

	test "should parse plugin stig severity" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert_equal "I", plugin.stig_severity
	end

	test "should parse item port" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		item = host.items.where(:plugin_id => 100001).first
		assert_equal 445, item.port
	end

	test "should parse item severity" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		item = host.items.where(:plugin_id => 100001).first
		assert_equal 4, item.severity
	end

	test "should parse item plugin output" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		item = host.items.where(:plugin_id => 100001).first
		assert_equal "The remote host is vulnerable.", item.plugin_output
	end

	test "should parse item svc_name" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		item = host.items.where(:plugin_id => 100001).first
		assert_equal "cifs", item.svc_name
	end

	test "should parse CVE references" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		cves = plugin.references.where(:reference_name => "cve")
		assert_equal 2, cves.count, "GOT #{cves.count}"
	end

	test "should parse BID references" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		bids = plugin.references.where(:reference_name => "bid")
		assert_equal 1, bids.count, "GOT #{bids.count}"
	end

	test "should parse xref references" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		xrefs = plugin.references.where(:reference_name => "xref")
		assert_equal 1, xrefs.count, "GOT #{xrefs.count}"
	end

	test "should parse MS patch as host patch record" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		patches = host.patches
		assert patches.count >= 1, "GOT #{patches.count}"
	end

	test "should parse server preferences" do
		parse_xml(build_xml_with_plugin_details)
		policy = Policy.last
		prefs = policy.server_preferences
		assert prefs.count >= 2, "GOT #{prefs.count}"
	end

	test "should parse server preference name and value" do
		parse_xml(build_xml_with_plugin_details)
		pref = Risu::Models::ServerPreference.where(:name => "max_hosts").first
		assert_equal "30", pref.value, "GOT #{pref.value}"
	end

	test "should parse family selection" do
		parse_xml(build_xml_with_plugin_details)
		policy = Policy.last
		families = policy.family_selections
		assert families.count >= 1, "GOT #{families.count}"
	end

	test "should parse individual plugin selection" do
		parse_xml(build_xml_with_plugin_details)
		policy = Policy.last
		selections = policy.individual_plugin_selections
		assert selections.count >= 1, "GOT #{selections.count}"
	end

	test "should parse report name" do
		parse_xml(build_xml_with_plugin_details)
		report = Report.last
		assert_equal "FullTestReport", report.name, "GOT #{report.name}"
	end

	test "should parse pluginID 0 as plugin id 1" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(1)
		assert plugin != nil, "Plugin with id 1 should exist for pluginID 0"
	end

	test "should set rollup_finding to false for parsed items" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.100").first
		item = host.items.where(:plugin_id => 100001).first
		assert_equal false, item.rollup_finding
	end

	test "should detect new unknown XML elements" do
		listener = parse_xml(build_xml_with_plugin_details)
		assert listener.new_tags.is_a?(Array)
	end

	test "should parse linux host OS" do
		parse_xml(build_xml_with_plugin_details)
		host = Host.where(:name => "192.168.1.101").first
		assert_equal "Linux Kernel 5.4", host.os
	end

	test "should parse plugin publication date" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert plugin.plugin_publication_date != nil, "plugin_publication_date should not be nil"
	end

	test "should parse vuln publication date" do
		parse_xml(build_xml_with_plugin_details)
		plugin = Plugin.find_by_id(100001)
		assert plugin.vuln_publication_date != nil, "vuln_publication_date should not be nil"
	end

	test "should parse plugins preference item" do
		parse_xml(build_xml_with_plugin_details)
		policy = Policy.last
		prefs = policy.plugins_preferences
		assert prefs.count >= 1, "GOT #{prefs.count}"
	end
end
