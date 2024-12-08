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
				class Wireshark < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Wireshark Patch Rollups",
							:plugin_id => -99992,
							:plugin_name => "Missing the latest Wireshark Patches",
							:item_name => "Update to the latest Wireshark",
							:plugin_ids => [
61572, #Wireshark 1.6.x < 1.6.10 Multiple Vulnerabilities
64361, #Wireshark 1.6.x < 1.6.13 Multiple Vulnerabilities
65253, #Wireshark 1.6.x < 1.6.14 Multiple Vulnerabilities
66543, #Wireshark 1.6.x < 1.6.15 ASN.1 BER Dissector Malformed Packet Handling DoS
65254, #Wireshark 1.8.x < 1.8.6 Multiple Vulnerabilities
66544, #Wireshark 1.8.x < 1.8.7 Multiple Vulnerabilities
72941, #Wireshark 1.8.x < 1.8.13 Multiple Vulnerabilities
66895, #Wireshark 1.8.x < 1.8.8 Multiple Vulnerabilities
69104, #Wireshark 1.8.x < 1.8.9 Multiple Vulnerabilities
69880, #Wireshark 1.8.x < 1.8.10 Multiple DoS
70763, #Wireshark 1.8.x < 1.8.11 Multiple DoS Vulnerabilities
71520, #Wireshark 1.8.x < 1.8.12 Multiple DoS
56164, #Wireshark 1.6.x < 1.6.2 Multiple Vulnerabilities
56690, #Wireshark 1.6.x < 1.6.3 Multiple Vulnerabilities
58518, #Wireshark 1.6.x < 1.6.6 Multiple Denial of Service Vulnerabilities
59240, #Wireshark 1.6.x < 1.6.8 Multiple Denial of Service Vulnerabilities
60117, #Wireshark 1.6.x < 1.6.9 Multiple Denial of Service Vulnerabilities
62477, #Wireshark 1.6.x < 1.6.11 DRDA DoS
63095, #Wireshark 1.6.x < 1.6.12 Multiple Vulnerabilities
66894, #Wireshark 1.6.x < 1.6.16 Multiple DoS Vulnerabilities
57539, #Wireshark 1.6.x < 1.6.5 Multiple Vulnerabilities
53473, #Wireshark < 1.2.16 / 1.4.5 Multiple Vulnerabilities
57538, #Wireshark 1.4.x < 1.4.11 Multiple Vulnerabilities
61571, #Wireshark 1.4.x < 1.4.15 Multiple Vulnerabilities
54942, #Wireshark < 1.2.17 / 1.4.7 Multiple DoS Vulnerabilities
55510, #Wireshark < 1.2.18 / 1.4.8 / 1.6.1 Multiple Denial of Service Vulnerabilities
56163, #Wireshark 1.4.x < 1.4.9 Multiple Vulnerabilities
56689, #Wireshark 1.4.x < 1.4.10 Multiple Vulnerabilities
58517, #Wireshark 1.4.x < 1.4.12 Multiple Denial of Service Vulnerabilities
59239, #Wireshark 1.4.x < 1.4.13 Multiple Denial of Service Vulnerabilities
60116, #Wireshark 1.4.x < 1.4.14 Multiple Denial of Service Vulnerabilities
51458, #Wireshark < 1.2.14 / 1.4.3 Multiple Vulnerabilities
52502, #Wireshark < 1.2.15 / 1.4.4 Multiple Vulnerabilities
83488, #Wireshark 1.10.x < 1.10.14 / 1.12.x < 1.12.5 Multiple DoS Vulnerabilities
36127, #Wireshark / Ethereal 0.99.2 to 1.0.6 Multiple Vulnerabilities
40335, #Wireshark / Ethereal 0.9.2 to 1.2.0 Multiple Vulnerabilities
43350, #Wireshark / Ethereal 0.9.0 to 1.2.4 Multiple Vulnerabilities
44338, #Wireshark / Ethereal Dissector LWRES Multiple Buffer Overflows
46864, #Wireshark / Ethereal < 1.0.14 / 1.2.9 Multiple Vulnerabilities
48213, #Wireshark / Ethereal < 1.0.15 / 1.2.10 Multiple Vulnerabilities
48943, #Wireshark / Ethereal < 1.2.11 / 1.0.16 Path Subversion Arbitrary DLL Injection Code Execution
89103, #Wireshark 1.12.x < 1.12.10 Multiple Vulnerabilities
90786, #Wireshark 1.12.x < 1.12.11 Multiple DoS
90787, #Wireshark 2.0.x < 2.0.3 Multiple DoS
92817, #Wireshark 2.0.x < 2.0.5 Multiple DoS
99437, #Wireshark 2.0.x < 2.0.12 / 2.2.x < 2.2.6 Multiple DoS
97574, #Wireshark 2.0.x < 2.0.11 / 2.2.x < 2.2.5 Multiple DoS
89104, #Wireshark 2.0.x < 2.0.2 Multiple Vulnerabilities
91821, #Wireshark 2.0.x < 2.0.4 Multiple DoS
100671, #Wireshark 2.0.x < 2.0.13 / 2.2.x < 2.2.7 Multiple DoS
91820, #Wireshark 1.12.x < 1.12.12 Multiple DoS - 91820
92816, #Wireshark 1.12.x < 1.12.13 Multiple DoS - 92816
50678, #Wireshark < 1.2.13 / 1.4.2 Multiple Vulnerabilities
107093, #Wireshark 2.2.x < 2.2.13 / 2.4.x < 2.4.5 Multiple DoS Vulnerabilities
108885, #Wireshark 2.2.x < 2.2.14 / 2.4.x < 2.4.6 Multiple Vulnerabilities
110269, #Wireshark 2.2.x < 2.2.15 / 2.4.x < 2.4.7 / 2.6.x < 2.6.1 Multiple Vulnerabilities
111387, #Wireshark 2.2.x < 2.2.16 / 2.4.x < 2.4.8 / 2.6.x < 2.6.2 Multiple Vulnerabilities
117339, #Wireshark 2.2.x < 2.2.17 / 2.4.x < 2.4.9 / 2.6.x < 2.6.3 Multiple Vulnerabilities
101898, #Wireshark 2.0.x < 2.0.14 / 2.2.x < 2.2.8 Multiple DoS
102920, #Wireshark 2.2.x < 2.2.9 Multiple DoS
103985, #Wireshark 2.2.x < 2.2.10 Multiple DoS
105007, #Wireshark 2.2.x < 2.2.11 / 2.4.x < 2.4.3 DoS Vulnerabilities
106142, #Wireshark 2.2.x < 2.2.12 / 2.4.x < 2.4.4 DoS Vulnerabilities
102919, #Wireshark 2.0.x < 2.0.15 Multiple DoS
103984, #Wireshark 2.0.x < 2.0.16 DMP dissector DoS
118206, #Wireshark 2.4.x < 2.4.10 Multiple Vulnerabilities
119419, #Wireshark 2.4.x < 2.4.11 Multiple Vulnerabilities
121107, #Wireshark 2.4.x < 2.4.12 Multiple Vulnerabilities
124164, #Wireshark 2.4.x < 2.4.14 Multiple Vulnerabilities
125365, #Wireshark 2.4.x < 2.4.15 A Vulnerability
126923, #Wireshark 2.4.x < 2.4.16 DoS Vulnerability
129061, #Wireshark 2.6.x < 2.6.11 Gryphon Dissector DoS Vulnerability
119420, #Wireshark 2.6.x < 2.6.5 Multiple Vulnerabilities
121108, #Wireshark 2.6.x < 2.6.6 Multiple Vulnerabilities
124165, #Wireshark 2.6.x < 2.6.8 Multiple Vulnerabilities
125367, #Wireshark 2.6.x < 2.6.9 A Vulnerability
126921, #Wireshark 2.6.x < 2.6.10 DoS Vulnerability
134112, #Wireshark 3.2.x < 3.2.2 Multiple Vulnerabilities
142421, #Wireshark 3.2.x < 3.2.8 Multiple Vulnerabilities
139573, #Wireshark 3.2.x < 3.2.6 A Vulnerability
140757, #Wireshark 3.2.x < 3.2.7 Multiple Vulnerabilities
142678, #Wireshark 3.2.x < 3.2.8 Multiple Vulnerabilities
147645, #Wireshark 3.2.x < 3.2.12 A Vulnerability
148946, #Wireshark 3.2.x < 3.2.13 A Vulnerability
136924, #Wireshark 3.2.x < 3.2.4 NFS Dissector DoS Vulnerability
135857, #Wireshark 2.6.x < 2.6.16 / 3.0.x < 3.0.10 / 3.2.x < 3.2.3 BACapp Dissector DoS
138087, #Wireshark 3.2.x < 3.2.5 A Vulnerability
151643, #Wireshark 3.2.x < 3.2.15 A Vulnerability
158992, #Wireshark 3.6.x < 3.6.2 Multiple Vulnerabilities
157893, #Wireshark 3.4.x < 3.4.12 A Vulnerability
164838, #Wireshark 3.4.x < 3.4.16 A Vulnerability
174236, #Wireshark 3.6.x < 3.6.13 Multiple Vulnerabilities
178197, #Wireshark 3.6.x < 3.6.15 A Vulnerability
176368, #Wireshark 3.6.x < 3.6.14 Multiple Vulnerabilities
166608, #Wireshark 3.6.x < 3.6.9 Multiple Vulnerabilities
170172, #Wireshark 3.6.x < 3.6.11 Multiple Vulnerabilities
187630, #HIGH, Wireshark 4.2.x < 4.2.1 Multiple Vulnerabilities
170000, #HIGH, Wireshark 3.6.x < 3.6.10 Multiple Vulnerabilities
172121, #HIGH, Wireshark 3.6.x < 3.6.12 A Vulnerability
182524, #HIGH, Wireshark 3.6.x < 3.6.17 A Vulnerability
187623, #HIGH, Wireshark 3.6.x < 3.6.20 Multiple Vulnerabilities
197093, #MEDIUM, Wireshark 3.6.x < 3.6.23 Multiple Vulnerabilities
197561, #MEDIUM, Wireshark 3.6.x < 3.6.24 Multiple Vulnerabilities
164831, #MEDIUM, Wireshark 3.4.x < 3.4.16, 3.6.x < 3.6.8 DoS
176372, #HIGH, Wireshark 2.2.x < 2.2.17 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
