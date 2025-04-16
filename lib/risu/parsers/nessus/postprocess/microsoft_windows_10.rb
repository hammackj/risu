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
				class MicrosoftWindows10 < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Windows 10 Patch Rollup",
							:plugin_id => -99922,
							:plugin_name => "Missing the latest Microsoft Windows 10",
							:item_name => "Update to the latest Microsoft Windows 10",
							:plugin_ids => [
170963, #Microsoft Windows 10 Version 21H2 Unsupported Version Detection                                 
208292, #HIGH, KB5044273: Windows 10 version 21H2 / Windows 10 Version 22H2 Security Update (October 2024)
205452, #CRITICAL, KB5041580: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (August 2024)
206894, #CRITICAL, KB5043064: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (September 2024)
187795, #HIGH, KB5034122: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (January 2024)
190468, #HIGH, KB5034763: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (February 2024)
191944, #HIGH, KB5035845: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (March 2024)
193090, #HIGH, KB5036892: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (April 2024)
197014, #HIGH, KB5037768: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (May 2024)
202037, #HIGH, KB5040427: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (July 2024)
200343, #CRITICAL, KB5039211: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (June 2024)
206898, #CRITICAL, KB5043050: Windows 10 version 1809 / Windows Server 2019 Security Update (September 2024)
208285, #CRITICAL, KB5044277: Windows 10 version 1809 / Windows Server 2019 Security Update (October 2024)
172532, #CRITICAL, KB5023697: Windows 10 Version 1607 and Windows Server 2016 Security Update (March 2023)
172533, #CRITICAL, KB5023702: Windows 10 version 1809 / Windows Server 2019 Security Update (March 2023)
174108, #CRITICAL, KB5025229: Windows 10 version 1809 / Windows Server 2019 Security Update (April 2023)
174120, #CRITICAL, KB5025228: Windows 10 Version 1607 and Windows Server 2016 Security Update (April 2023)
175339, #CRITICAL, KB5026363: Windows 10 Version 1607 and Windows Server 2016 Security Update (May 2023)
175347, #CRITICAL, KB5026362: Windows 10 version 1809 / Windows Server 2019 Security Update (May 2023)
178152, #CRITICAL, KB5028169: Windows 10 Version 1607 and Windows Server 2016 Security Update (July 2023)
179487, #CRITICAL, KB5029247: Windows 10 version 1809 / Windows Server 2019 Security Update (August 2023)
179498, #CRITICAL, KB5029242: Windows 10 Version 1607 and Windows Server 2016 Security Update (August 2023)
182862, #CRITICAL, KB5031362: Windows 10 Version 1607 and Windows Server 2016 Security Update (October 2023)
185576, #CRITICAL, KB5032197: Windows 10 Version 1607 and Windows Server 2016 Security Update (November 2023)
185579, #CRITICAL, KB5032196: Windows 10 version 1809 / Windows Server 2019 Security Update (November 2023)
202028, #CRITICAL, KB5040430: Windows 10 version 1809 / Windows Server 2019 Security Update (July 2024)
202043, #CRITICAL, KB5040434: Windows 10 Version 1607 / Windows Server 2016 Security Update (July 2024)
205447, #CRITICAL, KB5041773: Windows 10 Version 1607 / Windows Server 2016 Security Update (August 2024)
206902, #CRITICAL, KB5043051: Windows 10 Version 1607 / Windows Server 2016 Security Update (September 2024)
208298, #CRITICAL, KB5044293: Windows 10 Version 1607 / Windows Server 2016 Security Update (October 2024)
205461, #CRITICAL, KB5041578: Windows 10 version 1809 / Windows Server 2019 Security Update (August 2024)
168694, #HIGH, KB5021235: Windows 10 Version 1607 and Windows Server 2016 Security Update (December 2022)
181303, #HIGH, KB5030214: Windows 10 version 1809 / Windows Server 2019 Security Update (September 2023)
181312, #HIGH, KB5030213: Windows 10 Version 1607 and Windows Server 2016 Security Update (September 2023)
186789, #HIGH, KB5033371: Windows 10 version 1809 / Windows Server 2019 Security Update (December 2023)
186791, #HIGH, KB5033373: Windows 10 Version 1607 and Windows Server 2016 Security Update (December 2023)
187800, #HIGH, KB5034119: Windows 10 Version 1607 and Windows Server 2016 Security Update (January 2024)
187803, #HIGH, KB5034127: Windows 10 version 1809 / Windows Server 2019 Security Update (January 2024)
190482, #HIGH, KB5034768: Windows 10 version 1809 / Windows Server 2019 Security Update (February 2024)
190487, #HIGH, KB5034767: Windows 10 Version 1607 and Windows Server 2016 Security Update (February 2024)
191934, #HIGH, KB5035855: Windows 10 Version 1607 / Windows Server 2016 Security Update (March 2024)
191938, #HIGH, KB5035849: Windows 10 version 1809 / Windows Server 2019 Security Update (March 2024)
212239, #HIGH, KB5048661: Windows 10 version 1809 / Windows Server 2019 Security Update (December 2024)
214115, #HIGH, KB5050008: Windows 10 version 1809 / Windows Server 2019 Security Update (January 2025)
214123, #HIGH, KB5049993: Windows 10 Version 1607 / Windows Server 2016 Security Update (January 2025)
216134, #HIGH, KB5052006: Windows 10 Version 1607 / Windows Server 2016 Security Update (February 2025)
193091, #HIGH, KB5036896: Windows 10 version 1809 / Windows Server 2019 Security Update (April 2024)
193097, #HIGH, KB5036899: Windows 10 Version 1607 / Windows Server 2016 Security Update (April 2024)
197006, #HIGH, KB5037765: Windows 10 version 1809 / Windows Server 2019 Security Update (May 2024)
197009, #HIGH, KB5037763: Windows 10 Version 1607 / Windows Server 2016 Security Update (May 2024)
212232, #HIGH, KB5048671: Windows 10 Version 1607 / Windows Server 2016 Security Update (December 2024)
216131, #HIGH, KB5052000: Windows 10 version 1809 / Windows Server 2019 Security Update (February 2025)
							]
						}
					end
				end
			end
		end
	end
end


