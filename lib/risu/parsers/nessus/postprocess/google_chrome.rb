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
				class GoogleChrome < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Google Chrome Patch Rollup",
							:plugin_id => -99990,
							:plugin_name => "Update to the latest Google Chrome",
							:item_name => "Update to the latest Google Chrome",
							:plugin_ids => [
								74434,
								76581,
								80485,
								80951,
								81020,
								81207,
								81647,
								82534,
								82825,
								83136,
								83366,
								83745,
								84049,
								84667,
								84731,
								84921,
								77409,
								77581,
								77861,
								78080,
								78475,
								79141,
								79336,
								79578,
								79836,
								84342,
								77184,
								85567,
								85743,
								86061,
								86209,
								86380,
								86598,
								86852,
								87206,
								87245,
								87417,
								88088,
								88681,
								90794,
								88956,
								89685,
								89786,
								90194,
								90542,
								73419,
								74008,
								70916,
								70923,
								72167,
								72939,
								66813,
								62313,
								62519,
								63110,
								63232,
								63468,
								63645,
								73710,
								74122,
								71227,
								71968,
								72616,
								72800,
								73082,
								67232,
								69139,
								69423,
								70273,
								70494,
								66556,
								66930,
								



							]
						}
					end
				end
			end
		end
	end
end
