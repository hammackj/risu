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
				class AdobeReader < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Reader Patch Rollup",
							:plugin_id => -99998,
							:plugin_name => "Missing the latest Adobe Reader Patches",
							:item_name => "Update to the latest Adobe Reader",
							:plugin_ids => [
71947, #Adobe Reader < 10.1.9 / 11.0.6 Multiple Vulnerabilities (APSB14-01)
30200, #Adobe Reader < 7.1.0 / 8.1.2 Multiple Vulnerabilities
33256, #Adobe Reader < 7.1.0 / 8.1.2 SU1 Unspecified JavaScript Method Handling Arbitrary Code Execution
34695, #Adobe Reader < 8.1.3 / 9.0 Multiple Vulnerabilities
35821, #Adobe Reader < 9.1 / 8.1.4 / 7.1.1 Multiple Vulnerabilities
38746, #Adobe Reader getAnnots() JavaScript Method PDF Handling Memory Corruption (APSB09-06)
39355, #Adobe Reader < 9.1.2 / 8.1.6 / 7.1.3 Multiple Vulnerabilities
42120, #Adobe Reader < 9.2 / 8.1.7 / 7.1.4  Multiple Vulnerabilities (APSB09-15)
43876, #Adobe Reader < 9.3 / 8.2  Multiple Vulnerabilities (APSB10-02)
44644, #Adobe Reader < 9.3.1 / 8.2.1  Multiple Vulnerabilities (APSB10-07)
45505, #Adobe Reader < 9.3.2 / 8.2.2  Multiple Vulnerabilities (APSB10-09)
47165, #Adobe Reader < 9.3.3 / 8.2.3  Multiple Vulnerabilities (APSB10-15)
48375, #Adobe Reader < 9.3.4 / 8.2.4  Multiple Vulnerabilities (APSB10-17)
49173, #Adobe Reader < 9.4 / 8.2.5 Multiple Vulnerabilities (APSB10-21)
50614, #Adobe Reader < 9.4.1 Multiple Vulnerabilities (APSB10-28)
51925, #Adobe Reader < 10.0.1 / 9.4.2 / 8.2.6 Multiple Vulnerabilities (APSB11-03)
55144, #Adobe Reader < 10.1 / 9.4.5 / 8.3 Multiple Vulnerabilities (APSB11-16)
56198, #Adobe Reader < 10.1.1 / 9.4.6 / 8.3.1 Multiple Vulnerabilities (APSB11-21, APSB11-24)
74012, #Adobe Reader < 10.1.10 / 11.0.07 Multiple Vulnerabilities (APSB14-15)
58683, #Adobe Reader < 10.1.3 / 9.5.1 Multiple Vulnerabilities (APSB12-08)
61562, #Adobe Reader < 10.1.4 / 9.5.2 Multiple Vulnerabilities (APSB12-16)
63454, #Adobe Reader < 11.0.1 / 10.1.5 / 9.5.3 Multiple Vulnerabilities (APSB13-02)
64786, #Adobe Reader < 11.0.2 / 10.1.6 / 9.5.4 Multiple Vulnerabilities (APSB13-07)
66410, #Adobe Reader < 11.0.3 / 10.1.7 / 9.5.5 Multiple Vulnerabilities (APSB13-15)
69846, #Adobe Reader < 11.0.4 / 10.1.8 Multiple Vulnerabilities (APSB13-22)
71947, #Adobe Reader < 10.1.9 / 11.0.6 Multiple Vulnerabilities (APSB14-01)
57043, #Adobe Reader < 9.4.7 Multiple Memory Corruption Vulnerabilities (APSB11-30)
57484, #Adobe Reader < 10.1.2 / 9.5 Multiple Vulnerabilities (APSB12-01)
24002, #Adobe Reader < 6.0.6 / 7.0.9 Multiple Vulnerabilities
23776, #Adobe Reader < 8.0 AcroPDF ActiveX Control Multiple Vulnerabilities
23975, #Adobe PDF Plug-In < 8.0 / 7.0.9 / 6.0.6 Multiple Vulnerabilities (APSB07-01)
52672, #Adobe Reader 9.x / 10.x Unspecified Memory Corruption (APSB11-06)
53451, #Adobe Reader 9.x / 10.x Multiple Vulnerabilities (APSB11-08)
21698, #Adobe Reader < 7.0.8 Multiple Unspecified Vulnerabilities
77712, #Adobe Reader < 10.1.12 / 11.0.09 Multiple Vulnerabilities (APSB14-20)
79856, #Adobe Reader < 10.1.13 / 11.0.10 Multiple Vulnerabilities (APSB14-28)
77175, #Adobe Reader < 10.1.11 / 11.0.08 Sandbox Bypass (APSB14-19)
83471, #Adobe Reader < 10.1.14 / 11.0.11 Multiple Vulnerabilities (APSB15-10)
40494, #Adobe Reader < 9.1.3 Flash Handling Unspecified Arbitrary Code Execution (APSB09-10)
27584, #Adobe Reader < 8.1.1 Crafted PDF File Arbitrary Code Execution
86403, #Adobe Reader <= 10.1.15 / 11.0.12 / 2015.006.30060 / 2015.008.20082 Multiple Vulnerabilities (APSB15-24)
87918, #Adobe Reader < 11.0.14 / 15.006.30119 / 15.010.20056 Multiple Vulnerabilities (APSB16-02)
89831, #Adobe Reader < 11.0.15 / 15.006.30121 / 15.010.20060 Multiple Vulnerabilities (APSB16-09)
70343, #Adobe Reader 11.0.4 Crafted PDF File Handling JavaScript Scheme URI Execution (APSB13-25)
91097, #Adobe Reader < 11.0.16 / 15.006.30172 / 15.016.20039 Multiple Vulnerabilities (APSB16-14)
92035, #Adobe Reader < 11.0.17 / 15.006.30198 / 15.017.20050 Multiple Vulnerabilities (APSB16-26)
94072, #Adobe Reader < 11.0.18 / 15.006.30243 / 15.020.20039 Multiple Vulnerabilities (APSB16-33)
96453, #Adobe Reader < 11.0.19 / 15.006.30279 / 15.023.20053 Multiple Vulnerabilities (APSB17-01)
99374, #Adobe Reader < 11.0.20 / 2015.006.30306 / 2017.009.20044 Multiple Vulnerabilities (APSB17-11)
102428, #Adobe Reader < 11.0.21 / 2015.006.30355 / 2017.011.30066 / 2017.012.20098 Multiple Vulnerabilities (APSB17-24)
104627, #Adobe Reader < 11.0.23 / 2015.006.30392 / 2017.011.30068 / 2018.009.20044 Multiple Vulnerabilities (APSB17-36)
104626, #Adobe Acrobat < 11.0.23 / 2015.006.30392 / 2017.011.30068 / 2018.009.20044 Multiple Vulnerabilities (APSB17-36)
111794, #Adobe Reader <= 2015.006.30434 / 2017.011.30096 / 2018.011.20055 Multiple Vulnerabilities (APSB18- 29)
117600, #Adobe Reader <= 2015.006.30448 / 2017.011.30099 / 2018.011.20058 Multiple Vulnerabilities (APSB18- 34)
117877, #Adobe Reader <= 2015.006.30452 / 2017.011.30102 / 2018.011.20063 Multiple Vulnerabilities (APSB18- 30)
106846, #Adobe Reader <= 2015.006.30394 / 2017.011.30070 / 2018.009.20050 Multiple Vulnerabilities (APSB18- 02)
109896, #Adobe Reader <= 2015.006.30417 / 2017.011.30079 / 2018.011.20038 Multiple Vulnerabilities (APSB18- 09)
111012, #Adobe Reader <= 2015.006.30418 / 2017.011.30080 / 2018.011.20040 Multiple Vulnerabilities (APSB18- 21)
119676, #Adobe Reader <= 15.006.30457 / 17.011.30106 / 19.008.20081 Multiple Vulnerabilities (APSB18-41)
120952, #Adobe Reader <= 2015.006.30461 / 2017.011.30110 / 2019.010.20064 Multiple Vulnerabilities (APSB19- 02)
122253, #Adobe Reader < 2019.010.20091 / 2017.011.30120 / 2015.006.30475 Multiple Vulnerabilities (APSB19- 07)
122368, #Adobe Reader <= 2015.006.30475 / 2017.011.30120 / 2019.010.20091 Vulnerability (APSB19-13)
117876, #Adobe Acrobat <= 15.006.30452 / 17.011.30102 / 18.011.20063 Multiple Vulnerabilities (APSB18-30)
120951, #Adobe Acrobat <= 2015.006.30461 / 2017.011.30110 / 2019.010.20064 Multiple Vulnerabilities (APSB19- 02)
122252, #Adobe Acrobat < 2019.010.20091 / 2017.011.30120 / 2015.006.30475 Multiple Vulnerabilities (APSB19- 07)
122367, #Adobe Acrobat <= 2015.006.30475 / 2017.011.30120 / 2019.010.20091 Vulnerability (APSB19-13)
119675, #Adobe Acrobat <= 15.006.30457 / 17.011.30106 / 19.008.20081 Multiple Vulnerabilities (APSB18-41)
125222, #Adobe Reader <= 2015.006.30493 / 2017.011.30138 / 2019.010.20099 Multiple Vulnerabilities (APSB19- 18)
127904, #Adobe Reader <= 2015.006.30498 / 2017.011.30143 / 2019.012.20035 Multiple Vulnerabilities (APSB19- 41)
124008, #Adobe Reader <= 2015.006.30482 / 2017.011.30127 / 2019.010.20098 Multiple Vulnerabilities (APSB19- 17)
118932, #Adobe Reader <= 15.006.30456 / 17.011.30105 / 19.008.20080 NTLM SSO Hash Theft (APSB18-40)

							]
						}
					end
				end
			end
		end
	end
end
