# Copyright (c) 2010-2019 Jacob Hammack.
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
							:plugin_name => "Missing the latest Shockwave Player Patches",
							:item_name => "Update to the latest Shockwave Player",
							:plugin_ids => [
								72435, #Shockwave Player <= 12.0.7.148 Multiple Memory Corruption Vulnerabilities (APSB14-06)
								72983, #Shockwave Player <= 12.0.9.149 Unspecified Memory Corruption Vulnerabilities (APSB14-10)
								42369, #Shockwave Player <= 11.5.1.601 Multiple Vulnerabilities (APSB09-16)
								51936, #Shockwave Player < 11.5.9.620 (APSB11-01)
								71342, #Shockwave Player <= 12.0.6.147 Memory Corruptions (APSB13-29)
								44094, #Shockwave Player < 11.5.6.606 Multiple Vulnerabilities (APSB10-03)
								39564, #Shockwave Player Crafted Director File Handling Remote Code Execution (APSB09-08)
								40421, #Shockwave Player < 11.5.0.601 Multiple Vulnerabilities (APSB09-11)
								44094, #Shockwave Player < 11.5.6.606 Multiple Vulnerabilities (APSB10-03)
								46329, #Shockwave Player < 11.5.7.609 Multiple Vulnerabilities (APSB10-12)
								48436, #Shockwave Player < 11.5.8.612
								50387, #Shockwave Player < 11.5.9.615
								55142, #Shockwave Player < 11.6.0.626 (APSB11-17)
								55833, #Shockwave Player < 11.6.1.629 Multiple Memory Corruption Vulnerabilities (APSB11-19)
								56734, #Shockwave Player <= 11.6.1.629 Multiple Memory Corruption Vulnerabilities (APSB11-27)
								57941, #Shockwave Player <= 11.6.3.633 Multiple Code Execution Vulnerabilities (APSB12-02)
								59047, #Shockwave Player <= 11.6.4.634 Multiple Memory Corruption Vulnerabilities (APSB12-13)
								61536, #Shockwave Player <= 11.6.5.635 Multiple Memory Corruption Vulnerabilities (APSB12-17)
								62702, #Shockwave Player <= 11.6.7.637 Multiple Vulnerabilities (APSB12-23)
								64621, #Shockwave Player <= 11.6.8.638 Multiple Vulnerabilities (APSB13-06)
								65913, #Shockwave Player <= 12.0.0.112 Multiple Vulnerabilities (APSB13-12)
								67233, #Shockwave Player <= 12.0.2.122 Memory Corruption (APSB13-18)
								69844, #Shockwave Player <= 12.0.3.133 Memory Corruption Vulnerabilities (APSB13-23)
								84765, #Adobe Shockwave Player <= 12.1.8.158 Multiple RCE Vulnerabilities (APSB15-17)
								85882, #Adobe Shockwave Player <= 12.1.9.160 Multiple RCE (APSB15-22)
								86633, #Adobe Shockwave Player <= 12.2.0.162 RCE (APSB15-26)
								97835, #Adobe Shockwave Player <= 12.2.7.197 DLL Hijacking (APSB17-08)
								100806, #Adobe Shockwave Player <= 12.2.8.198 Memory Corruption RCE (APSB17-18) -
								104628, #Adobe Shockwave Player <= 12.2.9.199 Memory Corruption RCE (APSB17-40) 
							]
						}
					end
				end
			end
		end
	end
end
