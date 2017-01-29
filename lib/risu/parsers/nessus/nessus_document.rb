# Copyright (c) 2010-2017 Arxopia LLC.
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
	module Parsers
		module Nessus

			# A Object to represents the Nessus XML file in memory
			class NessusDocument
				attr_accessor :new_tags

				# Creates a instance of the NessusDocument class
				def initialize document
					@document = document
					@new_tags = Array.new
				end

				# Checks the validness of a NessusDocument
				#
				# @return [Boolean] True if valid, False if invalid
				def valid?
					parser = nil

					if File.exist?(@document)
						parser = LibXML::XML::Parser.file @document
					elsif @document.class == "String"
						parser = LibXML::XML::Parser.string @document
					else
						return false
					end

					doc = parser.parse

					if doc.root.name == nil
						return false
					end

					if doc.root.name == "NessusClientData_v2" #.nessus v2
						return true
					elsif doc.root.name == "NessusClientData" #.nessus v1
						return false
					else
						return false
					end
				end

				# Invokes the SAX parser on the XML document
				def parse
					@parser = LibXML::XML::SaxParser.file @document
					@parser.callbacks = NessusSaxListener.new
					@parser.parse

					#require 'pry'
					#binding.pry
					@new_tags == @parser.callbacks.new_tags
				end

				# Fixes the ip field if nil and replaces it with the name if its an ip
				def fix_ips
					@hosts = Host.all

					@hosts.each do |host|
						if host.ip == nil
							begin
								ip = IPAddr.new host.name
								host.ip = ip.to_string
								host.save
							rescue ArgumentError
								next
							end
						end
					end
				end
			end
		end
	end
end
