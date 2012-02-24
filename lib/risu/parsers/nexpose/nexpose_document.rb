module Risu
	module Parsers
		module Nexpose
			# A Object to represet the Nexpose xml file in memory
			#
			# @author Jacob Hammack <jacob.hammack@hammackj.com>
			class NexposeDocument

				# Creates a instance of the NexposeDocument class
				#
				def initialize document
					@document = document
				end

				# Checks the validness of a Nexpose
				#
				# @return [Boolean] True if valid, False if invalid
				def valid?
					if File.exist?(@document)
						@parser = LibXML::XML::Parser.file @document
						doc = @parser.parse

						if doc.root.name == nil
							return false
						end
				
						if doc.root.name == "NeXposeSimpleXML"
							return true
						else
							return false
						end
					else
						return false
					end
				end

				# Invokes the SAX parser on the XML document
				#
				def parse
					@parser = LibXML::XML::SaxParser.file @document
					@parser.callbacks = SimpleNexpose.new
					@parser.parse
				end

				# Fixes the ip field if nil and replaces it with the name if its an ip
				#
				def fix_ips
					@hosts = Host.all

					@hosts.each do |host|
						if host.ip == nil
							begin
								ip = IPAddr.new host.name
								host.ip = ip.to_string
								host.save
							rescue ArgumentError => ae
								next
							end
						end
					end
				end
			end
		end
	end
end
