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
				class GoogleChrome < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Google Chrome Patch Rollup",
							:plugin_id => -99990,
							:plugin_name => "Missing the latest Google Chrome Patches",
							:item_name => "Update to the latest Google Chrome",
							:plugin_ids => [
								74434,
								76581,
								80485,
								80951,
								81020,
								81207,
								81647,
								82534,
								82825,
								83136,
								83366,
								83745,
								84049,
								84667,
								84731,
								84921,
								77409,
								77581,
								77861,
								78080,
								78475,
								79141,
								79336,
								79578,
								79836,
								84342,
								77184,
								85567,
								85743,
								86061,
								86209,
								86380,
								86598,
								86852,
								87206,
								87245,
								87417,
								88088,
								88681,
								90794,
								88956,
								89685,
								89786,
								90194,
								90542,
								73419,
								74008,
								70916,
								70923,
								72167,
								72939,
								66813,
								62313,
								62519,
								63110,
								63232,
								63468,
								63645,
								73710,
								74122,
								71227,
								71968,
								72616,
								72800,
								73082,
								67232,
								69139,
								69423,
								70273,
								70494,
								66556,
								66930,
								91128,
								91350,
								91455,
								61381,
								61462,
								61774,
								62518,
								62861,
								63063,
								64813,
								65029,
								65097,
								93315,
								92628,
								92791,
								59117,
								59255,
								59735,
								59958,
								91716,
								93476,
								93817,
								99633,
								99995,
								94136,
								94580,
								94676,
								95480,
								96828,
								97724,
								99136,
								100679,
								100991,
								101980,
								102993, #Google Chrome < 61.0.3163.79 Multiple Vulnerabilities -
103933, #Google Chrome < 62.0.3202.62 Multiple Vulnerabilities
105356, #Google Chrome < 63.0.3239.108 Multiple Vulnerabilities
106350, #Google Chrome < 62.0.3202.94 Out of bounds read flaw in V8
105152, #Google Chrome < 63.0.3239.84 Multiple Vulnerabilities
104434, #Google Chrome < 62.0.3202.89 Multiple Vulnerabilities
103421, #Google Chrome < 61.0.3163.100 Multiple Vulnerabilities
106485, #Google Chrome < 64.0.3282.119 Multiple Vulnerabilities
106840, #Google Chrome < 64.0.3282.167 V8 JSFunction::CalculateInstanceSizeForDerivedClass() RCE
107220, #Google Chrome < 65.0.3325.146 Multiple Vulnerabilities
110228, #Google Chrome < 67.0.3396.62 Multiple Vulnerabilities
109395, #Google Chrome < 66.0.3359.117 Multiple Vulnerabilities
109899, #Google Chrome < 66.0.3359.170 Multiple Vulnerabilities
111383, #Google Chrome < 68.0.3440.75 Multiple Vulnerabilities
117333, #Google Chrome < 69.0.3497.81 Multiple Vulnerabilities
117429, #Google Chrome < 69.0.3497.92 Vulnerability
118153, #Google Chrome < 70.0.3538.67 Multiple Vulnerabilities
117636, #Google Chrome < 69.0.3497.100 Vulnerability
122853, #Google Chrome < 73.0.3683.75 Multiple Vulnerabilities
121514, #Google Chrome < 72.0.3626.81 Multiple Vulnerabilities
118887, #Google Chrome < 70.0.3538.102 Vulnerability
119097, #Google Chrome < 70.0.3538.110 Vulnerability
119558, #Google Chrome < 71.0.3578.80 Multiple Vulnerabilities
122246, #Google Chrome < 72.0.3626.96 Vulnerability
122617, #Google Chrome < 72.0.3626.121 Vulnerability
124279, #Google Chrome < 74.0.3729.108 Multiple Vulnerabilities
124460, #Google Chrome < 74.0.3729.131 Multiple Vulnerabilities
125371, #Google Chrome < 74.0.3729.157 Vulnerability
125952, #Google Chrome < 75.0.3770.90 Vulnerability
133465, #Google Chrome < 80.0.3987.87 Multiple Vulnerabilities
133848, #Google Chrome < 80.0.3987.116 Multiple Vulnerabilities
139001, #Google Chrome < 84.0.4147.105 Multiple Vulnerabilities
139459, #Google Chrome < 84.0.4147.125 Multiple Vulnerabilities
136348, #Google Chrome < 81.0.4044.138 Multiple Vulnerabilities
138449, #Google Chrome < 84.0.4147.89 Multiple Vulnerabilities
131022, #Google Chrome < 78.0.3904.97 Vulnerability
134701, #Google Chrome < 80.0.3987.149 Multiple Vulnerabilities

							]
						}
					end
				end
			end
		end
	end
end
