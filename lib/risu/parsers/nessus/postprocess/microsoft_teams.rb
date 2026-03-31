# Copyright (c) 2010-2026 Jacob Hammack.
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
				class MicrosoftTeams < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Teams Patch Rollup",
							:plugin_id => -99912,
							:plugin_name => "Missing the latest Microsoft Teams",
							:item_name => "Update to the latest Microsoft Teams",
							:plugin_ids => [
144813, #HIGH, Microsoft Teams < 1.3.0.13000 Remote Code Execution
175408, #MEDIUM, Microsoft Teams < 1.6.0.11166 Information Disclosure
179635, #HIGH, Microsoft Teams < 1.6.0.18681 RCE
250276, #HIGH, Microsoft Teams for Desktop < 25122.1415.3698.6812 Remote Code Execution (August 2025)
264898, #HIGH, Microsoft Teams for Desktop < 25163.3611.3774.6315 Elevation of Privilege

							]
						}
					end
				end
			end
		end
	end
end
