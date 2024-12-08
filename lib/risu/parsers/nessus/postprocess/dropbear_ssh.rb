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
				class DropbearSSHServerPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Dropbear SSH Server Patch Rollup",
							:plugin_id => -99952,
							:plugin_name => "Missing the latest Dropbear SSH Server Patches",
							:item_name => "Update to the latest Dropbear SSH Server",
							:plugin_ids => [
								93650, #Dropbear SSH Server < 2016.72 Multiple Vulnerabilities
								58183, #Dropbear SSH Server Channel Concurrency Use-after-free Remote Code Execution
								70545, #Dropbear SSH Server < 2013.59 Multiple Vulnerabilities
								21023, #Dropbear SSH Authorization-pending Connection Saturation DoS
								34769, #Dropbear SSH Server svr_ses.childpidsize Remote Overflow
							]
						}
					end
				end
			end
		end
	end
end
