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
				class VLCRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VLC Patch Rollup",
							:plugin_id => -99970,
							:plugin_name => "Missing the latest VLC Patches",
							:item_name => "Update to the latest VLC",
							:plugin_ids => [
								58416,
								60049,
								63381,
								66216,
								72279,
								69015,
								70560,
								78626,
								55608,
								63137,
100592, #VLC Media Player < 2.2.5 Multiple Vulnerabilities - 100592
105294, #VLC Media Player < 2.2.7 Overflow Condition
136422, #VLC < 3.0.9 Multiple Vulnerabilities
126246, #VLC < 3.0.7 Multiple Vulnerabilities
128080, #VLC < 3.0.8 Multiple Vulnerabilities

							]
						}
					end
				end
			end
		end
	end
end
