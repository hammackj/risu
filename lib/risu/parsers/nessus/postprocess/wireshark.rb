# Copyright (c) 2010-2015 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Parsers
		module Nessus
			module PostProcess
				class Wireshark < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Wireshark Patch Rollups",
							:plugin_id => -99992,
							:plugin_name => "Update to the latest Wireshark",
							:item_name => "Update to the latest Wireshark",
							:plugin_ids => [
								61572,
								64361,
								65253,
								66543,
								65254,
								66544,
								72941,
								66895,
								69104,
								69880,
								70763,
								71520,
								56164,
								56690,
								58518,
								59240,
								60117,
								62477,
								63095,
								66894,
								57539,
								
								
							]
						}
					end
				end
			end
		end
	end
end
