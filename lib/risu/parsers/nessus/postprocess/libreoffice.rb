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
80078,
86900,
88983,
86901,
80832,
73336,
91974,
97496,
127114, #LibreOffice < 6.2.5 Multiple Vulnerabilities (Windows)
129535, #LibreOffice < 6.2.7 / 6.3.x < 6.3.1 Multiple Vulnerabilities (Windows) 
133474, #LibreOffice < 6.2.6 / 6.3 Input Validation (Windows)
122586, #LibreOffice < 5.4.6 and < 6.0.2 Heap Buffer Overflow
122588, #LibreOffice < 5.4.5 or 6.x < 6.0.1 Multiple Vulnerabilities
122857, #LibreOffice < 5.4.7 or 6.x < 6.0.4 Information Disclosure
125223, #LibreOffice < 6.1.6, 6.2.x < 6.2.3 Hyperlink Processing Vulnerability (Windows) 
133471, #LibreOffice 6.2.6 / 6.3.1 Security Control Bypass (Windows)


							]
						}
					end
				end
			end
		end
	end
end
