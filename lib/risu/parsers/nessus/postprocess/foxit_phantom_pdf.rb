# Copyright (c) 2010-2025 Jacob Hammack.
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
				class FoxitPhantomPDFPatchRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Foxit PhantomPDF Patch Rollup",
							:plugin_id => -99956,
							:plugin_name => "Missing the latest Foxit PhantomPDF Patches",
							:item_name => "Update to the latest Foxit PhantomPDF",
							:plugin_ids => [
								86697,
								90566,
								102682, #Foxit PhantomPDF < 7.3.15 Multiple Vulnerabilities - 102682
								102858, #Foxit PhantomPDF < 8.3.2 Multiple Vulnerabilities - 102858
								101523, #Foxit PhantomPDF < 8.3.1 Multiple Vulnerabilities - 101523
								104436, #Foxit PhantomPDF < 9.0 Multiple Vulnerabilities
104742, #Foxit PhantomPDF < 8.3.5 Multiple Vulnerabilities
109398, #Foxit PhantomPDF < 9.1 Multiple Vulnerabilities
119258, #Foxit PhantomPDF < 7.3.11 Multiple Vulnerabilities
119259, #Foxit PhantomPDF < 7.3.9 Multiple Vulnerabilities
119835, #Foxit PhantomPDF < 7.3.13 Multiple Vulnerabilities
119836, #Foxit PhantomPDF < 7.3.17 Multiple Vulnerabilities
133525, #Foxit PhantomPDF < 9.7.1 Multiple Vulnerabilities
141216, #Foxit PhantomPDF < 10.1 Multiple Vulnerabilities
							]
						}
					end
				end
			end
		end
	end
end
