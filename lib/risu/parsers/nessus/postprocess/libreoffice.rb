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
				class LibreOfficePatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "LibreOffice Patch Rollup",
							:plugin_id => -99962,
							:plugin_name => "Missing the latest LibreOffice Patches",
							:item_name => "Update to the latest LibreOffice",
							:plugin_ids => [
80078, #HIGH, LibreOffice 4.x < 4.2.6-secfix (4.2.6.3) Multiple Vulnerabilities
86900, #MEDIUM, LibreOffice < 4.4.5 Multiple Vulnerabilities
88983, #HIGH, LibreOffice < 5.0.5 Multiple RCE
86901, #MEDIUM, LibreOffice < 4.4.6 / 5.x < 5.0.1 Document Bookmark Arbitrary Code Execution
80832, #HIGH, LibreOffice < 4.2.8 / 4.3.5 RTF File Handling Code Execution
73336, #MEDIUM, LibreOffice < 4.1.5 / 4.2.0 Python Multiple Vulnerabilities
91974, #MEDIUM, LibreOffice < 5.1.4 RTF Character Style Index RCE
97496, #HIGH, LibreOffice < 5.1.6 / 5.2.5 / 5.3.0 Multiple Vulnerabilities
127114, #HIGH, LibreOffice < 6.2.5 Multiple Vulnerabilities (Windows)
129535, #HIGH, LibreOffice < 6.2.7 / 6.3.x < 6.3.1 Multiple Vulnerabilities (Windows)
133474, #HIGH, LibreOffice < 6.2.6 / 6.3 Input Validation (Windows)
122586, #MEDIUM, LibreOffice < 5.4.6 and < 6.0.2 Heap Buffer Overflow
122588, #MEDIUM, LibreOffice < 5.4.5 or 6.x < 6.0.1 Multiple Vulnerabilities
122857, #MEDIUM, LibreOffice < 5.4.7 or 6.x < 6.0.4 Information Disclosure
125223, #MEDIUM, LibreOffice < 6.1.6
133471, #MEDIUM, LibreOffice 6.2.6 / 6.3.1 Security Control Bypass (Windows)
163762, #HIGH, LibreOffice < 7.2.7 / 7.3.2 Improper Certificate Validation (Windows)
163764, #HIGH, LibreOffice < 7.2.7 / 7.3 < 7.3.3 Multiple Vulnerabilities (Windows)
197300, #HIGH, LibreOffice < 7.6.7 / 8.0.x < 24.2.3 (cve-2024-3044)


							]
						}
					end
				end
			end
		end
	end
end
