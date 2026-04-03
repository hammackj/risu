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
				class VMwareVCenter < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware vCenter Patch Rollup",
							:plugin_id => -99979,
							:plugin_name => "Missing the latest VMware vCenter Patches",
							:item_name => "Update to the latest VMware vCenter",
							:plugin_ids => [
								79865, #CRITICAL, VMware Security Updates for vCenter Server (VMSA-2014-0012)
								66274, #MEDIUM, VMware Security Updates for vCenter Server (VMSA-2013-0006)
								66806, #CRITICAL, VMware vCenter Multiple Vulnerabilities (VMSA-2012-0013)
								70612, #CRITICAL, VMware Security Updates for vCenter Server (VMSA-2013-0012)
								77728, #CRITICAL, VMware Security Updates for vCenter Server (VMSA-2014-0008)
								65209, #HIGH, VMware vCenter Server Denial of Service (VMSA-2012-0018)
								65223, #HIGH, VMware vCenter Server NFC Protocol Code Execution (VMSA-2013-0003)
								76457, #MEDIUM, VMware Security Updates for vCenter Server (VMSA-2014-0006)
								83186, #CRITICAL, VMware vCenter Server Multiple Java Vulnerabilities (VMSA-2015-0003) (POODLE)
								81146, #MEDIUM, VMware Security Updates for vCenter Server (VMSA-2015-0001) (POODLE)
								79147, #CRITICAL, VMware vCenter Converter 5.1.x < 5.1.2 / 5.5.x < 5.5.3 Multiple Vulnerabilities (VMSA-2014-0010) (Shellshock)
								86255, #CRITICAL, VMware vCenter Multiple Vulnerabilities (VMSA-2015-0007)
								66812, #HIGH, VMware vCenter Server Multiple Vulnerabilities (VMSA-2012-0005)
								87763, #HIGH, VMware vCenter / vRealize Orchestrator 4.2.x / 5.x / 6.x Java Object Deserialization RCE (VMSA-2015-0009)
								90710, #MEDIUM, VMware vCenter Server 5.5.x < 5.5u3d / 6.0.x < 6.0u2 Client Integration Plugin Session Hijacking (VMSA-2016-0004)
								91322, #CRITICAL, VMware vCenter Server 5.0.x < 5.0u3e / 5.1.x < 5.1u3b / 5.5.x < 5.5u3 (Linux) / 5.5.x < 5.5u3b (Windows) / 6.0.x < 6.0.0b JMX Deserialization RCE (VMSA-2016-0005)
								87592, #MEDIUM, VMware vCenter Multiple Vulnerabilities (VMSA-2015-0008)
								92870, #MEDIUM, VMware vCenter Server 6.0.x < 6.0u2 Unspecified HTTP Header Injection (VMSA-2016-0010)
91713, #MEDIUM, VMware vCenter Server 5.0.x < 5.0u3g / 5.1.x < 5.1u3d / 5.5.x < 5.5u2d Reflected XSS (VMSA-2016-0009)
76947, #MEDIUM, VMware vCenter Converter Multiple Vulnerabilities (VMSA-2014-0006)
99475, #HIGH, VMware vCenter Server 6.0.x < 6.0u3b / 6.5.x < 6.5c BlazeDS AMF3 RCE (VMSA-2017-0007)
104654, #MEDIUM, VMware vCenter Server 5.5.x < 5.5u3f / 6.0.x < 6.0u3c / 6.5.x < 6.5u1 Multiple Vulnerabilities (VMSA-2017-0017)
86124, #MEDIUM, VMware vCenter 5.5 LDAP Certificate Validation MitM Spoofing (VMSA-2015-0006)
95468, #MEDIUM, VMware vCenter Server 5.5.x < 5.5u3e / 6.0.x < 6.0u2a Multiple XXE Vulnerabilities (VMSA-2016-0022)
105784, #LOW, VMware vCenter Server 5.5.x < 5.5U3g / 6.0.x < 6.0U3d / 6.5.x < 6.5U1e Hypervisor-Assisted Guest Remediation (VMSA-2018-0004) (Spectre)
111760, #MEDIUM, VMware vCenter Server 5.5.x / 6.0.x / 6.5.x / 6.7.x Speculative Execution Side Channel Vulnerability (Foreshadow) (VMSA-2018-0020)
79864, #CRITICAL, VMware vCenter Update Manager Multiple Java Vulnerabilities (VMSA-2014-0012)
129503, #MEDIUM, VMware vCenter Server 6.0 / 6.5 / 6.7 Multiple Vulnerabilities (VMSA-2019-0013)
149902, #CRITICAL, VMware vCenter Server 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2021-0010)
150163, #CRITICAL, VMware vCenter Server Virtual SAN Health Check plug-in RCE (CVE-2021-21985) (direct check)
146825, #CRITICAL, VMware vCenter Server RCE (direct check)
146826, #CRITICAL, VMware vCenter Server 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2021-0002)
153544, #HIGH, VMware vCenter Server < 6.7 Multiple Vulnerabilities (VMSA-2021-0020)
153889, #HIGH, VMware vCenter Server Arbitrary File Upload (VMSA-2021-0020)
135411, #MEDIUM, VMware vCenter Server 6.7 Sensitive Information Disclosure Vulnerability (VMSA-2020-0006)
140040, #MEDIUM, VMware vCenter Server 6.5 / 6.7 / 7.0 DoS (VMSA-2020-0018)
150982, #MEDIUM, VMware vCenter Server 6.5 / 6.7 Session Hijack (VMSA-2020-0023)
155790, #HIGH, VMware vCenter Server 6.5 / 6.7 Multiple Vulnerabilities (VMSA-2021-0027)
166101, #HIGH, VMware vCenter Server 6.5 < 6.5 U3u RCE (VMSA-2022-0025)
163100, #HIGH, VMware vCenter Server 6.5 / 6.7 / 7.0 SSRF (VMSA-2022-0018)
168746, #MEDIUM, VMware vCenter Server 6.5 < 6.5 U3u / 6.7 < 6.7.0 U3s / 7.0 < 7.0 U3i  Multiple Vulnerabilities (VMSA-2022-0030)
183957, #CRITICAL, VMware vCenter Server 6.5 < 6.5U3v / 6.7 < 6.7U3t / 7.0 < 7.0U3o / 8.0 < 8.0U1d Out-of-bounds Write (VMSA-2023-0023)
183958, #MEDIUM, VMware vCenter Server 7.0 < 7.0U3o / 8.0 < 8.0U2 Partial Information Disclosure (VMSA-2023-0023)
207464, #CRITICAL, VMware vCenter Server 7.x < 7.0 U3t / 8.x < 8.0.3 U3d Multiple Vulnerabilities (VMSA-2024-0019)
237247, #HIGH, VMware vCenter Server 7.0.x < 7.0 U3v / 8.0.x < 8.0 U3e Authenticated Command Execution (CVE-2025-41225) (VMSA-2025-0010)
237248, #HIGH, VMware vCenter Server 8.0 < 8.0 U3e Server Reflected XSS (CVE-2025-41228) (VMSA-2025-0010)
266405, #HIGH, VMware vCenter Server 7.0.x < 7.0 U3w / 8.0.x < 8.0 U3g SMTP Header Injection (VMSA-2025-0016)
245963, #MEDIUM, VMware vCenter Server 7.0.x < 7.0 U3v / 8.0.x < 8.0 U3g DoS (VMSA-2025-0014)
							]
						}
					end
				end
			end
		end
	end
end
