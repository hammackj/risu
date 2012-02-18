module Risu
	module Templates
		class Template < Risu::Base::TemplateBase
			
			# Initializes the template loading metadata
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "template", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "template"
				}
			end
			
			# Called during the rendering process
			#
			def render(output)
				output.text "Template"
			end
		end
	end
end

