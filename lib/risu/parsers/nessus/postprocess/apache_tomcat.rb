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
				class ApacheTomcatRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apache Tomcat Patch Rollup",
							:plugin_id => -99966,
							:plugin_name => "Missing the latest Apache Tomcat Patches",
							:item_name => "Update to the latest Apache Tomcat",
							:plugin_ids => [
								81649, #HIGH, Apache Tomcat 6.0.x < 6.0.43 Multiple Vulnerabilities (POODLE)
								12085, #MEDIUM, Apache Tomcat Default Files
								35806, #MEDIUM, Tomcat Sample App cal2.jsp 'time' Parameter XSS
								81650, #HIGH, Apache Tomcat 7.0.x < 7.0.57 Multiple Vulnerabilities (POODLE)
								83526, #MEDIUM, Apache Tomcat 7.0.x < 7.0.60 Multiple Vulnerabilities (FREAK)
								70414, #CRITICAL, Apache Tomcat / JBoss EJBInvokerServlet / JMXInvokerServlet Multiple Vulnerabilities
								134862, #HIGH, Apache Tomcat AJP Connector Request Injection (Ghostcat)
								133845, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.31 multiple vulnerabilities
111066, #HIGH, Apache Tomcat 7.0.0 < 7.0.89
141446, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.38
144050, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.40 multiple vulnerabilities
147164, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.43 multiple vulnerabilities
118036, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.34
132413, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.49 multiple vulnerabilities
132418, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.50
136807, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.55
138097, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.56
138574, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.57 multiple vulnerabilities
144054, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.60 multiple vulnerabilities
147019, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.63 multiple vulnerabilities
152183, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.68
126125, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.41 DoS
56070, #HIGH, Apache Tomcat 7.0.0 < 7.0.21
72692, #HIGH, Apache Tomcat 7.0.0 < 7.0.52
95438, #HIGH, Apache Tomcat 8.5.0 < 8.5.8 multiple vulnerabilities
121119, #HIGH, Apache Tomcat 7.0.0 < 7.0.70
62985, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.28 multiple vulnerabilities
62988, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.30 multiple vulnerabilities
63200, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.32
66427, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.33
66428, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.40 multiple vulnerabilities
72691, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.50 multiple vulnerabilities
74246, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.53 multiple vulnerabilities
103329, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.81 multiple vulnerabilities
103698, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.23
103782, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.82
106975, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.85 multiple vulnerabilities
121116, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.47 multiple vulnerabilities
121117, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.65
121118, #MEDIUM, Apache Tomcat 7.0.5 < 7.0.67
121120, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.76
136770, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.104
147163, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.108 multiple vulnerabilities
148405, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.107
77475, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.55 multiple vulnerabilities
83764, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.59
88936, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.68 multiple vulnerabilities
94578, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.5 multiple vulnerabilities
96003, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.9
99367, #MEDIUM, Apache Tomcat 8.0.0.RC1 < 8.0.43
100681, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.15
55859, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.20
57082, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.22 multiple vulnerabilities
57541, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.23
151502, #MEDIUM, Apache Tomcat 10.0.0.M1 < 10.0.6
152182, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.48
160894, #MEDIUM, Apache Tomcat 9.0.13 < 9.0.63
162498, #MEDIUM, Apache Tomcat 9.0.30 < 9.0.65
102587, #MEDIUM, Apache Tomcat 7.0.41 < 7.0.79
118035, #MEDIUM, Apache Tomcat 7.0.23 < 7.0.91
121121, #MEDIUM, Apache Tomcat 7.0.28 < 7.0.88
124064, #HIGH, Apache Tomcat 7.0.0 < 7.0.94 multiple vulnerabilities
166807, #HIGH, Apache Tomcat 8.5.0 < 8.5.83
169458, #HIGH, Apache Tomcat 8.5.83
162502, #MEDIUM, Apache Tomcat 8.5.50 < 8.5.82
166906, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.68
171657, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.71
173251, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.72
180194, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.80
159464, #LOW, Apache Tomcat 9.0.0.M1 < 9.0.62 Spring4Shell CVE-2021-43980
171351, #CRITICAL, Apache Tomcat SEoL (7.0.x)
74247, #MEDIUM, Apache Tomcat 7.0.0 < 7.0.54
83490, #HIGH, Apache Tomcat 6.0.x < 6.0.44 Multiple Vulnerabilities (FREAK)
72690, #MEDIUM, Apache Tomcat 6.0.x < 6.0.39 Multiple Vulnerabilities
74245, #MEDIUM, Apache Tomcat 6.0.x < 6.0.40 Multiple Vulnerabilities
81579, #MEDIUM, Apache Tomcat 6.0.x < 6.0.42 Handling Request Smuggling DoS
171656, #HIGH, Apache Tomcat 8.5.0 < 8.5.85
186364, #HIGH, Apache Tomcat 8.5.0 < 8.5.96
173256, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.86
180192, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.93
182811, #MEDIUM, Apache Tomcat 8.5.0 < 8.5.94 multiple vulnerabilities
197843, #HIGH, Apache Tomcat 7.0.0 < 7.0.100 multiple vulnerabilities
197848, #HIGH, Apache Tomcat 7.0.0 < 7.0.73 multiple vulnerabilities
197818, #CRITICAL, Apache Tomcat 7.0.0 < 7.0.72 multiple vulnerabilities
197820, #HIGH, Apache Tomcat 7.0.0 < 7.0.77
197823, #HIGH, Apache Tomcat 7.0.0 < 7.0.75
197831, #HIGH, Apache Tomcat 7.0.0 < 7.0.78
197838, #HIGH, Apache Tomcat 7.0.0 < 7.0.99 multiple vulnerabilities
213078, #CRITICAL, Apache Tomcat 9.0.0.M1 < 9.0.98 multiple vulnerabilities
232528, #CRITICAL, Apache Tomcat 9.0.0.M1 < 9.0.99
235034, #CRITICAL, Apache Tomcat 9.0.0.M1 < 9.0.104 multiple vulnerabilities
157117, #HIGH, Apache Tomcat 9.0.35 < 9.0.58 multiple vulnerabilities
186365, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.83
201848, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.90
237498, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.105
240060, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.106 multiple vulnerabilities
241680, #HIGH, Apache Tomcat 9.0.0.M1 < 9.0.107 multiple vulnerabilities
182809, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.81 multiple vulnerabilities
192042, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.86 multiple vulnerabilities
194473, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.44 multiple vulnerabilities
197830, #MEDIUM, Apache Tomcat 9.0.0.M1 < 9.0.46
							]
						}
					end
				end
			end
		end
	end
end
