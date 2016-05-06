# Copyright (c) 2010-2016 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Base

		class PostProcessManager
			attr_accessor :registered_postprocesses

			# Creates new instance of TemplateManager
			#
			# @param path Path relative to the base_dir of risu
			#
			# @return New instance of the template manager with templates loaded.
			def initialize (path)
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
			def validate(template)
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
