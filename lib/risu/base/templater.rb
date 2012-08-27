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

module Risu
	module Base

		# Templater class for generating a report from a ERB template
		#
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
					raise unless Rails.env.production?
					puts "Templater Error: #{e.message} \n #{e.backtrace.join("\n\t")}\n"
				end
			end
		end
	end
end
