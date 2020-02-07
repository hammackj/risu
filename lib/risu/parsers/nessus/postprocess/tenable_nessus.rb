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
				class TenableNessusRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Tenable Nessus Patch Rollup",
							:plugin_id => -99945,
							:plugin_name => "Missing the latest Tenable Nessus",
							:item_name => "Update to the latest Tenable Nessus",
							:plugin_ids => [
123462, #Tenable Nessus < 8.3.0 Multiple Vulnerabilities (TNS-2019-02)
121620, #Tenable Nessus < 8.2.2 Stored XSS Vulnerability (TNS-2019-01)

							]
						}
					end
				end
			end
		end
	end
end
