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
				class AppleQuicktime < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apple QuickTime Patch Rollup",
							:plugin_id => -99973,
							:plugin_name => "Missing the latest Apple QuickTime Patches",
							:item_name => "Update to the latest Apple QuickTime",
							:plugin_ids => [
								48323, #QuickTime < 7.6.7 QuickTimeStreaming.qtx SMIL File Debug Logging Overflow (Windows)
								49260, #QuickTime < 7.6.8 Multiple Vulnerabilities (Windows)
								51062, #QuickTime < 7.6.9 Multiple Vulnerabilities (Windows)
								66636, #QuickTime < 7.7.4 Multiple Vulnerabilities (Windows)
								72706, #QuickTime < 7.7.5 Multiple Vulnerabilities (Windows)
								78678, #QuickTime < 7.7.6 Multiple Vulnerabilities (Windows)
								62890, #QuickTime < 7.7.3 Multiple Vulnerabilities (Windows)
								87848, #Apple QuickTime < 7.7.9 Multiple RCE (Windows)
								85662, #Apple QuickTime < 7.7.8 Multiple Arbitrary Code Vulnerabilities (Windows)
								84505, #Apple QuickTime < 7.7.7 Multiple Vulnerabilities (Windows)
								59113, #QuickTime < 7.7.2 Multiple Vulnerabilities (Windows)
								56667, #QuickTime < 7.7.1 Multiple Vulnerabilities (Windows)
								55764, #QuickTime < 7.7 Multiple Vulnerabilities (Windows)
								21556, #QuickTime < 7.1 Multiple Vulnerabilities (Windows)
								22336, #QuickTime < 7.1.3 Multiple Vulnerabilities (Windows)
								24761, #QuickTime < 7.1.5 Multiple Vulnerabilities (Windows)
								25123, #QuickTime < 7.1.6 quicktime.util.QTHandleRef toQTPointer Method Arbitrary Code Execution (Windows)
								25347, #QuickTime < 7.1.6 Security Update (Windows)
								25703, #QuickTime < 7.2 Multiple Vulnerabilities (Windows)
								26916, #QuickTime < 7.2 Security Update (Windows)
								29698, #QuickTime < 7.3.1 Multiple Vulnerabilities (Windows)
								29982, #QuickTime < 7.4 Multiple Vulnerabilities (Windows)
								31735, #QuickTime < 7.4.5 Multiple Vulnerabilities (Windows)
								33130, #QuickTime < 7.5 Multiple Vulnerabilities (Windows)
								34119, #QuickTime < 7.5.5 Multiple Vulnerabilities (Windows)
								35437, #QuickTime < 7.6 Multiple Vulnerabilities (Windows)
								38988, #QuickTime < 7.6.2 Multiple Vulnerabilities (Windows)
								40929, #QuickTime < 7.6.4 Multiple Vulnerabilities (Windows)
								45388, #QuickTime < 7.6.6 Multiple Vulnerabilities (Windows)
								27626, #QuickTime < 7.3 Multiple Vulnerabilities (Windows)
								30204, #QuickTime < 7.4.1 RTSP Response Long Reason-Phrase Arbitrary Remote Code Execution (Windows)
								11506, #QuickTime < 6.1 URL Handling Overflow (Windows)
17637, #QuickTime < 6.5.2 PictureViewer Malformed JPEG Overflow (Windows)
20136, #QuickTime < 7.0.3 Multiple Vulnerabilities (Windows)
20395, #QuickTime < 7.0.4 Multiple Vulnerabilities (Windows)

							]
						}
					end
				end
			end
		end
	end
end
