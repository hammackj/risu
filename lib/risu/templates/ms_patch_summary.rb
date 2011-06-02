module Risu
	module Modules
		class MSPatchSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "ms_patch_summary", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a Microsoft Patch Summary Report"
				}
			end
			
			#
			#
			def render(output)
				text Report.classification, :align => :center
				text "\n"

				font_size(22) { text Report.title, :align => :center }
				font_size(18) { 
					text "Missing Microsoft Patch Summary", :align => :center
					text "\n"
					text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n\n\n"

				Item.ms_patches.each do |item|
					host = Host.find_by_id(item.host_id)

					if host == nil
						next
					end

					if host.name != nil
						text "Host:", :style => :bold 
						text host.name
					end

					if host.os != nil
						text "OS:", :style => :bold
						text host.os
					end

					if host.mac != nil
						text "Mac:", :style => :bold
						text host.mac
					end
					text "\n"
					text item.plugin_output
					text "\n"
				end

			end
		end
	end
end
