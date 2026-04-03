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
71947, #CRITICAL, Adobe Reader < 10.1.9 / 11.0.6 Multiple Vulnerabilities (APSB14-01)
30200, #HIGH, Adobe Reader < 7.1.0 / 8.1.2 Multiple Vulnerabilities
33256, #HIGH, Adobe Reader < 7.1.0 / 8.1.2 SU1 Unspecified JavaScript Method Handling Arbitrary Code Execution
34695, #HIGH, Adobe Reader < 8.1.3 / 9.0 Multiple Vulnerabilities
35821, #CRITICAL, Adobe Reader < 9.1 / 8.1.4 / 7.1.1 Multiple Vulnerabilities
38746, #HIGH, Adobe Reader getAnnots() JavaScript Method PDF Handling Memory Corruption (APSB09-06)
39355, #HIGH, Adobe Reader < 9.1.2 / 8.1.6 / 7.1.3 Multiple Vulnerabilities
42120, #HIGH, Adobe Reader < 9.2 / 8.1.7 / 7.1.4  Multiple Vulnerabilities (APSB09-15)
43876, #CRITICAL, Adobe Reader < 9.3 / 8.2  Multiple Vulnerabilities (APSB10-02)
44644, #HIGH, Adobe Reader < 9.3.1 / 8.2.1  Multiple Vulnerabilities (APSB10-07)
45505, #HIGH, Adobe Reader < 9.3.2 / 8.2.2  Multiple Vulnerabilities (APSB10-09)
47165, #HIGH, Adobe Reader < 9.3.3 / 8.2.3  Multiple Vulnerabilities (APSB10-15)
48375, #HIGH, Adobe Reader < 9.3.4 / 8.2.4  Multiple Vulnerabilities (APSB10-17)
49173, #HIGH, Adobe Reader < 9.4 / 8.2.5 Multiple Vulnerabilities (APSB10-21)
50614, #HIGH, Adobe Reader < 9.4.1 Multiple Vulnerabilities (APSB10-28)
51925, #HIGH, Adobe Reader < 10.0.1 / 9.4.2 / 8.2.6 Multiple Vulnerabilities (APSB11-03)
55144, #HIGH, Adobe Reader < 10.1 / 9.4.5 / 8.3 Multiple Vulnerabilities (APSB11-16)
56198, #HIGH, Adobe Reader < 10.1.1 / 9.4.6 / 8.3.1 Multiple Vulnerabilities (APSB11-21
74012, #CRITICAL, Adobe Reader < 10.1.10 / 11.0.07 Multiple Vulnerabilities (APSB14-15)
58683, #HIGH, Adobe Reader < 10.1.3 / 9.5.1 Multiple Vulnerabilities (APSB12-08)
61562, #CRITICAL, Adobe Reader < 10.1.4 / 9.5.2 Multiple Vulnerabilities (APSB12-16)
63454, #CRITICAL, Adobe Reader < 11.0.1 / 10.1.5 / 9.5.3 Multiple Vulnerabilities (APSB13-02)
64786, #HIGH, Adobe Reader < 11.0.2 / 10.1.6 / 9.5.4 Multiple Vulnerabilities (APSB13-07)
66410, #CRITICAL, Adobe Reader < 11.0.3 / 10.1.7 / 9.5.5 Multiple Vulnerabilities (APSB13-15)
69846, #CRITICAL, Adobe Reader < 11.0.4 / 10.1.8 Multiple Vulnerabilities (APSB13-22)
71947, #CRITICAL, Adobe Reader < 10.1.9 / 11.0.6 Multiple Vulnerabilities (APSB14-01)
57043, #CRITICAL, Adobe Reader < 9.4.7 Multiple Memory Corruption Vulnerabilities (APSB11-30)
57484, #CRITICAL, Adobe Reader < 10.1.2 / 9.5 Multiple Vulnerabilities (APSB12-01)
24002, #HIGH, Adobe Reader < 6.0.6 / 7.0.9 Multiple Vulnerabilities
23776, #HIGH, Adobe Reader < 8.0 AcroPDF ActiveX Control Multiple Vulnerabilities
23975, #HIGH, Adobe PDF Plug-In < 8.0 / 7.0.9 / 6.0.6 Multiple Vulnerabilities (APSB07-01)
52672, #HIGH, Adobe Reader 9.x / 10.x Unspecified Memory Corruption (APSB11-06)
53451, #HIGH, Adobe Reader 9.x / 10.x Multiple Vulnerabilities (APSB11-08)
21698, #MEDIUM, Adobe Reader < 7.0.8 Multiple Unspecified Vulnerabilities
77712, #CRITICAL, Adobe Reader < 10.1.12 / 11.0.09 Multiple Vulnerabilities (APSB14-20)
79856, #CRITICAL, Adobe Reader < 10.1.13 / 11.0.10 Multiple Vulnerabilities (APSB14-28)
77175, #CRITICAL, Adobe Reader < 10.1.11 / 11.0.08 Sandbox Bypass (APSB14-19)
83471, #CRITICAL, Adobe Reader < 10.1.14 / 11.0.11 Multiple Vulnerabilities (APSB15-10)
40494, #HIGH, Adobe Reader < 9.1.3 Flash Handling Unspecified Arbitrary Code Execution (APSB09-10)
27584, #HIGH, Adobe Reader < 8.1.1 Crafted PDF File Arbitrary Code Execution 
86403, #CRITICAL, Adobe Reader < 2015.006.30094 / 2015.009.20069 Multiple Vulnerabilities (APSB15-24)
87918, #CRITICAL, Adobe Reader < 15.006.30119 / 15.010.20056 Multiple Vulnerabilities (APSB16-02)
89831, #CRITICAL, Adobe Reader < 15.006.30121 / 15.010.20060 Multiple Vulnerabilities (APSB16-09)
70343, #HIGH, Adobe Reader 11.0.4 Crafted PDF File Handling JavaScript Scheme URI Execution (APSB13-25)
91097, #CRITICAL, Adobe Reader < 15.006.30172 / 15.016.20039 Multiple Vulnerabilities (APSB16-14)
92035, #CRITICAL, Adobe Reader < 15.006.30198 / 15.017.20050 Multiple Vulnerabilities (APSB16-26)
94072, #CRITICAL, Adobe Reader < 15.006.30243 / 15.020.20039 Multiple Vulnerabilities (APSB16-33)
96453, #CRITICAL, Adobe Reader < 15.006.30279 / 15.023.20053 Multiple Vulnerabilities (APSB17-01)
99374, #CRITICAL, Adobe Reader < 2015.006.30306 / 2017.009.20044 Multiple Vulnerabilities (APSB17-11)
102428, #CRITICAL, Adobe Reader < 11.0.21 / 2015.006.30355 / 2017.011.30066 / 2017.012.20098 Multiple Vulnerabilities (APSB17-24)
104627, #CRITICAL, Adobe Reader < 11.0.23 / 2015.006.30392 / 2017.011.30068 / 2018.009.20044 Multiple Vulnerabilities (APSB17-36)
104626, #CRITICAL, Adobe Acrobat < 11.0.23 / 2015.006.30392 / 2017.011.30068 / 2018.009.20044 Multiple Vulnerabilities (APSB17-36)
111794, #HIGH, Adobe Reader < 2015.006.30448 / 2017.011.30099 / 2018.011.20058 Multiple Vulnerabilities (APSB18-29)
117600, #HIGH, Adobe Reader < 2015.006.30452 / 2017.011.30102 / 2018.011.20063 Multiple Vulnerabilities (APSB18-34)
117877, #HIGH, Adobe Reader < 2015.006.30456 / 2017.011.30105 / 2019.008.20071 Multiple Vulnerabilities (APSB18-30)
106846, #CRITICAL, Adobe Reader <= 2015.006.30394 / 2017.011.30070 / 2018.009.20050 Multiple Vulnerabilities (APSB18-02)
109896, #CRITICAL, Adobe Reader < 2015.006.30418 / 2017.011.30080 / 2018.011.20040 Multiple Vulnerabilities (APSB18-09)
111012, #CRITICAL, Adobe Reader < 2015.006.30434 / 2017.011.30096 / 2018.011.20055 Multiple Vulnerabilities (APSB18-21)
119676, #CRITICAL, Adobe Reader < 2015.006.30461 / 2017.011.30110 / 2019.010.20064 Multiple Vulnerabilities (APSB18-41)
120952, #HIGH, Adobe Reader < 2015.006.30464 / 2017.011.30113 / 2019.010.20069 Multiple Vulnerabilities (APSB19-02)
122253, #CRITICAL, Adobe Reader < 2015.006.30475 / 2017.011.30120 / 2019.010.20091 Multiple Vulnerabilities (APSB19-07)
122368, #HIGH, Adobe Reader < 2015.006.30482 / 2017.011.30127 / 2019.010.20098 Vulnerability (APSB19-13)
117876, #HIGH, Adobe Acrobat < 2015.006.30456 / 2017.011.30105 / 2019.008.20071 Multiple Vulnerabilities (APSB18-30)
120951, #HIGH, Adobe Acrobat < 2015.006.30464 / 2017.011.30113 / 2019.010.20069 Multiple Vulnerabilities (APSB19-02)
122252, #CRITICAL, Adobe Acrobat < 2015.006.30475 / 2017.011.30120 / 2019.010.20091 Multiple Vulnerabilities (APSB19-07)
122367, #HIGH, Adobe Acrobat < 2015.006.30482 / 2017.011.30127 / 2019.010.20098 Vulnerability (APSB19-13)
119675, #CRITICAL, Adobe Acrobat < 2015.006.30461 / 2017.011.30110 / 2019.010.20064 Multiple Vulnerabilities (APSB18-41)
125222, #CRITICAL, Adobe Reader < 2015.006.30497 / 2017.011.30142 / 2019.012.20034 Multiple Vulnerabilities (APSB19-18)
127904, #CRITICAL, Adobe Reader < 2015.006.30499 / 2017.011.30144 / 2019.012.20036 Multiple Vulnerabilities (APSB19-41)
124008, #CRITICAL, Adobe Reader < 2015.006.30493 / 2017.011.30138 / 2019.010.20099 Multiple Vulnerabilities (APSB19-17)
118932, #MEDIUM, Adobe Reader < 2015.006.30457 / 2017.011.30106 / 2019.008.20081 Vulnerability (APSB18-40)
142467, #HIGH, Adobe Reader < 2017.011.30180 / 2020.001.30010 / 2020.013.20064 Multiple Vulnerabilities (APSB20-67)
156668, #HIGH, Adobe Reader < 17.011.30207 / 20.004.30020 / 21.011.20039 Multiple Vulnerabilities (APSB22-01)
159657, #HIGH, Adobe Reader < 17.012.30227 / 20.005.30331 / 22.001.20112 Multiple Vulnerabilities (APSB22-16)
129978, #CRITICAL, Adobe Reader < 2015.006.30504 / 2017.011.30150 / 2019.021.20047 Multiple Vulnerabilities (APSB19-49)
132037, #CRITICAL, Adobe Reader < 2015.006.30508 / 2017.011.30156 / 2019.021.20058 Multiple Vulnerabilities (APSB19-55)
133673, #CRITICAL, Adobe Reader < 2015.006.30510 / 2020.006.20034 Multiple Vulnerabilities (APSB20-05)
134706, #CRITICAL, Adobe Reader < 2015.006.30518 / 2017.011.30166 / 2020.006.20042 Multiple Vulnerabilities (APSB20-13)
146422, #HIGH, Adobe Reader < 2017.011.30190 / 2020.001.30020 / 2021.001.20135 Multiple Vulnerabilities (APSB21-09)
149379, #HIGH, Adobe Reader < 2017.011.30196 / 2020.001.30025 / 2021.001.20155 Multiple Vulnerabilities (APSB21-29)
151586, #HIGH, Adobe Reader < 2017.011.30199 / 2020.004.30006 / 2021.005.20058 Multiple Vulnerabilities (APSB21-51)
185552, #HIGH, Adobe Acrobat < 20.005.30539 / 23.006.20380 Multiple Vulnerabilities (APSB23-54)
185553, #HIGH, Adobe Reader < 20.005.30539 / 23.006.20380 Multiple Vulnerabilities (APSB23-54)
139581, #HIGH, Adobe Reader < 2015.006.30527 / 2017.011.30175 / 2020.001.30005 / 2020.012.20041 Multiple Vulnerabilities (APSB20-48)
163033, #HIGH, Adobe Reader < 17.012.30249 / 20.005.30362 / 22.001.20169 Multiple Vulnerabilities (APSB22-32)
163955, #HIGH, Adobe Reader < 17.012.30262 / 20.005.30381 / 22.002.20191 Multiple Vulnerabilities (APSB22-39)
169880, #HIGH, Adobe Reader < 20.005.30436 / 22.003.20310 Multiple Vulnerabilities (APSB23-01)
181276, #HIGH, Adobe Reader < 20.005.30524 / 23.006.20320 Vulnerability (APSB23-34)
174135, #HIGH, Adobe Reader < 20.005.30467 / 23.001.20143 Multiple Vulnerabilities (APSB23-24)
179484, #HIGH, Adobe Reader < 20.005.30514.10514 / 23.003.20269 Multiple Vulnerabilities (APSB23-30)
166043, #HIGH, Adobe Reader < 20.005.30407 / 22.003.20258 Multiple Vulnerabilities (APSB22-46)
150341, #MEDIUM, Adobe Reader < 2017.011.30197 / 2020.004.30005 / 2021.005.20048 Multiple Vulnerabilities (APSB21-37)
153364, #MEDIUM, Adobe Reader < 2017.011.30202 / 2020.004.30015 / 2021.007.20091 Multiple Vulnerabilities (APSB21-55)
144107, #MEDIUM, Adobe Reader < 2017.011.30188 / 2020.001.30018 / 2020.013.20074 Vulnerability (APSB20-75)
197027, #HIGH, Adobe Reader < 20.005.30635 / 24.002.20759 Multiple Vulnerabilities (APSB24-29)
264632, #HIGH, Adobe Reader < 20.005.30793 / 25.001.20693 Multiple Vulnerabilities (APSB25-85)

							]
						}
					end
				end
			end
		end
	end
end
