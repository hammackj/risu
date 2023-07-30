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
142971, #Google Chrome < 87.0.4280.66 Multiple Vulnerabilities
143471, #Google Chrome < 87.0.4280.88 Multiple Vulnerabilities
148558, #Google Chrome < 90.0.4430.72 Multiple Vulnerabilities
150430, #Google Chrome < 91.0.4472.101 Multiple Vulnerabilities
154238, #Google Chrome < 95.0.4638.54 Multiple Vulnerabilities
158500, #Google Chrome < 99.0.4844.51 Multiple Vulnerabilities
158936, #Google Chrome < 99.0.4844.74 Multiple Vulnerabilities
159304, #Google Chrome < 100.0.4896.60 Multiple Vulnerabilities
159638, #Google Chrome < 100.0.4896.88 Multiple Vulnerabilities
160217, #Google Chrome < 101.0.4951.41 Multiple Vulnerabilities
160906, #Google Chrome < 101.0.4951.64 Multiple Vulnerabilities
161477, #Google Chrome < 102.0.5005.61 Multiple Vulnerabilities
161979, #Google Chrome < 102.0.5005.115 Multiple Vulnerabilities
162422, #Google Chrome < 103.0.5060.53 Multiple Vulnerabilities
162706, #Google Chrome < 103.0.5060.114 Multiple Vulnerabilities
163273, #Google Chrome < 103.0.5060.134 Multiple Vulnerabilities
163724, #Google Chrome < 104.0.5112.79 Multiple Vulnerabilities
164155, #Google Chrome < 104.0.5112.101 Multiple Vulnerabilities
164508, #Google Chrome < 105.0.5195.52 Multiple Vulnerabilities
165068, #Google Chrome < 105.0.5195.125 Multiple Vulnerabilities
165502, #Google Chrome < 106.0.5249.61 Multiple Vulnerabilities
165590, #Google Chrome < 106.0.5249.91 Multiple Vulnerabilities
139695, #Google Chrome < 84.0.4147.135 Vulnerability
139794, #Google Chrome < 85.0.4183.83 Multiple Vulnerabilities
142641, #Google Chrome < 86.0.4240.193 Vulnerability
144781, #Google Chrome < 87.0.4280.141 Multiple Vulnerabilities
159235, #Google Chrome < 99.0.4844.84 Vulnerability
159494, #Google Chrome < 100.0.4896.75 Vulnerability
159741, #Google Chrome < 100.0.4896.127 Vulnerability
166045, #Google Chrome < 106.0.5249.119 Multiple Vulnerabilities
146948, #Google Chrome < 89.0.4389.72 Multiple Vulnerabilities
136743, #Google Chrome < 83.0.4103.61 Multiple Vulnerabilities
137081, #Google Chrome < 83.0.4103.97 Multiple Vulnerabilities
137635, #Google Chrome < 83.0.4103.106 Multiple Vulnerabilities
137701, #Google Chrome < 83.0.4103.116 Vulnerability
140406, #Google Chrome < 85.0.4183.102 Multiple Vulnerabilities
140700, #Google Chrome < 85.0.4183.121 Multiple Vulnerabilities
141194, #Google Chrome < 86.0.4240.75 Multiple Vulnerabilities
141573, #Google Chrome < 86.0.4240.111 Multiple Vulnerabilities
142209, #Google Chrome < 86.0.4240.183 Multiple Vulnerabilities
142719, #Google Chrome < 86.0.4240.198 Multiple Vulnerabilities
145071, #Google Chrome < 88.0.4324.96 Multiple Vulnerabilities
146060, #Google Chrome < 88.0.4324.146 Multiple Vulnerabilities 
146204, #Google Chrome < 88.0.4324.150 Vulnerability
146544, #Google Chrome < 88.0.4324.182 Multiple Vulnerabilities 
147754, #Google Chrome < 89.0.4389.90 Multiple Vulnerabilities 
148243, #Google Chrome < 89.0.4389.114 Multiple Vulnerabilities 
148487, #Google Chrome < 89.0.4389.128 Multiple Vulnerabilities 
148848, #Google Chrome < 90.0.4430.85 Multiple Vulnerabilities 
148996, #Google Chrome < 90.0.4430.93 Multiple Vulnerabilities 
149412, #Google Chrome < 90.0.4430.212 Multiple Vulnerabilities 
149900, #Google Chrome < 91.0.4472.77 Multiple Vulnerabilities 
150854, #Google Chrome < 91.0.4472.114 Multiple Vulnerabilities 
151672, #Google Chrome < 91.0.4472.164 Multiple Vulnerabilities 
151831, #Google Chrome < 92.0.4515.107 Multiple Vulnerabilities 
152189, #Google Chrome < 92.0.4515.131 Multiple Vulnerabilities 
152609, #Google Chrome < 92.0.4515.159 Multiple Vulnerabilities 
152928, #Google Chrome < 93.0.4577.63 Multiple Vulnerabilities 
153255, #Google Chrome < 93.0.4577.82 Multiple Vulnerabilities 
153515, #Google Chrome < 94.0.4606.54 Multiple Vulnerabilities 
153630, #Google Chrome < 94.0.4606.61 Vulnerability
153829, #Google Chrome < 94.0.4606.71 Multiple Vulnerabilities 
153931, #Google Chrome < 94.0.4606.81 Multiple Vulnerabilities 
154706, #Google Chrome < 95.0.4638.69 Multiple Vulnerabilities 
155352, #Google Chrome < 96.0.4664.45 Multiple Vulnerabilities 
155867, #Google Chrome < 96.0.4664.93 Multiple Vulnerabilities 
156033, #Google Chrome < 96.0.4664.110 Multiple Vulnerabilities 
156462, #Google Chrome < 97.0.4692.71 Multiple Vulnerabilities 
156862, #Google Chrome < 97.0.4692.99 Multiple Vulnerabilities 
157293, #Google Chrome < 98.0.4758.80 Multiple Vulnerabilities 
158051, #Google Chrome < 98.0.4758.102 Multiple Vulnerabilities 
164656, #Google Chrome < 105.0.5195.102 Vulnerability
166631, #Google Chrome < 107.0.5304.87 Vulnerability
166468, #Google Chrome < 107.0.5304.62 Multiple Vulnerabilities
167101, #Google Chrome < 107.0.5304.110 Multiple Vulnerabilities
171321, #Google Chrome < 110.0.5481.77 Multiple Vulnerabilities
168273, #Google Chrome < 108.0.5359.71 Multiple Vulnerabilities 
168699, #Google Chrome < 108.0.5359.124 Multiple Vulnerabilities 
168701, #Google Chrome < 108.0.5359.125 Multiple Vulnerabilities 
169758, #Google Chrome < 109.0.5414.74 Multiple Vulnerabilities 
170519, #Google Chrome < 109.0.5414.119 Multiple Vulnerabilities
168372, #Google Chrome < 108.0.5359.94 Vulnerability
168181, #Google Chrome < 107.0.5304.121 Vulnerability
172221, #Google Chrome < 111.0.5563.64 Multiple Vulnerabilities 
173059, #Google Chrome < 111.0.5563.110 Multiple Vulnerabilities 
173836, #Google Chrome < 112.0.5615.49 Multiple Vulnerabilities 
174332, #Google Chrome < 112.0.5615.121 Vulnerability
174478, #Google Chrome < 112.0.5615.137 Multiple Vulnerabilities 
175001, #Google Chrome < 113.0.5672.63 Multiple Vulnerabilities 
175839, #Google Chrome < 113.0.5672.126 Multiple Vulnerabilities 
176494, #Google Chrome < 114.0.5735.91 Multiple Vulnerabilities 
176496, #Google Chrome < 114.0.5735.90 Multiple Vulnerabilities 
176675, #Google Chrome < 114.0.5735.110 Vulnerability
177227, #Google Chrome < 114.0.5735.133 Multiple Vulnerabilities 
177635, #Google Chrome < 114.0.5735.198 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
