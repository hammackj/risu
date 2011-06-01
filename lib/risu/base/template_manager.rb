module Risu
	module Base
		class TemplateManager
			attr_accessor :registered_templates

			#
			#
			def initialize (path)
			  @registered_templates = Array.new
				@templates = Array.new
				
				load_templates(path)
			end

			#
			#
			def load_templates(path)
				begin
					base_dir = __FILE__.gsub("risu/base/template_manager.rb", "")
				  Dir["#{base_dir + path}/**/*.rb"].each do |x| 
						begin
							load x
						rescue => e
							next
						end
					end

				  TemplateBase.possible_templates.each do |p|
				    if validate(p) ==  true
				      @registered_templates << p
				    end
				  end
				rescue => e
					puts "Bad plugin"
				end
			end

			#
			#
			def validate(template)
			  t = template.new

			  if t == nil
			    return false
			  end

			  if t.respond_to?(:render) == false
			    return false
			  end

			  return true
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

			  @templates.push(plugin)
			end
			
			#
			#
			def display_templates
			  @registered_templates.each do |x| 
			      p = x.new
			      puts "[*] Template: #{p.template_info[:name]}\n", 
			    end
			end
		end
	end
end





