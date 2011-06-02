module Risu
	module Modules
		class Template < Risu::Base::TemplateBase
			
			#
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
			
			#
			#
			def render(output)

			end
		end
	end
end

