# Copyright (c) 2010-2019 Jacob Hammack.
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
				class DellIDracRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Dell iDRAC Products Patch Rollup",
							:plugin_id => -99947,
							:plugin_name => "Missing the latest Dell iDRAC Patches",
							:item_name => "Update to the latest Dell iDRAC",
							:plugin_ids => [
109208, #Dell iDRAC Products Multiple Vulnerabilities (Mar 2018) 
111604, #Dell iDRAC Products Multiple Vulnerabilities (June 2018) 
119833, #Dell iDRAC Products Multiple Vulnerabilities (December 2018)
90265, #Dell iDRAC6 / iDRAC7 / iDRAC8 Path Traversal Authentication Bypass

							]
						}
					end
				end
			end
		end
	end
end
