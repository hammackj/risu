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
				class AppleQuicktime < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apple QuickTime Patch Rollup",
							:plugin_id => -99973,
							:plugin_name => "Update to the latest Apple QuickTime",
							:item_name => "Update to the latest Apple QuickTime",
							:plugin_ids => [
								66636,
								72706,
								78678,
								62890,
								87848,
								85662,
								84505,
								59113,
								56667,
								55764,
								21556,
								22336,
								24761,
								25123,
								25347,
								25703,
								26916,
								29698,
								29982,
								31735,
								33130,
								34119,
								34460,
								35437,
								38988,
								40929,
								45388,
								27626,
								30204,
								
							]
						}
					end
				end
			end
		end
	end
end
