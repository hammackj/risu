# Copyright (c) 2010-2019 Jacob Hammack.
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
				class CiscoIOSPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Cisco IOS Patch Rollup",
							:plugin_id => -99965,
							:plugin_name => "Missing the latest Cisco IOS Patches",
							:item_name => "Update to the latest Cisco IOS",
							:plugin_ids => [
								58568, #Cisco IOS Software Multicast Source Discovery Protocol DoS (cisco-sa-20120328-msdp)
								58570, #Cisco IOS Software Command Security Bypass (cisco-sa-20120328-pai)
								58572, #Cisco IOS Software Smart Install Denial of Service Vulnerability (cisco-sa-20120328-smartinstall)
								62372, #Cisco IOS Software DHCP Denial of Service Vulnerability (cisco-sa-20120926-dhcp)
								62373, #Cisco IOS Software DHCP Version 6 Server Denial of Service Vulnerability (cisco-sa-20120926-dhcpv6)
								65891, #Cisco IOS Software Smart Install Denial of Service Vulnerability (cisco-sa-20130327-smartinstall)
								70316, #Cisco IOS Software DHCP Denial of Service Vulnerability (cisco-sa-20130925-dhcp)
								70322, #Cisco IOS Software Multicast Network Time Protocol Denial of Service Vulnerability (cisco-sa-20130925-ntp)
								73345, #Cisco IOS Software Multiple Network Address Translation (NAT) Denial of Service Vulnerabilities (cisco-sa-20140326-nat)
								78035, #Cisco IOS Software RSVP DoS (cisco-sa-20140924-rsvp)
								82571, #Cisco IOS Software TCP CIP DoS
								90358, #Cisco IOS Smart Install Packet Image List Parameter Handling DoS (cisco-sa-20160323-smi) 94252, #Cisco IOS Software CIP Request DoS (cisco-sa-20160928-cip)
								99028, #Cisco IOS L2TP Parsing DoS (cisco-sa-20170322-l2tp)
								99687, #Cisco IOS EnergyWise DoS (cisco-sa-20170419-energywise)
								103670, #Cisco IOS Software PROFINET denial of service (cisco-sa-20170927-profinet)
								97991, #Cisco IOS Cluster Management Protocol Telnet Option Handling RCE (cisco-sa-20170317-cmp)
								94252, #Cisco IOS Software CIP Request DoS (cisco-sa-20160928-cip)
							]
						}
					end
				end
			end
		end
	end
end
