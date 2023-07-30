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
				class AdobeAcrobat < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Acrobat Patch Rollup",
							:plugin_id => -99975,
							:plugin_name => "Missing the latest Adobe Acrobat Patches",
							:item_name => "Update to the latest Adobe Acrobat",
							:plugin_ids => [
								79855, #Adobe Acrobat < 10.1.13 / 11.0.10 Multiple Vulnerabilities (APSB14-28)
								83470, #Adobe Acrobat < 10.1.14 / 11.0.11 Multiple Vulnerabilities (APSB15-10)
								40803, #Adobe Acrobat < 9.1 / 8.1.4 / 7.1.1 Multiple Vulnerabilities
								40804, #Adobe Acrobat < 9.1.1 / 8.1.5 / 7.1.2 getAnnots() JavaScript Method PDF Handling Memory Corruption (APSB09-06)
								40805, #Adobe Acrobat < 9.1.2 / 8.1.6 / 7.1.3 Multiple Vulnerabilities
								40806, #Adobe Acrobat < 9.1.3 Flash Handling Unspecified Arbitrary Code Execution
								42119, #Adobe Acrobat < 9.2 / 8.1.7 / 7.1.4  Multiple Vulnerabilities (APSB09-15)
								43875, #Adobe Acrobat < 9.3 / 8.2  Multiple Vulnerabilities (APSB10-02)
								44643, #Adobe Acrobat < 9.3.1 / 8.2.1  Multiple Vulnerabilities (APSB10-07)
								45504, #Adobe Acrobat < 9.3.2 / 8.2.2  Multiple Vulnerabilities (APSB10-09)
								47164, #Adobe Acrobat < 9.3.3 / 8.2.3  Multiple Vulnerabilities (APSB10-15)
								48374, #Adobe Acrobat < 9.3.4 / 8.2.4  Multiple Vulnerabilities (APSB10-17)
								49172, #Adobe Acrobat < 9.4 / 8.2.5 Multiple Vulnerabilities (APSB10-21)
								50613, #Adobe Acrobat 9.x < 9.4.1 Multiple Vulnerabilities (APSB10-28)
								51924, #Adobe Acrobat < 10.0.1 / 9.4.2 / 8.2.5 Multiple Vulnerabilities (APSB11-03)
								52671, #Adobe Acrobat 9.x / 10.x Unspecified Memory Corruption (APSB11-06)
								53450, #Adobe Acrobat 9.x / 10.x Multiple Vulnerabilities (APSB11-08)
								55143, #Adobe Acrobat < 10.1 / 9.4.5 / 8.3 Multiple Vulnerabilities (APSB11-16)
								56197, #Adobe Acrobat < 10.1.1 / 9.4.6 / 8.3.1 Multiple Vulnerabilities (APSB11-21, APSB11-24)
								57042, #Adobe Acrobat < 9.4.7 Multiple Memory Corruption Vulnerabilities (APSB11-30)
								77813, #Adobe Acrobat Help Page XSS
								57483, #Adobe Acrobat < 10.1.2 / 9.5 Multiple Vulnerabilities (APSB12-01)
								58682, #Adobe Acrobat < 10.1.3 / 9.5.1 Multiple Vulnerabilities (APSB12-08)
								61561, #Adobe Acrobat < 10.1.4 / 9.5.2 Multiple Vulnerabilities (APSB12-16)
								64785, #Adobe Acrobat < 11.0.2 / 10.1.6 / 9.5.4 Multiple Vulnerabilities (APSB13-07)
								63453, #Adobe Acrobat < 11.0.1 / 10.1.5 / 9.5.3 Multiple Vulnerabilities (APSB13-02)
								66409, #Adobe Acrobat < 11.0.3 / 10.1.7 / 9.5.5 Multiple Vulnerabilities (APSB13-15)
								74011, #Adobe Acrobat < 10.1.10 / 11.0.07 Multiple Vulnerabilities (APSB14-15)
								84801, #Adobe Reader < 10.1.15 / 11.0.12 / 2015.006.30060 / 2015.008.20082 Multiple Vulnerabilities (APSB15-15)
								84800, #Adobe Acrobat < 10.1.15 / 11.0.12 / 2015.006.30060 / 2015.008.20082 Multiple Vulnerabilities (APSB15-15)
								77176, #Adobe Acrobat < 10.1.11 / 11.0.08 Sandbox Bypass (APSB14-19)
								77711, #Adobe Acrobat < 10.1.12 / 11.0.09 Multiple Vulnerabilities (APSB14-20)
								69845, #Adobe Acrobat < 11.0.4 / 10.1.8 Multiple Vulnerabilities (APSB13-22)
								71946, #Adobe Acrobat < 10.1.9 / 11.0.6 Multiple Vulnerabilities (APSB14-01)
								86402, #Adobe Acrobat <= 10.1.15 / 11.0.12 / 2015.006.30060 / 2015.008.20082 Multiple Vulnerabilities (APSB15-24)
								91096, #Adobe Acrobat < 11.0.16 / 15.006.30172 / 15.016.20039 Multiple Vulnerabilities (APSB16-14)
								87917, #Adobe Acrobat < 11.0.14 / 15.006.30119 / 15.010.20056 Multiple Vulnerabilities (APSB16-02)
								89830, #Adobe Acrobat < 11.0.15 / 15.006.30121 / 15.010.20060 Multiple Vulnerabilities (APSB16-09)
								92034, #Adobe Acrobat < 11.0.17 / 15.006.30198 / 15.017.20050 Multiple Vulnerabilities (APSB16-26)
								40802, #Adobe Acrobat < 8.1.3 Multiple Vulnerabilities
								40801, #Adobe Acrobat < 7.1.0 / 8.1.2 Unspecified JavaScript Method Handling Arbitrary Code Execution
								40800, #Adobe Acrobat < 8.1.2 / 7.1.0 Multiple Vulnerabilities
								96452, #Adobe Acrobat < 11.0.19 / 15.006.30279 / 15.023.20053 Multiple Vulnerabilities (APSB17-01)
								99373, #Adobe Acrobat < 11.0.20 / 2015.006.30306 / 2017.009.20044 Multiple Vulnerabilities (APSB17-11)
								94071, #Adobe Acrobat < 11.0.18 / 15.006.30243 / 15.020.20039 Multiple Vulnerabilities (APSB16-33)
								102427, #Adobe Acrobat < 11.0.21 / 2015.006.30355 / 2017.011.30066 / 2017.012.20098 Multiple Vulnerabilities (APSB17-24)
								169877, #Adobe Acrobat < 20.005.30436 / 22.003.20310 Multiple Vulnerabilities (APSB23-01)
								174136, #Adobe Acrobat < 20.005.30467 / 23.001.20143 Multiple Vulnerabilities (APSB23-24)
																
							]
						}
					end
				end
			end
		end
	end
end
