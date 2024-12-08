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
				class MySQLRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "MySQL Patch Rollup",
							:plugin_id => -99932,
							:plugin_name => "Missing the latest MySQL",
							:item_name => "Update to the latest MySQL",
							:plugin_ids => [
132957, #MySQL 5.7.x < 5.7.29 Multiple Vulnerabilities (Jan 2020 CPU)
141797, #MySQL 5.7.x < 5.7.32 Multiple Vulnerabilities (Oct 2020 CPU)
154259, #MySQL 5.7.x < 5.7.36 Multiple Vulnerabilities (Oct 2021 CPU)
148936, #MySQL 5.7.x < 5.7.34 Multiple Vulnerabilities (Apr 2021 CPU)
151969, #MySQL 5.7.x < 5.7.35 Multiple Vulnerabilities (Jul 2021 CPU)
145247, #MySQL 5.7.x < 5.7.33 Multiple Vulnerabilities (Jan 2021 CPU)
138561, #MySQL Denial of Service (Jul 2020 CPU)
138570, #MySQL 5.7.x < 5.7.31 Multiple Vulnerabilities (Jul 2020 CPU)


							]
						}
					end
				end
			end
		end
	end
end


