# Copyright (c) 2010-2014 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Parsers
		module Nessus
			module PostProcess
				class FlashPlayer < PostProcess

					#
					def initialize
						@plugin_id = -99997
						@plugin_name = "Upgrade to the latest Flash Player"
						@item_name = "Upgrade to the latest Flash Player"
						@plugin_ids = [
							46859, #Flash Player < 9.0.277.0 / 10.1.53.63 Multiple Vulnerabilities (ASPB10-14)
							48300, #Flash Player < 9.0.280 / 10.1.82.76 Multiple Vulnerabilities (APSB10-16)
							49307, #Flash Player < 9.0.283 / 10.1.85.3 Unspecified Code Execution (APSB10-22)
							50493, #Flash Player < 9.0.289 / 10.1.102.64 Multiple Vulnerabilities (APSB10-26)
							51926, #Flash Player < 10.2.152.26 Multiple Vulnerabilities (APSB11-02)
							52673, #Flash Player < 10.2.153.1 Unspecified Memory Corruption (APSB11-05)
							53472, #Flash Player < 10.2.159.1 ActionScript Predefined Class Prototype Addition Remote Code Execution (APSB11-07)
							54299, #Flash Player < 10.3.181.14 Multiple Vulnerabilities (APSB11-12)
							54972, #Flash Player < 10.3.181.22 Cross-Site Scripting (APSB11-13)
							55140, #Flash Player < 10.3.181.26 Multiple Vulnerabilities (APSB11-18)
							55803, #Flash Player <= 10.3.181.36 Multiple Vulnerabilities (APSB11-21)
							56259, #Flash Player <= 10.3.183.7 Multiple Vulnerabilities (APSB11-26)
							56874, #Flash Player <= 10.3.183.10 / 11.0.1.152 Multiple Vulnerabilities (APSB11-28)
							58001, #Flash Player <= 10.3.183.14 / 11.1.102.55 Multiple Vulnerabilities (APSB12-03)
							58207, #Flash Player <= 10.3.183.15 / 11.1.102.62 Multiple Vulnerabilities (APSB12-05)
							58538, #Flash Player <= 10.3.183.16 / 11.1.102.63 Multiple Memory Corruption Vulnerabilities (APSB12-07)
							58994, #Flash Player <= 10.3.183.18 / 11.2.202.233 Object Confusion Vulnerability (APSB12-09)
							59196, #Flash Player Unsupported Version Detection
							59426, #Flash Player <= 10.3.183.19 / 11.3.300.256 Multiple Vulnerabilities (APSB12-14)
							61622, #Flash Player <= 10.3.183.22 / 11.4.402.264 Multiple Vulnerabilities (APSB12-19)
							62480, #Flash Player <= 10.3.183.23 / 11.4.402.278 Multiple Vulnerabilities (APSB12-22)
							62836, #Flash Player <= 10.3.183.29 / 11.4.402.287 Multiple Vulnerabilities (APSB12-24)
							63242, #Flash Player <= 10.3.183.43 / 11.5.502.110 Multiple Vulnerabilities (APSB12-27)
							63450, #Flash Player <= 10.3.183.48 / 11.5.502.135 Buffer Overflow (APSB13-01)
							64506, #Flash Player <= 10.3.183.50 / 11.5.502.146 Multiple Vulnerabilities (APSB13-04)
							64584, #Flash Player <= 10.3.183.51 / 11.5.502.149 Multiple Vulnerabilities (APSB13-05)
							64916, #Flash Player <= 10.3.183.63 / 11.6.602.168 Multiple Vulnerabilities (APSB13-08)
							65219, #Flash Player <= 10.3.183.67 / 11.6.602.171 Multiple Vulnerabilities (APSB13-09)
							65910, #Flash Player <= 10.3.183.68 / 11.6.602.180 Multiple Vulnerabilities (APSB13-11)
							66445, #Flash Player <= 10.3.183.75 / 11.7.700.169 Multiple Vulnerabilities (APSB13-14)
							66872, #Flash Player <= 10.3.183.86 / 11.7.700.202 Memory Corruption (APSB13-16)
							67225, #Flash Player <= 10.3.183.90 / 11.7.700.224 Multiple Vulnerabilities (APSB13-17)
							69866, #Flash Player <= 11.7.700.232 / 11.8.800.94 Memory Corruptions (APSB13-21)
							70858, #Flash Player <= 11.7.700.242 / 11.9.900.117 Memory Corruptions (APSB13-26)
							71351, #Flash Player <= 11.7.700.252 / 11.9.900.152 Multiple Vulnerabilities (APSB13-28)
							71951, #Flash Player <= 11.7.700.257 / 11.9.900.170 Multiple Vulnerabilities (APSB14-02)
							72284  #Flash Player <= 11.7.700.260 / 12.0.0.43 Unspecified Remote Code Execution (APSB14-04)
						]
					end
				end
			end
		end
	end
end
