# Copyright (c) 2010-2020 Jacob Hammack.
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
				class HPSystemMgtHomePage < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "HP System Management Homepage Patch Rollup",
							:plugin_id => -99985,
							:plugin_name => "Missing the latest HP System Management Homepage Patches",
							:item_name => "Update to the latest HP System Management Homepage",
							:plugin_ids => [
								53532,
								58811,
								59851,
								66541,
								69020,
								70118,
								76345,
								49272,
								72959,
								46015,
								46677,
								78090,
								33548,
								34694,
								38832,
								85181,
								84923,
								73639,
								90150,
								90251,
								91222,
								94654,
103530, #HP System Management Homepage < 7.6.1 Multiple Vulnerabilities (HPSBMU03753)


							]
						}
					end
				end
			end
		end
	end
end
