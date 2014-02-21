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
				class AdobeReader < PostProcess

					#
					def initialize
						@plugin_id = -99998
						@plugin_name = "Upgrade to the latest Adobe Reader"
						@item_name = "Upgrade to the latest Adobe Reader"
						@plugin_ids = [
							30200, #Adobe Reader < 7.1.0 / 8.1.2 Multiple Vulnerabilities
							33256, #Adobe Reader < 7.1.0 / 8.1.2 SU1 Unspecified JavaScript Method Handling Arbitrary Code Execution
							34695, #Adobe Reader < 8.1.3 / 9.0 Multiple Vulnerabilities
							35821, #Adobe Reader < 9.1 / 8.1.4 / 7.1.1 Multiple Vulnerabilities
							38746, #Adobe Reader getAnnots() JavaScript Method PDF Handling Memory Corruption (APSB09-06)
							39355, #Adobe Reader < 9.1.2 / 8.1.6 / 7.1.3 Multiple Vulnerabilities
							42120, #Adobe Reader < 9.2 / 8.1.7 / 7.1.4  Multiple Vulnerabilities (APSB09-15)
							43876, #Adobe Reader < 9.3 / 8.2  Multiple Vulnerabilities (APSB10-02)
							44644, #Adobe Reader < 9.3.1 / 8.2.1  Multiple Vulnerabilities (APSB10-07)
							45505, #Adobe Reader < 9.3.2 / 8.2.2  Multiple Vulnerabilities (APSB10-09)
							47165, #Adobe Reader < 9.3.3 / 8.2.3  Multiple Vulnerabilities (APSB10-15)
							48375, #Adobe Reader < 9.3.4 / 8.2.4  Multiple Vulnerabilities (APSB10-17)
							49173, #Adobe Reader < 9.4 / 8.2.5 Multiple Vulnerabilities (APSB10-21)
							50614, #Adobe Reader < 9.4.1 Multiple Vulnerabilities (APSB10-28)
							51925, #Adobe Reader < 10.0.1 / 9.4.2 / 8.2.6 Multiple Vulnerabilities (APSB11-03)
							55144, #Adobe Reader < 10.1 / 9.4.5 / 8.3 Multiple Vulnerabilities (APSB11-16)
							56198, #Adobe Reader < 10.1.1 / 9.4.6 / 8.3.1 Multiple Vulnerabilities (APSB11-21, APSB11-24)
							56213, #Adobe Reader Unsupported Version Detection
							66517, #Adobe Reader Enabled in Browser (Internet Explorer)
							66542  #JavaScript Enabled in Adobe Reader
						]
					end
				end
			end
		end
	end
end
