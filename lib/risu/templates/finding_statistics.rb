# Copyright (c) 2010-2014 Arxopia LLC.
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
		class FindingStatistics < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "finding_statistics",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates report finding statistics"
				}
			end

			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Finding Statistics", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				output.text "Scan Date:", :style => :bold
				output.text "#{Report.scan_date}"
				output.text "\n"

				headers = ["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"]
				data = [Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]

				output.table([headers] + [data], :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

			end
		end
	end
end



