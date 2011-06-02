module NaslTidy
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
			def render
				image File.dirname(template) + "/data/nessuslogo.jpg", :scale => 0.2, :position => :left, :vposition => :top

				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"

				font_size(24) { text Report.title, :align => :center }

				font_size(18) { 
				    text "Coversheet Example", :align => :center
				    text "\n"
				    text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"

				text "Nessus is a Registered Trademark of Tenable Network Security, Inc."
			end
		end
	end
end



