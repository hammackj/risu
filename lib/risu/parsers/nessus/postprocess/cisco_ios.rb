# Copyright (c) 2010-2020 Jacob Hammack.
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
								103565, #Cisco IOS Software DHCP Remote Code Execution Vulnerability
								108722, #Cisco IOS Software Smart Install Remote Code Execution Vulnerability
								108880, #Cisco IOS Software Link Layer Discovery Protocol Buffer Overflow Vulnerabilities (cisco-sa-20180328- lldp)
								108956, #Cisco IOS Software DNS Forwarder Denial of Service Vulnerability (cisco-sa-20160928-dns)
								109087, #Cisco IOS DHCP Multiple Vulnerabilities
								117944, #Cisco IOS Software Cluster Management Protocol DoS Vulnerability (cisco-sa-20180926-cmp)																
108720, #Cisco IOS Software Quality of Service Remote Code Execution Vulnerability
133000, #Cisco IOS Web UI Cross-Site Request Forgery (cisco-sa-20200108-ios-csrf)
103669, #Cisco IOS Software NAT denial of service (cisco-sa-20170927-nat)
103693, #Cisco IOS Software Internet Key Exchange Denial of Service Vulnerability
117949, #Cisco IOS Software IPv6 Hop-by-Hop DoS Vulnerability (cisco-sa-20180926-ipv6hbh)
129694, #Cisco IOS Denial of Service Vulnerability (cisco-sa-20190925-sip-dos)		
132048, #Cisco IOS Software Software Plug and Play Agent Memory Leak(cisco-sa-20180926-pnp-memleak) 
132723, #Cisco IOS Software NAT64 Denial of Service Vulnerability
137630, #Cisco IOS and IOS XE Software Tcl Arbitrary Code Execution (cisco-sa-tcl-ace-C9KuVKmm) 
137654, #Cisco IOS, IOS XE, and NX-OS Software Security Group Tag Exchange Protocol Denial of Service																														
129812, #Cisco IOS ISDN Interface Denial of Service Vulnerability
130092, #Cisco IOS Software IP Service Level Agreement Denial of Service Vulnerability
131325, #Cisco IOS Software Internet Key Exchange Memory Leak (cisco-sa-20180328-ike)
141170, #Cisco IOS Software Split DNS DoS (cisco-sa-splitdns-SPWqpdGW)
130766, #Cisco IOS Smart Install Memory Leak (cisco-sa-20160928-smi) 
131164, #Cisco IOS AAA Login DoS (cisco-sa-20160928-aaados) 
131322, #Cisco IOS Software Smart Install DoS (cisco-sa-20180328-smi)
184452, #CRITICAL, Cisco IOS XE Unauthenticatd Remote Command Execution (CVE-2023-20198) (Direct Check)
							]
						}
					end
				end
			end
		end
	end
end
