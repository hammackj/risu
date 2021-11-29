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
								79865,
								66274,
								66806,
								70612,
								77728,
								65209,
								65223,
								76457,
								83186,
								81146,
								79147,
								86255,
								66812,
								87763,
								90710,
								91322,
								87592,
								92870,
91713, #VMware vCenter Server 5.0.x < 5.0u3g / 5.1.x < 5.1u3d / 5.5.x < 5.5u2d Reflected XSS (VMSA-2016- 0009)
76947, #VMware vCenter Converter Multiple Vulnerabilities (VMSA-2014-0006)
99475, #VMware vCenter Server 6.0.x < 6.0u3b / 6.5.x < 6.5c BlazeDS AMF3 RCE (VMSA-2017-0007)
104654, #VMware vCenter Server 5.5.x < 5.5u3f / 6.0.x < 6.0u3c / 6.5.x < 6.5u1 Multiple Vulnerabilities (VMSA- 2017-0017)
86124, #VMware vCenter 5.5 LDAP Certificate Validation MitM Spoofing (VMSA-2015-0006)
95468, #VMware vCenter Server 5.5.x < 5.5u3e / 6.0.x < 6.0u2a Multiple XXE Vulnerabilities (VMSA-2016-0022)
105784, #VMware vCenter Server 5.5.x < 5.5U3g / 6.0.x < 6.0U3d / 6.5.x < 6.5U1e Hypervisor-Assisted Guest Remediation (VMSA-2018-0004) (Spectre)
111760, #VMware vCenter Server 5.5.x / 6.0.x / 6.5.x / 6.7.x Speculative Execution Side Channel Vulnerability (Foreshadow) (VMSA-2018-0020)
79864, #VMware vCenter Update Manager Multiple Java Vulnerabilities (VMSA-2014-0012)
129503, #VMware vCenter Server 6.0 / 6.5 / 6.7 Multiple Vulnerabilities (VMSA-2019-0013)
149902, #VMware vCenter Server 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2021-0010)
150163, #VMware vCenter Server Virtual SAN Health Check plug-in RCE (CVE-2021-21985) (direct check)
146825, #VMware vCenter Server RCE (direct check)
146826, #VMware vCenter Server 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2021-0002)
153544, #VMware vCenter Server < 6.7 Multiple Vulnerabilities (VMSA-2021-0020)
153889, #VMware vCenter Server Arbitrary File Upload (VMSA-2021-0020)
135411, #VMware vCenter Server 6.7 Sensitive Information Disclosure Vulnerability (VMSA-2020-0006) 
140040, #VMware vCenter Server 6.5 / 6.7 / 7.0 DoS (VMSA-2020-0018)
150982, #VMware vCenter Server 6.5 / 6.7 Session Hijack (VMSA-2020-0023)

							]
						}
					end
				end
			end
		end
	end
end
