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
				class ZoomClientRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Zoom Client for Meetings Patch Rollup",
							:plugin_id => -99935,
							:plugin_name => "Missing the latest Zoom Client for Meetings",
							:item_name => "Update to the latest Zoom Client for Meetings",
							:plugin_ids => [
135188, #Zoom Client for Meetings < 4.6.19253.0401 Multiple Vulnerabilities
168792, #Zoom Client for Meetings < 5.12.2 Vulnerability (ZSB-22024)
168821, #Zoom Client for Meetings < 5.3.0 Vulnerability (ZSB-21003)
177219, #Zoom Client for Meetings < 5.14.0 Vulnerability (ZSB-23013)
177223, #Zoom Client for Meetings < 5.14.0 Vulnerability (ZSB-23015)
168797, #Zoom Client for Meetings < 5.8.4 Vulnerability (ZSB-21019)
168807, #Zoom Client for Meetings < 5.6.3 Vulnerability (ZSB-22002)
168816, #Zoom Client for Meetings < 5.6.3 Vulnerability (ZSB-21002)
174469, #Zoom Client for Meetings < 5.13.3 Vulnerability / Zoom VDI < 5.13.1 Information Disclosure (ZSB-23001)
158168, #Zoom Client < 5.8.4 Multiple Vulnerabilities
184369, #CRITICAL, Zoom Client for Meetings < 5.15.2 Vulnerability (ZSB-23038)
184371, #CRITICAL, Zoom Client for Meetings < 5.14.7 Vulnerability (ZSB-23032)
184379, #CRITICAL, Zoom Client for Meetings < 5.14.7 Vulnerability (ZSB-23030)
190787, #CRITICAL, Zoom Client for Meetings < 5.16.5 Vulnerability (ZSB-24008)
184358, #HIGH, Zoom Client for Meetings < 5.14.5 Vulnerability (ZSB-23027)
184372, #HIGH, Zoom Client for Meetings < 5.14.5 Vulnerability (ZSB-23028)
184376, #HIGH, Zoom Client for Meetings < 5.15.0 Vulnerability (ZSB-23018)
185527, #HIGH, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23047)
185530, #HIGH, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23050)
185532, #HIGH, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23055)
185548, #HIGH, Zoom Client for Meetings < 5.15.10 Vulnerability (ZSB-23048)
190798, #HIGH, Zoom Client for Meetings < 5.16.5 Vulnerability (ZSB-23059)
184364, #HIGH, Zoom Client for Meetings < 5.13.3 Vulnerability (ZSB-23001)
184375, #HIGH, Zoom Client for Meetings < 5.13.5 Vulnerability (ZSB-23002)
184365, #HIGH, Zoom Client for Meetings < 5.13.5 Vulnerability (ZSB-23005)
184366, #HIGH, Zoom Client for Meetings < 5.15.5 Vulnerability (ZSB-23036)
184378, #HIGH, Zoom Client for Meetings < 5.14.5 Vulnerability (ZSB-23026)
190784, #HIGH, Zoom Client for Meetings < 5.17.0 Vulnerability (ZSB-24004)
177220, #HIGH, Zoom Client for Meetings < 5.14.0 Vulnerability (ZSB-23014)
177221, #HIGH, Zoom Client for Meetings < 5.14.0 Vulnerability (ZSB-23012)
177231, #HIGH, Zoom Client for Meetings < 5.13.5 Vulnerability (ZSB-23010)
190797, #HIGH, Zoom Client for Meetings < 5.16.10 Vulnerability (ZSB-24001)
184359, #MEDIUM, Zoom Client for Meetings < 5.15.5 Vulnerability (ZSB-23040)
184361, #MEDIUM, Zoom Client for Meetings < 5.15.5 Vulnerability (ZSB-23041)
184367, #MEDIUM, Zoom Client for Meetings < 5.14.10 Vulnerability (ZSB-23034)
185525, #MEDIUM, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23051)
185544, #MEDIUM, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23049)
185546, #MEDIUM, Zoom Client for Meetings < 5.16.0 Vulnerability (ZSB-23052)
190780, #MEDIUM, Zoom Client for Meetings < 5.16.5 Vulnerability (ZSB-24006)
190783, #MEDIUM, Zoom Client for Meetings < 5.16.5 Vulnerability (ZSB-24007)
190789, #MEDIUM, Zoom Client for Meetings < 5.17.0 Vulnerability (ZSB-24002)
190792, #MEDIUM, Zoom Client for Meetings < 5.17.0 Vulnerability (ZSB-24003)
190793, #MEDIUM, Zoom Client for Meetings < 5.17.0 Vulnerability (ZSB-24005)
190801, #MEDIUM, Zoom Client for Meetings < 5.16.5 Vulnerability (ZSB-23062)
193079, #MEDIUM, Zoom Client for Meetings < 5.17.10 Vulnerability (ZSB-24011)
177222, #MEDIUM, Zoom Client for Meetings < 5.14.10 Vulnerability (ZSB-23016)
177230, #MEDIUM, Zoom Client for Meetings < 5.14.0 Vulnerability (ZSB-23009)
177234, #MEDIUM, Zoom Client for Meetings < 5.13.10 Vulnerability (ZSB-23007)
179598, #MEDIUM, Zoom Client for Meetings < 5.14.10 Vulnerability (ZSB-23031)
							]
						}
					end
				end
			end
		end
	end
end


