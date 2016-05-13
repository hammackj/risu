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
