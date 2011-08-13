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
			#
			def load_templates(path)				
				begin
				  Dir["#{path}/**/*.rb"].each do |x| 
						begin
							load x
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
			# @param template The template to validate
			#
			def validate(template)
			  t = template.new
				
				return false if t == nil
			  return t.respond_to?(:render)
			end

			#
			#
			def find_plugins(file_name)
				Dir.new("#{file_name}").each do |file|
					next if file.match(/^\.+/)
					path = "#{file_name}/#{file}"

					if  FileTest.directory?("#{path}")
						list("#{path}")
					else
						self.register_template path
					end
				end
			end

			#
			#
			def register_template(plugin)
			  load plugin

			  @templates.push(plugin) if @templates.include?(plugin) == false
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
			
			# Displays a list of all the templates
			#
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





