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
								74434, #HIGH, Google Chrome < 35.0.1916.153 Multiple Vulnerabilities
								76581, #MEDIUM, Google Chrome < 36.0.1985.125 Multiple Vulnerabilities
								80485, #CRITICAL, Google Chrome < 39.0.2171.99 Multiple Vulnerabilities
								80951, #HIGH, Google Chrome < 40.0.2214.91 Multiple Vulnerabilities
								81020, #CRITICAL, Google Chrome < 40.0.2214.93 Flash Player Multiple Remote Code Execution
								81207, #HIGH, Google Chrome < 40.0.2214.111 Multiple Vulnerabilities
								81647, #HIGH, Google Chrome < 41.0.2272.76 Multiple Vulnerabilities
								82534, #HIGH, Google Chrome < 41.0.2272.118 Multiple Vulnerabilities
								82825, #HIGH, Google Chrome < 42.0.2311.90 Multiple Vulnerabilities
								83136, #HIGH, Google Chrome < 42.0.2311.135 Multiple Vulnerabilities
								83366, #CRITICAL, Google Chrome < 42.0.2311.152 Multiple Vulnerabilities
								83745, #HIGH, Google Chrome < 43.0.2357.65 Multiple Vulnerabilities
								84049, #CRITICAL, Google Chrome < 43.0.2357.124 Multiple Vulnerabilities
								84667, #CRITICAL, Google Chrome < 43.0.2357.132 Multiple Vulnerabilities
								84731, #CRITICAL, Google Chrome < 43.0.2357.134 Multiple RCE Vulnerabilities
								84921, #HIGH, Google Chrome < 44.0.2403.89 Multiple Vulnerabilities
								77409, #CRITICAL, Google Chrome < 37.0.2062.94 Multiple Vulnerabilities
								77581, #CRITICAL, Google Chrome < 37.0.2062.120 Multiple Vulnerabilities
								77861, #HIGH, Google Chrome < 37.0.2062.124 Multiple Vulnerabilities
								78080, #CRITICAL, Google Chrome < 38.0.2125.101 Multiple Vulnerabilities
								78475, #CRITICAL, Google Chrome < 38.0.2125.104 Multiple Vulnerabilities
								79141, #CRITICAL, Google Chrome < 38.0.2125.122 Multiple Vulnerabilities
								79336, #CRITICAL, Google Chrome < 39.0.2171.65 Multiple Vulnerabilities
								79578, #CRITICAL, Google Chrome < 39.0.2171.71 Flash Player Remote Code Execution
								79836, #CRITICAL, Google Chrome < 39.0.2171.95 Multiple Vulnerabilities
								84342, #MEDIUM, Google Chrome < 43.0.2357.130 Multiple Vulnerabilities
								77184, #HIGH, Google Chrome < 36.0.1985.143 Multiple Vulnerabilities
								85567, #CRITICAL, Google Chrome < 44.0.2403.155 Multiple Vulnerabilities
								85743, #HIGH, Google Chrome < 45.0.2454.85 Multiple Vulnerabilities
								86061, #CRITICAL, Google Chrome < 45.0.2454.99 Multiple Vulnerabilities
								86209, #HIGH, Google Chrome < 45.0.2454.101 Multiple Vulnerabilities
								86380, #HIGH, Google Chrome < 46.0.2490.71 Multiple Vulnerabilities
								86598, #CRITICAL, Google Chrome < 46.0.2490.80 Multiple Vulnerabilities
								86852, #HIGH, Google Chrome < 46.0.2490.86 Vulnerability
								87206, #CRITICAL, Google Chrome < 47.0.2526.73 Multiple Vulnerabilities
								87245, #CRITICAL, Google Chrome < 47.0.2526.80 Multiple Vulnerabilities
								87417, #CRITICAL, Google Chrome < 47.0.2526.106 Vulnerability
								88088, #HIGH, Google Chrome < 48.0.2564.82 Multiple Vulnerabilities
								88681, #MEDIUM, Google Chrome < 48.0.2564.109 Multiple Vulnerabilities
								90794, #CRITICAL, Google Chrome < 50.0.2661.94 Multiple Vulnerabilities
								88956, #CRITICAL, Google Chrome < 48.0.2564.116 Vulnerability
								89685, #CRITICAL, Google Chrome < 49.0.2623.75 Multiple Vulnerabilities
								89786, #HIGH, Google Chrome < 49.0.2623.87 Multiple Vulnerabilities
								90194, #HIGH, Google Chrome < 49.0.2623.108 Multiple Vulnerabilities
								90542, #CRITICAL, Google Chrome < 50.0.2661.75 Multiple Vulnerabilities
								73419, #CRITICAL, Google Chrome < 34.0.1847.116 Multiple Vulnerabilities
								74008, #CRITICAL, Google Chrome < 34.0.1847.137 Multiple Vulnerabilities
								70916, #CRITICAL, Google Chrome < 31.0.1650.48 Multiple Vulnerabilities
								70923, #HIGH, Google Chrome < 31.0.1650.57 Multiple Memory Corruptions
								72167, #CRITICAL, Google Chrome < 32.0.1700.102 Multiple Vulnerabilities
								72939, #CRITICAL, Google Chrome < 33.0.1750.149 Multiple Vulnerabilities
								66813, #CRITICAL, Google Chrome < 27.0.1453.110 Multiple Vulnerabilities
								62313, #CRITICAL, Google Chrome < 22.0.1229.79 Multiple Vulnerabilities
								62519, #CRITICAL, Google Chrome < 22.0.1229.94 Multiple Vulnerabilities
								63110, #CRITICAL, Google Chrome < 23.0.1271.95 Multiple Vulnerabilities
								63232, #CRITICAL, Google Chrome < 23.0.1271.97 Multiple Vulnerabilities
								63468, #CRITICAL, Google Chrome < 24.0.1312.52 Multiple Vulnerabilities
								63645, #CRITICAL, Google Chrome < 24.0.1312.56 Multiple Vulnerabilities
								73710, #CRITICAL, Google Chrome < 34.0.1847.131 Multiple Vulnerabilities
								74122, #HIGH, Google Chrome < 35.0.1916.114 Multiple Vulnerabilities
								71227, #HIGH, Google Chrome < 31.0.1650.63 Multiple Vulnerabilities
								71968, #HIGH, Google Chrome < 32.0.1700.76 Multiple Vulnerabilities
								72616, #HIGH, Google Chrome < 33.0.1750.117 Multiple Vulnerabilities
								72800, #HIGH, Google Chrome < 33.0.1750.146 Multiple Vulnerabilities
								73082, #HIGH, Google Chrome < 33.0.1750.154 Multiple Vulnerabilities
								67232, #HIGH, Google Chrome < 28.0.1500.71 Multiple Vulnerabilities
								69139, #HIGH, Google Chrome < 28.0.1500.95 Multiple Vulnerabilities
								69423, #HIGH, Google Chrome < 29.0.1547.57 Multiple Vulnerabilities
								70273, #HIGH, Google Chrome < 30.0.1599.66 Multiple Vulnerabilities
								70494, #HIGH, Google Chrome < 30.0.1599.101 Multiple Vulnerabilities
								66556, #HIGH, Google Chrome < 27.0.1453.93 Multiple Vulnerabilities
								66930, #MEDIUM, Google Chrome < 27.0.1453.116 Flash Click-Jacking
								91128, #HIGH, Google Chrome < 50.0.2661.102 Multiple Vulnerabilities
								91350, #MEDIUM, Google Chrome < 51.0.2704.63 Multiple Vulnerabilities
								91455, #MEDIUM, Google Chrome < 51.0.2704.79 Multiple Vulnerabilities
								61381, #HIGH, Google Chrome < 21.0.1180.60 Multiple Vulnerabilities
								61462, #HIGH, Google Chrome < 21.0.1180.75 Multiple PDF Viewer Vulnerabilities
								61774, #HIGH, Google Chrome < 21.0.1180.89 Multiple Vulnerabilities
								62518, #HIGH, Google Chrome < 22.0.1229.92 Multiple Vulnerabilities
								62861, #HIGH, Google Chrome < 23.0.1271.64 Multiple Vulnerabilities
								63063, #HIGH, Google Chrome < 23.0.1271.91 Multiple Vulnerabilities
								64813, #HIGH, Google Chrome < 25.0.1364.97 Multiple Vulnerabilities
								65029, #HIGH, Google Chrome < 25.0.1364.152 Multiple Vulnerabilities
								65097, #HIGH, Google Chrome < 25.0.1364.160 WebKit Type Confusion Code Execution
								93315, #HIGH, Google Chrome < 53.0.2785.89 Multiple Vulnerabilities
								92628, #HIGH, Google Chrome < 52.0.2743.82 Multiple Vulnerabilities
								92791, #HIGH, Google Chrome < 52.0.2743.116 Multiple Vulnerabilities
								59117, #CRITICAL, Google Chrome < 19.0.1084.46 Multiple Vulnerabilities
								59255, #CRITICAL, Google Chrome < 19.0.1084.52 Multiple Vulnerabilities
								59735, #HIGH, Google Chrome < 20.0.1132.43 Multiple Vulnerabilities
								59958, #HIGH, Google Chrome < 20.0.1132.57 Multiple Vulnerabilities
								91716, #MEDIUM, Google Chrome < 51.0.2704.103 Vulnerability
								93476, #MEDIUM, Google Chrome < 53.0.2785.113 Multiple Vulnerabilities
								93817, #HIGH, Google Chrome < 53.0.2785.143 Multiple Vulnerabilities
								99633, #MEDIUM, Google Chrome < 58.0.3029.81 Multiple Vulnerabilities
								99995, #MEDIUM, Google Chrome < 58.0.3029.96 Vulnerability
								94136, #CRITICAL, Google Chrome < 54.0.2840.59 Multiple Vulnerabilities
								94580, #MEDIUM, Google Chrome < 54.0.2840.87 Vulnerability
								94676, #HIGH, Google Chrome < 54.0.2840.99 Multiple Vulnerabilities
								95480, #CRITICAL, Google Chrome < 55.0.2883.75 Multiple Vulnerabilities
								96828, #MEDIUM, Google Chrome < 56.0.2924.76 Multiple Vulnerabilities
								97724, #MEDIUM, Google Chrome < 57.0.2987.98 Multiple Vulnerabilities
								99136, #HIGH, Google Chrome < 57.0.2987.133 Multiple Vulnerabilities
								100679, #MEDIUM, Google Chrome < 59.0.3071.86 Multiple Vulnerabilities
								100991, #MEDIUM, Google Chrome < 59.0.3071.104 Multiple Vulnerabilities
								101980, #MEDIUM, Google Chrome < 60.0.3112.78 Multiple Vulnerabilities
								102993, #MEDIUM, Google Chrome < 61.0.3163.79 Multiple Vulnerabilities
