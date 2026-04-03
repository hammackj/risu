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
				class OpenSSLRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "OpenSSL Patch Rollup",
							:plugin_id => -99984,
							:plugin_name => "Missing the latest OpenSSL Patches",
							:item_name => "Update to the latest OpenSSL",
							:plugin_ids => [
								11267, #MEDIUM, OpenSSL < 0.9.6j / 0.9.7b Multiple Vulnerabilities
								12110, #MEDIUM, OpenSSL < 0.9.6m / 0.9.7d Multiple Remote DoS
								74363, #HIGH, OpenSSL 0.9.8 < 0.9.8za Multiple Vulnerabilities
								77086, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zb Multiple Vulnerabilities
								74326, #MEDIUM, OpenSSL 'ChangeCipherSpec' MiTM Potential Vulnerability
								73412, #MEDIUM, OpenSSL Heartbeat Information Disclosure (Heartbleed)
								77200, #MEDIUM, OpenSSL 'ChangeCipherSpec' MiTM Vulnerability
								17757, #CRITICAL, OpenSSL < 0.9.7l / 0.9.8d Multiple Vulnerabilities
								73404, #MEDIUM, OpenSSL 1.0.1 < 1.0.1g Multiple Vulnerabilities
								74364, #HIGH, OpenSSL 1.0.1 < 1.0.1h Multiple Vulnerabilities
								77088, #HIGH, OpenSSL 1.0.1 < 1.0.1i Multiple Vulnerabilities
								17755, #MEDIUM, OpenSSL < 0.9.7h / 0.9.8a Protocol Version Rollback
								17756, #MEDIUM, OpenSSL < 0.9.7k / 0.9.8c PKCS Padding RSA Signature Forgery Vulnerability
								17758, #MEDIUM, OpenSSL < 0.9.7m / 0.9.8e Buffer Overflow (deprecated)
								17759, #MEDIUM, OpenSSL < 0.9.8 Weak Default Configuration
								17761, #MEDIUM, OpenSSL 0.9.8 < 0.9.8i Vulnerability
								17762, #MEDIUM, OpenSSL 0.9.8 < 0.9.8j Vulnerability
								17763, #LOW, OpenSSL 0.9.8 < 0.9.8k Multiple Vulnerabilities
								17765, #MEDIUM, OpenSSL < 0.9.8l Multiple Vulnerabilities
								57459, #HIGH, OpenSSL 0.9.8 < 0.9.8s Multiple Vulnerabilities
								58799, #HIGH, OpenSSL 0.9.8 < 0.9.8v Vulnerability
								17760, #HIGH, OpenSSL 0.9.8 < 0.9.8f Multiple Vulnerabilities
								56996, #MEDIUM, OpenSSL 0.9.8f < 0.9.8h Multiple Vulnerabilities
								58564, #MEDIUM, OpenSSL 0.9.8 < 0.9.8u Vulnerability
								59076, #MEDIUM, OpenSSL 0.9.8 < 0.9.8x Vulnerability
								64532, #LOW, OpenSSL 0.9.8 < 0.9.8y Multiple Vulnerabilities
								71857, #MEDIUM, OpenSSL 1.0.1 < 1.0.1f Multiple Vulnerabilities
								78554, #MEDIUM, OpenSSL 1.0.1 < 1.0.1j Multiple Vulnerabilities
								80568, #MEDIUM, OpenSSL 1.0.1 < 1.0.1k Multiple Vulnerabilities
								82032, #MEDIUM, OpenSSL 1.0.1 < 1.0.1m Multiple Vulnerabilities
								84153, #MEDIUM, OpenSSL 1.0.1 < 1.0.1n Multiple Vulnerabilities
								51892, #MEDIUM, OpenSSL SSL_OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG Session Resume Ciphersuite Downgrade Issue
								17766, #HIGH, OpenSSL < 0.9.8p / 1.0.0b Buffer Overflow
								17767, #MEDIUM, OpenSSL < 0.9.8p / 1.0.0e Double Free Vulnerability
								90888, #CRITICAL, OpenSSL 1.0.1 < 1.0.1o Vulnerability
								93814, #HIGH, OpenSSL 1.0.1 < 1.0.1u Multiple Vulnerabilities
								89081, #CRITICAL, OpenSSL 1.0.1 < 1.0.1s Multiple Vulnerabilities
								84636, #MEDIUM, OpenSSL 1.0.1 < 1.0.1p Multiple Vulnerabilities
								87221, #MEDIUM, OpenSSL 1.0.1 < 1.0.1q Multiple Vulnerabilities
								88529, #MEDIUM, OpenSSL 1.0.1 < 1.0.1r Vulnerability
								90890, #MEDIUM, OpenSSL 1.0.1 < 1.0.1t Multiple Vulnerabilities
								93112, #MEDIUM, OpenSSL < 1.0.2i Default Weak 64-bit Block Cipher (SWEET32)
								89082, #CRITICAL, OpenSSL 1.0.2 < 1.0.2g Multiple Vulnerabilities
								96873, #MEDIUM, OpenSSL 1.0.2 < 1.0.2k Multiple Vulnerabilities
								93815, #HIGH, OpenSSL 1.0.2 < 1.0.2i Multiple Vulnerabilities
								78552, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zc Multiple Vulnerabilities
80566, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zd Multiple Vulnerabilities
82030, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zf Multiple Vulnerabilities
84151, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zg Multiple Vulnerabilities
87219, #MEDIUM, OpenSSL 0.9.8 < 0.9.8zh Vulnerability
87222, #MEDIUM, OpenSSL 1.0.2 < 1.0.2e Multiple Vulnerabilities
88530, #MEDIUM, OpenSSL 1.0.2 < 1.0.2f Multiple Vulnerabilities
90891, #MEDIUM, OpenSSL 1.0.2 < 1.0.2h Multiple Vulnerabilities
109945, #MEDIUM, OpenSSL 1.0.2b < 1.0.2o Vulnerability
112119, #MEDIUM, OpenSSL 1.0.2 < 1.0.2p Multiple Vulnerabilities
104408, #MEDIUM, OpenSSL 1.0.2 < 1.0.2m Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
