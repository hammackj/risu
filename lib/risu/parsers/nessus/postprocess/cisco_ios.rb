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
								58568, #HIGH, Cisco IOS Software Multicast Source Discovery Protocol DoS (cisco-sa-20120328-msdp)
								58570, #HIGH, Cisco IOS Software Command Security Bypass (cisco-sa-20120328-pai)
								58572, #HIGH, Cisco IOS Software Smart Install Denial of Service Vulnerability (cisco-sa-20120328-smartinstall)
								62372, #HIGH, Cisco IOS Software DHCP Denial of Service Vulnerability (cisco-sa-20120926-dhcp)
								62373, #HIGH, Cisco IOS Software DHCP Version 6 Server Denial of Service Vulnerability (cisco-sa-20120926-dhcpv6)
								65891, #HIGH, Cisco IOS Software Smart Install Denial of Service Vulnerability (cisco-sa-20130327-smartinstall)
								70316, #HIGH, Cisco IOS Software DHCP Denial of Service Vulnerability (cisco-sa-20130925-dhcp)
								70322, #HIGH, Cisco IOS Software Multicast Network Time Protocol Denial of Service Vulnerability (cisco-sa-20130925-ntp)
								73345, #HIGH, Cisco IOS Software Multiple Network Address Translation (NAT) Denial of Service Vulnerabilities (cisco-sa-20140326-nat)
								78035, #HIGH, Cisco IOS Software RSVP DoS (cisco-sa-20140924-rsvp)
								82571, #HIGH, Cisco IOS Software TCP CIP DoS
								90358, #HIGH, Cisco IOS Smart Install Packet Image List Parameter Handling DoS (cisco-sa-20160323-smi)
								99028, #HIGH, Cisco IOS L2TP Parsing DoS (cisco-sa-20170322-l2tp)
								99687, #HIGH, Cisco IOS EnergyWise DoS (cisco-sa-20170419-energywise)
								103670, #HIGH, Cisco IOS Software PROFINET denial of service (cisco-sa-20170927-profinet)
								97991, #CRITICAL, Cisco IOS Cluster Management Protocol Telnet Option Handling RCE (cisco-sa-20170317-cmp)
								94252, #HIGH, Cisco IOS Software CIP Request DoS (cisco-sa-20160928-cip)
								103565, #CRITICAL, Cisco IOS Software DHCP Remote Code Execution Vulnerability
								108722, #CRITICAL, Cisco IOS Software Smart Install Remote Code Execution Vulnerability
								108880, #HIGH, Cisco IOS Software Link Layer Discovery Protocol Buffer Overflow Vulnerabilities (cisco-sa-20180328-lldp)
								108956, #HIGH, Cisco IOS Software DNS Forwarder Denial of Service Vulnerability (cisco-sa-20160928-dns)
								109087, #HIGH, Cisco IOS DHCP Multiple Vulnerabilities
								117944, #MEDIUM, Cisco IOS Software Cluster Management Protocol DoS Vulnerability (cisco-sa-20180926-cmp)
108720, #CRITICAL, Cisco IOS Software Quality of Service Remote Code Execution Vulnerability
133000, #HIGH, Cisco IOS Web UI Cross-Site Request Forgery (cisco-sa-20200108-ios-csrf)
103669, #HIGH, Cisco IOS Software NAT denial of service (cisco-sa-20170927-nat)
103693, #HIGH, Cisco IOS Software Internet Key Exchange Denial of Service Vulnerability
117949, #HIGH, Cisco IOS Software IPv6 Hop-by-Hop DoS Vulnerability (cisco-sa-20180926-ipv6hbh)
129694, #HIGH, Cisco IOS Denial of Service Vulnerability (cisco-sa-20190925-sip-dos)
132048, #HIGH, Cisco IOS Software Software Plug and Play Agent Memory Leak(cisco-sa-20180926-pnp-memleak)
132723, #HIGH, Cisco IOS Software NAT64 Denial of Service Vulnerability
137630, #HIGH, Cisco IOS and IOS XE Software Tcl Arbitrary Code Execution (cisco-sa-tcl-ace-C9KuVKmm)
137654, #HIGH, Cisco IOS
129812, #HIGH, Cisco IOS ISDN Interface Denial of Service Vulnerability
130092, #HIGH, Cisco IOS Software IP Service Level Agreement Denial of Service Vulnerability
131325, #HIGH, Cisco IOS Software Internet Key Exchange Memory Leak (cisco-sa-20180328-ike)
141170, #HIGH, Cisco IOS Software Split DNS DoS (cisco-sa-splitdns-SPWqpdGW)
130766, #HIGH, Cisco IOS Smart Install Memory Leak (cisco-sa-20160928-smi)
131164, #HIGH, Cisco IOS AAA Login DoS (cisco-sa-20160928-aaados)
131322, #HIGH, Cisco IOS Software Smart Install DoS (cisco-sa-20180328-smi)
184452, #CRITICAL, Cisco IOS XE Unauthenticatd Remote Command Execution (CVE-2023-20198) (Direct Check)
							]
						}
					end
				end
			end
		end
	end
end
