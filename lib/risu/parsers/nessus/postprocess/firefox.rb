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
				class FirefoxRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Firefox Patch Rollup",
							:plugin_id => -99972,
							:plugin_name => "Missing the latest Firefox Patches",
							:item_name => "Update to the latest Firefox",
							:plugin_ids => [
								73099, #Firefox < 28.0 Multiple Vulnerabilities
								73769, #Firefox < 29.0 Multiple Vulnerabilities
								74440, #Firefox < 30.0 Multiple Vulnerabilities
								76763, #Firefox < 31.0 Multiple Vulnerabilities
								77500, #Firefox < 32.0 Multiple Vulnerabilities
								77906, #Firefox < 32.0.3 NSS Signature Verification Vulnerability
								78473, #Firefox < 33.0 Multiple Vulnerabilities
								79665, #Firefox < 34.0 Multiple Vulnerabilities
								80523, #Firefox < 35 Multiple Vulnerabilities
								81521, #Firefox < 36 Multiple Vulnerabilities
								82040, #Firefox < 36.0.3 JIT Code Execution
								82041, #Firefox < 36.0.4 SVG Bypass Privilege Escalation
								82503, #Firefox < 37.0 Multiple Vulnerabilities
								82998, #Firefox < 37.0.2 Failed Plugin Memory Corruption
								83439, #Firefox < 38.0 Multiple Vulnerabilities
								84581, #Firefox < 39.0 Multiple Vulnerabilities (Logjam)
								82583, #Firefox < 37.0.1 HTTP/2 Alt-Svc Header Certificate Verification Bypass
								85386, #Firefox < 40 Multiple Vulnerabilities
								62998, #Firefox < 17.0 Multiple Vulnerabilities
								63551, #Firefox < 18.0 Multiple Vulnerabilities
								64723, #Firefox < 19.0 Multiple Vulnerabilities
								65131, #Firefox < 19.0.2 nsHTMLEditor Use-After-Free
								65806, #Firefox < 20 Multiple Vulnerabilities
								66480, #Firefox < 21.0 Multiple Vulnerabilities
								66993, #Firefox < 22.0 Multiple Vulnerabilities
								69269, #Firefox < 23.0 Multiple Vulnerabilities
								69993, #Firefox < 24.0 Multiple Vulnerabilities
								70716, #Firefox < 25.0 Multiple Vulnerabilities
								70949, #Firefox < 25.0.1 NSS and NSPR Multiple Vulnerabilities
								71347, #Firefox < 26.0 Multiple Vulnerabilities
								72331, #Firefox < 27.0 Multiple Vulnerabilities
								85275, #Firefox < 39.0.3 PDF Reader Arbitrary File Access
								85689, #Firefox < 40.0.3 Multiple Vulnerabilities
								86071, #Firefox < 41 Multiple Vulnerabilities
								86764, #Firefox < 42 Multiple Vulnerabilities
								87476, #Firefox < 43 Multiple Vulnerabilities
								86418, #Firefox < 41.0.2 'fetch' API Cross-Origin Bypass
								88461, #Firefox < 44 Multiple Vulnerabilities
								89875, #Firefox < 45 Multiple Vulnerabilities
								90793, #Firefox < 46 Multiple Vulnerabilities
								91547, #Firefox < 47 Multiple Vulnerabilities
								88754, #Firefox < 44.0.2 Service Workers Security Bypass
								92755, #Firefox < 48 Multiple Vulnerabilities
								93662, #Mozilla Firefox < 49.0 Multiple Vulnerabilities
								94960, #Mozilla Firefox < 50.0 Multiple Vulnerabilities
								95475, #Mozilla Firefox < 50.0.2 nsSMILTimeContainer.cpp SVG Animation RCE
								95886, #Mozilla Firefox < 50.1 Multiple Vulnerabilities
								96776, #Mozilla Firefox < 51.0 Multiple Vulnerabilities
								97639, #Mozilla Firefox < 52.0 Multiple Vulnerabilities
								99125, #Mozilla Firefox < 52.0.1 CreateImageBitmap RCE
								99632, #Mozilla Firefox < 53 Multiple Vulnerabilities
								100127, #Mozilla Firefox < 53.0.2 ANGLE Graphics Library RCE
								55901, #Firefox 3.6 < 3.6.20 Multiple Vulnerabilities
								56334, #Firefox 3.6.x < 3.6.23 Multiple Vulnerabilities
								56750, #Firefox 3.6.x < 3.6.24 Multiple Vulnerabilities
								57768, #Firefox < 10.0 Multiple Vulnerabilities
								57769, #Firefox 3.6.x < 3.6.26 Multiple Vulnerabilities
								58006, #Firefox 3.6.x < 3.6.27 'png_decompress_chunk' Integer Overflow
								58349, #Firefox 3.6.x < 3.6.28 Multiple Vulnerabilities
								58898, #Firefox < 12.0 Multiple Vulnerabilities
								59407, #Firefox < 13.0 Multiple Vulnerabilities
								60043, #Firefox < 14.0 Multiple Vulnerabilities
								61715, #Firefox < 15.0 Multiple Vulnerabilities
								62580, #Firefox < 16.0 Multiple Vulnerabilities
								62589, #Firefox < 16.0.1 Multiple Vulnerabilities
								94232, #Mozilla Firefox 48.x / 49.x < 49.0.2 Multiple Vulnerabilities
								102359, #Mozilla Firefox < 55 Multiple Vulnerabilities
								100810, #Mozilla Firefox < 54 Multiple Vulnerabilities
								103680, #Mozilla Firefox < 56 Multiple Vulnerabilities
								99631, #Mozilla Firefox ESR 52.x < 52.1 Multiple Vulnerabilities
								100126, #Mozilla Firefox ESR 52.x < 52.1.1 ANGLE Graphics Library RCE
								100809, #Mozilla Firefox ESR < 52.2 Multiple Vulnerabilities
								102358, #Mozilla Firefox ESR < 52.3 Multiple Vulnerabilities
								104637, #Mozilla Firefox ESR < 52.5 Multiple Vulnerabilities
								105212, #Mozilla Firefox ESR < 52.5.2 Multiple Vulnerabilities
								106302, #Mozilla Firefox ESR < 52.6 Multiple Vulnerabilities
								103679, #Mozilla Firefox ESR < 52.4 Multiple Vulnerabilities
								108376, #Mozilla Firefox ESR < 52.7 Multiple Vulnerabilities
								108586, #Mozilla Firefox ESR < 52.7.2 Multiple Code Execution Vulnerabilities
								108755, #Mozilla Firefox ESR < 52.7.3 Denial of Service Vulnerability
								104638, #Mozilla Firefox < 57 Multiple Vulnerabilities
105213, #Mozilla Firefox < 57.0.2 ANGLE Graphics Library RCE
106303, #Mozilla Firefox < 58 Multiple Vulnerabilities
106561, #Mozilla Firefox < 58.0.1 Arbitrary Code Execution
108377, #Mozilla Firefox < 59 Multiple Vulnerabilities
108587, #Mozilla Firefox < 59.0.1 Multiple Code Execution Vulnerabilities
108756, #Mozilla Firefox ESR < 59.0.2 Denial of Service Vulnerability
109869, #Mozilla Firefox < 60 Multiple Critical Vulnerabilities
105040, #Mozilla Firefox < 57.0.1 Multiple Vulnerabilities
105616, #Mozilla Firefox < 57.0.4 Speculative Execution Side-Channel Attack Vulnerability (Spectre)
110811, #Mozilla Firefox < 61 Multiple Critical Vulnerabilities
117294, #Mozilla Firefox < 62 Multiple Critical Vulnerabilities
118397, #Mozilla Firefox < 63 Multiple Vulnerabilities
117921, #Mozilla Firefox < 62.0.3 Multiple Vulnerabilities
117941, #Mozilla Firefox < 49 Multiple Vulnerabilities
122948, #Mozilla Firefox < 66.0
123012, #Mozilla Firefox < 66.0.1
121512, #Mozilla Firefox < 65.0
							]
						}
					end
				end
			end
		end
	end
end
