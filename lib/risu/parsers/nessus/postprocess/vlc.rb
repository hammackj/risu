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
								58416, #HIGH, VLC Media Player < 2.0.1 Multiple Vulnerabilities
								60049, #MEDIUM, VLC Media Player < 2.0.2 Multiple Vulnerabilities
								63381, #HIGH, VLC < 2.0.5 Multiple Vulnerabilities
								66216, #MEDIUM, VLC < 2.0.6 ASF Demuxer Buffer Overflow
								72279, #HIGH, VLC 2.x < 2.1.2 parseRTSPRequestString Function RTSP Command Parsing Overflow
								69015, #MEDIUM, VLC < 2.0.7 Multiple Vulnerabilities
								70560, #HIGH, VLC < 2.0.9 DoS
								78626, #HIGH, VLC Media Player < 2.1.5 Multiple Vulnerabilities
								55608, #HIGH, VLC Media Player 0.5.0 to 1.1.10 Multiple Buffer Overflows
								63137, #HIGH, VLC get_chunk_header Function TiVo File Remote Code Execution
100592, #MEDIUM, VLC Media Player < 2.2.5 Multiple Vulnerabilities
105294, #HIGH, VLC Media Player < 2.2.7 Overflow Condition
136422, #HIGH, VLC < 3.0.9 Multiple Vulnerabilities
126246, #HIGH, VLC < 3.0.7 Multiple Vulnerabilities
128080, #HIGH, VLC < 3.0.8 Multiple Vulnerabilities

							]
						}
					end
				end
			end
		end
	end
end
