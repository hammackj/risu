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
				class AdobeAir < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Air Patch Rollup",
							:plugin_id => -99994,
							:plugin_name => "Update to the latest Adobe Air",
							:item_name => "Update to the latest Adobe Air",
							:plugin_ids => [
								52755,
								53474,
								55805,
								55806,
								66444,
								66871,
								69865,
								70214,
								70857,
								71350,
								71947,
								71950,
								73432,
								73993,
								74430,
								73432,
								73993,
								74430,
								58537,
								59425,
								61624,
								62835,
								62479,
								63449,
								64583,
								65218,
								65909,
								66444,
								66871,
								63241,
								77171,
								77576,
								78440,
								79139,
								80483,
								34815,
								40447,
								43069,
								46858,
								48299,
								50604,
								44595,
								84155,
								84156,
								84157,
								84158,
								84641,
								85325,
								86059,
								86368,
								86850,
								87243,
								87656,
								88638,
								89868,
								91162,
								93523,
								


							]

						}

					end
				end
			end
		end
	end
end
