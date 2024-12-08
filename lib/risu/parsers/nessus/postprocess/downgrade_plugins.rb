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
				class DowngradePlugins < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Downgrades the Severity of Certain Plugins",
							:plugin_id => 0
						}

            #0 - informational
            #1 - low
            #2 - medium
            #3 - high
            #4 - critical

						# TODO read from "extra" section

						@plugins_to_severity = {
							41028 => 0, # SNMP Agent Default Community Name (public) - 41028
              				10264 => 0, # SNMP Agent Default Community Names - 10264
							10081 => 0, # FTP Privileged Port Bounce Scan - 10081
							42411 => 0, # Microsoft Windows SMB Shares Unprivileged Access
							66349 => 0, # X Server Unauthenticated Access: Screenshot
							26925 => 0, # VNC Server Unauthenticated Access
							66174 => 0, # VNC Server Unauthenticated Access: Screenshot
							10205 => 0, # rlogin Service Detection
							20007 => 2, # SSL Version 2 and 3 Protocol Detection
							80101 => 2, # IPMI v2.0 Password Hash Disclosure
						}
					end

					#
					def run
						@plugins_to_severity.each do |k, v|
							items = Item.where(:plugin_id => k)

							if items == nil
								next
							end

              items.each do |item|
                if item == nil
                  next
                end

                item.severity = v
		            item.save
              end

						end
					end
				end
			end
		end
	end
end
