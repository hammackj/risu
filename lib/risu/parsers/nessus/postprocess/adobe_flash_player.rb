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
				class AdobeFlashPlayer < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Flash Player Patch Rollup",
							:plugin_id => -99997,
							:plugin_name => "Missing the latest Adobe Flash Player Patches",
							:item_name => "Update to the latest Adobe Flash Player",
							:plugin_ids => [
								100756, #Adobe Flash Player <= 25.0.0.171 Multiple Vulnerabilities (APSB17-17)
								11323, #Flash Player < 6.0.79.0 Multiple Unspecified Overflows
								11952, #Flash Player < 7.0.19.0 Predictable Data Location Weakness
								20158, #Flash Player < 7.0.60.0 / 8.0.22.0 Multiple Vulnerabilities
								21079, #Flash Player swf Processing Multiple Unspecified Code Execution (APSB06-03)
								22056, #Flash Player Multiple Vulnerabilities (APSB06-11)
								23869, #Flash Player HTTP Header CRLF Injection (APSB06-18)
								25694, #Flash Player Multiple Vulnerabilities (APSB07-12)
								29741, #Flash Player < 7.0.73.0 / 9.0.115.0 Multiple Vulnerabilities (APSB07-20)
								31799, #Flash Player < 8.0.42.0 / 9.0.124.0 Multiple Vulnerabilities (APSB08-11)
								34741, #Flash Player < 9.0.151.0 / 10.0.12.36 Multiple Vulnerabilities (APSB08-18 / APSB08-20 / APSB08-22)
								35742, #Flash Player 9.0.159.0 / 10.0.22.87 Multiple Vulnerabilities (APSB09-01)
								40434, #Flash Player < 9.0.246.0 / 10.0.32.18 Multiple Vulnerabilities (APSB09-10)
								43068, #Flash Player < 9.0.260 / 10.0.42.34 Multiple Vulnerabilities (APSB09-19)
								44596, #Flash Player < 10.0.45.2 Multiple Vulnerabilities (APSB10-06)
								46859, #Flash Player < 9.0.277.0 / 10.1.53.63 Multiple Vulnerabilities (ASPB10-14)
								48300, #Flash Player < 9.0.280 / 10.1.82.76 Multiple Vulnerabilities (APSB10-16)
								49307, #Flash Player < 9.0.283 / 10.1.85.3 Unspecified Code Execution (APSB10-22)
								50493, #Flash Player < 9.0.289 / 10.1.102.64 Multiple Vulnerabilities (APSB10-26)
								51926, #Flash Player < 10.2.152.26 Multiple Vulnerabilities (APSB11-02)
								52673, #Flash Player < 10.2.153.1 Unspecified Memory Corruption (APSB11-05)
								53472, #Flash Player < 10.2.159.1 ActionScript Predefined Class Prototype Addition Remote Code Execution (APSB11-07)
								54299, #Flash Player < 10.3.181.14 Multiple Vulnerabilities (APSB11-12)
								54972, #Flash Player < 10.3.181.22 XSS (APSB11-13)
								55140, #Flash Player < 10.3.181.26 Multiple Vulnerabilities (APSB11-18)
								55803, #Flash Player <= 10.3.181.36 Multiple Vulnerabilities (APSB11-21)
								56259, #Flash Player <= 10.3.183.7 Multiple Vulnerabilities (APSB11-26)
								56874, #Flash Player <= 10.3.183.10 / 11.0.1.152 Multiple Vulnerabilities (APSB11-28)
								58001, #Flash Player <= 10.3.183.14 / 11.1.102.55 Multiple Vulnerabilities (APSB12-03)
								58207, #Flash Player <= 10.3.183.15 / 11.1.102.62 Multiple Vulnerabilities (APSB12-05)
								58538, #Flash Player <= 10.3.183.16 / 11.1.102.63 Multiple Memory Corruption Vulnerabilities (APSB12-07)
								58994, #Flash Player <= 10.3.183.18 / 11.2.202.233 Object Confusion Vulnerability (APSB12-09)
								59426, #Flash Player <= 10.3.183.19 / 11.3.300.256 Multiple Vulnerabilities (APSB12-14)
								61550, #Flash Player <= 11.3.300.270 Code Execution (APSB12-18)
								61622, #Flash Player <= 10.3.183.22 / 11.4.402.264 Multiple Vulnerabilities (APSB12-19)
								62480, #Flash Player <= 10.3.183.23 / 11.4.402.278 Multiple Vulnerabilities (APSB12-22)
								62836, #Flash Player <= 10.3.183.29 / 11.4.402.287 Multiple Vulnerabilities (APSB12-24)
								63242, #Flash Player <= 10.3.183.43 / 11.5.502.110 Multiple Vulnerabilities (APSB12-27)
								63450, #Flash Player <= 10.3.183.48 / 11.5.502.135 Buffer Overflow (APSB13-01)
								64506, #Flash Player <= 10.3.183.50 / 11.5.502.146 Multiple Vulnerabilities (APSB13-04)
								64584, #Flash Player <= 10.3.183.51 / 11.5.502.149 Multiple Vulnerabilities (APSB13-05)
								64916, #Flash Player <= 10.3.183.63 / 11.6.602.168 Multiple Vulnerabilities (APSB13-08)
								65219, #Flash Player <= 10.3.183.67 / 11.6.602.171 Multiple Vulnerabilities (APSB13-09)
								65910, #Flash Player <= 10.3.183.68 / 11.6.602.180 Multiple Vulnerabilities (APSB13-11)
								66445, #Flash Player <= 10.3.183.75 / 11.7.700.169 Multiple Vulnerabilities (APSB13-14)
								66872, #Flash Player <= 10.3.183.86 / 11.7.700.202 Memory Corruption (APSB13-16)
								67225, #Flash Player <= 10.3.183.90 / 11.7.700.224 Multiple Vulnerabilities (APSB13-17)
								69866, #Flash Player <= 11.7.700.232 / 11.8.800.94 Memory Corruptions (APSB13-21)
								70858, #Flash Player <= 11.7.700.242 / 11.9.900.117 Memory Corruptions (APSB13-26)
								71351, #Flash Player <= 11.7.700.252 / 11.9.900.152 Multiple Vulnerabilities (APSB13-28)
								71951, #Flash Player <= 11.7.700.257 / 11.9.900.170 Multiple Vulnerabilities (APSB14-02)
								72284, #Flash Player <= 11.7.700.260 / 12.0.0.43 Unspecified Remote Code Execution (APSB14-04)
								72606, #Flash Player <= 11.7.700.261 / 12.0.0.44 Multiple Vulnerabilities (APSB14-07)
								72937, #Flash Player <= 11.7.700.269 / 12.0.0.70 Multiple Vulnerabilities (APSB14-08)
								73433, #Flash Player <= 11.7.700.272 / 12.0.0.77 Multiple Vulnerabilities (APSB14-09)
								73740, #Flash Player <= 11.7.700.275 / 13.0.0.182 Pixel Bender Component Buffer Overflow (APSB14-13)
								73994, #Flash Player <= 13.0.0.206 Multiple Vulnerabilities (APSB14-14)
								74431, #Flash Player <= 13.0.0.214 Multiple Vulnerabilities (APSB14-16)
								76413, #Flash Player <= 14.0.0.125 Multiple Vulnerabilities (APSB14-17)
								77172, #Flash Player <= 14.0.0.145 Multiple Vulnerabilities (APSB14-18)
								77577, #Flash Player <= 14.0.0.179 Multiple Vulnerabilities (APSB14-21)
								78441, #Flash Player <= 15.0.0.167 Multiple Vulnerabilities (APSB14-22)
								79140, #Flash Player <= 15.0.0.189 Multiple Vulnerabilities (APSB14-24)
								79442, #Flash Player <= 15.0.0.223 Dereferenced Memory Pointer RCE (APSB14-26)
								79835, #Flash Player <= 15.0.0.239 Multiple Vulnerabilities (APSB14-27)
								80484, #Flash Player <= 16.0.0.235 Multiple Vulnerabilities (APSB15-01)
								80946, #Flash Player <= 16.0.0.257 Information Disclosure (APSB15-02)
								80998, #Flash Player <= 16.0.0.287 Unspecified Code Execution (APSA15-01 / APSB15-03)
								81127, #Flash Player <= 16.0.0.296 Unspecified Code Execution (APSA15-02 / APSB15-04)
								81819, #Flash Player <= 16.0.0.305 Multiple Vulnerabilities (APSB15-05)
								82781, #Adobe Flash Player <= 17.0.0.134 Multiple Vulnerabilities (APSB15-06)
								83365, #Adobe Flash Player <= 17.0.0.169 Multiple Vulnerabilities (APSB15-09)
								84048, #Adobe Flash Player <= 17.0.0.188 Multiple Vulnerabilities (APSB15-11)
								84365, #Adobe Flash Player <= 18.0.0.161 RCE (APSB15-14)
								84642, #Adobe Flash Player <= 18.0.0.194 Multiple Vulnerabilities (APSB15-16)
								84730, #Adobe Flash Player <= 18.0.0.203 Multiple RCE Vulnerabilities (APSB15-18)
								85326, #Adobe Flash Player <= 18.0.0.209 Multiple Vulnerabilities (APSB15-19)
								86060, #Adobe Flash Player <= 18.0.0.232 Multiple Vulnerabilities (APSB15-23)
								86369, #Adobe Flash Player <= 19.0.0.185 Multiple Vulnerabilities (APSB15-25)
								86423, #Adobe Flash Player <= 19.0.0.207 Vulnerability (APSB15-27)
								86851, #Adobe Flash Player <= 19.0.0.226 Multiple Vulnerabilities (APSB15-28)
								87244, #Adobe Flash Player <= 19.0.0.245 Multiple Vulnerabilities (APSB15-32)
								87657, #Adobe Flash Player <= 20.0.0.235 Multiple Vulnerabilities (APSB16-01)
								88639, #Adobe Flash Player <= 20.0.0.286 Multiple Vulnerabilities (APSB16-04)
								89834, #Adobe Flash Player <= 20.0.0.306 Multiple Vulnerabilities (APSB16-08)
								90425, #Adobe Flash Player <= 21.0.0.197 Multiple Vulnerabilities (APSB16-10)
								91163, #Adobe Flash Player <= 21.0.0.226 Multiple Vulnerabilities (APSB16-15)
								91670, #Adobe Flash Player <= 21.0.0.242 Multiple Vulnerabilities (APSB16-18)
								92012, #Adobe Flash Player <= 22.0.0.192 Multiple Vulnerabilities (APSB16-25)
								93461, #Adobe Flash Player <= 22.0.0.211 Multiple Vulnerabilities (APSB16-29)
								93960, #Adobe Flash Player <= 23.0.0.162 Multiple Vulnerabilities (APSB16-32)
								94334, #Adobe Flash Player <= 23.0.0.185 Arbitrary Code Execution (APSB16-36)
								94628, #Adobe Flash Player <= 23.0.0.205 Multiple Vulnerabilities (APSB16-37)
								95762, #Adobe Flash Player <= 23.0.0.207 Multiple Vulnerabilities (APSB16-39)
								96388, #Adobe Flash Player <= 24.0.0.186 Multiple Vulnerabilities (APSB17-02)
								97142, #Adobe Flash Player <= 24.0.0.194 Multiple Vulnerabilities (APSB17-04)
								97727, #Adobe Flash Player <= 24.0.0.221 Multiple Vulnerabilities (APSB17-07)
								99283, #Adobe Flash Player <= 25.0.0.127 Multiple Vulnerabilities (APSB17-10)
								100052, #Adobe Flash Player <= 25.0.0.148 Multiple Vulnerabilities (APSB17-15)
								102262, #Adobe Flash Player <= 26.0.0.137 Multiple Vulnerabilities (APSB17-23)
								101362, #Adobe Flash Player <= 26.0.0.131 Multiple Vulnerabilities (APSB17-21)
								103124, #Adobe Flash Player <= 26.0.0.151 Multiple Vulnerabilities (APSB17-28)
								103922, #Adobe Flash Player <= 27.0.0.159 Type Confusion Vulnerability (APSB17-32)
								108958, #Adobe Flash Player <= 29.0.0.113 (APSB18-08)
								104544, #Adobe Flash Player <= 27.0.0.183 (APSB17-33)
105691, #Adobe Flash Player <= 28.0.0.126 (APSB18-01)
106606, #Adobe Flash Player <= 28.0.0.137 Use-after-free Remote Code Execution (APSA18-01) (APSB18-03)
108281, #Adobe Flash Player <= 28.0.0.161 (APSB18-05)
109601, #Adobe Flash Player <= 29.0.0.140 (APSB18-16)
105175, #Adobe Flash Player <= 27.0.0.187 (APSB17-42)
110397, #Adobe Flash Player <= 29.0.0.171 (APSB18-19)
111683, #Adobe Flash Player <= 30.0.0.134 (APSB18-25)
110979, #Adobe Flash Player <= 30.0.0.113 (APSB18-24)
119094, #Adobe Flash Player <= 31.0.0.148 (APSB18-44)
119462, #Adobe Flash Player <= 31.0.0.153 (APSB18-42)
123938, #Adobe Flash Player <= 32.0.0.156 (APSB19-19)
125056, #Adobe Flash Player <= 32.0.0.171 (APSB19-26)
125815, #Adobe Flash Player <= 32.0.0.192 (APSB19-30)
125827, #KB4503308: Security update for Adobe Flash Player (June 2019)
125068, #KB4497932: Security update for Adobe Flash Player (May 2019)
104547, #KB4048951: Security update for Adobe Flash Player (November 2017)
105693, #KB4056887: Security update for Adobe Flash Player (January 2018)
106655, #KB4074595: Security update for Adobe Flash Player (February 2018)
108287, #KB4088785: Security update for Adobe Flash Player (March 2018)
118909, #Adobe Flash Player <= 31.0.0.122 (APSB18-39)
122117, #Adobe Flash Player <= 32.0.0.114 (APSB19-06)
117419, #KB4457146: Security update for Adobe Flash Player (September 2018)
118917, #KB4467694: Security update for Adobe Flash Player (November 2018)
122130, #KB4487038: Security update for Adobe Flash Player (February 2019)
128633, #Adobe Flash Player <= 32.0.0.238 (APSB19-46)
117410, #Adobe Flash Player <= 30.0.0.154 (APSB18-31)
133607, #Adobe Flash Player <= 32.0.0.321 (APSB20-06)
137253, #Adobe Flash Player <= 32.0.0.371 (APSB20-30)
141494, #Adobe Flash Player <= 32.0.0.433 (APSB20-58)
							]
						}
					end
				end
			end
		end
	end
end
