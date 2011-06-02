module Risu
	module Modules
		class CoverSheet < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "cover_sheet", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a coversheet with a logo (Example Template)"
				}
			end
			
			#
			#
			def render(output)
				output.image "data/nessuslogo.jpg", :scale => 0.2, :position => :left, :vposition => :top

				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"

				output.font_size(24) { output.text Report.title, :align => :center }

				output.font_size(18) { 
				    output.text "Coversheet Example", :align => :center
				    output.text "\n"
				    output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"

				output.text "Nessus is a Registered Trademark of Tenable Network Security, Inc."
			end
		end
	end
end



