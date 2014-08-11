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
				class RootCauses < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Root Cause Mapper",
							:plugin_id => 0
						}

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
							-99999 => "Vendor Patch",
							-99998 => "Vendor Patch",
							-99995 => "Vendor Patch",
							24712 => "Vendor Patch",
							25371 => "Vendor Patch",
							-99997 => "Vendor Patch",
							-99994 => "Vendor Patch",
							-99992 => "Vendor Patch",
							-99991 => "Vendor Patch",
							-99989 => "Vendor Patch",
							55976 => "Vendor Patch",
							58597 => "Vendor Patch",
							58848 => "Vendor Patch",
							73984 => "Vendor Patch",
							10043 => "Vendor Patch",
							58659 => "Vendor Patch",
							76123 => "Vendor Patch",
							27599 => "Vendor Patch",
							51894 => "Vendor Patch",
							51895 => "Vendor Patch",
							46738 => "Vendor Patch",
							32313 => "Vendor Patch",
							44073 => "Vendor Patch",
							49274 => "Vendor Patch",
							51178 => "Vendor Patch",
							62465 => "Vendor Patch",
							

							33850 => "Vendor Support",
							34460 => "Vendor Support",
							73182 => "Vendor Support",
							47709 => "Vendor Support",
							56710 => "Vendor Support",
							48762 => "Vendor Support",
							62758 => "Vendor Support",
							72704 => "Vendor Support",
							48761 => "Vendor Support",
							26928 => "Vendor Support",
							12217 => "Vendor Support",
							35291 => "Vendor Support",
							42873 => "Vendor Support",
							42880 => "Vendor Support",
							62974 => "Vendor Support",
							20007 => "Vendor Support",
							22313 => "Vendor Support",
							56210 => "Vendor Support",
							56211 => "Vendor Support",

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
							63155 => "Configuration",
							65057 => "Configuration",
							51192 => "Configuration",
							63478 => "Configuration",
							10079 => "Configuration",
							42411 => "Configuration",
							26925 => "Configuration",
							66174 => "Configuration",
							10862 => "Configuration",
							10264 => "Configuration",
							10297 => "Configuration",
							57640 => "Configuration",
							71783 => "Configuration",
							11213 => "Configuration",
							57792 => "Configuration",
							74442 => "Configuration",
							11457 => "Configuration",
							65821 => "Configuration",
							30218 => "Configuration",
							26194 => "Configuration",
							70658 => "Configuration",
							71049 => "Configuration",
							10547 => "Configuration",
							31705 => "Configuration",
							34324 => "Configuration",
							54582 => "Configuration",
							69551 => "Configuration",
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
