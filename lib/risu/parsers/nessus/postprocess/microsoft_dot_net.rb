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
				class MicrosoftDotNet < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft .NET Patch Rollup",
							:plugin_id => -99925,
							:plugin_name => "Missing the latest Microsoft .NET",
							:item_name => "Update to the latest Microsoft .NET",
							:plugin_ids => [
209021, #HIGH, Security Update for Microsoft .NET Core (July 2024)
193217, #HIGH, Security Updates for Microsoft .NET Framework (April 2024)
179664, #Security Updates for Microsoft .NET Framework (August 2023)
174219, #Security Updates for Microsoft .NET core (April 2023)
185886, #Security Update for Microsoft .NET Core (November 2023) (CVE-2023-36558)
150365, #Security Update for .NET Core SDK (June 2021)
150708, #Security Update for .NET Core (June 2021)
152488, #Security Update for .NET Core (August 2021)
156227, #Security Updates for Microsoft ASP.NET Core (December 2021)
157879, #Security Update for .NET Core (February 2022)
158744, #Security Updates for Microsoft .NET core (March 2022)
161167, #Security Updates for Microsoft .NET core (May 2022)
177265, #Security Update for .NET Core (June 2023)
178193, #Security Update for Microsoft .NET Core (July 2023)
167254, #Security Updates for Microsoft .NET Framework (November 2022)
167885, #Security Updates for Microsoft .NET Framework (May 2022)
168395, #Security Updates for Microsoft .NET Framework (April 2022)
168396, #Security Updates for Microsoft .NET Framework (February 2021)
168397, #Security Updates for Microsoft .NET Framework (January 2022)
179502, #Security Update for Microsoft .NET Core (August 2023)
181277, #Security Update for Microsoft .NET Core (September 2023)
183025, #Security Update for Microsoft .NET 6 Core (October 2023)
168747, #Security Updates for Microsoft .NET Core (December 2022)
171545, #Security Updates for Microsoft .NET core (February 2023)
202031, #HIGH, Security Update for Microsoft .NET Core (July 2024)
147946, #HIGH, Security Update for .NET Core (March 2021)
190535, #HIGH, Security Update for Microsoft .NET Core (February 2024)
133049, #HIGH, Security Update for Microsoft ASP.NET Core (January 2020)
185887, #Security Updates for Microsoft .NET Framework (November 2023)
177393, #Security Updates for Microsoft .NET Framework (June 2023)
168745, #Security Updates for Microsoft .NET Framework (December 2022)
169775, #Security Updates for Microsoft .NET Core (January 2023)
168398, #HIGH, Security Updates for Microsoft .NET Framework (September 2022)
208286, #HIGH, Security Update for Microsoft .NET Core (October 2024)
202304, #HIGH, Security Updates for Microsoft .NET Framework (July 2024)
208757, #HIGH, Security Updates for Microsoft .NET Framework (October 2024)
171598, #Security Updates for Microsoft .NET Framework (February 2023)
141503, #Security Updates for Microsoft .NET Framework (October 2020)
187859, #CRITICAL, Security Update for Microsoft .NET Core (January 2024)
193142, #MEDIUM, Security Update for Microsoft .NET Core (April 2024)
136564, #Security Updates for Microsoft .NET Framework (May 2020)
138464, #Security Updates for Microsoft .NET Framework (July 2020)
							]
						}
					end
				end
			end
		end
	end
end


