# Copyright (c) 2010-2025 Jacob Hammack.
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
				class MicrosoftEdge < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Edge Patch Rollup",
							:plugin_id => -99924,
							:plugin_name => "Missing the latest Microsoft Edge",
							:item_name => "Update to the latest Microsoft Edge",
							:plugin_ids => [
162168, #Microsoft Edge (Chromium) < 102.0.1245.41 Multiple Vulnerabilities
157881, #Microsoft Edge (Chromium) < 98.0.1108.50 Vulnerability
159239, #Microsoft Edge (Chromium) < 99.0.1150.55 Vulnerability
159592, #Microsoft Edge (Chromium) < 100.0.1185.36 Vulnerability
162624, #Microsoft Edge (Chromium) < 103.0.1264.44 Vulnerability
161989, #Microsoft Edge (Chromium) < 102.0.1245.39 Vulnerability
162503, #Microsoft Edge (Chromium) < 103.0.1264.37 Multiple Vulnerabilities
162776, #Microsoft Edge (Chromium) < 103.0.1264.49 Vulnerability
157369, #Microsoft Edge (Chromium) < 98.0.1108.43 Multiple Vulnerabilities
158097, #Microsoft Edge (Chromium) < 98.0.1108.55 Multiple Vulnerabilities
207516, #HIGH, Microsoft Edge (Chromium) < 128.0.2739.90 / 129.0.2792.52 Multiple Vulnerabilities
207866, #HIGH, Microsoft Edge (Chromium) < 128.0.2739.97 / 129.0.2792.65 Multiple Vulnerabilities
202635, #HIGH, Microsoft Edge (Chromium) < 126.0.2592.113 Multiple Vulnerabilities
204747, #HIGH, Microsoft Edge (Chromium) < 127.0.2651.74 Multiple Vulnerabilities
204961, #HIGH, Microsoft Edge (Chromium) < 127.0.2651.86 Multiple Vulnerabilities
205697, #HIGH, Microsoft Edge (Chromium) < 127.0.2651.105 (CVE-2024-43472)
206172, #HIGH, Microsoft Edge (Chromium) < 128.0.2739.42 Multiple Vulnerabilities
208101, #CRITICAL, Microsoft Edge (Chromium) < 129.0.2792.79 Multiple Vulnerabilities
208710, #HIGH, Microsoft Edge (Chromium) < 129.0.2792.89 Multiple Vulnerabilities
171268, #Microsoft Edge (Chromium) < 110.0.1587.41 Multiple Vulnerabilities
205222, #CRITICAL, Microsoft Edge (Chromium) < 127.0.2651.98 Multiple Vulnerabilities
158583, #Microsoft Edge (Chromium) < 99.0.1150.30 Multiple Vulnerabilities 
159037, #Microsoft Edge (Chromium) < 99.0.1150.46 Multiple Vulnerabilities 
159465, #Microsoft Edge (Chromium) < 100.0.1185.29 Multiple Vulnerabilities 
159816, #Microsoft Edge (Chromium) < 100.0.1185.44 Multiple Vulnerabilities 
161198, #Microsoft Edge (Chromium) < 101.0.1210.47 Multiple Vulnerabilities 
161717, #Microsoft Edge (Chromium) < 102.0.1245.30 Multiple Vulnerabilities
160319, #Microsoft Edge (Chromium) < 101.0.1210.32 Multiple Vulnerabilities
186447, #MEDIUM, Microsoft Edge (Chromium) < 118.0.2088.122 / 119.0.2151.97 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end


