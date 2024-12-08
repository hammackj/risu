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
				class PHP < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "PHP Patch Rollup",
							:plugin_id => -99988,
							:plugin_name => "Missing the latest PHP Patches",
							:item_name => "Update to the latest PHP",
							:plugin_ids => [
76281, #PHP 5.4.x < 5.4.30 Multiple Vulnerabilities
66843, #PHP 5.4.x < 5.4.16 Multiple Vulnerabilities
67260, #PHP 5.4.x < 5.4.17 Buffer Overflow
69401, #PHP 5.4.x < 5.4.18 Multiple Vulnerabilities
72881, #PHP 5.4.x < 5.4.26 Multiple Vulnerabilities
46803, #PHP expose_php Information Disclosure
66585, #PHP 5.4.x < 5.4.13 Information Disclosure
71427, #PHP 5.4.x < 5.4.23 OpenSSL openssl_x509_parse() Memory Corruption
71927, #PHP 5.4.x < 5.4.24 Multiple Vulnerabilities
73338, #PHP 5.4.x < 5.4.27 awk Magic Parsing BEGIN DoS
73862, #PHP 5.4.x < 5.4.28 FPM Unix Socket Insecure Permission Escalation
74291, #PHP 5.4.x < 5.4.29 'src/cdf.c' Multiple Vulnerabilities
76791, #PHP 5.4.x < 5.4.31 CLI Server 'header' DoS
11850, #PHP < 4.3.3 Multiple Vulnerabilities
15973, #PHP < 4.3.10 / 5.0.3 Multiple Vulnerabilities
17710, #PHP < 4.4.4 Multiple Vulnerabilities
17796, #PHP 4.x < 4.3.0 ZendEngine Integer Overflow
18033, #PHP < 4.3.11 / 5.0.3 Multiple Unspecified Vulnerabilities
20111, #PHP < 4.4.1 / 5.0.6 Multiple Vulnerabilities
22268, #PHP < 4.4.3 / 5.1.4 Multiple Vulnerabilities
24906, #PHP < 4.4.5 Multiple Vulnerabilities
29833, #PHP < 4.4.8 Multiple Vulnerabilities
33849, #PHP < 4.4.9 Multiple Vulnerabilities
35067, #PHP < 5.2.8 Multiple Vulnerabilities
41014, #PHP < 5.2.11 Multiple Vulnerabilities
57537, #PHP < 5.3.9 Multiple Vulnerabilities
58966, #PHP < 5.3.11 Multiple Vulnerabilities
66842, #PHP 5.3.x < 5.3.26 Multiple Vulnerabilities
58988, #PHP < 5.3.12 / 5.4.2 CGI Query String Code Execution
67259, #PHP 5.3.x < 5.3.27 Multiple Vulnerabilities
77285, #PHP 5.3.x < 5.3.29 Multiple Vulnerabilities
35750, #PHP < 5.2.9 Multiple Vulnerabilities
39480, #PHP < 5.2.10 Multiple Vulnerabilities
43351, #PHP < 5.2.12 Multiple Vulnerabilities
44921, #PHP < 5.3.2 / 5.2.13 Multiple Vulnerabilities
64992, #PHP 5.3.x < 5.3.22 Multiple Vulnerabilities
66584, #PHP 5.3.x < 5.3.23 Information Disclosure
71426, #PHP 5.3.x < 5.3.28 Multiple OpenSSL Vulnerabilities
77402, #PHP 5.4.x < 5.4.32 Multiple Vulnerabilities
78545, #PHP 5.4.x < 5.4.34 Multiple Vulnerabilities
79246, #PHP 5.4.x < 5.4.35 'donote' DoS
80330, #PHP 5.4.x < 5.4.36 'process_nested_data' RCE
81080, #PHP 5.4.x < 5.4.37 Multiple Vulnerabilities
81510, #PHP 5.4.x < 5.4.38 Multiple Vulnerabilities (GHOST)
82025, #PHP 5.4.x < 5.4.39 Multiple Vulnerabilities
83033, #PHP 5.4.x < 5.4.40 Multiple Vulnerabilities
83517, #PHP 5.4.x < 5.4.41 Multiple Vulnerabilities
84362, #PHP 5.4.x < 5.4.42 Multiple Vulnerabilities
84671, #PHP 5.4.x < 5.4.43 Multiple Vulnerabilities (BACKRONYM)
32123, #PHP < 5.2.6 Multiple Vulnerabilities
35043, #PHP 5 < 5.2.7 Multiple Vulnerabilities
48244, #PHP 5.2 < 5.2.14 Multiple Vulnerabilities
28181, #PHP < 5.2.5 Multiple Vulnerabilities
51139, #PHP 5.2 < 5.2.15 Multiple Vulnerabilities
51439, #PHP 5.2 < 5.2.17 / 5.3 < 5.3.5 String To Double Conversion DoS
73289, #PHP PHP_RSHUTDOWN_FUNCTION Security Bypass
60085, #PHP 5.3.x < 5.3.15 Multiple Vulnerabilities
48245, #PHP 5.3 < 5.3.3 Multiple Vulnerabilities
51140, #PHP 5.3 < 5.3.4 Multiple Vulnerabilities
52717, #PHP 5.3 < 5.3.6 Multiple Vulnerabilities
55925, #PHP 5.3 < 5.3.7 Multiple Vulnerabilities
59056, #PHP 5.3.x < 5.3.13 CGI Query String Code Execution
59529, #PHP 5.3.x < 5.3.14 Multiple Vulnerabilities
88679 ,#PHP prior to 5.5.x < 5.5.31 / 5.6.x < 5.6.17 Multiple Vulnerabilities -
88694, #PHP 5.6.x < 5.6.18 Multiple Vulnerabilities -
90008, #PHP 5.6.x < 5.6.19 Multiple Vulnerabilities -
90361, #PHP 5.6.x < 5.6.20 Multiple Vulnerabilities -
91442, #PHP 5.6.x < 5.6.22 Multiple Vulnerabilities -
91898, #PHP 5.6.x < 5.6.23 Multiple Vulnerabilities -
92555, #PHP 5.6.x < 5.6.24 Multiple Vulnerabilities (httpoxy) -
93656, #PHP 5.6.x < 5.6.26 Multiple Vulnerabilities -
94106, #PHP 5.6.x < 5.6.27 Multiple Vulnerabilities -
94955, #PHP 5.6.x < 5.6.28 Multiple Vulnerabilities -
95874, #PHP 5.6.x < 5.6.29 Multiple Vulnerabilities -
101525, #PHP 5.6.x < 5.6.31 Multiple Vulnerabilities -
90921, #PHP 5.6.x < 5.6.21 Multiple Vulnerabilities -
93077, #PHP 5.6.x < 5.6.25 Multiple Vulnerabilities -
96799, #PHP 5.6.x < 5.6.30 Multiple DoS
104631, #PHP 5.6.x < 5.6.32 Multiple Vulnerabilities
107216, #PHP 5.6.x < 5.6.34 Stack Buffer Overflow
119764, #PHP 5.6.x < 5.6.39 Arbitrary Command Injection Vulnerability
105771, #PHP 5.6.x < 5.6.33 Multiple Vulnerabilities
109576, #PHP 5.6.x < 5.6.36 Multiple Vulnerabilities
111230, #PHP 5.6.x < 5.6.37 exif_thumbnail_extract() DoS
117497, #PHP 5.6.x < 5.6.38 Transfer-Encoding Parameter XSS Vulnerability
84673, #PHP 5.6.x < 5.6.11 Multiple Vulnerabilities (BACKRONYM)
84364, #PHP 5.6.x < 5.6.10 Multiple Vulnerabilities
85300, #PHP 5.6.x < 5.6.12 Multiple Vulnerabilities
85887, #PHP 5.6.x < 5.6.13 Multiple Vulnerabilities
121602, #PHP 5.6.x < 5.6.40 Multiple vulnerabilities.
86301, #PHP 5.6.x < 5.6.14 Multiple Vulnerabilities	
122591, #PHP 5.6.x < 5.6.35 Security Bypass Vulnerability
130276, #PHP < 7.1.33 / 7.2.x < 7.2.24 / 7.3.x < 7.3.11 Remote Code Execution Vulnerability.
123829, #PHP 7.3.x < 7.3.3 Multiple vulnerabilities.
128531, #PHP 7.3.x < 7.3.9 Multiple Vulnerabilities.
129557, #PHP 7.3.x < 7.3.10 Heap-Based Buffer Overflow Vulnerability.
125681, #PHP 7.3.x < 7.3.6 Multiple Vulnerabilities.
126637, #PHP 7.3.x < 7.3.7 Multiple Vulnerabilities.
127132, #PHP 7.3.x < 7.3.8 Multiple Vulnerabilities.
135918, #PHP 7.3.x < 7.3.17 Out of Bounds Read Vulnerability
136741, #PHP 7.2.x < 7.2.31 / 7.3.x < 7.3.18, 7.4.x < 7.4.6 Denial of Service (DoS)
138593, #PHP 7.2.x < 7.2.32 / 7.3.x < 7.3.20 / 7.4.x < 7.4.8 Information Disclosure
140532, #PHP 7.2.x / 7.3.x < 7.3.22 Memory Leak Vulnerability
122750, #PHP 7.3.x < 7.3.2 Information Disclosure.
123755, #PHP 7.3.x < 7.3.4 Multiple vulnerabilities.
124764, #PHP 7.3.x < 7.3.5 Heap-based Buffer Overflow Vulnerability.
142591, #PHP < 7.3.24 Multiple Vulnerabilities
25368, #PHP < 5.2.3 Multiple Vulnerabilities
25971, #PHP < 5.2.4 Multiple Vulnerabilities
154349, #PHP 7.4.x < 7.4.25
155589, #PHP 7.4.x < 7.4.26
158133, #PHP 7.4.x < 7.4.28
161971, #PHP 7.4.x < 7.4.30 Multiple Vulnerabilities
166901, #PHP 7.4.x < 7.4.33 Multiple Vulnerabilities
165545, #PHP 7.4.x < 7.4.32 Multiple Vulnerabilities		
							]
						}
					end
				end
			end
		end
	end
end
