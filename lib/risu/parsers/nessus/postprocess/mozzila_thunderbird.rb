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
				class MozzilaThunderbirdPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Mozzila Thunderbird Patch Rollup",
							:plugin_id => -99949,
							:plugin_name => "Missing the latest Mozzila Thunderbird Patches",
							:item_name => "Update to the latest Mozzila Thunderbird",
							:plugin_ids => [
								105507, #Mozilla Thunderbird < 52.5.2 Multiple Vulnerabilities
								108519, #Mozilla Thunderbird < 52.6 Multiple Vulnerabilities
								109946, #Mozilla Thunderbird < 52.8 Multiple Vulnerabilities (EFAIL)
								105044, #Mozilla Thunderbird < 52.5 Multiple Vulnerabilities
								111044, #Mozilla Thunderbird < 52.9 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
