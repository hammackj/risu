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
								91128,
								91350,
								91455,
								61381,
								61462,
								61774,
								62518,
								62861,
								63063,
								64813,
								65029,
								65097,
								93315,
								92628,
								92791,
								59117,
								59255,
								59735,
								59958,
								91716,
								93476,
								93817,
								99633,
								99995,
								94136,
								94580,
								94676,
								95480,
								96828,
								97724,
								99136,
								



							]
						}
					end
				end
			end
		end
	end
end
