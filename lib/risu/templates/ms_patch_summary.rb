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
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) { 
					output.text "Missing Microsoft Patch Summary", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				Item.ms_patches.each do |item|
					host = Host.find_by_id(item.host_id)

					if host == nil
						next
					end

					if host.name != nil
						output.text "Host:", :style => :bold 
						output.text host.name
					end

					if host.os != nil
						output.text "OS:", :style => :bold
						output.text host.os
					end

					if host.mac != nil
						output.text "Mac:", :style => :bold
						output.text host.mac
					end
					output.text "\n"
					output.text item.plugin_output
					output.text "\n"
				end

			end
		end
	end
end
