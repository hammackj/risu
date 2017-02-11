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
				class Apache < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apache Patch Rollup",
							:plugin_id => -99986,
							:plugin_name => "Update to the latest Apache",
							:item_name => "Update to the latest Apache",
							:plugin_ids => [
								11030,
								11137,
								11793,
								11915,
								31654,
								55976,
								57792,
								12280,
								17696,
								31408,
								73405,
								56216,
								57791,
								62101,
								64912,
								68915,
								77531,
								45004,
								57603,
								42052,
								48205,
								50070,
								53896,
								69014,
								76622,
								81126,
								73081,
								84959,
								40467,
								
							]
						}
					end
				end
			end
		end
	end
end
