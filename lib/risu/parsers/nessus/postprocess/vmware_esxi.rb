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
				class ESXi < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware ESXi Patch Rollup",
							:plugin_id => -99981,
							:plugin_name => "Update to the latest VMware ESXi",
							:item_name => "Update to the latest VMware ESXi",
							:plugin_ids => [
								70879,
								70880,
								70882,
								70883,
								70884,
								70885,
								70888,
								59447,
								70877,
								70878,
								70881,
								70886,
								70887,
								71773,
								72037,
								76203,
								76368,
								73917,
								81085,
								71774,
								74470,
								78108,
								79862,
								80037,
								81084,
								83781,
								86947,
								86946,
								86945,
								87676,
								81083,
								87940,
								89035,
								89036,
								89037,
								89038,
								87673,
								87674,
								87677,
								87678,
								88906,
								92949,
								87943,
								89106,
								89105,
								89108,
								89678,
								89680,


							]
						}
					end
				end
			end
		end
	end
end
