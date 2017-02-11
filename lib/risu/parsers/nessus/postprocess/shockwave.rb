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
				class Shockwave < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Shockwave Player Patch Rollup",
							:plugin_id => -99991,
							:plugin_name => "Update to the latest Shockwave Player",
							:item_name => "Update to the latest Shockwave Player",
							:plugin_ids => [
								72435,
								72983,
								42369,
								51936,
								71342,
								44094,
								39564,
								40421,
								44094,
								46329,
								48436,
								50387,
								55142,
								55833,
								56734,
								57941,
								59047,
								61536,
								62702,
								64621,
								65913,
								67233,
								69844,
								84765,
								85882,
								86633,
								

							]
						}
					end
				end
			end
		end
	end
end
