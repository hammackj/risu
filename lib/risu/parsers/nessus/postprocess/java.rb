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
				class Java < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Java Patch Rollup",
							:plugin_id => -99999,
							:plugin_name => "Missing the latest Java Patches",
							:item_name => "Update to the latest Java",
							:plugin_ids => [
								66932, #Oracle Java SE Multiple Vulnerabilities (June 2013 CPU)
								65995, #Oracle Java SE Multiple Vulnerabilities (April 2013 CPU)
								59462, #Oracle Java SE Multiple Vulnerabilities (June 2012 CPU)
								62593, #Oracle Java SE Multiple Vulnerabilities (October 2012 CPU)
								45544, #Oracle Java JDK / JRE 6 < Update 20 Multiple Vulnerabilities
								45379, #Oracle Java SE Multiple Vulnerabilities (March 2010 CPU)
								65050, #Oracle Java JDK / JRE 6 < Update 43 Remote Code Execution (Windows)
								63521, #Oracle Java SE 7 < Update 11 Multiple Vulnerabilities
								65052, #Oracle Java JDK / JRE 7 < Update 17 Remote Code Execution (Windows)
								49996, #Oracle Java SE Multiple Vulnerabilities (October 2010 CPU)
								52002, #Oracle Java SE Multiple Vulnerabilities (February 2011 CPU)
								54997, #Oracle Java SE Multiple Vulnerabilities (June 2011 CPU)
								55958, #Oracle Java JRE Unsupported Version Detection
								56566, #Oracle Java SE Multiple Vulnerabilities (October 2011 CPU) (BEAST)
								57290, #Oracle Java JDK / JRE 6 < Update 30 Multiple Vulnerabilities
								57959, #Oracle Java SE Multiple Vulnerabilities (February 2012 CPU)
								64454, #Oracle Java SE Multiple Vulnerabilities (February 2013 CPU)
								64790, #Oracle Java SE Multiple Vulnerabilities (February 2013 CPU Update 1)
								76532, #Oracle Java SE Multiple Vulnerabilities (July 2014 CPU)
								73570, #Oracle Java SE Multiple Vulnerabilities (April 2014 CPU)
								70472, #Oracle Java SE Multiple Vulnerabilities (October 2013 CPU)
								71966, #Oracle Java SE Multiple Vulnerabilities (January 2014 CPU)
								61746, #Oracle Java JDK / JRE 6 < Update 35 SunToolKit getField() and getMethod() Access Issue
								42373, #Sun Java JRE Multiple Vulnerabilities (269868 / 269869 / 270476 ..)
								36034, #Sun Java JRE Multiple Vulnerabilities (254569 / 254611 / 254608 ..)
								40495, #Sun Java JRE Multiple Vulnerabilities (263408 / 263409 / 263428 ..)
								23931, #Sun Java JRE Multiple Vulnerabilities (102729 / 102732)
								25370, #Sun Java JRE Image Parsing Vulnerabilities (102934)
								24022, #Sun Java JRE GIF Image Handling Buffer Overflow (102760)
								26923, #Sun Java JRE / Web Start Multiple Vulnerabilities (103072, 103073, 103078, 103079, 103112)
								35030, #Sun Java JRE Multiple Vulnerabilities (244986 et al)
								31356, #Sun Java JRE Multiple Vulnerabilities (233321-233327)
								65048, #Oracle Java JDK / JRE 5 < Update 41 Remote Code Execution (Windows)
								33488, #Sun Java JDK/JRE 6 < Update 7 Multiple Vulnerabilities
								78481, #Oracle Java SE Multiple Vulnerabilities (October 2014 CPU)
								80908, #Oracle Java SE Multiple Vulnerabilities (January 2015 CPU) (POODLE)
								82820, #Oracle Java SE Multiple Vulnerabilities (April 2015 CPU) (FREAK)
								25124, #Sun Java Web Start Unauthorized Access (102881)
								25627, #Sun Java Web Start PersistenceService Application Traversal Arbitrary File Overwrite (102957)
								25903, #Sun Java JRE Font Parsing Privilege Escalation (103024)
								31344, #Sun Java JRE Applet Handling Privilege Escalation (231261)
								33487, #Sun Java JDK/JRE 5 < Update 16 Multiple Vulnerabilities
								25693, #Sun Java Web Start JNLP File Handling Overflow (102996)
								30148, #Sun Java JRE jpiexp32.dll NULL Pointer Remote DoS
								61681, #Oracle Java SE 7 < Update 7 Multiple Vulnerabilities
								84824, #Oracle Java SE Multiple Vulnerabilities (July 2015 CPU) (Bar Mitzvah)
								33486, #Sun Java J2SE 1.4.2 < Update 18 Multiple Vulnerabilities
								25709, #Sun Java JRE XML Signature Command Injection (102993)
								86542, #Oracle Java SE Multiple Vulnerabilities (October 2015 CPU)
								88045, #Oracle Java SE Multiple Vulnerabilities (January 2016 CPU) (SLOTH)
								90625, #Oracle Java SE Multiple Vulnerabilities (April 2016 CPU)
								90828, #Oracle Java SE Hotspot JSR 292 Method Handles RCE
								92516, #Oracle Java SE Multiple Vulnerabilities (July 2016 CPU)
								92516, #Oracle Java SE Multiple Vulnerabilities (July 2016 CPU)
								99588, #Oracle Java SE Multiple Vulnerabilities (April 2017 CPU)
								94138, #Oracle Java SE Multiple Vulnerabilities (October 2016 CPU)
								96628, #Oracle Java SE Multiple Vulnerabilities (January 2017 CPU) (SWEET32)
								101843, #Oracle Java SE Multiple Vulnerabilities (July 2017 CPU)
103963, #Oracle Java SE Multiple Vulnerabilities (October 2017 CPU)
30149, #Sun Java JRE External XML Entities Restriction Bypass (231246)
106190, #Oracle Java SE Multiple Vulnerabilities (January 2018 CPU)
109202, #Oracle Java SE Multiple Vulnerabilities (April 2018 CPU)
111163, #Oracle Java SE Multiple Vulnerabilities (July 2018 CPU)
118228, #Oracle Java SE Multiple Vulnerabilities (October 2018 CPU)
121231, #Oracle Java SE 1.7.x < 1.7.0_211 / 1.8.x < 1.8.0_201 / 1.11.x < 1.11.0_2 Multiple Vulnerabilities (January 2019 CPU)
124198, #Oracle Java SE 1.7.0_221 / 1.8.0_211 / 1.11.0_3 / 1.12.0_1 Multiple Vulnerabilities (Apr 2019 CPU)
126821, #Oracle Java SE 1.7.0_231 / 1.8.0_221 / 1.11.0_4 / 1.12.0_2 Multiple Vulnerabilities (Jul 2019 CPU)
130011, #Oracle Java SE 1.7.0_241 / 1.8.0_231 / 1.11.0_5 / 1.13.0_1 Multiple Vulnerabilities (Oct 2019 CPU) (Windows)
135592, #Oracle Java SE 1.7.0_261 / 1.8.0_251 / 1.11.0_7 / 1.14.0_1 Multiple Vulnerabilities (Apr 2020 CPU) 
138522, #Oracle Java SE 1.7.0_271 / 1.8.0_261 / 1.11.0_8 / 1.14.0_2 Multiple Vulnerabilities (Jul 2020 CPU)
132992, #Oracle Java SE 1.7.0_251 / 1.8.0_241 / 1.11.0_6 / 1.13.0_2 Multiple Vulnerabilities (Jan 2020 CPU)
145218, #Oracle Java SE 1.7.0_291 / 1.8.0_281 / 1.11.0_10 / 1.15.0_2 Information Disclosure (Windows Jan 2021 CPU)
141800, #Oracle Java SE 1.7.0_281 / 1.8.0_271 / 1.11.0_9 / 1.15.0_1 Multiple Vulnerabilities (Oct 2020 CPU)
148960, #Oracle Java SE 1.7.0_301 / 1.8.0_291 / 1.11.0_11 / 1.16.0_1 Multiple Vulnerabilities (Apr 2021 CPU)
152020, #Oracle Java SE 1.7.0_311 / 1.8.0_301 / 1.11.0_12 / 1.16.0_2 Multiple Vulnerabilities (July 2021 CPU)
154344, #Oracle Java SE 1.7.0_321 / 1.8.0_311 / 1.11.0_13 / 1.17.0_1 Multiple Vulnerabilities (October 2021 CPU)
156887, #Oracle Java SE 1.7.0_331 / 1.8.0_321 / 1.11.0_14 / 1.17.0_2 Multiple Vulnerabilities (January 2022 CPU) 
159975, #Oracle Java SE Multiple Vulnerabilities (April 2022 CPU)
166316, #Oracle Java SE Multiple Vulnerabilities (October 2022 CPU)
163304, #Oracle Java SE Multiple Vulnerabilities (July 2022 CPU)
170161, #Oracle Java SE Multiple Vulnerabilities (January 2023 CPU)
174511, #Oracle Java SE Multiple Vulnerabilities (April 2023 CPU)
178485, #Oracle Java SE Multiple Vulnerabilities (July 2023 CPU)
189116, #HIGH, Oracle Java SE Multiple Vulnerabilities (January 2024 CPU)
193574, #CRITICAL, Oracle Java (Apr 2024 CPU)
202704, #HIGH, Oracle Java SE Multiple Vulnerabilities (July2024 CPU)
183295, #MEDIUM, Oracle Java SE Multiple Vulnerabilities (October 2023 CPU)
209282, #MEDIUM, Oracle Java SE Multiple Vulnerabilities (October 2024 CPU)

							]
						}
					end
				end
			end
		end
	end
end
