# Copyright (c) 2010-2017 Jacob Hammack.
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
		class FindingsHost < Risu::Base::TemplateBase
			include TemplateHelper

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "findings_host",
					:author => "hammackj",
					:version => "0.0.4",
					:renderer => "PDF",
					:description => "Generates a findings report by host"
				}
			end

			#
			#
			def render(output)
				@output.font_size 10

				report_classification

				report_title Report.title
				report_subtitle "Findings Summary by Host Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				Host.sorted.each do |host|
					if host.items.high_risks_unique_sorted.to_a.count > 0 or host.items.medium_risks_unique_sorted.to_a.count > 0
						@output.font_size(16) do

							host_string = "#{host.ip}"
							host_string << " (#{host.fqdn})" if host.fqdn != nil

							output.text "#{host_string}", :style => :bold
						end
					end

					if host.items.critical_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) do
							output.fill_color "551A8B"
							output.text "Critical Findings", :style => :bold
							output.fill_color "000000"
						end

						host.items.critical_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end
					end

					if host.items.high_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "FF0000"
							output.text "High Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.high_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end
					end

					if host.items.medium_risks_unique_sorted.to_a.count > 0
						@output.font_size(12) {
							output.fill_color "FF8040"
							output.text "Medium Findings", :style => :bold
							output.fill_color "000000"
						}

						host.items.medium_risks_unique_sorted.each do |item|
							name = Plugin.find_by_id(item.plugin_id).plugin_name
							output.text "#{name}"
						end
					end

					if host.items.high_risks_unique_sorted.to_a.count > 0 or host.items.medium_risks_unique_sorted.to_a.count > 0
						@output.text "\n"
					end
				end

			end
		end
	end
end
