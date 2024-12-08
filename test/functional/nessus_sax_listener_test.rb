# Copyright (c) 2010-2025 Jacob Hammack.
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

class NessusSaxListenerTest < ActiveSupport::TestCase
	include Risu::Models

	#
	def setup
			setup_test_database (false)
			xml = build_nessus_xml "HOST_END", "Thu Jul 7 14:49:31 2011"

			@parser = LibXML::XML::SaxParser.string xml
			@parser.callbacks = Risu::Parsers::Nessus::NessusSaxListener.new
			@parser.parse
	end

	#Expand this to cover the entire Nessus xml spec
	def build_nessus_xml property, value
		builder = Nokogiri::XML::Builder.new do |xml|
			xml.NessusClientData_v2 do
				xml.Policy do
					xml.policyName "Everything"
					xml.policyComments "comments..."
					xml.policyOwner "Someone"
					xml.visibility "shared"

					xml.Preferences do
						xml.ServerPreferences do
							xml.preference do
								xml.name "max_simult_tcp_sessions"
								xml.value "unlimited"
							end
						end
					end
				end

				xml.Report(:name => "Reportname") do
					xml.ReportHost(:name => "69.69.69.69") do
						xml.HostProperties do
							xml.tag(:name => "#{property}") do
								xml.text "#{value}"
							end

							xml.tag(:name => "host-ip") do
								xml.text "69.69.69.69"
							end

							xml.tag(:name => "traceroute-hop-0") do
								xml.text "69.69.69.67"
							end

							xml.tag(:name => "traceroute-hop-1") do
								xml.text "69.69.69.68"
							end

							xml.tag(:name => "traceroute-hop-2") do
								xml.text "69.69.69.70"
							end

							xml.tag(:name => "pcidss:insecure_http_methods") do
								xml.text "GET"
							end

							xml.tag(:name => "UNDEFINED_HOST_PROPERTY") do
								xml.text "UNDEFINED_HOST_PROPERTY"
							end

							xml.tag(:name => "operating-system") do
								xml.text "Microsoft Windows Server 2003
	Microsoft Windows Vista
	Microsoft Windows Server 2008
	Microsoft Windows 7
	Microsoft Windows Server 2008 R2
	Microsoft Windows Server 2012
	Microsoft Windows 8
	Microsoft Windows Server 2012 R2
	Microsoft Windows 10
	Microsoft Windows Server 2016
	Microsoft Windows Server 2019"
							end
						end

						xml.ReportItem(:port => "88", :svc_name => "kerberos?", :protocol => "tcp", :severity => "0", :pluginName => "Test Plugin", :pluginFamily => "Test Family", :pluginID =>"999999") do
							xml.xref "MSFT:MS00-000"
							xml.xref "cert-cc:CA-1997-22"
							xml.send(:"cert-cc", "CA-1997-22")
							xml.xref "USN:1752-1"
							xml.send(:"usn", "USN:1752-1")
							xml.exploited_by_malware("true")
							xml.attachment(:name => "ts_screenshot.jpg", :type => "image/bmp") do
								xml.text "c89122a07b0ea7087a0c712d711a07b7"
							end

							xml.agent "all"
							xml.in_the_news "true"

							xml.send(:"cm:compliance-info", "cm:compliance-info")
							xml.send(:"cm:compliance-reference", "cm:compliance-reference")
							xml.send(:"cm:compliance-see-also", "cm:compliance-see-also")
							xml.send(:"cm:compliance-solution", "cm:compliance-solution")

							xml.send(:"UNDEFINED_ELEMENT", "UNDEFINED_ELEMENT")
						end
					end
				end
			end
		end

		builder.to_xml
	end

	test "Host.where(:name => '69.69.69.69').first.items.first.cm_compliance_info == cm:compliance-info" do
			assert Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_info == "cm:compliance-info", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_info}"
	end

	test "Host.where(:name => '69.69.69.69').first.items.first.cm_compliance_reference == cm:compliance-reference" do
			assert Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_reference == "cm:compliance-reference", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_reference}"
	end

	test "Host.where(:name => '69.69.69.69').first.items.first.cm_compliance_see_also == cm:compliance-see-also" do
			assert Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_see_also == "cm:compliance-see-also", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_see_also}"
	end

	test "Host.where(:name => '69.69.69.69').first.items.first.cm_compliance_solution == cm:compliance-solution" do
			assert Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_solution == "cm:compliance-solution", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.cm_compliance_solution}"
	end

	test "Host.where(:name => '69.69.69.69').first.os.length == 310" do
			assert Host.where(:name => "69.69.69.69").first.os.length == 310, "GOT #{Host.where(:name => "69.69.69.69").first.os.length}"
	end

	test "Attachment.first.name == 'ts_screenshot.jpg'" do
			assert Attachment.first.name == 'ts_screenshot.jpg', "GOT #{Attachment.first.name}"
	end

	test "Attachment.first.ttype == 'image/bmp'" do
		assert Attachment.first.ttype == 'image/bmp', "GOT #{Attachment.first.ttype}"
	end

	test "Attachment.first.ahash == 'c89122a07b0ea7087a0c712d711a07b7'" do
		assert Attachment.first.ahash == 'c89122a07b0ea7087a0c712d711a07b7', "GOT #{Attachment.first.ahash}"
	end

	test "return 2011-07-07 14:49:31 -0500 for Host.where(:name => '69.69.69.69').first.end" do
			assert Host.where(:name => "69.69.69.69").first.end.strftime("%Y%m%d") == "20110707", "GOT #{Host.where(:name => "69.69.69.69").first.end.strftime("%Y%m%d")}"
	end

 	test "return 1 Item for Host 69.69.69.69" do
 		assert Host.where(:name => "69.69.69.69").first.items.count == 1, "GOT #{Host.where(:name => "69.69.69.69").first.items.count}"
 	end

 	test "return CA-1997-22 for Host.where(:name => 69.69.69.69).first.items.first.plugin.references.where(:reference_name => cert-cc).first.value" do
 		assert Host.where(:name => "69.69.69.69").first.items.first.plugin.references.where(:reference_name => "cert-cc").first.value == "CA-1997-22", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.plugin.references.where(:reference_name => "cert-cc").first.value}"
 	end

	test "return 'all' for Host.where(:name => 69.69.69.69).first.items.first.plugin.agent" do
		assert Host.where(:name => "69.69.69.69").first.items.first.plugin.agent == "all", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.plugin.agent}"
	end

	test "return USN:1752-1 for Host.where(:name => 69.69.69.69).first.items.first.plugin.references.where(:reference_name => usn).first.value" do
		assert Host.where(:name => "69.69.69.69").first.items.first.plugin.references.where(:reference_name => "usn").first.value == "USN:1752-1", "GOT #{Host.where(:name => "69.69.69.69").first.items.first.plugin.references.where(:reference_name => "usn").first.value}"
	end

	test "return Everything for Policy.last.name" do
		assert Policy.last.name == "Everything", "GOT #{Policy.last.name}"
	end

	test "return Comments... for Policy.last.comments" do
		assert Policy.last.comments == "comments...", "GOT #{Policy.last.comments}"
	end

	test "return Someone for Policy.last.owner" do
		assert Policy.last.owner == "Someone", "GOT #{Policy.last.owner}"
	end

	test "return shared for Policy.last.visibility" do
		assert Policy.last.visibility == "shared", "GOT #{Policy.last.visibility}"
	end

	test "return 10.69.69.67 for Host.where(:name => 69.69.69.69)...traceroute_hop_0" do
		assert Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-0").first.value == "69.69.69.67", "GOT #{Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-0").first.value}"
	end

	test "return 10.69.69.68 for Host.where(:name => 69.69.69.69)...traceroute_hop_1" do
		assert Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-1").first.value == "69.69.69.68", "GOT #{Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-1").first.value}"
	end

	test "return 10.69.69.70 for Host.where(:name => 69.69.69.69)...traceroute_hop_2" do
		assert Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-2").first.value == "69.69.69.70", "GOT #{Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "traceroute-hop-2").first.value}"
	end

	test "return GET for Host.where(:name => 69.69.69.69)...pcidss:insecure_http_methods" do
		assert Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "pcidss:insecure_http_methods").first.value == "GET", "GOT #{Host.where(:name => "69.69.69.69").first.host_properties.where(:name => "pcidss:insecure_http_methods").first.value}"
	end

	test "return 1 for Plugin.where(:exploited_by_malware => true).count" do
			assert Plugin.where(:exploited_by_malware => true).count == 1, "GOT #{Plugin.where(:exploited_by_malware => true).count}"
	end

	test "return 1 for Plugin.in_the_news.count" do
			assert Plugin.in_the_news.count == 1, "GOT #{Plugin.in_the_news.count}"
	end
end
