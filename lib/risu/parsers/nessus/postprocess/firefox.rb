# Copyright (c) 2010-2016 Arxopia LLC.
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
				class FirefoxRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Firefox Patch Rollup",
							:plugin_id => -99972,
							:plugin_name => "Update to the latest Firefox",
							:item_name => "Update to the latest Firefox",
							:plugin_ids => [
                73099,
                73769,
                74440,
                76763,
                77500,
                77906,
                78473,
                79665,
                80523,
                81521,
                82040,
                82041,
                82503,
                82998,
                83439,
                84581,
								82583,
								85386,
								62998,
								63551,
								64723,
								65131,
								65806,
								66480,
								66993,
								69269,
								69993,
								70716,
								70949,
								71347,
								72331,
								85275,
								85689,
								86071,
								86764,
								87476,
								86418,
								88461,
								89875,
								90793,
								


							]
						}
					end
				end
			end
		end
	end
end
