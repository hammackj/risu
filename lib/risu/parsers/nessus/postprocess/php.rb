# Copyright (c) 2010-2017 Arxopia LLC.
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
				class PHP < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "PHP Patch Rollup",
							:plugin_id => -99988,
							:plugin_name => "Update to the latest PHP",
							:item_name => "Update to the latest PHP",
							:plugin_ids => [
								76281,
								66843,
								67260,
								69401,
								72881,
								46803,
								66585,
								71427,
								71927,
								73338,
								73862,
								74291,
								76791,
								11850,
								15973,
								17710,
								17796,
								18033,
								20111,
								22268,
								24906,
								29833,
								33849,
								35067,
								41014,
								57537,
								58966,
								66842,
								58988,
								67259,
								77285,
								35750,
								39480,
								43351,
								44921,
								64992,
								66584,
								71426,
								77402,
								78545,
								79246,
								80330,
								81080,
								81510,
								82025,
								83033,
								83517,
								84362,
								84671,
								32123,
								35043,
								48244,
								28181,
								51139,
								51439,
								73289,
								60085,
								48245,
								51140,
								52717,
								55925,
								59056,
								59529,
								



							]
						}
					end
				end
			end
		end
	end
end
