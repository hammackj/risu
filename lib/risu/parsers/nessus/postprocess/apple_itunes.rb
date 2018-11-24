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
				class AppleiTunesPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apple iTunes Patch Rollup",
							:plugin_id => -99960,
							:plugin_name => "Missing the latest Apple iTunes Patches",
							:item_name => "Update to the latest Apple iTunes",
							:plugin_ids => [
								84504, #Apple iTunes < 12.2 Multiple Vulnerabilities (credentialed check)
								86001, #Apple iTunes < 12.3 Multiple Vulnerabilities (credentialed check)
								86602, #Apple iTunes < 12.3.1 Multiple Vulnerabilities (credentialed check)
								91347, #Apple iTunes < 12.4 DLL Injection Arbitrary Code Execution (credentialed check)
								87371, #Apple iTunes < 12.3.2 Multiple Vulnerabilities (credentialed check)
								92410, #Apple iTunes < 12.4.2 Multiple Vulnerabilities (credentialed check)
								94914, #Apple iTunes < 12.5.1 Multiple Vulnerabilities (credentialed check)
								94915, #Apple iTunes < 12.5.2 Multiple Vulnerabilities (credentialed check)
								95824, #Apple iTunes < 12.5.4 Multiple Vulnerabilities (credentialed check)
								96830, #Apple iTunes < 12.5.5 Multiple Vulnerabilities (credentialed check)
								100025, #Apple iTunes < 12.6 Multiple Vulnerabilities (credentialed check)
								100300, #Apple iTunes < 12.6.1 WebKit Memory Corruption RCE (credentialed check)
								78597, #Apple iTunes < 12.0.1 Multiple Vulnerabilities (credentialed check) -
								101954, #Apple iTunes < 12.6.2 Multiple Vulnerabilities (credentialed check) -
								111105, #Apple iTunes < 12.8 Multiple Vulnerabilities (credentialed check)
								117880, #Apple iTunes < 12.9 Multiple Vulnerabilities (credentialed check)
								108795, #Apple iTunes < 12.7.4 WebKit Multiple Vulnerabilities (credentialed check)
								110384, #Apple iTunes < 12.7.5 Multiple Vulnerabilities (credentialed check)
								118718, #Apple iTunes < 12.9.1 Multiple Vulnerabilities (credentialed check)
								
							]
						}
					end
				end
			end
		end
	end
end
