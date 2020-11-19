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
				class ILoRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "iLO Patch Rollup",
							:plugin_id => -99942,
							:plugin_name => "Missing the latest iLO",
							:item_name => "Update to the latest iLO",
							:plugin_ids => [
122032, #iLO 4 < 2.60 / iLO 5 < 1.30 Multiple Vulnerabilities
125342, #iLO 4 < 2.70 / iLO 5 < 1.40a Multiple Vulnerabilities
122095, #iLO 4 < 2.53 Remote Code Execution Vulnerability
122187, #iLO 3 < 1.88 / iLO 4 < 2.44 XSS Vulnerability
122191, #iLO 3 < 1.85 / iLO 4 < 2.22 Denial of Service Vulnerability
102803, #HP iLO 4 <= 2.52 RCE
134976, #iLO 3 < 1.90 / iLO 4 < 2.61 / iLO 5 < 1.35 Remote Code Execution Vulnerability (HPESBHF03866)
140770, #HP iLO 3 < 1.93 / HP iLO 4 < 2.75 / HP iLO 5 < 2.18 Ripple20 Multiple vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
