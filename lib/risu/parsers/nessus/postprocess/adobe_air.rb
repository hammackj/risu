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
				class AdobeAir < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Air Patch Rollup",
							:plugin_id => -99994,
							:plugin_name => "Missing the latest Adobe Air Patches",
							:item_name => "Update to the latest Adobe Air",
							:plugin_ids => [
								56959, #Adobe AIR <= 3.0 Multiple Vulnerabilities (APSB11-28)
								52755, #Adobe AIR < 2.6 Unspecified Memory Corruption (APSB11-05)
								53474, #Adobe AIR < 2.6.0.19140 ActionScript Predefined Class Prototype Addition Remote Code Execution (APSB11-07)
								55805, #Adobe AIR < 2.7.1 Multiple Vulnerabilities (APSB11-21)
								66444, #Adobe AIR <= 3.7.0.1530 Multiple Vulnerabilities (APSB13-14)
								66871, #Adobe AIR <= 3.7.0.1860 Memory Corruption (APSB13-16)
								69865, #Adobe AIR <= 3.8.0.870 Memory Corruptions (APSB13-21)
								70214, #Adobe AIR <= 3.7.0.2090 Multiple Vulnerabilities (APSB13-17)
								70857, #Adobe AIR <= 3.9.0.1030 Memory Corruptions (APSB13-26)
								71350, #Adobe AIR <= AIR 3.9.0.1210 Multiple Vulnerabilities (APSB13-28)
								71950, #Adobe AIR <= AIR 3.9.0.1380 Multiple Vulnerabilities (APSB14-02)
								73432, #Adobe AIR <= AIR 4.0.0.1628 Multiple Vulnerabilities (APSB14-09)
								73993, #Adobe AIR <= AIR 13.0.0.83 Multiple Vulnerabilities (APSB14-14)
								74430, #Adobe AIR <= AIR 13.0.0.111 Multiple Vulnerabilities (APSB14-16)
								73432, #Adobe AIR <= AIR 4.0.0.1628 Multiple Vulnerabilities (APSB14-09)
								73993, #Adobe AIR <= AIR 13.0.0.83 Multiple Vulnerabilities (APSB14-14)
								74430, #Adobe AIR <= AIR 13.0.0.111 Multiple Vulnerabilities (APSB14-16)
								58537, #Adobe AIR 3.x <= 3.1.0.4880 Multiple Memory Corruption Vulnerabilities (APSB12-07)
								59425, #Adobe AIR 3.x <= 3.2.0.2070 Multiple Vulnerabilities (APSB12-14)
								61624, #Adobe AIR 3.x <= 3.3.0.3670 Multiple Vulnerabilities (APSB12-19)
								62835, #Adobe AIR 3.x <= 3.4.0.2710 Multiple Vulnerabilities (APSB12-24)
								62479, #Adobe AIR 3.x <= 3.4.0.2540 Multiple Vulnerabilities (APSB12-22)
								63449, #Adobe AIR 3.x <= 3.5.0.880 Buffer Overflow (APSB13-01)
								64583, #Adobe AIR 3.x <= 3.5.0.1060 Buffer Overflow (APSB13-05)
								65218, #Adobe AIR 3.x <= 3.6.0.597 Buffer Overflow (APSB13-09)
								65909, #Adobe AIR 3.x <= 3.6.0.6090 Multiple Vulnerabilities (APSB13-11)
								66444, #Adobe AIR <= 3.7.0.1530 Multiple Vulnerabilities (APSB13-14)
								66871, #Adobe AIR <= 3.7.0.1860 Memory Corruption (APSB13-16)
								63241, #Adobe AIR 3.x <= 3.5.0.600 Multiple Vulnerabilities (APSB12-27)
								77171, #Adobe AIR <= AIR 14.0.0.110 Multiple Vulnerabilities (APSB14-18)
								77576, #Adobe AIR <= AIR 14.0.0.178 Multiple Vulnerabilities (APSB14-21)
								78440, #Adobe AIR <= AIR 15.0.0.249 Multiple Vulnerabilities (APSB14-22)
								79139, #Adobe AIR <= 15.0.0.293 Multiple Vulnerabilities (APSB14-24)
								80483, #Adobe AIR <= 15.0.0.356 Multiple Vulnerabilities (APSB15-01)
								34815, #Adobe AIR < 1.5 Multiple Vulnerabilities (APSB08-23)
								40447, #Adobe AIR < 1.5.2 Multiple Vulnerabilities (APSB09-10)
								43069, #Adobe AIR < 1.5.3 Multiple Vulnerabilities (APSB09-19)
								46858, #Adobe AIR < 2.0.2.12610 Multiple Vulnerabilities (ASPB10-14)
								48299, #Adobe AIR < 2.0.3 Multiple Vulnerabilities (APSB10-16)
								50604, #Adobe AIR < 2.5.1 Multiple Vulnerabilities (APSB10-26)
								44595, #Adobe AIR < 1.5.3.9130 Multiple Vulnerabilities (APSB10-06)
								84155, #Adobe AIR <= 17.0.0.124 Multiple Vulnerabilities (APSB15-05)
								84156, #Adobe AIR <= 17.0.0.144 Multiple Vulnerabilities (APSB15-06)
								84157, #Adobe AIR <= 17.0.0.144 Multiple Vulnerabilities (APSB15-09)
								84158, #Adobe AIR <= 17.0.0.172 Multiple Vulnerabilities (APSB15-11)
								84641, #Adobe AIR <= 18.0.0.144 Multiple Vulnerabilities (APSB15-16)
								85325, #Adobe AIR <= 18.0.0.180 Multiple Vulnerabilities (APSB15-19)
								86059, #Adobe AIR <= 18.0.0.199 Multiple Vulnerabilities (APSB15-23)
								86368, #Adobe AIR <= 19.0.0.190 Multiple Vulnerabilities (APSB15-25)
								86850, #Adobe AIR <= 19.0.0.213 Multiple Vulnerabilities (APSB15-28)
								87243, #Adobe AIR <= 19.0.0.241 Multiple Vulnerabilities (APSB15-32)
								87656, #Adobe AIR <= 20.0.0.204 Multiple Vulnerabilities (APSB16-01)
								88638, #Adobe AIR <= 20.0.0.233 Multiple Vulnerabilities (APSB16-04)
								89868, #Adobe AIR <= 20.0.0.260 Multiple Vulnerabilities (APSB16-08)
								91162, #Adobe AIR <= 21.0.0.198 Multiple Vulnerabilities (APSB16-15)
								93523, #Adobe AIR <= 22.0.0.153 Android Applications Runtime Analytics MitM (APSB16-31)
							]
						}

					end
				end
			end
		end
	end
end
