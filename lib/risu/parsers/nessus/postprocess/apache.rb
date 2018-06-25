# Copyright (c) 2010-2018 Jacob Hammack.
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
							]
						}
					end
				end
			end
		end
	end
end
