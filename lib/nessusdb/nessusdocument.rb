# encoding: utf-8

module NessusDB
	
	# A Object to represet the Nessus xml file in memory
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class NessusDocument
		
		# Creates a instance of the NessusDocument class
		#
		def initialize document
			@document = document
		end
		
		# Checks the validness of a NessusDocument
		#
		# @return [Boolean] True if valid, False if invalid
		def valid?
			@parser = LibXML::XML::Parser.file @document
			doc = @parser.parse
			
			if doc == nil
				return false
			end
			
			node = doc.find("//NessusClientData_v2")
			
			if node.first.content != nil
				return true
			else
				return false
			end
		end
				
		# Invokes the SAX parser on the XML document
		#
		def parse
			@parser = LibXML::XML::SaxParser.file @document
   		@parser.callbacks = NessusSaxListener.new
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
