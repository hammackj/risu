# Copyright (c) 2010-2017 Jacob Hammack.
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
				load_templates(Dir.pwd, false)
				load_templates(File.expand_path(USER_TEMPLATES_DIR)) if File.exist?(File.expand_path(USER_TEMPLATES_DIR)) && File.directory?(File.expand_path(USER_TEMPLATES_DIR))
			end

			# Loads templates from a specific path
			#
			# @param path Path to templates to load
			def load_templates(path, recursive=true)
				begin
					search_path = "#{path}/**/*.rb" if recursive == true
					search_path = "#{path}/*.rb" if recursive == false

					Dir[search_path].each do |x|
						begin
							require x
						rescue
							next
						end
					end

					TemplateBase.possible_templates.each do |p|
						if validate(p) ==  true
							@registered_templates << p if @registered_templates.include?(p) == false
						end
					end
				rescue
					puts "[!] Invalid template path"
				end
			end

			# Validates that a template is a valid template
			#
			# @TODO look at refactoring this to valid?(template)
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
