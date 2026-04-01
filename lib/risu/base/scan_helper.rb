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
	module Templates
		module ScanHelper

			# Parses Nessus plugin output text into a normalized hash of key/value pairs.
			# Each line is expected to be in "Key: Value" format; keys are downcased and
			# spaces are replaced with underscores.
			#
			# @param plugin_output [String] raw plugin output text from a Nessus finding
			#
			# @return [Hash{String => String}] parsed key/value pairs
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

			# Counts the number of authenticated and unauthenticated scan targets based
			# on the Credentialed_Scan host property set by Nessus.
			#
			# @return [Hash{String => Integer}] hash with "auth" and "unauth" counts
			def authenticated_count
				count = {}
				count["auth"] = 0
				count["unauth"] = 0

				HostProperty.where(:name => "Credentialed_Scan").each do |prop|
					if prop.value == "true"
						count["auth"] += 1
					else
						count["unauth"] += 1
					end
				end

				return count
			end
		end
	end
end
