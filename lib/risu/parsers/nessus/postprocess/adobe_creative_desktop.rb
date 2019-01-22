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
				class AbobeCreativeCloudDesktopRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Creative Cloud Desktop Patch Rollup",
							:plugin_id => -99948,
							:plugin_name => "Missing the latest Adobe Creative Cloud Desktop Patches",
							:item_name => "Update to the latest Adobe Creative Cloud Desktop",
							:plugin_ids => [
								99366, #Adobe Creative Cloud Desktop < 4.0.0.185 Multiple Vulnerabilities (APSB17-13)
								91386, #Adobe Creative Cloud <= 3.5.1.209 Arbitrary File Read/Write Vulnerability
94055, #Adobe Creative Cloud Desktop < 3.8.0.310 Unquoted Search Path Local Privilege Escalation (APSB16-34)

							]
						}
					end
				end
			end
		end
	end
end
