# Copyright (c) 2010-2012 Arxopia LLC.
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

require 'risu'

ActiveRecord::Migration.verbose = false

module Risu
	module Parsers
		module Nexpose
			class SimpleNexpose
				include LibXML::XML::SaxParser::Callbacks

				# @todo comment
				#
				def initialize
					@vals = Hash.new

					@valid_fingerprints = {
						"description" => :os,
						"vendor" => nil,
						"family" => nil,
						"product" => nil,
						"version" => nil,
						"device-class" => :system_type,
						"architecture" => nil
					}

					@report = Report.create
				end

				# @todo comment
				#
				def on_start_element(element, attributes)
					@tag = element
					@vals[@tag] = ""
					puts element

					case element
						when "device"
							@in_device = true
							@rh = @report.hosts.create
							@rh.name = attributes["address"]
							@rh.ip = attributes["address"]
							@rh.save
						when "fingerprint"
							@in_fingerprint = true
					end

				end

				# Called when the inner text of a element is reached
				#
				# @param text
				def on_characters(text)
					if @vals[@tag] == nil then
						@vals[@tag] = text
					else
						@vals[@tag] << text
					end
				end

				# Called when the end of the XML element is reached
				#
				# @param element
				def on_end_element(element)
					@tag = nil
					case element
						when "device"
							@in_device = false
						when "description"
							if @in_device && @in_fingerprint
								@rh.attributes = { @valid_fingerprints[element] => @vals[element].gsub("\n", ",") } if @valid_fingerprints.keys.include?(element)
								@rh.save
							end
						when "fingerprint"
							@in_fingerprint = false
					end
				end

			end
		end
	end
end

