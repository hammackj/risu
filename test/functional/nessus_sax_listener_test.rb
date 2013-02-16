# Copyright (c) 2010-2013 Arxopia LLC.
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
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

 require 'test_helper'

 class NessusSaxListenerTest < ActiveSupport::TestCase
 	include Risu::Models

 	#exapand this
 	def build_nessus_xml property, value
		builder = Nokogiri::XML::Builder.new do |xml|
			xml.NessusClientData_v2 do
				xml.Policy do
					xml.policyName "Everything"
					xml.policyComments ""

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
						end

						xml.ReportItem(:port => "88", :svc_name => "kerberos?", :protocol => "tcp", :severity => "0", :pluginName => "", :pluginFamily => "") do
							xml.xref "MSFT:MS00-000"
						end
					end
				end
			end
		end

 		builder.to_xml
 	end

 	def setup
  		xml = build_nessus_xml "HOST_END", "Thu Jul 7 14:49:31 2011"
 		@parser = LibXML::XML::SaxParser.string xml
		@parser.callbacks = Risu::Parsers::Nessus::NessusSaxListener.new
		@parser.parse		
 	end

 	test "return 2011-07-07 14:49:31 -0500 for Host.where(:name => '69.69.69.69').first.end" do
		assert Host.where(:name => "69.69.69.69").first.end == "2011-07-07 14:49:31 -0500", "GOT #{Host.where(:name => "69.69.69.69").first.end}"
 	end

 	test "return 1 Item for Host 69.69.69.69" do
 		assert Host.where(:name => "69.69.69.69").first.items.count == 1, "GOT #{Host.where(:name => "69.69.69.69").first.items.count}"
 	end

 end
