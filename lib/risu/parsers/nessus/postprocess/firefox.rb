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
				class FirefoxRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Firefox Patch Rollup",
							:plugin_id => -99972,
							:plugin_name => "Update to the latest Firefox",
							:item_name => "Update to the latest Firefox",
							:plugin_ids => [
                73099,
                73769,
                74440,
                76763,
                77500,
                77906,
                78473,
                79665,
                80523,
                81521,
                82040,
                82041,
                82503,
                82998,
                83439,
                84581,
								82583,
								85386,
								62998,
								63551,
								64723,
								65131,
								65806,
								66480,
								66993,
								69269,
								69993,
								70716,
								70949,
								71347,
								72331,
								85275,
								85689,
								86071,
								86764,
								87476,
								86418,
								88461,
								89875,
								90793,
								91547,
								88754,
								92755,
								


							]
						}
					end
				end
			end
		end
	end
end