103933, #MEDIUM, Google Chrome < 62.0.3202.62 Multiple Vulnerabilities
105356, #MEDIUM, Google Chrome < 63.0.3239.108 Vulnerability
106350, #MEDIUM, Google Chrome < 62.0.3202.94 Multiple Vulnerabilities
105152, #MEDIUM, Google Chrome < 63.0.3239.84 Multiple Vulnerabilities
104434, #HIGH, Google Chrome < 62.0.3202.89 Multiple Vulnerabilities
103421, #MEDIUM, Google Chrome < 61.0.3163.100 Multiple Vulnerabilities
106485, #MEDIUM, Google Chrome < 64.0.3282.119 Multiple Vulnerabilities
106840, #MEDIUM, Google Chrome < 64.0.3282.167 Vulnerability
107220, #CRITICAL, Google Chrome < 65.0.3325.146 Multiple Vulnerabilities
110228, #HIGH, Google Chrome < 67.0.3396.62 Multiple Vulnerabilities
109395, #HIGH, Google Chrome < 66.0.3359.117 Multiple Vulnerabilities
109899, #MEDIUM, Google Chrome < 66.0.3359.170 Multiple Vulnerabilities
111383, #MEDIUM, Google Chrome < 68.0.3440.75 Multiple Vulnerabilities
117333, #MEDIUM, Google Chrome < 69.0.3497.81 Multiple Vulnerabilities
117429, #MEDIUM, Google Chrome < 69.0.3497.92 Multiple Vulnerabilities
118153, #MEDIUM, Google Chrome < 70.0.3538.67 Multiple Vulnerabilities
117636, #HIGH, Google Chrome < 69.0.3497.100 Vulnerability
122853, #HIGH, Google Chrome < 73.0.3683.75 Multiple Vulnerabilities
121514, #MEDIUM, Google Chrome < 72.0.3626.81 Multiple Vulnerabilities
118887, #MEDIUM, Google Chrome < 70.0.3538.102 Vulnerability
119097, #MEDIUM, Google Chrome < 70.0.3538.110 Vulnerability
119558, #MEDIUM, Google Chrome < 71.0.3578.80 Multiple Vulnerabilities
122246, #MEDIUM, Google Chrome < 72.0.3626.96 Vulnerability
122617, #MEDIUM, Google Chrome < 72.0.3626.121 Vulnerability
124279, #MEDIUM, Google Chrome < 74.0.3729.108 Multiple Vulnerabilities
124460, #MEDIUM, Google Chrome < 74.0.3729.131 Multiple Vulnerabilities
125371, #HIGH, Google Chrome < 74.0.3729.157 Vulnerability
125952, #MEDIUM, Google Chrome < 75.0.3770.90 Vulnerability
133465, #MEDIUM, Google Chrome < 80.0.3987.87 Multiple Vulnerabilities
133848, #MEDIUM, Google Chrome < 80.0.3987.116 Multiple Vulnerabilities
139001, #MEDIUM, Google Chrome < 84.0.4147.105 Multiple Vulnerabilities
139459, #HIGH, Google Chrome < 84.0.4147.125 Multiple Vulnerabilities
136348, #HIGH, Google Chrome < 81.0.4044.138 Multiple Vulnerabilities
138449, #HIGH, Google Chrome < 84.0.4147.89 Multiple Vulnerabilities
131022, #HIGH, Google Chrome < 78.0.3904.97 Vulnerability
134701, #MEDIUM, Google Chrome < 80.0.3987.149 Multiple Vulnerabilities
142971, #MEDIUM, Google Chrome < 87.0.4280.66 Multiple Vulnerabilities
143471, #HIGH, Google Chrome < 87.0.4280.88 Multiple Vulnerabilities
148558, #MEDIUM, Google Chrome < 90.0.4430.72 Multiple Vulnerabilities
150430, #MEDIUM, Google Chrome < 91.0.4472.101 Multiple Vulnerabilities
154238, #MEDIUM, Google Chrome < 95.0.4638.54 Multiple Vulnerabilities
158500, #MEDIUM, Google Chrome < 99.0.4844.51 Multiple Vulnerabilities
158936, #CRITICAL, Google Chrome < 99.0.4844.74 Multiple Vulnerabilities
159304, #CRITICAL, Google Chrome < 100.0.4896.60 Multiple Vulnerabilities
159638, #CRITICAL, Google Chrome < 100.0.4896.88 Multiple Vulnerabilities
160217, #CRITICAL, Google Chrome < 101.0.4951.41 Multiple Vulnerabilities
160906, #CRITICAL, Google Chrome < 101.0.4951.64 Multiple Vulnerabilities
161477, #CRITICAL, Google Chrome < 102.0.5005.61 Multiple Vulnerabilities
161979, #CRITICAL, Google Chrome < 102.0.5005.115 Multiple Vulnerabilities
162422, #CRITICAL, Google Chrome < 103.0.5060.53 Multiple Vulnerabilities
162706, #CRITICAL, Google Chrome < 103.0.5060.114 Multiple Vulnerabilities
163273, #CRITICAL, Google Chrome < 103.0.5060.134 Multiple Vulnerabilities
163724, #CRITICAL, Google Chrome < 104.0.5112.79 Multiple Vulnerabilities
164155, #CRITICAL, Google Chrome < 104.0.5112.101 Multiple Vulnerabilities (deprecated)
164508, #CRITICAL, Google Chrome < 105.0.5195.52 Multiple Vulnerabilities
165068, #CRITICAL, Google Chrome < 105.0.5195.125 Multiple Vulnerabilities
165502, #CRITICAL, Google Chrome < 106.0.5249.61 Multiple Vulnerabilities
165590, #CRITICAL, Google Chrome < 106.0.5249.91 Multiple Vulnerabilities
139695, #HIGH, Google Chrome < 84.0.4147.135 Vulnerability
139794, #HIGH, Google Chrome < 85.0.4183.83 Multiple Vulnerabilities
142641, #MEDIUM, Google Chrome < 86.0.4240.193 Vulnerability
144781, #HIGH, Google Chrome < 87.0.4280.141 Multiple Vulnerabilities
159235, #CRITICAL, Google Chrome < 99.0.4844.84 Vulnerability
159494, #CRITICAL, Google Chrome < 100.0.4896.75 Vulnerability
159741, #CRITICAL, Google Chrome < 100.0.4896.127 Vulnerability
166045, #CRITICAL, Google Chrome < 106.0.5249.119 Multiple Vulnerabilities
146948, #HIGH, Google Chrome < 89.0.4389.72 Multiple Vulnerabilities
136743, #MEDIUM, Google Chrome < 83.0.4103.61 Multiple Vulnerabilities
137081, #MEDIUM, Google Chrome < 83.0.4103.97 Multiple Vulnerabilities
137635, #MEDIUM, Google Chrome < 83.0.4103.106 Multiple Vulnerabilities
137701, #MEDIUM, Google Chrome < 83.0.4103.116 Vulnerability
140406, #MEDIUM, Google Chrome < 85.0.4183.102 Multiple Vulnerabilities
140700, #MEDIUM, Google Chrome < 85.0.4183.121 Multiple Vulnerabilities
141194, #MEDIUM, Google Chrome < 86.0.4240.75 Multiple Vulnerabilities
141573, #MEDIUM, Google Chrome < 86.0.4240.111 Multiple Vulnerabilities
142209, #MEDIUM, Google Chrome < 86.0.4240.183 Multiple Vulnerabilities
142719, #MEDIUM, Google Chrome < 86.0.4240.198 Multiple Vulnerabilities
145071, #MEDIUM, Google Chrome < 88.0.4324.96 Multiple Vulnerabilities
146060, #MEDIUM, Google Chrome < 88.0.4324.146 Multiple Vulnerabilities
146204, #MEDIUM, Google Chrome < 88.0.4324.150 Vulnerability
146544, #MEDIUM, Google Chrome < 88.0.4324.182 Multiple Vulnerabilities
147754, #MEDIUM, Google Chrome < 89.0.4389.90 Multiple Vulnerabilities
148243, #MEDIUM, Google Chrome < 89.0.4389.114 Multiple Vulnerabilities
148487, #MEDIUM, Google Chrome < 89.0.4389.128 Multiple Vulnerabilities
148848, #MEDIUM, Google Chrome < 90.0.4430.85 Multiple Vulnerabilities
148996, #MEDIUM, Google Chrome < 90.0.4430.93 Multiple Vulnerabilities
149412, #MEDIUM, Google Chrome < 90.0.4430.212 Multiple Vulnerabilities
149900, #MEDIUM, Google Chrome < 91.0.4472.77 Multiple Vulnerabilities
150854, #MEDIUM, Google Chrome < 91.0.4472.114 Multiple Vulnerabilities
151672, #MEDIUM, Google Chrome < 91.0.4472.164 Multiple Vulnerabilities
151831, #MEDIUM, Google Chrome < 92.0.4515.107 Multiple Vulnerabilities
152189, #MEDIUM, Google Chrome < 92.0.4515.131 Multiple Vulnerabilities
152609, #MEDIUM, Google Chrome < 92.0.4515.159 Multiple Vulnerabilities
152928, #MEDIUM, Google Chrome < 93.0.4577.63 Multiple Vulnerabilities
153255, #MEDIUM, Google Chrome < 93.0.4577.82 Multiple Vulnerabilities
153515, #MEDIUM, Google Chrome < 94.0.4606.54 Multiple Vulnerabilities
153630, #MEDIUM, Google Chrome < 94.0.4606.61 Vulnerability
153829, #MEDIUM, Google Chrome < 94.0.4606.71 Multiple Vulnerabilities
153931, #MEDIUM, Google Chrome < 94.0.4606.81 Multiple Vulnerabilities
154706, #MEDIUM, Google Chrome < 95.0.4638.69 Multiple Vulnerabilities
155352, #MEDIUM, Google Chrome < 96.0.4664.45 Multiple Vulnerabilities
155867, #MEDIUM, Google Chrome < 96.0.4664.93 Multiple Vulnerabilities
156033, #MEDIUM, Google Chrome < 96.0.4664.110 Multiple Vulnerabilities
156462, #MEDIUM, Google Chrome < 97.0.4692.71 Multiple Vulnerabilities
156862, #MEDIUM, Google Chrome < 97.0.4692.99 Multiple Vulnerabilities
157293, #MEDIUM, Google Chrome < 98.0.4758.80 Multiple Vulnerabilities
158051, #MEDIUM, Google Chrome < 98.0.4758.102 Multiple Vulnerabilities
164656, #CRITICAL, Google Chrome < 105.0.5195.102 Vulnerability
166631, #CRITICAL, Google Chrome < 107.0.5304.87 Vulnerability
166468, #CRITICAL, Google Chrome < 107.0.5304.62 Multiple Vulnerabilities
167101, #CRITICAL, Google Chrome < 107.0.5304.106 Multiple Vulnerabilities (deprecated)
171321, #CRITICAL, Google Chrome < 110.0.5481.77 Multiple Vulnerabilities
168273, #CRITICAL, Google Chrome < 108.0.5359.71 Multiple Vulnerabilities
168699, #CRITICAL, Google Chrome < 108.0.5359.124 Multiple Vulnerabilities
168701, #CRITICAL, Google Chrome < 108.0.5359.125 Multiple Vulnerabilities (deprecated)
169758, #CRITICAL, Google Chrome < 109.0.5414.74 Multiple Vulnerabilities
170519, #CRITICAL, Google Chrome < 109.0.5414.119 Multiple Vulnerabilities
168372, #CRITICAL, Google Chrome < 108.0.5359.94 Vulnerability
168181, #CRITICAL, Google Chrome < 107.0.5304.121 Vulnerability
172221, #CRITICAL, Google Chrome < 111.0.5563.64 Multiple Vulnerabilities
173059, #CRITICAL, Google Chrome < 111.0.5563.110 Multiple Vulnerabilities
173836, #CRITICAL, Google Chrome < 112.0.5615.49 Multiple Vulnerabilities
174332, #CRITICAL, Google Chrome < 112.0.5615.121 Vulnerability
174478, #CRITICAL, Google Chrome < 112.0.5615.137 Multiple Vulnerabilities
175001, #CRITICAL, Google Chrome < 113.0.5672.63 Multiple Vulnerabilities
175839, #CRITICAL, Google Chrome < 113.0.5672.126 Multiple Vulnerabilities
176494, #CRITICAL, Google Chrome < 114.0.5735.91 Multiple Vulnerabilities (deprecated)
176496, #CRITICAL, Google Chrome < 114.0.5735.90 Multiple Vulnerabilities
176675, #CRITICAL, Google Chrome < 114.0.5735.110 Vulnerability
177227, #CRITICAL, Google Chrome < 114.0.5735.133 Multiple Vulnerabilities
177635, #CRITICAL, Google Chrome < 114.0.5735.198 Multiple Vulnerabilities
178447, #CRITICAL, Google Chrome < 115.0.5790.98 Multiple Vulnerabilities
179224, #CRITICAL, Google Chrome < 115.0.5790.170 Multiple Vulnerabilities
179837, #CRITICAL, Google Chrome < 116.0.5845.96 Multiple Vulnerabilities
180163, #CRITICAL, Google Chrome < 116.0.5845.110 Multiple Vulnerabilities
180250, #CRITICAL, Google Chrome < 116.0.5845.140 Vulnerability
180508, #CRITICAL, Google Chrome < 116.0.5845.179 Multiple Vulnerabilities
181235, #CRITICAL, Google Chrome < 116.0.5845.187 Vulnerability
181291, #CRITICAL, Google Chrome < 117.0.5938.62 Multiple Vulnerabilities
182072, #CRITICAL, Google Chrome < 117.0.5938.132 Multiple Vulnerabilities
182442, #CRITICAL, Google Chrome < 117.0.5938.149 Vulnerability
182850, #CRITICAL, Google Chrome < 118.0.5993.70 Multiple Vulnerabilities
183806, #CRITICAL, Google Chrome < 118.0.5993.117 Vulnerability
184083, #CRITICAL, Google Chrome < 119.0.6045.105 Multiple Vulnerabilities
185349, #CRITICAL, Google Chrome < 119.0.6045.123 Vulnerability
185587, #CRITICAL, KB5032250: Windows Server 2008 R2 Security Update (November 2023)
186362, #CRITICAL, Google Chrome < 119.0.6045.199 Multiple Vulnerabilities
185605, #CRITICAL, Google Chrome < 119.0.6045.159 Multiple Vulnerabilities
183246, #HIGH, Google Chrome < 118.0.5993.88 Vulnerability
186834, #CRITICAL, Google Chrome < 120.0.6099.110 Multiple Vulnerabilities
186835, #CRITICAL, Google Chrome < 120.0.6099.109 Multiple Vulnerabilities
187132, #CRITICAL, Google Chrome < 120.0.6099.130 Vulnerability
187134, #CRITICAL, Google Chrome < 120.0.6099.129 Vulnerability
187619, #CRITICAL, Google Chrome < 120.0.6099.200 Multiple Vulnerabilities
187620, #CRITICAL, Google Chrome < 120.0.6099.199 Multiple Vulnerabilities
188158, #CRITICAL, Google Chrome < 120.0.6099.224 Multiple Vulnerabilities
188161, #CRITICAL, Google Chrome < 120.0.6099.225 Multiple Vulnerabilities
189460, #CRITICAL, Google Chrome < 121.0.6167.85 Multiple Vulnerabilities
189823, #CRITICAL, Google Chrome < 121.0.6167.139 Multiple Vulnerabilities
190064, #CRITICAL, Google Chrome < 121.0.6167.160 Multiple Vulnerabilities
190441, #HIGH, Google Chrome < 121.0.6167.184 Vulnerability
191060, #HIGH, Google Chrome < 122.0.6261.94 Multiple Vulnerabilities
186600, #CRITICAL, Google Chrome < 120.0.6099.62 Multiple Vulnerabilities
190813, #CRITICAL, Google Chrome < 122.0.6261.57 Multiple Vulnerabilities
200329, #CRITICAL, Google Chrome < 126.0.6478.56 Multiple Vulnerabilities
210778, #HIGH, Google Chrome < 131.0.6778.69 Multiple Vulnerabilities
216177, #CRITICAL, Google Chrome < 133.0.6943.98 Multiple Vulnerabilities
214952, #MEDIUM, Google Chrome < 133.0.6943.53 Multiple Vulnerabilities
233671, #HIGH, Google Chrome < 135.0.7049.41 Multiple Vulnerabilities
274069, #HIGH, Google Chrome < 142.0.7444.134 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
