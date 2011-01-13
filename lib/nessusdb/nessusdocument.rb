# encoding: utf-8

module NessusDB
	
	# A Object to represet the Nessus xml file in memory
	#
	# @author Jacob Hammack
	class NessusDocument
		
		# Creates a instance of the NessusDocument class
		#
		def initialize document
			@document = document
		end
		
		#
		#
		def validate
			@parser = LibXML::XML::Parser.file @document
			doc = @parser.parse
			
			puts doc.inspect

		end
				
		#
		#
		def parse
			@parser = LibXML::XML::SaxParser.file @document
    	@parser.callbacks = NessusSaxListener.new
    	@parser.parse
		end
		
	end
end
