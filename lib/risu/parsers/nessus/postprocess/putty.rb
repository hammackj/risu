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
				class PuTTYRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "PuTTY Patch Rollup",
							:plugin_id => -99938,
							:plugin_name => "Missing the latest PuTTY",
							:item_name => "Update to the latest PuTTY",
							:plugin_ids => [
123418, #PuTTY < 0.71 Multiple Vulnerabilities
105154, #PuTTY < 0.67 PSCP Server Header Handling Stack Buffer Overflow
193433, #HIGH, PuTTY < 0.81 Key Recovery Attack Vulnerability								
							]
						}
					end
				end
			end
		end
	end
end


