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
				class AdobeAcrobat < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Acrobat Patch Rollup",
							:plugin_id => -99975,
							:plugin_name => "Update to the latest Adobe Acrobat",
							:item_name => "Update to the latest Adobe Acrobat",
							:plugin_ids => [
								79855,
								83470,
								40803,
								40804,
								40805,
								40806,
								42119,
								43875,
								44643,
								45504,
								47164,
								48374,
								49172,
								50613,
								51924,
								52671,
								53450,
								55143,
								56197,
								57042,
								77813,
								57483,
								58682,
								61561,
								64785,
								63453,
								66409,
								74011,
								84801,
								84800,
								77176,
								77711,
								69845,
								71946,
								86402,
								91096,
								87917,
								89830,
								92034,
								40802,
								40801,
								40800,
								48323,
								49260,
								51062,
								



							]
						}
					end
				end
			end
		end
	end
end
