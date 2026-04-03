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
				class HPSystemMgtHomePage < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "HP System Management Homepage Patch Rollup",
							:plugin_id => -99985,
							:plugin_name => "Missing the latest HP System Management Homepage Patches",
							:item_name => "Update to the latest HP System Management Homepage",
							:plugin_ids => [
								53532, #CRITICAL, HP System Management Homepage < 6.3 Multiple Vulnerabilities
								58811, #CRITICAL, HP System Management Homepage < 7.0 Multiple Vulnerabilities
								59851, #CRITICAL, HP System Management Homepage < 7.1.1 Multiple Vulnerabilities
								66541, #HIGH, HP System Management Homepage < 7.2.0.14 iprange Parameter Code Execution
								69020, #HIGH, HP System Management Homepage < 7.2.1.0 Multiple Vulnerabilities (BEAST)
								70118, #HIGH, HP System Management Homepage ginkgosnmp.inc Command Injection
								76345, #MEDIUM, HP System Management Homepage < 7.2.4.1 / 7.3.3.1 OpenSSL Multiple Vulnerabilities
								49272, #HIGH, HP System Management Homepage < 6.2 Multiple Vulnerabilities
								72959, #MEDIUM, HP System Management Homepage < 7.3 Multiple Vulnerabilities
								46015, #CRITICAL, HP System Management Homepage < 6.0.0.96 / 6.0.0-95 Multiple Vulnerabilities
								46677, #MEDIUM, HP System Management Homepage < 6.1.0.102 / 6.1.0-103 Multiple Vulnerabilities
								78090, #HIGH, HP System Management Homepage < 7.4 Multiple Vulnerabilities
								33548, #MEDIUM, HP System Management Homepage < 2.1.12 Unspecified XSS
								34694, #MEDIUM, HP System Management Homepage < 2.1.15.210 Unspecified XSS
								38832, #MEDIUM, HP System Management Homepage < 3.0.1.73 Multiple Flaws
								85181, #MEDIUM, HP System Management Homepage < 7.2.5 / 7.4.1 Multiple Vulnerabilities (POODLE)
								84923, #HIGH, HP System Management Homepage 7.3.x / 7.4.x < 7.5.0 Multiple Vulnerabilities (FREAK)
								73639, #MEDIUM, HP System Management Homepage OpenSSL Multiple Vulnerabilities (Heartbleed)
								90150, #CRITICAL, HP System Management Homepage < 7.5.4 Multiple Vulnerabilities (Logjam)
								90251, #HIGH, HP System Management Homepage < 7.2.6 Multiple Vulnerabilities (FREAK)
								91222, #CRITICAL, HP System Management Homepage Multiple Vulnerabilities (HPSBMU03593)
								94654, #HIGH, HP System Management Homepage < 7.6 Multiple Vulnerabilities (HPSBMU03653) (httpoxy)
103530, #MEDIUM, HP System Management Homepage < 7.6.1 Multiple Vulnerabilities (HPSBMU03753)


							]
						}
					end
				end
			end
		end
	end
end
