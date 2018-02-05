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

		class PostProcessManager
			attr_accessor :registered_postprocesses

			# Creates new instance of TemplateManager
			#
			# @param path Path relative to the base_dir of risu
			#
			# @return New instance of the template manager with templates loaded.
			def initialize path
				@registered_postprocesses = Array.new
				@postprocesses = Array.new

				base_dir = __FILE__.gsub("risu/base/post_process_manager.rb", "")

				load_postprocesses(base_dir + path)
				load_postprocesses(Dir.pwd, false)
				load_postprocesses(File.expand_path(USER_TEMPLATES_DIR)) if File.exist?(File.expand_path(USER_TEMPLATES_DIR)) && File.directory?(File.expand_path(USER_TEMPLATES_DIR))

				sort
			end

			def sort
				@postprocesses.each do |klass|
					k = klass.new
					@registered_postprocesses << k
				end

				@registered_postprocesses.sort! do |a,b|
					a <=> b
				end
			end

			# Loads templates from a specific path
			#
			# @param path Path to templates to load
			def load_postprocesses(path, recursive=true)
				begin

					search_path = "#{path}/**/*.rb" if recursive == true
					search_path = "#{path}/*.rb" if recursive == false

					Dir[search_path].each do |x|
						begin
							require x
						rescue => e
							#puts e.inspect
							#puts e.backtrace
							next
						end
					end

				  PostProcessBase.possible_postprocesses.each do |p|
				    if validate(p) ==  true
				      @postprocesses << p if @postprocesses.include?(p) == false
				    end
				  end
				rescue => e
					puts "[!] Invalid post processing path"
					puts e.inspect
  					puts e.backtrace
				end
			end

			# Validates that a template is a valid template
			#
			# @TODO look at refactoring this to valid?(template)
			#
			# @param template The template to validate
			#
			# @return [Boolean] If the template is valid
			def validate template
				t = template.new

				return false if t == nil
				return t.instance_variable_defined?("@info")
			end

			# Displays a list of all the templates to STDOUT
			def display_postprocesses
				puts "Available Post Processing"
			  @registered_postprocesses.each do |p|
			      if p.info[:plugin_id] != nil
			      	puts "\t#{p.info[:description]} (#{p.info[:plugin_id]})\n"
			      else
			      	puts "\t#{p.info[:description]}"
			      end
			    end
			end
		end
	end
end
