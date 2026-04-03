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
				class RealPlayerPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "RealPlayer Patch Rollup",
							:plugin_id => -99957,
							:plugin_name => "Missing the latest RealPlayer Patches",
							:item_name => "Update to the latest RealPlayer",
							:plugin_ids => [
								57863, #HIGH, RealPlayer for Windows < 15.0.2.71 Multiple Vulnerabilities
								59173, #HIGH, RealPlayer for Windows < 15.0.4.53 Multiple Vulnerabilities
								62065, #HIGH, RealPlayer for Windows < 15.0.6.14 Multiple Vulnerabilities
								63289, #HIGH, RealPlayer for Windows < 16.0.0.282 Multiple Vulnerabilities
								65630, #HIGH, RealPlayer for Windows < 16.0.1.18 MP4 Heap-Based Buffer Overflow
								69472, #HIGH, RealPlayer for Windows < 16.0.3.51 Multiple Vulnerabilities
								71772, #HIGH, RealPlayer for Windows < 17.0.4.61 RMP Buffer Overflow
								76458, #HIGH, RealPlayer for Windows <= 17.0.8.22 MP4 Multiple Memory Corruptions

							]
						}
					end
				end
			end
		end
	end
end
