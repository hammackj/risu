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
								73099, #HIGH, Firefox < 28.0 Multiple Vulnerabilities
								73769, #CRITICAL, Firefox < 29.0 Multiple Vulnerabilities
								74440, #CRITICAL, Firefox < 30.0 Multiple Vulnerabilities
								76763, #CRITICAL, Firefox < 31.0 Multiple Vulnerabilities
								77500, #CRITICAL, Firefox < 32.0 Multiple Vulnerabilities
								77906, #HIGH, Firefox < 32.0.3 NSS Signature Verification Vulnerability
								78473, #HIGH, Firefox < 33.0 Multiple Vulnerabilities
								79665, #HIGH, Firefox < 34.0 Multiple Vulnerabilities
								80523, #HIGH, Firefox < 35 Multiple Vulnerabilities
								81521, #HIGH, Firefox < 36 Multiple Vulnerabilities
								82040, #MEDIUM, Mozilla Firefox < 36.0.3
								82041, #HIGH, Firefox < 36.0.4 SVG Bypass Privilege Escalation
								82503, #HIGH, Firefox < 37.0 Multiple Vulnerabilities
								82998, #MEDIUM, Firefox < 37.0.2 Failed Plugin Memory Corruption
								83439, #CRITICAL, Firefox < 38.0 Multiple Vulnerabilities
								84581, #CRITICAL, Firefox < 39.0 Multiple Vulnerabilities (Logjam)
								82583, #MEDIUM, Firefox < 37.0.1 HTTP/2 Alt-Svc Header Certificate Verification Bypass
								85386, #CRITICAL, Firefox < 40 Multiple Vulnerabilities
								62998, #CRITICAL, Firefox < 17.0 Multiple Vulnerabilities
								63551, #CRITICAL, Firefox < 18.0 Multiple Vulnerabilities
								64723, #CRITICAL, Firefox < 19.0 Multiple Vulnerabilities
								65131, #HIGH, Firefox < 19.0.2 nsHTMLEditor Use-After-Free
								65806, #CRITICAL, Firefox < 20 Multiple Vulnerabilities
								66480, #CRITICAL, Firefox < 21.0 Multiple Vulnerabilities
								66993, #CRITICAL, Firefox < 22.0 Multiple Vulnerabilities
								69269, #CRITICAL, Firefox < 23.0 Multiple Vulnerabilities
								69993, #CRITICAL, Firefox < 24.0 Multiple Vulnerabilities
								70716, #CRITICAL, Firefox < 25.0 Multiple Vulnerabilities
								70949, #HIGH, Firefox < 25.0.1 NSS and NSPR Multiple Vulnerabilities
								71347, #CRITICAL, Firefox < 26.0 Multiple Vulnerabilities
								72331, #CRITICAL, Firefox < 27.0 Multiple Vulnerabilities
								85275, #MEDIUM, Firefox < 39.0.3 PDF Reader Arbitrary File Access
								85689, #CRITICAL, Firefox < 40.0.3 Multiple Vulnerabilities
								86071, #HIGH, Firefox < 41 Multiple Vulnerabilities
								86764, #HIGH, Firefox < 42 Multiple Vulnerabilities
								87476, #CRITICAL, Firefox < 43 Multiple Vulnerabilities
								86418, #MEDIUM, Firefox < 41.0.2 'fetch' API Cross-Origin Bypass
								88461, #CRITICAL, Firefox < 44 Multiple Vulnerabilities
								89875, #CRITICAL, Firefox < 45 Multiple Vulnerabilities
								90793, #CRITICAL, Firefox < 46 Multiple Vulnerabilities
								91547, #HIGH, Firefox < 47 Multiple Vulnerabilities
								88754, #MEDIUM, Firefox < 44.0.2 Service Workers Security Bypass
								92755, #HIGH, Firefox < 48 Multiple Vulnerabilities
								93662, #HIGH, Mozilla Firefox < 49.0 Multiple Vulnerabilities
								94960, #HIGH, Mozilla Firefox < 50.0 Multiple Vulnerabilities
								95475, #MEDIUM, Mozilla Firefox < 50.0.2 nsSMILTimeContainer.cpp SVG Animation RCE
								95886, #HIGH, Mozilla Firefox < 50.1 Multiple Vulnerabilities
								96776, #HIGH, Mozilla Firefox < 51.0 Multiple Vulnerabilities
								97639, #CRITICAL, Mozilla Firefox < 52.0 Multiple Vulnerabilities
								99125, #HIGH, Mozilla Firefox < 52.0.1
								99632, #HIGH, Mozilla Firefox < 53.0
								100127, #MEDIUM, Mozilla Firefox < 53.0.2
								55901, #HIGH, Firefox 3.6 < 3.6.20 Multiple Vulnerabilities
								56334, #HIGH, Firefox 3.6.x < 3.6.23 Multiple Vulnerabilities
								56750, #HIGH, Firefox 3.6.x < 3.6.24 Multiple Vulnerabilities
								57768, #HIGH, Firefox < 10.0 Multiple Vulnerabilities
								57769, #HIGH, Firefox 3.6.x < 3.6.26 Multiple Vulnerabilities
								58006, #HIGH, Firefox 3.6.x < 3.6.27 'png_decompress_chunk' Integer Overflow
								58349, #HIGH, Firefox 3.6.x < 3.6.28 Multiple Vulnerabilities
								58898, #HIGH, Firefox < 12.0 Multiple Vulnerabilities
								59407, #HIGH, Firefox < 13.0 Multiple Vulnerabilities
								60043, #CRITICAL, Firefox < 14.0 Multiple Vulnerabilities
								61715, #CRITICAL, Firefox < 15.0 Multiple Vulnerabilities
								62580, #CRITICAL, Firefox < 16.0 Multiple Vulnerabilities
								62589, #CRITICAL, Firefox < 16.0.1 Multiple Vulnerabilities
								94232, #HIGH, Mozilla Firefox 48.x / 49.x < 49.0.2 Multiple Vulnerabilities
								102359, #CRITICAL, Mozilla Firefox < 55.0
								100810, #HIGH, Mozilla Firefox < 54.0
								103680, #CRITICAL, Mozilla Firefox < 56.0
								99631, #HIGH, Mozilla Firefox ESR < 52.1
								100126, #MEDIUM, Mozilla Firefox ESR < 52.1.1
								100809, #HIGH, Mozilla Firefox ESR < 52.2 Multiple Vulnerabilities
								102358, #CRITICAL, Mozilla Firefox ESR < 52.3
								104637, #CRITICAL, Mozilla Firefox ESR < 52.5
								105212, #HIGH, Mozilla Firefox ESR < 52.5.2
								106302, #HIGH, Mozilla Firefox ESR < 52.6
								103679, #CRITICAL, Mozilla Firefox ESR < 52.4
								108376, #HIGH, Mozilla Firefox ESR < 52.7
								108586, #HIGH, Mozilla Firefox ESR < 52.7.2
								108755, #HIGH, Mozilla Firefox ESR < 52.7.3
								104638, #CRITICAL, Mozilla Firefox < 57.0
