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
				class SevenZipPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "7-Zip Patch Rollup",
							:plugin_id => -99954,
							:plugin_name => "Missing the latest 7-Zip Patches",
							:item_name => "Update to the latest 7-Zip",
							:plugin_ids => [
91230, #7-Zip < 16.00 Multiple Vulnerabilities
109730, #7-Zip < 18.05 Memory Corruption Arbitrary Code Execution
109799, #7-Zip < 16.03 NULL Pointer Dereference DoS
109800, #7-Zip < 18.00 Multiple Vulnerabilities
180360, #HIGH, 7-Zip < 23.00 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
