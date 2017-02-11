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
		module TemplateHelper
			include HostTemplateHelper
			include MalwareTemplateHelper
			include GraphTemplateHelper
			include SharesTemplateHelper
			include ScanHelper

			#
			def report_classification classification=Report.classification.upcase, newline=true
				@output.font_size(12) do
					@output.text classification, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_title title, newline=false
				@output.font_size(24) do
					@output.text title, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_subtitle title, newline=false
				@output.font_size(18) do
					@output.text title, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_author author, newline=false
				@output.font_size(14) do
					@output.text author, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def text(text, options = {})
				if text == nil
					text = ""
				end

				@output.text text, options
			end

			def title(text, size=18, color='#000000')
				@output.font_size(size) do
					@output.fill_color color.gsub('#', '')
					@output.text text, :style => :bold
					@output.fill_color "000000"
				end

				@output.text "\n"
			end

			def definition term, text, options = {}
				if text != nil
					@output.text "\n#{term}", :style => :bold
					@output.text text, options
				end
			end

			#
			def heading1 title_text
				title title_text, 24
			end

			#
			def heading2 title_text
				title title_text, 18
			end

			#
			def heading3 title_text
				title title_text, 14
			end

			#
			def heading4 title_text
				title title_text, 12
			end

			#
			def heading5 title_text
				title title_text, 10
			end

			#
			def heading6 title_text
				@output.font_size(8) do
					@output.text title_text, :style => :bold
				end
			end

			#
			def table headers, header_widths, data
				@output.table([headers] + data, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end
			end

			#
			def new_page
				@output.start_new_page
			end

			#
			def item_count_by_plugin_name plugin_name
				begin
					return Item.where(:plugin_id => Plugin.where(:plugin_name => plugin_name).first.id).count
				rescue
					return 0
				end
			end

			def item_count_by_plugin_id plugin_id
				begin
					return Item.where(:plugin_id => plugin_id).count
				rescue
					return 0
				end
			end

			# @TODO comment
			def default_credential_plugins
				[
					10862, 25927, 32315, 65950, 39364, 33852, 11454, 51369,
					26918, 76073, 24745, 11245, 23938, 46786, 46789, 10483,
					81375
				].uniq
			end

			# @TODO comment
			def has_default_credentials?
				plugins = default_credential_plugins
				default_cred = false

				plugins.each do |plugin_id|
					if item_count_by_plugin_id(plugin_id) > 0
						default_cred = true
					end
				end

				return default_cred
			end

			# @TODO comment
			def default_credentials_section
				heading1 "Default Credentials"

				text "Default credentials were discovered on the network. This can cause issues because the credentials can be found all over the Internet giving anyone with network access full access to the systems in question."
				text "\n"
			end

			# @TODO comment
			def default_credentials_appendix_section
				if !has_default_credentials?
					return
				end

				heading1 "Default Credentials"

				headers = ["Plugin Name", "IP"]
				header_widths = {0 => (@output.bounds.width - 80), 1 => 80}
				data = Array.new

				default_credential_plugins.each do |plugin_id|
					if item_count_by_plugin_id(plugin_id) > 0
						items = Item.where(:plugin_id => plugin_id)

						plugin_name = items.first.plugin_name

						items.each do |item|
							hosts = Host.where(:id => item.host_id)

							hosts.each do |host|
								row = Array.new
								row.push plugin_name
								row.push host.ip

								data.push row
							end
						end
					end
				end

				table headers, header_widths, data

				text "\n"
			end

		end
	end
end
