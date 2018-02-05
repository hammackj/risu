# Copyright (c) 2010-2018 Jacob Hammack.
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
		class MissingRootCauses < Risu::Base::TemplateBase

			#
			#
			def initialize
				@template_info =
				{
					:name => "missing_root_causes",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a Report of all the findings without a root cause"
				}
			end

			#
			#
			def render output
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) do
					output.text Report.title, :align => :center
				end

				output.font_size(18) do
					output.text "Missing Root Causes Report", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				end

				output.text "\n\n\n"

				output.font_size(20) {
					output.fill_color "9B30FF"
					output.text "Critical Findings", :style => :bold
					output.fill_color "000000"
				}

				Item.critical_risks_unique_sorted.each do |item|
					plugin = Plugin.find_by_id(item.plugin_id)
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					if plugin.root_cause != nil
						next
					end

					output.text "#{count} - #{name} - #{item.plugin_id}" 
				end

				output.start_new_page

				output.font_size(20) do
					output.fill_color "FF0000"
					output.text "High Findings", :style => :bold
					output.fill_color "000000"
				end

				Item.high_risks_unique_sorted.each do |item|
					plugin = Plugin.find_by_id(item.plugin_id)
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					if plugin.root_cause != nil
						next
					end					

					output.text "#{count} - #{name} - #{item.plugin_id}"
				end

				output.start_new_page

				output.font_size(20) {
					output.fill_color "FF8040"
					output.text "Medium Findings", :style => :bold
					output.fill_color "000000"
				}

				Item.medium_risks_unique_sorted.each do |item|
					plugin = Plugin.find_by_id(item.plugin_id)
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					if plugin.root_cause != nil
						next
					end

					output.text "#{count} - #{name} - #{item.plugin_id}"
				end

				output.start_new_page

				output.font_size(20) {
					output.fill_color "0000FF"
					output.text "Low Findings", :style => :bold
					output.fill_color "000000"
				}

				Item.low_risks_unique_sorted.each do |item|
					plugin = Plugin.find_by_id(item.plugin_id)
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					if plugin.root_cause != nil
						next
					end

					output.text "#{count} - #{name} - #{item.plugin_id}"
				end

				output.start_new_page

				output.font_size(20) {
					output.fill_color "008000"
					output.text "Info Findings", :style => :bold
					output.fill_color "000000"
				}
				
				Item.info_risks_unique_sorted.each do |item|
					plugin = Plugin.find_by_id(item.plugin_id)
					name = Plugin.find_by_id(item.plugin_id).plugin_name
					count = Item.where(:plugin_id => item.plugin_id).count

					if plugin.root_cause != nil
						next
					end
				
					output.text "#{count} - #{name} - #{item.plugin_id}"
				end
			end
		end
	end
end
