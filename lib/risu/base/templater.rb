module Risu
	module Base
		# Templater class for generating a report from a ERB template
		#
		# @author Jacob Hammack
		class Templater
			attr_accessor :template, :template_manager, :findings, :output_file

			# Setups of the Templater class initializing all of the variables
			#
			# @return [Templater] New Instance
			def initialize(template, findings, output, template_manager)
				@template = template
				@findings = findings
				@output_file = output
				@template_manager = template_manager
			end

			# Generates a report based on the ERB template
			#
			def generate
				begin
					template = @template
					template_manager = @template_manager

					Prawn::Document.generate(@output_file, :margin => [75, 50, 75, 50]) do |output|
						output.font_size 12
						t = template_manager.find_template_by_name(template)
						t = t.class.new
						t.render(output) unless t == nil
					end
				rescue => e
					puts "Error: #{e.message} \n #{e.backtrace.join("\n\t")}\n"
				end
			end
		end
	end
end
