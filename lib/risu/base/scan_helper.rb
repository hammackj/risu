# Copyright (c) 2010-2017 Arxopia LLC.
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
	module Templates
		module ScanHelper

			#
			# TODO doc
			def scan_info_to_hash plugin_output
				scan_info = {}

				plugin_output.split("\n").each do |line|
					a = line.split(":")

					if a.size != 2
						next
					end

					key = a[0].strip.downcase
					value = a[1].strip.downcase

					key = key.gsub(" ", "_")

					scan_info[key] = value
				end

				return scan_info
			end

			# TODO doc
			#
			def authenticated_count
				count = {}
				count["auth"] = 0
				count["unauth"] = 0

				Item.where(:plugin_id => 19506).each do |item|
					scan_info = scan_info_to_hash (item.plugin_output)

					auth = scan_info["credentialed_checks"]

					if auth =~ /yes/
						count["auth"] = count["auth"] + 1
					else
						count["unauth"] = count["unauth"] + 1
					end
				end

				return count
			end
		end
	end
end
