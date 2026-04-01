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
				class ESXi < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware ESXi Patch Rollup",
							:plugin_id => -99981,
							:plugin_name => "Missing the latest VMware ESXi Patches",
							:item_name => "Update to the latest VMware ESXi",
							:plugin_ids => [
70879, #MEDIUM, ESXi 5.0 < Build 1311175 Multiple Vulnerabilities (remote check)
70880, #HIGH, ESXi 5.0 < Build 515841 Multiple Vulnerabilities (remote check)
70882, #HIGH, ESXi 5.0 < Build 702118 Multiple Vulnerabilities (remote check)
70883, #HIGH, ESXi 5.0 < Build 721882 Multiple Vulnerabilities (remote check)
70884, #HIGH, ESXi 5.0 < Build 764879 Multiple Vulnerabilities (remote check)
70885, #HIGH, ESXi 5.0 < Build 912577 Multiple Vulnerabilities (remote check)
70888, #HIGH, ESXi 5.1 < Build 911593 Multiple Vulnerabilities (remote check)
59447, #HIGH, VMSA-2012-0009 : ESXi and ESX patches address critical security issues (uncredentialed check)
70877, #HIGH, ESXi 5.0 < Build 1022489 Multiple Vulnerabilities (remote check)
70878, #MEDIUM, ESXi 5.0 < Build 1197855 NFC Traffic Denial of Service (remote check)
70881, #HIGH, ESXi 5.0 < Build 608089 Multiple Vulnerabilities (remote check)
70886, #MEDIUM, ESXi 5.1 < Build 1063671 Multiple Vulnerabilities (remote check)
70887, #MEDIUM, ESXi 5.1 < Build 1142907 NFC Traffic Denial of Service (remote check)
71773, #MEDIUM, ESXi 5.1 < Build 1312873 File Descriptors Privilege Escalation (remote check)
72037, #LOW, ESXi 5.1 < Build 1483097 Multiple Vulnerabilities (remote check)
76203, #MEDIUM, ESXi 5.1 < Build 1900470 OpenSSL Library Multiple Vulnerabilities (remote check)
76368, #MEDIUM, ESXi 5.0 < Build 1918656 OpenSSL Library Multiple Vulnerabilities (remote check)
73917, #MEDIUM, ESXi 5.5 < Build 1746974 / 5.5 Update 1 < Build 1746018 OpenSSL Library Multiple Vulnerabilities (remote check) (Heartbleed)
81085, #MEDIUM, ESXi 5.5 < Build 2352327 Multiple Vulnerabilities (remote check) (POODLE)
71774, #MEDIUM, ESXi 5.5 < Build 1474526 File Descriptors Privilege Escalation (remote check)
74470, #MEDIUM, ESXi 5.5 < Build 1881737 OpenSSL Library Multiple Vulnerabilities (remote check)
78108, #MEDIUM, ESXi 5.5 < Build 1980513 glibc Library Multiple Vulnerabilities (remote check)
79862, #MEDIUM, ESXi 5.1 < Build 2323236 Third-Party Libraries Multiple Vulnerabilities (remote check) (BEAST)
80037, #MEDIUM, ESXi 5.1 < Build 2323231 glibc Library Multiple Vulnerabilities (remote check)
81084, #MEDIUM, ESXi 5.1 < Build 1743201 Multiple Vulnerabilities (remote check)
83781, #MEDIUM, ESXi 5.5 < Build 1623387 Multiple Vulnerabilities (remote check)
86947, #CRITICAL, VMware ESXi 5.5 < Build 3029944 OpenSLP RCE (VMSA-2015-0007)
86946, #CRITICAL, VMware ESXi 5.1 < Build 3021178 OpenSLP RCE (VMSA-2015-0007)
86945, #CRITICAL, VMware ESXi 5.0 < Build 3021432 OpenSLP RCE (VMSA-2015-0007)
87676, #MEDIUM, VMware ESXi Multiple OpenSSL Vulnerabilities (VMSA-2014-0004) (Heartbleed)
81083, #MEDIUM, ESXi 5.0 < Build 1749766 Multiple Vulnerabilities (remote check)
87940, #MEDIUM, ESXi 5.0 < Build 3086167 Shared Folders (HGFS) Guest Privilege Escalation (VMSA-2016-0001) (remote check)
89035, #HIGH, VMware ESX / ESXi Multiple Vulnerabilities (VMSA-2012-0009) (remote check)
89036, #HIGH, VMware ESX / ESXi Multiple Vulnerabilities (VMSA-2012-0011) (remote check)
89037, #HIGH, VMware ESX / ESXi libxml2 Multiple Vulnerabilities (VMSA-2012-0012) (remote check)
89038, #HIGH, VMware ESX / ESXi Third-Party Libraries Multiple Vulnerabilities (VMSA-2012-0013) (remote check)
87673, #MEDIUM, VMware ESX / ESXi Multiple DoS (VMSA-2014-0001)
87674, #MEDIUM, VMware ESX / ESXi Multiple Vulnerabilities (VMSA-2014-0002)
87677, #MEDIUM, VMware ESXi Tools Guest OS Privilege Escalation (VMSA-2014-0005)
87678, #MEDIUM, VMware ESXi Multiple OpenSSL Vulnerabilities (VMSA-2014-0006)
88906, #MEDIUM, ESXi 5.5 < Build 3568722 / 6.0 < Build 3568940 glibc DNS Resolver RCE (VMSA-2016-0002) (remote check)
92949, #MEDIUM, ESXi 5.0 / 5.1 / 5.5 / 6.0 Multiple Vulnerabilities (VMSA-2016-0010) (remote check)
87943, #MEDIUM, ESXi 6.0 < Build 3380124 Shared Folders (HGFS) Guest Privilege Escalation (VMSA-2016-0001) (remote check)
89106, #CRITICAL, VMware ESX / ESXi Multiple Vulnerabilities (VMSA-2012-0005) (BEAST) (remote check)
89105, #HIGH, VMware ESX / ESXi Service Console and Third-Party Libraries Multiple Vulnerabilities (VMSA-2012-0001) (remote check)
89108, #HIGH, VMware ESX / ESXi Tools Folder Incorrect ACL Privilege Escalation  (VMSA-2012-0007) (remote check)
89678, #HIGH, VMware ESX / ESXi Multiple Vulnerabilities (VMSA-2011-0009) (remote check)
89680, #HIGH, VMware ESX / ESXi Third-Party Libraries Multiple Vulnerabilities (VMSA-2011-0012) (remote check)
99129, #HIGH, ESXi 5.5 < Build 5230635 Multiple Vulnerabilities (VMSA-2017-0006) (remote check)
99130, #HIGH, ESXi 6.0 U1 < Build 5251621 / 6.0 U2 < Build 5251623 / 6.0 U3 < Build 5224934 Multiple Vulnerabilities (VMSA-2017-0006) (remote check)
87679, #MEDIUM, VMware ESXi Multiple DoS (VMSA-2014-0008)
87942, #MEDIUM, ESXi 5.5 < Build 3248547 Shared Folders (HGFS) Guest Privilege Escalation (VMSA-2016-0001) (remote check)
103375, #LOW, ESXi 5.5 < Build 6480267 RPC NULL Pointer Dereference Vulnerability (VMSA-2017-0015) (remote check)
105486, #MEDIUM, ESXi 5.5 / 6.0 / 6.5 / Multiple Vulnerabilities (VMSA-2017-0021) (VMSA-2018-0002) (Spectre) (remote check)
87941, #MEDIUM, ESXi 5.1 < Build 3070626 Shared Folders (HGFS) Guest Privilege Escalation (VMSA-2016-0001) (remote check)
87681, #MEDIUM, VMware ESXi Multiple Vulnerabilities (VMSA-2014-0012)
105614, #MEDIUM, ESXi 6.5 < Build 6765664 Heap Buffer Overflow (VMSA-2017-0021) (remote check)
111759, #MEDIUM, ESXi 5.5 / 6.0 / 6.5 / 6.7 Speculative Execution Side Channel Vulnerability (Foreshadow) (VMSA-2018-0020) (remote check)
118466, #HIGH, ESXi 6.0 / 6.5 / 6.7 Out-of-Bounds Read Vulnerability (VMSA-2018-0026) (Remote Check)
102698, #MEDIUM, ESXi 6.0 < Build 5485776 Multiple Vulnerabilities (VMSA-2017-0015) (remote check)
118885, #HIGH, ESXi 6.0 / 6.5 / 6.7 Multiple Vulnerabilities (VMSA-2018-0027) (Remote Check)
123518, #HIGH, ESXi 6.0 / 6.5 / 6.7 Multiple Vulnerabilities (VMSA-2019-0005) (Remote Check)
134878, #MEDIUM, VMware ESXi 5.5 / 6.0 / 6.5 / 6.7 DoS (VMSA-2018-0018) (remote check)
143221, #HIGH, ESXi 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2020-0026)
138475, #MEDIUM, ESXi 6.5 / 6.7 XSS (VMSA-2020-0008)
140039, #MEDIUM, ESXi 6.5 / 6.7 / 7.0 DoS (VMSA-2020-0018)
158494, #MEDIUM, ESXi 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2022-0004)
99131, #HIGH, ESXi 6.5 < Build 5224529 Multiple Vulnerabilities (VMSA-2017-0006) (remote check)
103376, #HIGH, ESXi 6.5 < Build 5969300 Multiple Vulnerabilities (VMSA-2017-0015) (remote check)
168828, #MEDIUM, ESXi 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2022-0030)
176249, #HIGH, ESXi < 7.0 Reflected Denial of Service
146827, #MEDIUM, ESXi 6.5 / 6.7 / 7.0 RCE (VMSA-2021-0002)
151665, #MEDIUM, ESXi 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2021-0014)
192466, #MEDIUM, VMware ESXi 6.5 / 6.7 / 7.0 Multiple Vulnerabilities (VMSA-2022-0020)
191711, #CRITICAL, VMware ESXi 7.0 / 8.0 Multiple Vulnerabilities (VMSA-2024-0006)
237304, #CRITICAL, VMware ESXi 7.0 / 8.0 Multiple Vulnerabilities (VMSA-2025-0004)
242168, #CRITICAL, VMware ESXi 7.x < 7.0 Update 3w / 8.x < 8.0 Update 2e / 8.0 Update 3 < 8.0 Update 3f (VMSA-2025-0013)
237246, #MEDIUM, VMware ESXi 7.0 / 8.0 Multiple Vulenerabilities (VMSA-2025-0010)
201125, #MEDIUM, VMware ESXi 7.0 / 8.0 Out-of-Bounds read (CVE-2024-37086)
							]
						}
					end
				end
			end
		end
	end
end
