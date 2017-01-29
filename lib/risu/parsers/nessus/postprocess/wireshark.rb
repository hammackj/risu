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
				class Wireshark < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Wireshark Patch Rollups",
							:plugin_id => -99992,
							:plugin_name => "Update to the latest Wireshark",
							:item_name => "Update to the latest Wireshark",
							:plugin_ids => [
								61572,
								64361,
								65253,
								66543,
								65254,
								66544,
								72941,
								66895,
								69104,
								69880,
								70763,
								71520,
								56164,
								56690,
								58518,
								59240,
								60117,
								62477,
								63095,
								66894,
								57539,
								53473,
								57538,
								61571,
								54942,
								55510,
								56163,
								56689,
								58517,
								59239,
								60116,
								51458,
								52502,
								83488,
								36127,
								40335,
								43350,
								44338,
								46864,
								48213,
								48943,
								89103,
								90786,
								90787,
								92817,
								

							]
						}
					end
				end
			end
		end
	end
end
