# Copyright (c) 2010-2017 Jacob Hammack.
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
				class WinSCP < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "WinSCP Patch Rollups",
							:plugin_id => -99978,
							:plugin_name => "Missing the latest WinSCP Patches",
							:item_name => "Update to the latest WinSCP",
							:plugin_ids => [
								73613, #WinSCP Heartbeat Information Disclosure (Heartbleed)
								76167, #WinSCP 5.x < 5.5.4 Multiple Vulnerabilities
								78078, #WinSCP 5.x < 5.5.5 Multiple Vulnerabilities
								72388, #WinSCP < 5.1.6 RSA Signature Blob Integer Overflow
								72389, #WinSCP < 5.1.7 Multiple Vulnerabilities


							]
						}
					end
				end
			end
		end
	end
end
