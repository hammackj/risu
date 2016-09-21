# Copyright (c) 2010-2016 Arxopia LLC.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	module Templates
		class MSPatchSummary < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "ms_patch_summary",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a Microsoft Patch Summary Report"
				}
			end

			def render(output)
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Missing Microsoft Patch Summary"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				Item.ms_patches.each do |item|
					host = Host.find_by_id(item.host_id)

					next if host == nil

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
