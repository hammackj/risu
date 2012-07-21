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

		class TemplateManager
			attr_accessor :registered_templates

			# Creates new instance of TemplateManager
			#
			# @param path Path relative to the base_dir of risu
			#
			# @return New instance of the template manager with templates loaded.
			def initialize (path)
			  @registered_templates = Array.new
				@templates = Array.new

				base_dir = __FILE__.gsub("risu/base/template_manager.rb", "")

				load_templates(base_dir + path)
				load_templates(File.expand_path(USER_TEMPLATES_DIR)) if File.exists?(File.expand_path(USER_TEMPLATES_DIR)) && File.directory?(File.expand_path(USER_TEMPLATES_DIR))
			end

			# Loads templates from a specific path
			#
			# @param path Path to templates to load
			def load_templates(path)
				begin
				  Dir["#{path}/**/*.rb"].each do |x|
						begin
							require x
						rescue => e
							next
						end
					end

				  TemplateBase.possible_templates.each do |p|
				    if validate(p) ==  true
				      @registered_templates << p if @registered_templates.include?(p) == false
				    end
				  end
				rescue => e
					puts "[!] Invalid template path"
				end
			end

			# Validates that a template is a valid template
			#
			# @todo look at refactoring this to valid?(template)
			#
			# @param template The template to validate
			#
			# @return [Boolean] If the template is valid
			def validate(template)
			  t = template.new

				return false if t == nil
			  return t.respond_to?(:render)
			end

			# Finds a template by its name
			#
			# @param name Name of the template to find
			#
			# @return the instance of the template or nil if not found
			def find_template_by_name(name)
				@registered_templates.each do |template|
					t = template.new
					if t.template_info[:name] == name
						return t
					end
				end

				return nil
			end

			# Displays a list of all the templates to STDOUT
			def display_templates
				puts "Available Templates"
			  @registered_templates.each do |x|
			      p = x.new
			      puts "\t#{p.template_info[:name]} - #{p.template_info[:description]}\n"
			    end
			end
		end
	end
end
