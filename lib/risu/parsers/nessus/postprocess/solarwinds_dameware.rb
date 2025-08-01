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
				class SolarWindsDameWareRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "SolarWinds DameWare Patch Rollup",
							:plugin_id => -99936,
							:plugin_name => "Missing the latest SolarWinds DameWare",
							:item_name => "Update to the latest SolarWinds DameWare",
							:plugin_ids => [
								124062, #SolarWinds DameWare Mini Remote Client Agent < 12.0.3 Stack Buffer Overflow
								130458, #SolarWinds Dameware Mini Remote Control Unauthenticated RCE
								126263, #HIGH, SolarWinds Dameware Mini Remote Control Client Public Key Buffer Over-read								
							]
						}
					end
				end
			end
		end
	end
end


