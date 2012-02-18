module Risu
	module Templates
		class CoverSheet < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "cover_sheet", 
					:author => "hammackj", 
					:version => "0.0.2", 
					:description => "Generates a coversheet with a logo (Example Template)"
				}
			end
			
			#
			#
			def render(output)				
				output.image "#{File.expand_path(File.dirname(__FILE__))}/data/nessuslogo.jpg", :scale => 0.2, :position => :left, :vposition => :top

				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"

				output.font_size(24) do
					output.text Report.title, :align => :center
				end

				output.font_size(18) do
				    output.text "Coversheet Example", :align => :center
				    output.text "\n"
				    output.text "This report was prepared by\n#{Report.author}", :align => :center
				end

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



