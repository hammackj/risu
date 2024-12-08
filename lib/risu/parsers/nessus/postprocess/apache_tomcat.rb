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
								81649, #Apache Tomcat 6.0.x < 6.0.43 Multiple Vulnerabilities (POODLE)
								12085, #Apache Tomcat Servlet / JSP Container Default Files
								35806, #Tomcat Sample App cal2.jsp 'time' Parameter XSS
								81650, #Apache Tomcat 7.0.x < 7.0.57 Multiple Vulnerabilities (POODLE)
								83526, #Apache Tomcat 7.0.x < 7.0.60 Multiple Vulnerabilities (FREAK)
								70414, #Apache Tomcat / JBoss EJBInvokerServlet / JMXInvokerServlet Multiple Vulnerabilities
								134862, #Apache Tomcat AJP Connector Request Injection (Ghostcat)
								133845, #Apache Tomcat 7.0.x < 7.0.100 / 8.5.x < 8.5.51 / 9.0.x < 9.0.31 Multiple Vulnerabilities
111066, #Apache Tomcat 7.0.41 < 7.0.90 Multiple Vulnerabilities
141446, #Apache Tomcat 8.5.x < 8.5.58 / 9.0.x < 9.0.38 HTTP/2 Request Mix-Up
144050, #Apache Tomcat 9.x < 9.0.40 Information Disclosure
147164, #Apache Tomcat 9.0.0.M1 < 9.0.43 Multiple Vulnerabilities
118036, #Apache Tomcat 8.5.x < 8.5.34 Open Redirect Weakness
132413, #Apache Tomcat 8.5.0 < 8.5.49 Privilege Escalation
132418, #Apache Tomcat 8.5.0 < 8.5.50 Privilege Escalation Vulnerability
136807, #Apache Tomcat 8.5.x < 8.5.55 Remote Code Execution
138097, #Apache Tomcat 8.5.0 < 8.5.56 DoS
138574, #Apache Tomcat 8.5.0 < 8.5.57 Multiple Vulnerabilities
144054, #Apache Tomcat 8.5.x < 8.5.60 Information Disclosure
147019, #Apache Tomcat 8.5.0 < 8.5.63 Multiple Vulnerabilities
152183, #Apache Tomcat 8.5.0 < 8.5.68 vulnerability
126125, #Apache Tomcat 8.5.0 < 8.5.41 DoS
56070, #Apache Tomcat 7.x < 7.0.21 Arbitrary AJP Message Control
72692, #Apache Tomcat 7.0.x < 7.0.52 Content-Type DoS
95438, #Apache Tomcat 6.0.x < 6.0.48 / 7.0.x < 7.0.73 / 8.0.x < 8.0.39 / 8.5.x < 8.5.8 / 9.0.x < 9.0.0.M13 Multiple Vulnerabilities
121119, #Apache Tomcat 7.0.x < 7.0.70 / 8.0.x < 8.0.36 / 8.5.x < 8.5.3 / 9.0.x < 9.0.0.M8 Denial of Service
62985, #Apache Tomcat 7.0.x < 7.0.28 Multiple DoS
62988, #Apache Tomcat 7.0.x < 7.0.30 Multiple Vulnerabilities
63200, #Apache Tomcat 7.0.x < 7.0.32 XSRF Filter Bypass
66427, #Apache Tomcat 7.0.x < 7.0.33 Session Fixation
66428, #Apache Tomcat 7.0.x < 7.0.40 Multiple Vulnerabilities
72691, #Apache Tomcat 7.0.x < 7.0.50 Multiple Vulnerabilities
74246, #Apache Tomcat 7.0.x < 7.0.53 Multiple Vulnerabilities
103329, #Apache Tomcat 7.0.x < 7.0.81 Multiple Vulnerabilities
103698, #Apache Tomcat 7.0.x < 7.0.82 / 8.5.x < 8.5.23 Multiple Vulnerabilities
103782, #Apache Tomcat 7.0.x < 7.0.82 Multiple Vulnerabilities
106975, #Apache Tomcat 7.0.0 < 7.0.85 Security Constraint Weakness
121116, #Apache Tomcat 7.0.x < 7.0.47 / 8.0.x < 8.0.0-RC3 Information Disclosure
121117, #Apache Tomcat 7.0.x < 7.0.65 / 8.0.x < 8.0.27 Directory Traversal
121118, #Apache Tomcat < 7.0.67 Session Fixation
121120, #Apache Tomcat 7.0.x < 7.0.76 / 8.0.x < 8.0.42 / 8.5.x < 8.5.12 / 9.0.x < 9.0.0.M18 Improper Access Control
136770, #Apache Tomcat 7.0.0 < 7.0.104 Remote Code Execution
147163, #Apache Tomcat 7.0.0 < 7.0.108 RCE
148405, #Apache Tomcat 7.0.0 < 7.0.107 Information Disclosure
77475, #Apache Tomcat 7.0.x < 7.0.55 Multiple Vulnerabilities
83764, #Apache Tomcat 7.0.x < 7.0.59 Security Manager Bypass
88936, #Apache Tomcat 7.0.x < 7.0.68 Multiple Vulnerabilities
94578, #Apache Tomcat 6.0.x < 6.0.47 / 7.0.x < 7.0.72 / 8.0.x < 8.0.37 / 8.5.x < 8.5.5 / 9.0.x < 9.0.0.M10 Multiple Vulnerabilities
96003, #Apache Tomcat 6.0.16 < 6.0.50 / 7.0.x < 7.0.75 / 8.0.x < 8.0.41 / 8.5.x < 8.5.9 / 9.0.x < 9.0.0.M15 NIO HTTP Connector Information Disclosure
99367, #Apache Tomcat 6.0.x < 6.0.53 / 7.0.x < 7.0.77 / 8.0.x < 8.0.43 Pipelined Requests Information Disclosure
100681, #Apache Tomcat 7.0.x < 7.0.78 / 8.0.x < 8.0.44 / 8.5.x < 8.5.15 / 9.0.x < 9.0.0.M21 Remote Error Page Manipulation
55859, #Apache Tomcat 7.x < 7.0.20 'jsvc' Information Disclosure
57082, #Apache Tomcat 7.x < 7.0.22 Multiple Vulnerabilities
57541, #Apache Tomcat 7.x < 7.0.23 Hash Collision DoS
151502, #Apache Tomcat 7.0.x <= 7.0.108 / 8.5.x <= 8.5.65 / 9.0.x <= 9.0.45 / 10.0.x <= 10.0.5 vulnerability 
152182, #Apache Tomcat 9.0.0.M1 < 9.0.48 vulnerability
160894, #Apache Tomcat 9.0.13 < 9.0.63 vulnerability 
162498, #Apache Tomcat 9.0.30 < 9.0.65 vulnerability
102587, #Apache Tomcat 7.0.41 < 7.0.79 Cache Poisoning Vulnerability
118035, #Apache Tomcat 7.0.0 < 7.0.91 Open Redirect Weakness
121121, #Apache Tomcat 7.0.x < 7.0.88 Denial of Service
124064, #Apache Tomcat 7.0.0 < 7.0.94 Remote Code Execution Vulnerability (Windows)
166807, #Apache Tomcat 8.5.x < 8.5.83 Request Smuggling Vulnerability
169458, #Apache Tomcat 8.5.0 < 8.5.84
162502, #Apache Tomcat 8.5.50 < 8.5.82 vulnerability
166906, #Apache Tomcat 9.0.0-M1 < 9.0.68 Request Smuggling Vulnerability 
171657, #Apache Tomcat 9.0.0.M1 < 9.0.71
173251, #Apache Tomcat 9.0.0.M1 < 9.0.72
180194, #Apache Tomcat 9.0.0.M1 < 9.0.80
159464, #Apache Tomcat 9.0.0.M1 < 9.0.62 Spring4Shell (CVE-2022-22965) Mitigations
171351, #Apache Tomcat SEoL (7.0.x)
74247, #Apache Tomcat 7.0.x < 7.0.54 XML Parser Information Disclosure
83490, #Apache Tomcat 6.0.x < 6.0.44 Multiple Vulnerabilities
72690, #Apache Tomcat 6.0.x < 6.0.39 Multiple Vulnerabilities
74245, #Apache Tomcat 6.0.x < 6.0.40 Multiple Vulnerabilities
81579, #Apache Tomcat 6.0.x < 6.0.42 Handling Request Smuggling DoS
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

							]
						}
					end
				end
			end
		end
	end
end
