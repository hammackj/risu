module Risu
	module Templates
		class Template < Risu::Base::TemplateBase

			# Initializes the template loading meta data
			#
			def initialize ()
				@template_info =
				{
					:name => "template",
					:author => "hammackj",
					:version => "0.0.2",
					:description => "template"
				}
			end

			# Called during the rendering process
			#
			def render(output)
				output.text "Template"
				output.start_new_page
			end
		end
	end
end
