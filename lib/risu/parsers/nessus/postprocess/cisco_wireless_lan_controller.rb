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
	module Parsers
		module Nessus
			module PostProcess
				class CiscoWirelessLANController < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Cisco Wireless LAN Controller Patch Rollup",
							:plugin_id => -99919,
							:plugin_name => "Missing the latest Cisco Wireless LAN Controller",
							:item_name => "Update to the latest Cisco Wireless LAN Controller",
							:plugin_ids => [
118461, #HIGH, Cisco Wireless LAN Controller Multiple Vulnerabilities
130208, #HIGH, Cisco Wireless LAN Controller Secure Shell (SSH) Denial of Service Vulnerability (cisco-sa-20191016-wlc-ssh-dos)
138440, #HIGH, Cisco Wireless LAN Controller Software Cross-Site Request Forgery (cisco-sa-20190417-wlc-csrf)
139036, #HIGH, Cisco Wireless LAN Controller CAPWAP DoS (cisco-sa-wlc-capwap-dos-Y2sD9uEw)
141369, #HIGH, Cisco AireOS Software for Cisco Wireless LAN Controllers (WLC) DoS (cisco-sa-iosxe-wlc-fnfv9-EvrAQpNX)
192919, #HIGH, Cisco Access Points Managed from WLC DoS (cisco-sa-ap-dos-h9TGGX6W)
94108, #MEDIUM, Cisco Wireless LAN Controller Multiple Vulnerabilities
99471, #MEDIUM, Cisco Wireless LAN Controller 802.11 WME Packet Header Handling DoS (cisco-sa-20170405-wlc)
124331, #MEDIUM, Cisco Wireless LAN Controller Software GUI Configuration Denial of Service Vulnerabilities
124332, #MEDIUM, Cisco Wireless LAN Controller Software IAPP Message Handling Denial of Service Vulnerabilities
124333, #MEDIUM, Cisco Wireless LAN Controller Secure Shell Unauthorized Access Vulnerability
124334, #MEDIUM, Cisco Wireless LAN Controller Locally Significant Certificate Denial of Service Vulnerability
							]
						}
					end
				end
			end
		end
	end
end


