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
				class FoxitReaderRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Foxit Reader Patch Rollup",
							:plugin_id => -99969,
							:plugin_name => "Missing the latest Foxit Reader Patches",
							:item_name => "Update to the latest Foxit Reader",
							:plugin_ids => [
								52458, #Foxit Reader < 4.3.1.0218 Multiple Vulnerabilities
								55671, #Foxit Reader < 5.0.2.0718 Multiple Vulnerabilities
								57050, #Foxit Reader < 5.1.3.1201 Memory Corruption RCE
								62063, #Foxit Reader < 5.3 Cross-References RCE
								62384, #Foxit Reader < 5.4.3 Trojan DLL Injection
								72723, #Foxit Reader < 6.1.4 Trojan DLL Injection
								62064, #Foxit Reader < 5.4 Trojan DLL Injection
								86698, #Foxit Reader < 7.2 Multiple Vulnerabilities
								90567, #Foxit Reader < 7.3.4 Multiple Vulnerabilities
								101524, #Foxit Reader < 8.3.1 Multiple Vulnerabilities



							]
						}
					end
				end
			end
		end
	end
end
