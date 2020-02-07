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
				class DB2 < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "DB2 Patch Rollup",
							:plugin_id => -99980,
							:plugin_name => "Missing the latest DB2 Patches",
							:item_name => "Update to the latest DB2",
							:plugin_ids => [
								62701, #IBM DB2 9.7 < Fix Pack 7 Multiple Vulnerabilities
								71519, #IBM DB2 9.7 < Fix Pack 9 Multiple Vulnerabilities
								76114, #IBM DB2 9.7 < Fix Pack 9a Multiple Vulnerabilities
								76116, #IBM DB2 Stored Procedure Infrastructure Privilege Escalation Vulnerability
								84828, #IBM DB2 9.7 < Fix Pack 11 Multiple Vulnerabilities (Bar Mitzvah) (FREAK) (TLS POODLE)
							]
						}
					end
				end
			end
		end
	end
end
