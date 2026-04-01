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
				class OpenSSHRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "OpenSSH Patch Rollup",
							:plugin_id => -99995,
							:plugin_name => "Missing the latest OpenSSH Patches",
							:item_name => "Update to the latest OpenSSH",
							:plugin_ids => [
								11837, #CRITICAL, OpenSSH < 3.7.1 Multiple Vulnerabilities
								17702, #HIGH, OpenSSH < 3.6.1p2 Multiple Vulnerabilities
								44077, #HIGH, OpenSSH < 4.5 Multiple Vulnerabilities
								44078, #HIGH, OpenSSH < 4.7 Trusted X11 Cookie Connection Policy Bypass
								44065, #MEDIUM, OpenSSH < 5.2 CBC Plaintext Disclosure
								31737, #MEDIUM, OpenSSH X11 Forwarding Session Hijacking
								44074, #MEDIUM, Portable OpenSSH < 3.8p1 Multiple Vulnerabilities
								44076, #MEDIUM, OpenSSH  < 4.3 scp Command Line Filename Processing Command Injection
								44079, #MEDIUM, OpenSSH < 4.9 'ForceCommand' Directive Bypass
								19592, #LOW, OpenSSH < 4.2 Multiple Vulnerabilities
								44075, #LOW, OpenSSH < 4.0 known_hosts Plaintext Host Information Disclosure
								53841, #LOW, Portable OpenSSH ssh-keysign ssh-rand-helper Utility File Descriptor Leak Local Information Disclosure
								44080, #LOW, OpenSSH X11UseLocalhost X11 Forwarding Port Hijacking
								44077, #HIGH, OpenSSH < 4.5 Multiple Vulnerabilities
								44078, #HIGH, OpenSSH < 4.7 Trusted X11 Cookie Connection Policy Bypass
								85382, #HIGH, OpenSSH < 7.0 Multiple Vulnerabilities
								86122, #HIGH, OpenSSH MaxAuthTries Bypass
								10883, #CRITICAL, OpenSSH < 3.1 Channel Code Off by One Remote Privilege Escalation
								11031, #CRITICAL, OpenSSH < 3.4 Multiple Remote Overflows
								10771, #HIGH, OpenSSH 2.5.x - 2.9 Multiple Vulnerabilities
								10823, #HIGH, OpenSSH < 3.0.2 Multiple Vulnerabilities
								10954, #HIGH, OpenSSH Kerberos TGT/AFS Token Passing Remote Overflow
								11712, #HIGH, OpenSSH < 3.6.2 Reverse DNS Lookup Bypass
								44072, #HIGH, OpenSSH < 3.2.3 YP Netgroups Authentication Bypass
								10802, #MEDIUM, OpenSSH < 3.0.1 Multiple Flaws
								90022, #HIGH, OpenSSH < 7.2 Untrusted X11 Forwarding Fallback Security Bypass
								93194, #HIGH, OpenSSH < 7.3 Multiple Vulnerabilities
								96151, #HIGH, OpenSSH < 7.4 Multiple Vulnerabilities
								201194, #HIGH, OpenSSH < 9.8 RCE
								106608, #HIGH, OpenSSH 5.4 < 7.1p2 Multiple Vulnerabilities
								99359, #MEDIUM, OpenSSH < 7.5
								103781, #MEDIUM, OpenSSH < 7.6
								159490, #MEDIUM, OpenSSH < 7.8
								159491, #MEDIUM, OpenSSH < 8.0
								187201, #MEDIUM, OpenSSH < 9.6 Multiple Vulnerabilities
								84638, #HIGH, OpenSSH < 6.9 Multiple Vulnerabilities
								90023, #MEDIUM, OpenSSH < 7.2p2 X11Forwarding xauth Command Injection
90924, #MEDIUM, OpenSSH 6.8p1 - 7.x < 7.1p2 ssh_packet_read_poll2() Packet Handling DoS
85690, #LOW, OpenSSH 7.x < 7.1 PermitRootLogin Security Bypass
234554, #LOW, OpenSSH < 10.0 DisableForwarding
269984, #LOW, OpenSSH < 10.1 / 10.1p1 Multiple Vulnerabilities

							]
						}
					end
				end
			end
		end
	end
end
