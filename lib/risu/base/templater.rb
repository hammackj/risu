# Copyright (c) 2010-2018 Jacob Hammack.
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
	module Base

		# Templater class for generating a report from a ERB template
		class Templater
			attr_accessor :template, :template_manager, :findings, :output_file

			# Setups of the Templater class initializing all of the variables
			#
			# @return [Templater] New Instance
			def initialize template, findings, output, template_manager
				@template = template
				@findings = findings
				@output_file = output
				@template_manager = template_manager
			end

			# Generates a report based on the ERB template
			def generate
				begin
					template = @template
					template_manager = @template_manager

					t = template_manager.find_template_by_name(template)
					t = t.class.new

					if t.template_info[:renderer] == "CSV"
						Risu::Renderers::CSVRenderer.generate(@output_file) do |output|
							t = template_manager.find_template_by_name(template)
							t = t.class.new
							t.output = output
							t.render(output) unless t == nil
						end
					elsif t.template_info[:renderer] == "PDF"
						Prawn::Document.generate(@output_file, :margin => [75, 50, 75, 50]) do |output|
							output.font_size 10
							t = template_manager.find_template_by_name(template)
							t = t.class.new
							t.output = output
							t.render(output) unless t == nil
						end
					end
				rescue => e
					raise unless Rails.env.production?
					puts "Templater Error: #{e.message} \n #{e.backtrace.join("\n\t")}\n"
				end
			end
		end
	end
end
