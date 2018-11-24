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
								11267, #OpenSSL < 0.9.6j / 0.9.7b Multiple Vulnerabilities
								12110, #OpenSSL < 0.9.6m / 0.9.7d Multiple Remote DoS
								74363, #OpenSSL 0.9.8 < 0.9.8za Multiple Vulnerabilities
								77086, #OpenSSL 0.9.8 < 0.9.8zb Multiple Vulnerabilities
								74326, #OpenSSL 'ChangeCipherSpec' MiTM Potential Vulnerability
								73412, #OpenSSL Heartbeat Information Disclosure (Heartbleed)
								77200, #OpenSSL 'ChangeCipherSpec' MiTM Vulnerability
								17757, #OpenSSL < 0.9.7l / 0.9.8d Multiple Vulnerabilities
								73404, #OpenSSL 1.0.1 < 1.0.1g Multiple Vulnerabilities (Heartbleed)
								74364, #OpenSSL 1.0.1 < 1.0.1h Multiple Vulnerabilities
								77088, #OpenSSL 1.0.1 < 1.0.1i Multiple Vulnerabilities
								17755, #OpenSSL < 0.9.7h / 0.9.8a Protocol Version Rollback
								17756, #OpenSSL < 0.9.7k / 0.9.8c PKCS Padding RSA Signature Forgery Vulnerability
								17758, #OpenSSL < 0.9.7m / 0.9.8e Buffer Overflow (deprecated)
								17759, #OpenSSL < 0.9.8 Weak Default Configuration
								17761, #OpenSSL < 0.9.8i Denial of Service
								17762, #OpenSSL < 0.9.8j Signature Spoofing
								17763, #OpenSSL < 0.9.8k Multiple Vulnerabilities
								17765, #OpenSSL < 0.9.8l Multiple Vulnerabilities
								57459, #OpenSSL < 0.9.8s Multiple Vulnerabilities
								58799, #OpenSSL < 0.9.8w ASN.1 asn1_d2i_read_bio Memory Corruption
								17760, #OpenSSL < 0.9.8f Multiple Vulnerabilities
								56996, #OpenSSL < 0.9.8h Multiple Vulnerabilities
								58564, #OpenSSL < 0.9.8u Multiple Vulnerabilities
								59076, #OpenSSL 0.9.8 < 0.9.8x DTLS CBC Denial of Service
								64532, #OpenSSL < 0.9.8y Multiple Vulnerabilities
								71857, #OpenSSL 1.0.1 < 1.0.1f Multiple Vulnerabilities
								78554, #OpenSSL 1.0.1 < 1.0.1j Multiple Vulnerabilities (POODLE)
								80568, #OpenSSL 1.0.1 < 1.0.1k Multiple Vulnerabilities (FREAK)
								82032, #OpenSSL 1.0.1 < 1.0.1m Multiple Vulnerabilities
								84153, #OpenSSL 1.0.1 < 1.0.1n Multiple Vulnerabilities (Logjam)
								51892, #OpenSSL SSL_OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG Session Resume Ciphersuite Downgrade Issue
								17766, #OpenSSL < 0.9.8p / 1.0.0b Buffer Overflow
								17767, #OpenSSL < 0.9.8p / 1.0.0e Double Free Vulnerability
								90888, #OpenSSL 1.0.1 < 1.0.1o ASN.1 Encoder Negative Zero Value Handling RCE -
								93814, #OpenSSL 1.0.1 < 1.0.1u Multiple Vulnerabilities
								89081, #OpenSSL 1.0.1 < 1.0.1s Multiple Vulnerabilities (DROWN)
								84636, #OpenSSL 1.0.1 < 1.0.1p Multiple Vulnerabilities -
								87221, #OpenSSL 1.0.1 < 1.0.1q Multiple DoS -
								88529, #OpenSSL 1.0.1 < 1.0.1r Multiple Vulnerabilities -
								90890, #OpenSSL 1.0.1 < 1.0.1t Multiple Vulnerabilities -
								93112, #OpenSSL < 1.1.0 Default Weak 64-bit Block Cipher
								89082, #OpenSSL 1.0.2 < 1.0.2g Multiple Vulnerabilities (DROWN)
								96873, #OpenSSL 1.0.2 < 1.0.2k Multiple Vulnerabilities
								93815, #OpenSSL 1.0.2 < 1.0.2i Multiple Vulnerabilities
								78552, #OpenSSL 0.9.8 < 0.9.8zc Multiple Vulnerabilities
80566, #OpenSSL 0.9.8 < 0.9.8zd Multiple Vulnerabilities
82030, #OpenSSL 0.9.8 < 0.9.8zf Multiple Vulnerabilities
84151, #OpenSSL 0.9.8 < 0.9.8zg Multiple Vulnerabilities
87219, #OpenSSL 0.9.8 < 0.9.8zh X509_ATTRIBUTE Memory Leak DoS
							]
						}
					end
				end
			end
		end
	end
end
