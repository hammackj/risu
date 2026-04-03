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
				class SymantecEndpointPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Symantec Endpoint Patch Rollup",
							:plugin_id => -99953,
							:plugin_name => "Missing the latest Symantec Endpoint Patches",
							:item_name => "Update to the latest Symantec Endpoint",
							:plugin_ids => [
								91895, #CRITICAL, Symantec Endpoint Protection Client 12.1.x < 12.1 RU6 MP5 Multiple Vulnerabilities (SYM16-010)
								71993, #HIGH, Symantec Endpoint Protection Client < 11.0.7.4 / 12.1.2 (SYM14-001)
								90199, #HIGH, Symantec Endpoint Protection Client < 12.1 RU6 MP4 SysPlant.sys Driver RCE (SYM16-003)
								59366, #HIGH, Symantec Endpoint Protection Manager < 11 RU7 MP2 (SYM12-007 / SYM12-008) (credentialed check)
								71994, #HIGH, Symantec Endpoint Protection Manager < 11.0.7.4 / 12.1.2 RU2 (SYM14-001)
								72542, #HIGH, Symantec Endpoint Protection Manager < 11.0 RU7-MP4a / 12.1 RU4a Multiple Vulnerabilities (SYM14-004)
								85256, #HIGH, Symantec Endpoint Protection Manager 11.x / 12.x < 12.1 RU6 MP1 Multiple Vulnerabilities (SYM15-007)
104459, #MEDIUM, Symantec Endpoint Protection Client 12.1.x < 12.1 RU6 MP9 / 14.0.x < 14.0 RU1 Multiple Vulnerabilities (SYM17-011)
131233, #HIGH, Symantec Endpoint Protection Client 12.x < 12.1.7454.7000 / 14.x < 14.2.5323.2000 Multiple Vulnerabilities (SYMSA1488)

							]
						}
					end
				end
			end
		end
	end
end
