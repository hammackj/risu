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
				class AdobeReader < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Adobe Reader Patch Rollup",
							:plugin_id => -99998,
							:plugin_name => "Update to the latest Adobe Reader",
							:item_name => "Update to the latest Adobe Reader",
							:plugin_ids => [
								30200,
								33256,
								34695,
								35821,
								38746,
								39355,
								42120,
								43876,
								44644,
								45505,
								47165,
								48375,
								49173,
								50614,
								51925,
								55144,
								56198,
								56213,
								66517,
								66542,
								74012,
								58683,
								61562,
								63454,
								64786,
								66410,
								69846,
								71947,
								57043,
								57484,
								24002,
								23776,
								23975,
								52672,
								53451,
								21698,
								77712,
								79856,
								77175,
								83471,
								40494,
								27584,
								86403,
								87918,
								89831,
								70343



							]
						}
					end
				end
			end
		end
	end
end
