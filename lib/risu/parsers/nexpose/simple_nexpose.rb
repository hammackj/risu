require 'risu'

ActiveRecord::Migration.verbose = false

module Risu
	module Parsers
		module Nexpose
			class SimpleNexpose
				include LibXML::XML::SaxParser::Callbacks
				
				#
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
				
				#
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
				
				# Called when the end of the xml element is reached
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
			