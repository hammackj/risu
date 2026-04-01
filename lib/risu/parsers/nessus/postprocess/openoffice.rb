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
				class OpenOfficePatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "OpenOffice Patch Rollup",
							:plugin_id => -99963,
							:plugin_name => "Missing the latest OpenOffice Patches",
							:item_name => "Update to the latest OpenOffice",
							:plugin_ids => [
								77408, #HIGH, Apache OpenOffice < 4.1.1 Multiple Vulnerabilities
								86904, #MEDIUM, Apache OpenOffice < 4.1.2 Multiple Vulnerabilities
								94199, #HIGH, Apache OpenOffice < 4.1.3 Multiple Vulnerabilities
								61731, #HIGH, Apache OpenOffice < 3.4.1 Multiple Heap-Based Buffer Overflows
								69185, #MEDIUM, Apache OpenOffice < 4.0 Multiple Memory Corruption Vulnerabilities
								51773, #HIGH, Oracle OpenOffice.org < 3.3 Multiple Vulnerabilities
								58727, #HIGH, OpenOffice XML External Entity RDF Document Handling Information Disclosure
								59191, #HIGH, Apache OpenOffice < 3.4.0 Multiple Memory Corruption Vulnerabilities
								104351, #MEDIUM, Apache OpenOffice < 4.1.4 Multiple Vulnerabilities
								40826, #HIGH, OpenOffice < 3.1.1 Multiple Buffer Overflows
44597, #HIGH, Sun OpenOffice.org < 3.2 Multiple Vulnerabilities
46814, #HIGH, Oracle OpenOffice.org < 3.2.1 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
