# Copyright (c) 2010-2020 Jacob Hammack.
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


ActiveRecord::Migration.verbose = false

module Risu
	module Parsers
		module Nexpose
			class SimpleNexpose
				include LibXML::XML::SaxParser::Callbacks

					VALID_FINGERPRINTS = {
						"description" => :os,
						"vendor" => nil,
						"family" => nil,
						"product" => nil,
						"version" => nil,
						"device-class" => :system_type,
						"architecture" => nil
					}

				# @TODO comment
				#
				def initialize
					@vals = Hash.new

					@report = Report.create
				end

				# @TODO comment
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
								@rh.attributes = { VALID_FINGERPRINTS[element] => @vals[element].gsub("\n", ",") } if VALID_FINGERPRINTS.key?(element)
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
