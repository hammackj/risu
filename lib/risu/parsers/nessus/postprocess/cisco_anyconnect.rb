# Copyright (c) 2010-2018 Jacob Hammack.
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
				class CiscoAnyConnectPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Cisco AnyConnect Client Patch Rollup",
							:plugin_id => -99961,
							:plugin_name => "Missing the latest Cisco AnyConnect Client Patches",
							:item_name => "Update to the latest Cisco AnyConnect Client",
							:plugin_ids => [
								76491, #Cisco AnyConnect Secure Mobility Client 2.x / 3.x < 3.1(5170) Multiple OpenSSL Vulnerabilities
								81978, #Cisco AnyConnect Secure Mobility Client < 3.1.10010.0 / 4.0.x < 4.0.4014.0 / 4.1.x < 4.1.4011.0 Code Execution Vulnerability
								86302, #Cisco AnyConnect Secure Mobility Client 3.x < 3.1.11004.0 / 4.x < 4.1.6020.0 Privilege Escalation
								78676, #Cisco AnyConnect Secure Mobility Client < 3.1(5187) (POODLE)
								81671, #Cisco AnyConnect Secure Mobility Client < 3.1(6068) XSS
								82270, #Cisco AnyConnect Secure Mobility Client < 3.1(7021) / <= 4.0(48) Multiple Vulnerabilities (FREAK)
								85266, #Cisco AnyConnect Secure Mobility Client < 3.1.8009.0 / 4.0.x < 4.0.2052.0 / 4.1.x < 4.1.28.0 Multiple Vulnerabilities
								85267, #Cisco AnyConnect Secure Mobility Client < 3.1.10010.0 / 4.0.x < 4.0.4013.0 / 4.1.x < 4.1.4011.0 IPC File Write Vulnerability
								85541, #Cisco AnyConnect Secure Mobility Client 3.x < 3.1.10010.0 / 4.x < 4.1.4011.0 Arbitrary File Write
								87894, #Cisco AnyConnect Secure Mobility Client 2.x < 3.1.13015.0 / 4.x < 4.2.1035.0 Arbitrary File Manipulation
								88100, #Cisco AnyConnect Secure Mobility Client < 3.1.13015.0 / 4.2.x < 4.2.1035.0 Multiple OpenSSL Vulnerabilities
								54954, #Cisco AnyConnect Secure Mobility Client < 2.3.254 Multiple Vulnerabilities
								59820, #Cisco AnyConnect Secure Mobility Client VPN Downloader RCE (cisco-sa-20120620-ac)
								93382, #Cisco AnyConnect Secure Mobility Client 4.2.x < 4.2.5015.0 / 4.3.x < 4.3.2039.0 Privilege Escalation Vulnerability
								71464, #Cisco AnyConnect Secure Mobility Client 2.x / 3.x < 3.0(629) ATL Buffer Overflow
								95951, #Cisco AnyConnect Secure Mobility Client 3.1.x < 4.3.4019.0 / 4.4.x < 4.4.225.0 Privilege Escalation
							]
						}
					end
				end
			end
		end
	end
end
