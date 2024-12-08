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
				class MicrosoftWindowsServer < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Windows Server Patch Rollup",
							:plugin_id => -99926,
							:plugin_name => "Missing the latest Microsoft Windows Server",
							:item_name => "Update to the latest Microsoft Windows Server",
							:plugin_ids => [
162205, #HIGH, KB5014678: Windows Server 2022 Security Update (June 2022)
163045, #HIGH, KB5015827: Windows Server 2022 Security Update (July 2022)
166032, #HIGH, KB5018421: Windows Server 2022 Security Update (October 2022)
167107, #HIGH, KB5019081: Windows Server 2022 / Azure Stack HCI 21H2 / 22H2 Security Update (November 2022)
200336, #CRITICAL, KB5039227: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (June 2024)
202039, #CRITICAL, KB5040437: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (July 2024)
205456, #CRITICAL, KB5041160: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (August 2024)
206897, #CRITICAL, KB5042881: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (September 2024)
208295, #CRITICAL, KB5044281: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (October 2024)
168690, #HIGH, KB5021249: Windows Server 2022 Security Update (December 2022)
169776, #HIGH, KB5022291: Windows Server 2022 Security Update (January 2023)
181305, #HIGH, KB5030216: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (September 2023)
186777, #HIGH, KB5033118: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (December 2023)
187790, #HIGH, KB5034129: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (January 2024)
190481, #HIGH, KB5034770: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (February 2024)
191947, #HIGH, KB5035857: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (March 2024)
193095, #HIGH, KB5036909: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (April 2024)
197015, #HIGH, KB5037782: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (May 2024)
159681, #CRITICAL, KB5012604: Windows Server 2022 Security Update (April 2022)
160929, #CRITICAL, KB5013944: Windows Server 2022 Security Update (May 2022)
163953, #CRITICAL, KB5016627: Windows Server 2022 Security Update (August 2022)
165000, #CRITICAL, KB5017392: Windows Server 2022 Security Update (September 2022)
171444, #CRITICAL, KB5022842: Windows Server 2022 Security Update (February 2023)
172518, #CRITICAL, KB5023705: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (March 2023)
174113, #CRITICAL, KB5025230: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (April 2023)
175341, #CRITICAL, KB5026370: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (May 2023)
177235, #CRITICAL, KB5027225: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (June 2023)
178155, #CRITICAL, KB5028171: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (July 2023)
179492, #CRITICAL, KB5029250: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (August 2023)
182851, #CRITICAL, KB5031364: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (October 2023)
185588, #CRITICAL, KB5032198: Windows Server 2022 / Azure Stack HCI 22H2 Security Update (November 2023)
191942, #CRITICAL, KB5035885: Windows Server 2012 R2 Security Update (March 2024)
193101, #CRITICAL, KB5036960: Windows Server 2012 R2 Security Update (April 2024)
197010, #CRITICAL, KB5037823: Windows Server 2012 R2 Security Update (May 2024)
187901, #CRITICAL, Security Updates for Microsoft .NET Framework (January 2024)
190478, #CRITICAL, KB5034809: Windows Server 2008 R2 Security Update (February 2024)
186782, #CRITICAL, KB5033420: Windows Server 2012 R2 Security Update (December 2023)
190490, #CRITICAL, KB5034819: Windows Server 2012 R2 Security Update (February 2024)
171440, #KB5022874: Windows Server 2008 R2 Security Update (February 2023)
172517, #KB5023759: Windows Server 2008 R2 Security Update (March 2023)
174103, #KB5025277: Windows Server 2008 R2 Security Update (April 2023)
175344, #KB5026426: Windows Server 2008 R2 Security Update (May 2023)
177241, #KB5027256: Windows Server 2008 R2 Security Update (June 2023)
178168, #KB5028224: Windows Server 2008 R2 Security Update (July 2023)
179489, #KB5029307: Windows Server 2008 R2 Security Update (August 2023)
185577, #KB5032249: Windows Server 2012 R2 Security Update (November 2023)
187799, #HIGH, KB5034171: Windows Server 2012 R2 Security Update (January 2024)
187805, #HIGH, KB5034167: Windows Server 2008 R2 Security Update (January 2024)
179501, #CRITICAL, KB5029304: Windows Server 2012 R2 Security Update (August 2023)
182864, #CRITICAL, KB5031407: Windows Server 2012 R2 Security Update (October 2023)
200338, #CRITICAL, KB5039294: Windows Server 2012 R2 Security Update (June 2024)
168687, #KB5021296: Windows Server 2012 R2 Security Update (December 2022)
171453, #KB5022894: Windows Server 2012 R2 Security Update (February 2023)
172535, #KB5023764: Windows Server 2012 R2 Security Update (March 2023)
174118, #KB5025288: Windows Server 2012 R2 Security Update (April 2023)
163947, #KB5016683: Windows Server 2012 R2 Security Update (August 2022)
165005, #KB5017365: Windows Server 2012 R2 Security Update (September 2022)
175349, #KB5026409: Windows Server 2012 R2 Security Update (May 2023)
186781, #CRITICAL, KB5033424: Windows Server 2008 R2 Security Update (December 2023)
182857, #KB5031441: Windows Server 2008 R2 Security Update (October 2023)
181299, #MEDIUM, KB5030261: Windows Server 2008 R2 Security Update (September 2023)
156073, #KB5008285: Windows Server 2012 R2 Security Update (December 2021)
156624, #KB5009595: Windows Server 2012 R2 Security Updates (January 2022)
157431, #KB5010395: Windows Server 2012 R2 Security Update (February 2022)
158702, #KB5011560: Windows Server 2012 R2 Security Update (March 2022)
163042, #KB5015877: Windows Server 2012 R2 Security Update (July 2022)
160931, #KB5014001: Windows Server 2012 R2 Security Update (May 2022)
162202, #KB5014746: Windows Server 2012 R2 Security Update (June 2022)
169789, #KB5022346: Windows Server 2012 R2 Security Update (January 2023)
177237, #KB5027282: Windows Server 2012 R2 Security Update (June 2023)
168681, #KB5021288: Windows Server 2008 R2 Security Update (December 2022)
165002, #KB5017373: Windows Server 2008 R2 Security Update (September 2022)
166024, #KB5018479: Windows Server 2008 R2 Security Update (October 2022)
167103, #KB5020013: Windows Server 2008 R2 Security Update (November 2022)
							]
						}
					end
				end
			end
		end
	end
end


