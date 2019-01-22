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
				class OracleDatabase < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Oracle Database Patch Rollup",
							:plugin_id => -99993,
							:plugin_name => "Missing the latest Oracle Database Patches",
							:item_name => "Update to the latest Oracle Database",
							:plugin_ids => [
								45625,
								56051,
								56052,
								56053,
								56056,
								56066,
								50652,
								47718,
								45626,
								51573,
								53897,
								56054,
								56055,
								56057,
								56058,
								56060,
								56064,
								56065,
								56059,
								56061,
								56062,
								56063,
								56653,
								57589,
								55632,
								11227,
								10848,
								10851,
								11223,
								11224,
								11226,
								10852,
								55786,
								84822,
								82903,
								80906,
								78540,
								72982,



							]
						}
					end
				end
			end
		end
	end
end
