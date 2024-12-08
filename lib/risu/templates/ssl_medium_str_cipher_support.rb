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


module Risu
	module Templates
		class SSLMediumStrCipherSupported < Risu::Base::TemplateBase
			include TemplateHelper

			#
			def initialize
				@template_info =
				{
					:name => "ssl_medium_str_cipher_supported",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a report of all hosts supporting medium str ciphers for ssl"
				}
			end

			#
			#
			def render output
				@output.text Report.classification.upcase, :align => :center
				@output.text "\n"

				report_title Report.title
				report_subtitle "SSL Medium Strength Cipher Suites Suupported Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

                plugin_to_find = 42873

                plugin_data = Plugin.where(:id => plugin_to_find).first

                if plugin_data == nil
                    puts "No Data for SSL Medium Str Cipher Support, exiting"
                    return
                end

                heading2 "#{plugin_data.plugin_name}"
                text "#{plugin_data.description}"
                
                text "\n"
                text "\n"
                text "\n"

                if plugin_data.items == nil
                    puts "No Data for SSL Medium Str Cipher Support, exiting"
                    return
                end

                plugin_data.items.each do |item|
                    host = item.host

                    plugin_output = clean_output item.plugin_output.to_s

                    heading2 host.ip
                    field "Operating System: ", host.os
                    field "Name: ", host.name
                    field "FQDN: ", host.fqdn
                    field "Port: ", item.port.to_s
                    field "Possible Service Name: ", item.svc_name
                    definition "Detected Ciphers:", plugin_output
                    text "\n"
                end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end

            def clean_output data
                output = data.gsub "The fields above are :", ""
                output = output.gsub "{Tenable ciphername}", ""
                output = output.gsub "{Cipher ID code}", ""
                output = output.gsub "Kex={key exchange}", ""
                output = output.gsub "Auth={authentication}", ""
                output = output.gsub "Encrypt={symmetric encryption method}", ""
                output = output.gsub "MAC={message authentication code}", ""
                output = output.gsub "{export flag}", ""

                output.chomp!
                output.strip!
            end
		end
	end
end
