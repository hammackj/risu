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
				class DellIDracRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Dell iDRAC Products Patch Rollup",
							:plugin_id => -99947,
							:plugin_name => "Missing the latest Dell iDRAC Patches",
							:item_name => "Update to the latest Dell iDRAC",
							:plugin_ids => [
109208, #Dell iDRAC Products Multiple Vulnerabilities (Mar 2018) 
111604, #Dell iDRAC Products Multiple Vulnerabilities (June 2018) 
119833, #Dell iDRAC Products Multiple Vulnerabilities (December 2018)
90265, #Dell iDRAC6 / iDRAC7 / iDRAC8 Path Traversal Authentication Bypass
135187, #Dell iDRAC Buffer Overflow Vulnerability (CVE-2020-5344)
162428, #Dell EMC iDRAC8 < 2.83.83.83 / Dell EMC iDRAC9 < 5.10.30.00 (DSA-2022-154)
159643, #Dell EMC iDRAC8 < 2.83.83.83 (DSA-2022-069)
161798, #Dell EMC iDRAC8 < 2.80.80.80 / Dell EMC iDRAC9 < 4.40.40.00 (DSA-2021-177)
167508, #Dell EMC iDRAC8 < 2.84.84.84 (DSA-2022-265)
167509, #Dell EMC iDRAC9 < 6.00.30.00 (DSA-2022-265)
131730, #Dell iDRAC Improper Authorization (DSA-2019-137)
139206, #Dell iDRAC9 Directory Traversal (DSA-2020-128)
144756, #Dell iDRAC XSS (DSA-2020-268)
148956, #Dell iDRAC Multiple Vulnerabilities (DSA-2021-073)
161800, #Dell EMC iDRAC9 < 5.00.00.00 (DSA-2021-177)
70411, #MEDIUM, Dell iDRAC6 / iDRAC7 Login Page 'ErrorMsg' Parameter XSS
80442, #MEDIUM, Dell iDRAC Products IPMI Arbitrary Command Injection Vulnerability
193888, #HIGH, Dell EMC iDRAC8 < 2.85.85.85 (DSA-2024-089)
202259, #MEDIUM, Dell EMC iDRAC9 < 7.00.00.172 / 7.10.00.00 < 7.10.50.00 (DSA-2024-099)

							]
						}
					end
				end
			end
		end
	end
end