105213, #HIGH, Mozilla Firefox < 57.0.2
106303, #CRITICAL, Mozilla Firefox < 58.0
106561, #MEDIUM, Mozilla Firefox < 58.0.1
108377, #HIGH, Mozilla Firefox < 59.0
108587, #HIGH, Mozilla Firefox < 59.0.1
108756, #HIGH, Mozilla Firefox < 59.0.2
109869, #CRITICAL, Mozilla Firefox < 60 Multiple Critical Vulnerabilities
105040, #MEDIUM, Mozilla Firefox < 57.0.1
105616, #MEDIUM, Mozilla Firefox < 57.0.4 Speculative Execution Side-Channel Attack Vulnerability (Spectre)
110811, #HIGH, Mozilla Firefox < 61 Multiple Critical Vulnerabilities
117294, #HIGH, Mozilla Firefox < 62 Multiple Critical Vulnerabilities
118397, #HIGH, Mozilla Firefox < 63.0
117921, #MEDIUM, Mozilla Firefox < 62.0.3
117941, #HIGH, Mozilla Firefox < 49 Multiple Vulnerabilities
122948, #HIGH, Mozilla Firefox < 66.0
123012, #MEDIUM, Mozilla Firefox < 66.0.1
121512, #CRITICAL, Mozilla Firefox < 65.0
125361, #HIGH, Mozilla Firefox < 67.0
126002, #HIGH, Mozilla Firefox < 67.0.3
126072, #CRITICAL, Mozilla Firefox < 67.0.4
121477, #HIGH, Mozilla Firefox ESR < 60.5
109868, #HIGH, Mozilla Firefox ESR < 52.8
110809, #HIGH, Mozilla Firefox ESR < 52.9
125877, #MEDIUM, Mozilla Firefox < 67.0.2
117668, #MEDIUM, Mozilla Firefox < 62.0.2
119604, #HIGH, Mozilla Firefox < 64.0
122233, #MEDIUM, Mozilla Firefox < 65.0.1
126622, #HIGH, Mozilla Firefox < 68.0
128061, #MEDIUM, Mozilla Firefox < 68.0.2
128525, #HIGH, Mozilla Firefox < 69.0
132715, #MEDIUM, Mozilla Firefox < 72.0.1
133693, #MEDIUM, Mozilla Firefox < 73.0
136404, #CRITICAL, Mozilla Firefox < 76.0
135276, #HIGH, Mozilla Firefox < 75.0
137049, #HIGH, Mozilla Firefox < 77.0
138085, #HIGH, Mozilla Firefox < 78.0
138445, #MEDIUM, Mozilla Firefox < 78.0.2
119606, #HIGH, Mozilla Firefox ESR < 60.4
134405, #HIGH, Mozilla Firefox < 74.0
134407, #HIGH, Mozilla Firefox ESR < 68.6
139040, #HIGH, Mozilla Firefox < 79.0
139789, #HIGH, Mozilla Firefox < 80.0
142613, #HIGH, Mozilla Firefox < 82.0.3
142910, #HIGH, Mozilla Firefox < 83.0
141571, #HIGH, Mozilla Firefox < 82.0
131773, #MEDIUM, Mozilla Firefox < 71.0
132709, #MEDIUM, Mozilla Firefox < 72.0
135202, #MEDIUM, Mozilla Firefox < 74.0.1
129101, #MEDIUM, Mozilla Firefox < 69.0.1
130170, #MEDIUM, Mozilla Firefox < 70.0
140732, #MEDIUM, Mozilla Firefox < 81.0
144282, #HIGH, Mozilla Firefox < 84.0
146425, #MEDIUM, Mozilla Firefox < 85.0.1
150119, #MEDIUM, Mozilla Firefox < 89.0
148767, #MEDIUM, Mozilla Firefox < 88.0
151571, #HIGH, Mozilla Firefox < 90.0
152412, #MEDIUM, Mozilla Firefox < 91.0
152635, #MEDIUM, Mozilla Firefox < 91.0.1
150802, #MEDIUM, Mozilla Firefox < 89.0.1
153089, #MEDIUM, Mozilla Firefox < 92.0
153881, #MEDIUM, Mozilla Firefox < 93.0
154819, #HIGH, Mozilla Firefox < 94.0
148014, #MEDIUM, Mozilla Firefox < 87.0
149281, #MEDIUM, Mozilla Firefox < 88.0.1
158654, #CRITICAL, Mozilla Firefox < 97.0.2
158694, #CRITICAL, Mozilla Firefox < 98.0
157443, #CRITICAL, Mozilla Firefox < 97.0
160465, #CRITICAL, Mozilla Firefox < 100.0
161415, #CRITICAL, Mozilla Firefox < 100.0.2
161716, #CRITICAL, Mozilla Firefox < 101.0
162602, #CRITICAL, Mozilla Firefox < 102.0
155917, #MEDIUM, Mozilla Firefox < 95.0
156606, #CRITICAL, Mozilla Firefox < 96.0
159530, #MEDIUM, Mozilla Firefox < 99.0
163497, #CRITICAL, Mozilla Firefox < 103.0
164344, #CRITICAL, Mozilla Firefox < 104.0
165262, #CRITICAL, Mozilla Firefox < 105.0
166209, #CRITICAL, Mozilla Firefox < 106.0
167633, #CRITICAL, Mozilla Firefox < 107.0
168651, #CRITICAL, Mozilla Firefox < 108.0
170099, #CRITICAL, Mozilla Firefox < 109.0
177932, #CRITICAL, Mozilla Firefox < 115.0
174076, #CRITICAL, Mozilla Firefox < 112.0
175330, #CRITICAL, Mozilla Firefox < 113.0
176741, #CRITICAL, Mozilla Firefox < 114.0
171454, #CRITICAL, Mozilla Firefox < 110.0
172515, #CRITICAL, Mozilla Firefox < 111.0
178147, #CRITICAL, Mozilla Firefox < 115.0.2
180232, #CRITICAL, Mozilla Firefox < 117.0
181349, #CRITICAL, Mozilla Firefox < 117.0.1
181875, #CRITICAL, Mozilla Firefox < 118.0
182134, #CRITICAL, Mozilla Firefox < 118.0.1
179143, #CRITICAL, Mozilla Firefox < 116.0
186186, #CRITICAL, Mozilla Firefox ESR < 115.5.0
183784, #CRITICAL, Mozilla Firefox ESR < 115.4
189364, #CRITICAL, Mozilla Firefox < 122.0
190779, #HIGH, Mozilla Firefox < 123.0
192470, #HIGH, Mozilla Firefox < 124.0.1
193366, #HIGH, Mozilla Firefox < 125.0
196992, #HIGH, Mozilla Firefox < 126.0
200315, #HIGH, Mozilla Firefox < 127.0
183785, #CRITICAL, Mozilla Firefox < 119.0
186030, #CRITICAL, Mozilla Firefox < 120.0
186032, #CRITICAL, Mozilla Firefox < 115.5
187079, #CRITICAL, Mozilla Firefox < 121.0
205009, #CRITICAL, Mozilla Firefox < 129.0
202017, #HIGH, Mozilla Firefox < 128.0
192243, #MEDIUM, Mozilla Firefox < 124.0

							]
						}
					end
				end
			end
		end
	end
end
