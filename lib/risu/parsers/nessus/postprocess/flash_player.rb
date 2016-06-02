# Copyright (c) 2010-2016 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

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
								




							]
						}
					end
				end
			end
		end
	end
end
