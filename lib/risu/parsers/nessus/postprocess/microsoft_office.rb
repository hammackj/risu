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
				class MicrosoftOfficeRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Office Patch Rollup",
							:plugin_id => -99946,
							:plugin_name => "Missing the latest Microsoft Office Patches",
							:item_name => "Update to the latest Microsoft Office",
							:plugin_ids => [
22031, #MS06-037: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (917285)
22032, #MS06-038: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (917284)
22033, #MS06-039: Vulnerabilities in Microsoft Office Filters Could Allow Remote Code Execution (915384)
31046, #MS08-012: Vulnerability in Microsoft Publisher Could Allow Remote Code Execution (947085)
31047, #MS08-013: Vulnerability in Microsoft Office Could Allow Remote Code Execution (947108)
31413, #MS08-014: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (949029)
31414, #MS08-015: Vulnerability in Microsoft Outlook Could Allow Remote Code Execution (949031)
31415, #MS08-016: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (949030)
91611, #MS16-070: Security Update for Microsoft Office (3163610)
92019, #MS16-088: Security Update for Microsoft Office (3170008)
92839, #MS16-099: Security Update for Microsoft Office (3177451)
125071, #Security Updates for Microsoft Office Products (May 2019)
125072, #Security Updates for Microsoft Word Products (May 2019)
125832, #Security Updates for Microsoft Word Products (June 2019)
118926, #Security Updates for Microsoft Office Viewer Products (November 2018)
96391, #MS17-002: Security Update for Microsoft Office (3214291)
126580, #Security Updates for Microsoft Excel Products (July 2019)
126583, #Security Updates for Microsoft Office Products (July 2019)
127853, #Security Updates for Microsoft Office Products (August 2019)
108976, #Security Updates for Microsoft Word Products (April 2018)
110492, #Security Updates for Microsoft Excel Products (June 2018)
122128, #Security Updates for Microsoft Excel Products (February 2019)
126585, #Security Updates for Outlook (July 2019)
127854, #Security Updates for Outlook (August 2019)
127856, #Security Updates for Microsoft Word Products (August 2019)
128645, #Security Updates for Microsoft Excel Products (September 2019)
128648, #Security Updates for Microsoft Office Products (September 2019)
108293, #Security Updates for Microsoft Excel Products (March 2018)
130913, #Security Updates for Microsoft Office Products (November 2019)
129727, #Security Updates for Microsoft Excel Products (October 2019)
131937, #Security Updates for Microsoft Office Products (December 2019)
131938, #Security Updates for Microsoft PowerPoint Products (December 2019)
131940, #Security Updates for Microsoft Word Products (December 2019)
130911, #Security Updates for Microsoft Excel Products (November 2019)
132867, #Security Updates for Microsoft Excel Products (January 2020)
133616, #Security Updates for Microsoft Excel Products (February 2020)
135474, #Security Updates for Microsoft Excel Products (April 2020)
135476, #Security Updates for Microsoft Office Products (April 2020)
135482, #Security Updates for Microsoft Word Products (April 2020)
136511, #Security Updates for Microsoft Excel Products (May 2020)
52584, #MS11-016: Vulnerability in Microsoft Groove Could Allow Remote Code Execution (2494047) 
56176, #MS11-073: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2587634)
139497, #Security Updates for Microsoft Excel Products (August 2020)
139499, #Security Updates for Microsoft Office Products (August 2020)
139505, #Security Updates for Outlook (August 2020)
138602, #Microsoft OneDrive Elevation of Privilege (CVE-2020-1465)
139598, #Security Updates for Microsoft .NET Framework (August 2020)
134382, #Security Updates for Microsoft Word Products (March 2020)
137264, #Security Feature Bypass Vulnerability for Microsoft Excel Products (June 2020)
141418, #Security Updates for Microsoft Office Products (October 2020)
141428, #Security Updates for Outlook (October 2020)
142685, #Security Updates for Microsoft Excel Products (November 2020)
142689, #Security Updates for Microsoft Office Products (November 2020)
143555, #Security Updates for Microsoft Office Products (December 2020)
143564, #Security Updates for Microsoft Excel Products (December 2020)
143567, #Security Updates for Microsoft PowerPoint Products (December 2020)
144875, #Security Updates for Microsoft Word Products (January 2021)
144885, #Security Updates for Microsoft Office Products (January 2021)
147218, #Security Updates for Microsoft Office Products (March 2021)
110496, #Security Updates for Microsoft Office Compatibility Products (June 2018)
							]
						}
					end
				end
			end
		end
	end
end
