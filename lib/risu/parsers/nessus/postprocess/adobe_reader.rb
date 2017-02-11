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
				class AdobeReader < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Reader Patch Rollup",
							:plugin_id => -99998,
							:plugin_name => "Update to the latest Adobe Reader",
							:item_name => "Update to the latest Adobe Reader",
							:plugin_ids => [
								30200,
								33256,
								34695,
								35821,
								38746,
								39355,
								42120,
								43876,
								44644,
								45505,
								47165,
								48375,
								49173,
								50614,
								51925,
								55144,
								56198,
								56213,
								66517,
								66542,
								74012,
								58683,
								61562,
								63454,
								64786,
								66410,
								69846,
								71947,
								57043,
								57484,
								24002,
								23776,
								23975,
								52672,
								53451,
								21698,
								77712,
								79856,
								77175,
								83471,
								40494,
								27584,
								86403,
								87918,
								89831,
								70343,
								91097,
								92035,
								94072,
								


							]
						}
					end
				end
			end
		end
	end
end
