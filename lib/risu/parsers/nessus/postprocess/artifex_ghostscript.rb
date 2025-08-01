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
				class ArtifexGhostscriptRollup < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Artifex Ghostscript Patch Rollup",
							:plugin_id => -99937,
							:plugin_name => "Missing the latest Artifex Ghostscript",
							:item_name => "Update to the latest Artifex Ghostscript",
							:plugin_ids => [
                                117459, #Artifex Ghostscript Multiple Vulnerabilities
117596, #Artifex Ghostscript < 9.25 PostScript Code Execution Vulnerability
119240, #Artifex Ghostscript < 9.26 PostScript Multiple Vulnerabilities
130273, #Artifex Ghostscript < 9.50 Multiple Vulnerabilities
177205, #CRITICAL, Artifex Ghostscript < 10.01.1 Buffer Overflow
177836, #HIGH, Artifex Ghostscript < 10.01.2 Security Bypass
186904, #HIGH, Artifex Ghostscript < 10.2.1 DoS
200487, #HIGH, Artifex Ghostscript < 10.03.1 Multiple Vulnerabilities
210946, #HIGH, Artifex Ghostscript < 10.04.0 Multiple Vulnerabilities

							]
						}
					end
				end
			end
		end
	end
end


