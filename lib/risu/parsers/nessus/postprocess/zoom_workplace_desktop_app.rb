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
				class ZoomWorkplaceDesktopApp < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Zoom Workplace Desktop App Patch Rollup",
							:plugin_id => -99923,
							:plugin_name => "Missing the latest Zoom Workplace Desktop App",
							:item_name => "Update to the latest Zoom Workplace Desktop App",
							:plugin_ids => [
200481, #MEDIUM, Zoom Workplace Desktop App < 5.17.11 Divide By Zero Vulnerability (ZSB-24018)
202591, #MEDIUM, Zoom Workplace Desktop App For Windows < 6.0.10 Privilage Escalation (ZSB-24026)
202593, #MEDIUM, Zoom Workplace Desktop App For Windows < 6.0.10 RACE condition (ZSB-24028)
204852, #MEDIUM, Zoom Workplace Desktop App < 6.0.0 Improper Input Validation (ZSB-24020)
207228, #MEDIUM, Zoom Workplace Desktop App < 6.1.0 Information Disclosure (ZSB-24036)
							]
						}
					end
				end
			end
		end
	end
end


