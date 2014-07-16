# Copyright (c) 2010-2014 Arxopia LLC.
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
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Parsers
		module Nessus
			module PostProcess
				class RootCauses

					#
					def initialize
						@plugins_to_cause = {
							22194 => "Vendor Patch",
							34477 => "Vendor Patch",
							35362 => "Vendor Patch",
							40887 => "Vendor Patch",
							53514 => "Vendor Patch",
							58435 => "Vendor Patch",
							22034 => "Vendor Patch",
							63643 => "Vendor Patch",
							25905 => "Vendor Patch",
							28227 => "Vendor Patch",
							33128 => "Vendor Patch",
							29924 => "Vendor Patch",
							32194 => "Vendor Patch",
							51840 => "Vendor Patch",
							70612 => "Vendor Patch",
							45415 => "Vendor Patch",
							45418 => "Vendor Patch",
							45419 => "Vendor Patch",
							73917 => "Vendor Patch",
							73412 => "Vendor Patch",
							74326 => "Vendor Patch",
							34475 => "Vendor Patch",
							24699 => "Vendor Patch",
							36132 => "Vendor Patch",
							45416 => "Vendor Patch",
							45417 => "Vendor Patch",
							60098 => "Vendor Patch",
							74470 => "Vendor Patch",
							71774 => "Vendor Patch",
							76457 => "Vendor Patch",
							34501 => "Vendor Patch",
							36216 => "Vendor Patch",
							38978 => "Vendor Patch",
							42044 => "Vendor Patch",
							44588 => "Vendor Patch",
							45429 => "Vendor Patch",
							46173 => "Vendor Patch",
							49690 => "Vendor Patch",
							59644 => "Vendor Patch",
							70216 => "Vendor Patch",

							33850 => "Vendor Support",
							34460 => "Vendor Support",

							49071 => "Configuration",
							41028 => "Configuration",
							57582 => "Configuration",
							45411 => "Configuration",
							45417 => "Configuration",
							57608 => "Configuration",
							18405 => "Configuration",
							57690 => "Configuration",
							58453 => "Configuration",
							15901 => "Configuration",
							26920 => "Configuration",
							26919 => "Configuration",
							51368 => "Configuration",

						}
					end

					#
					def run
						@plugins_to_cause.each do |k, v|
							plugin = Plugin.where(:id => k).first

							if plugin == nil
								next
							end

							plugin.root_cause = v
							plugin.save
						end
					end
				end
			end
		end
	end
end
