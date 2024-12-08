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
							]
						}
					end
				end
			end
		end
	end
end


