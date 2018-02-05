# Copyright (c) 2010-2018 Jacob Hammack.
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
				class VMwareVCenter < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware vCenter Patch Rollup",
							:plugin_id => -99979,
							:plugin_name => "Missing the latest VMware vCenter Patches",
							:item_name => "Update to the latest VMware vCenter",
							:plugin_ids => [
								79865,
								66274,
								66806,
								70612,
								77728,
								65209,
								65223,
								76457,
								83186,
								81146,
								79147,
								86255,
								66812,
								87763,
								90710,
								91322,
								87592,
								92870,






							]
						}
					end
				end
			end
		end
	end
end
