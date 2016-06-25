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
				class ESXi < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "VMware ESXi Patch Rollup",
							:plugin_id => -99981,
							:plugin_name => "Update to the latest VMware ESXi",
							:item_name => "Update to the latest VMware ESXi",
							:plugin_ids => [
								70879,
								70880,
								70882,
								70883,
								70884,
								70885,
								70888,
								59447,
								70877,
								70878,
								70881,
								70886,
								70887,
								71773,
								72037,
								76203,
								76368,
								73917,
								81085,
								71774,
								74470,
								78108,
								79862,
								80037,
								81084,
								83781,
								86947,
								86946,
								86945,
								87676,
								81083,
								87940,
								89035,
								89036,
								89037,
								89038,
								87673,
								87674,
								87677,
								87678,
								


							]
						}
					end
				end
			end
		end
	end
end
