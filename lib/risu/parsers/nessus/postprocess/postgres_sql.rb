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
				class PostgresSQLRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Postgres SQL Patch Rollup",
							:plugin_id => -99933,
							:plugin_name => "Missing the latest Postgres SQL",
							:item_name => "Update to the latest Postgres SQL",
							:plugin_ids => [
127905, #PostgreSQL 9.4.x < 9.4.24 / 9.5.x < 9.5.19 / 9.6.x < 9.6.15 / 10.x < 10.10 / 11.x < 11.5 Multiple Vulnerabilities
94610, #PostgreSQL 9.1.x < 9.1.24 / 9.2.x < 9.2.19 / 9.3.x < 9.3.15 / 9.4.x < 9.4.10 / 9.5.x < 9.5.5 / 9.6.x < 9.6.1 Aggregate Functions Use-after-free DoS
97435, #PostgreSQL 9.2.x < 9.2.20 / 9.3.x < 9.3.16 / 9.4.x < 9.4.11 / 9.5.x < 9.5.6 / 9.6.x < 9.6.2 Multiple Vulnerabilities
125264, #PostgreSQL 9.4.x < 9.4.22 / 9.5.x < 9.5.17 / 9.6.x < 9.6.13 / 10.x < 10.8 / 11.x < 11.3 Multiple vulnerabilities
110288, #PostgreSQL 9.3 < 9.3.23 / 9.4 < 9.4.18 / 9.5 < 9.5.13 / 9.6 < 9.6.9 / 10.3 Insecure ACL Remote Issue
144060, #PostgreSQL 9.5.x < 9.5.24 / 9.6.x < 9.6.20 / 10.x < 10.15 / 11.x < 11.10 / 12.x < 12.5 / 13.x < 13.1 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end


