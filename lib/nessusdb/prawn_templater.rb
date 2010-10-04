# encoding: utf-8

module NessusDB

	# Templater class for generating a report from a erb template
	#
	# @author Jacob Hammack
	class PrawnTemplater
		attr_accessor :template, :template_source, :findings, :output_file
		
		# Setups of the Templater class initalizing all of the variables
		#
		# @author Jacob Hammack
		def initialize(template, findings, output)
			@template = template
			@findings = findings
			@output_file = output

			@template_source = File.new(@template).read
		end
		
		# Generates a report based on the erb template
		#
		# @ returns [String] html output of the erb template
		# 
		# @author Jacob Hammack
		def generate
			begin				
				source = @template_source
				findings = @findings
				Prawn::Document.generate(@output_file) do
					eval source
				end
			rescue => e
				puts "Error: #{e.message} \n #{e.backtrace.join("\n\t")}\n"
			end
		end
	end
end

