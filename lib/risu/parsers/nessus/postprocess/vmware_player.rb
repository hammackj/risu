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
				class VMwarePlayer < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware Player Patch Rollup",
							:plugin_id => -99976,
							:plugin_name => "Missing the latest VMware Player Patches",
							:item_name => "Update to the latest VMware Player",
							:plugin_ids => [
								71231, #HIGH, VMware Player 5.x < 5.0.3 LGTOSYNC.SYS Guest Privilege Escalation (VMSA-2013-0014)
								76454, #MEDIUM, VMware Player < 5.0.4 / 6.0.3 OpenSSL Library Multiple Vulnerabilities (Windows)
								73672, #MEDIUM, VMware Player 6.x < 6.0.2 OpenSSL Library Multiple Vulnerabilities (VMSA-2014-0004) (Heartbleed)
								74265, #MEDIUM, VMware Player 6.x < 6.0.2 Windows 8.1 Guest Privilege Escalation (VMSA-2014-0005)
								84219, #MEDIUM, VMware Player 6.x < 6.0.6 Multiple Vulnerabilities (VMSA-2015-0004)
								84805, #HIGH, VMware Player 6.x < 6.0.7 / 7.x < 7.1.1 DACL Privilege Escalation (VMSA-2015-0005)
								81185, #MEDIUM, VMware Player 6.x < 6.0.5 Multiple Vulnerabilities (VMSA-2015-0001) (Windows)


							]
						}
					end
				end
			end
		end
	end
end
