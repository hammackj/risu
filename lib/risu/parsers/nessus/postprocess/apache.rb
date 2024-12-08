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
				class Apache < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apache Patch Rollup",
							:plugin_id => -99986,
							:plugin_name => "Missing the latest Apache patches",
							:item_name => "Update to the latest Apache",
							:plugin_ids => [
								11030, #Apache Chunked Encoding Remote Overflow
								11137, #Apache < 1.3.27 Multiple Vulnerabilities (DoS, XSS)
								11793, #Apache < 1.3.28 Multiple Vulnerabilities (DoS, ID)
								11915, #Apache < 1.3.29 Multiple Modules Local Overflow
								31654, #Apache < 1.3.37 mod_rewrite LDAP Protocol URL Handling Overflow
								55976, #Apache HTTP Server Byte Range DoS
								57792, #Apache HTTP Server httpOnly Cookie Information Disclosure
								12280, #Apache < 1.3.31 / 2.0.49 Socket Connection Blocking Race Condition DoS
								17696, #Apache HTTP Server 403 Error Page UTF-7 Encoded XSS
								31408, #Apache 1.3.x < 1.3.41 Multiple Vulnerabilities (DoS, XSS)
								73405, #Apache 2.2.x < 2.2.27 Multiple Vulnerabilities
								56216, #Apache 2.2.x < 2.2.21 mod_proxy_ajp DoS
								57791, #Apache 2.2.x < 2.2.22 Multiple Vulnerabilities
								62101, #Apache 2.2.x < 2.2.23 Multiple Vulnerabilities
								64912, #Apache 2.2.x < 2.2.24 Multiple XSS Vulnerabilities
								68915, #Apache 2.2.x < 2.2.25 Multiple Vulnerabilities
								77531, #Apache 2.2.x < 2.2.28 Multiple Vulnerabilities
								45004, #Apache 2.2.x < 2.2.15 Multiple Vulnerabilities
								57603, #Apache 2.2.x < 2.2.13 APR apr_palloc Heap Overflow
								42052, #Apache 2.2.x < 2.2.14 Multiple Vulnerabilities
								48205, #Apache 2.2.x < 2.2.16 Multiple Vulnerabilities
								50070, #Apache 2.2.x < 2.2.17 Multiple Vulnerabilities
								53896, #Apache 2.2.x < 2.2.18 APR apr_fnmatch DoS
								69014, #Apache 2.4.x < 2.4.5 Multiple Vulnerabilities
								76622, #Apache 2.4.x < 2.4.10 Multiple Vulnerabilities
								81126, #Apache 2.4.x < 2.4.12 Multiple Vulnerabilities
								73081, #Apache 2.4.x < 2.4.8 Multiple Vulnerabilities
								84959, #Apache 2.4.x < 2.4.16 Multiple Vulnerabilities
								40467, #Apache 2.2.x < 2.2.12 Multiple Vulnerabilities
								96451, #Apache 2.4.x < 2.4.25 Multiple Vulnerabilities (httpoxy)
								100995, #Apache 2.2.x < 2.2.33-dev / 2.4.x < 2.4.26 Multiple Vulnerabilities -
								101788, #Apache 2.4.x < 2.4.27 Multiple Vulnerabilities
								103838, #Apache 2.4.x < 2.4.28 HTTP Vulnerability (OptionsBleed)
								101787, #Apache 2.2.x < 2.2.34 Multiple Vulnerabilities
								68914, #Apache 2.0.x < 2.0.65 Multiple Vulnerabilities
								123642, #Apache 2.4.x < 2.4.39 Multiple Vulnerabilities
								139574, #Apache 2.4.x < 2.4.46 Multiple Vulnerabilities
150280, #Apache 2.4.x < 2.4.47 Multiple Vulnerabilities
111788, #Apache 2.4.x < 2.4.34 Multiple Vulnerabilities
117807, #Apache 2.4.x < 2.4.35 DoS
121355, #Apache 2.4.x < 2.4.38 Multiple Vulnerabilities
122060, #Apache 2.4.x < 2.4.33 Multiple Vulnerabilities
128033, #Apache 2.4.x < 2.4.41 Multiple Vulnerabilities
92320, #Apache 2.4.18 / 2.4.20 X.509 Certificate Authentication Bypass
135290, #Apache 2.4.x < 2.4.42 Multiple Vulnerabilities
150244, #Apache 2.4.x < 2.4.48 Vulnerability
153584, #Apache < 2.4.49 Multiple Vulnerabilities
156255, #Apache 2.4.x < 2.4.52 Multiple Vulnerabilities
153583, #Apache < 2.4.49 Multiple Vulnerabilities
153585, #Apache >= 2.4.17 < 2.4.49 mod_http2
153586, #Apache >= 2.4.30 < 2.4.49 mod_proxy_uwsgi
158900, #Apache 2.4.x < 2.4.53 Multiple Vulnerabilities
161948, #Apache 2.4.x < 2.4.54 Multiple Vulnerabilities
161454, #Apache 2.4.x < 2.4.52 mod_lua Buffer Overflow
170113, #Apache 2.4.x < 2.4.55 Multiple Vulnerabilities
172186, #Apache 2.4.x < 2.4.56 Multiple Vulnerabilities
183391, #Apache 2.4.x < 2.4.58 Multiple Vulnerabilities
192923, #HIGH, Apache 2.4.x < 2.4.59 Multiple Vulnerabilities
201198, #CRITICAL, Apache 2.4.x < 2.4.60 Multiple Vulnerabilities
202577, #HIGH, Apache 2.4.x < 2.4.62 Multiple Vulnerabilities
193421, #CRITICAL, Apache 2.4.x < 2.4.54 Authentication Bypass
193419, #HIGH, Apache 2.4.x < 2.4.58 Out-of-Bounds Read (CVE-2023-31122)
193422, #HIGH, Apache 2.4.x < 2.4.54 HTTP Request Smuggling Vulnerability
193423, #HIGH, Apache 2.4.x < 2.4.54 Multiple Vulnerabilities
193424, #HIGH, Apache 2.4.x < 2.4.54 Multiple Vulnerabilities (mod_lua)
193420, #MEDIUM, Apache 2.4.x < 2.4.54 Out-Of-Bounds Read (CVE-2022-28330)

							]
						}
					end
				end
			end
		end
	end
end
