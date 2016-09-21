# Copyright (c) 2010-2016 Arxopia LLC.
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
				class FlashPlayer < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Flash Player Patch Rollup",
							:plugin_id => -99997,
							:plugin_name => "Update to the latest Flash Player",
							:item_name => "Update to the latest Flash Player",
							:plugin_ids => [
								46859,
								48300,
								49307,
								50493,
								51926,
								52673,
								53472,
								54299,
								54972,
								55140,
								55803,
								56259,
								56874,
								58001,
								58207,
								58538,
								58994,
								59196,
								59426,
								61622,
								62480,
								62836,
								63242,
								63450,
								64506,
								64584,
								64916,
								65219,
								65910,
								66445,
								66872,
								67225,
								69866,
								70858,
								71351,
								71951,
								72284,
								74431,
								73994,
								73740,
								73433,
								72606,
								76413,
								34741,
								35742,
								40434,
								43068,
								25694,
								72937,
								22056,
								44596,
								23869,
								20158,
								29741,
								21079,
								77172,
								77577,
								78441,
								79140,
								79442,
								79835,
								80484,
								80998,
								81127,
								81819,
								80946,
								83365,
								82781,
								61550,
								84048,
								84365,
								84642,
								84730,
								31799,
								85326,
								86060,
								86369,
								86423,
								86851,
								87244,
								87657,
								88639,
								88639,
								11323,
								89834,
								90425,
								91163,
								91670,
								92012,
								11952,
							]
						}
					end
				end
			end
		end
	end
end
