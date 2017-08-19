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
				class Java < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Java Patch Rollup",
							:plugin_id => -99999,
							:plugin_name => "Missing the latest Java",
							:item_name => "Update to the latest Java",
							:plugin_ids => [
								66932,
								65995,
								56959,
								59462,
								62593,
								45544,
								45379,
								65050,
								63521,
								65052,
								49996,
								52002,
								54997,
								55958,
								56566,
								57290,
								57959,
								64454,
								64790,
								76532,
								73570,
								70472,
								71966,
								61746,
								42373,
								36034,
								40495,
								23931,
								25370,
								24022,
								26923,
								35030,
								31356,
								65048,
								33488,
								78481,
								80908,
								82820,
								25124,
								25627,
								25903,
								31344,
								33487,
								25693,
								30148,
								61681,
								84824,
								33486,
								25709,
								86542,
								88045,
								90625,
								90828,
								92516,
								92516,
								99588,
								94138,
								96628,
								101843,
								

							]
						}
					end
				end
			end
		end
	end
end
