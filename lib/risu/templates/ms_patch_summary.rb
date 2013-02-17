# Copyright (c) 2010-2013 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		class MSPatchSummary < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "ms_patch_summary",
					:author => "hammackj",
					:version => "0.0.1",
					:description => "Generates a Microsoft Patch Summary Report"
				}
			end

			def render(output)
				report_text Report.classification.upcase, :align => :center
				report_text "\n"

				report_title Report.title
				report_subtitle "Missing Microsoft Patch Summary"
				report_author "This report was prepared by\n#{Report.author}"

				report_text "\n\n\n"

				Item.ms_patches.each do |item|
					host = Host.find_by_id(item.host_id)

					next if host == nil

					if host.name != nil
						report_text "Host:", :style => :bold
						report_text host.name
					end

					if host.os != nil
						report_text "OS:", :style => :bold
						report_text host.os
					end

					if host.mac != nil
						report_text "Mac:", :style => :bold
						report_text host.mac
					end
					report_text "\n"
					report_text item.plugin_output
					report_text "\n"
				end
			end
		end
	end
end
