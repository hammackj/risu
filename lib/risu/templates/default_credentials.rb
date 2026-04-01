# Copyright (c) 2010-2026 Jacob Hammack.
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
		class DefaultCredentialsReport < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "default_credentials",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a Default Credentials Report"
				}
			end

			def render output
				report_classification

				report_title Report.title
				report_subtitle "Default Credentials Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				if !default_credentials?
					text "No default credentials were detected on the network."
					@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
					return
				end

				heading1 "Overview"
				text "Default credentials were discovered on the network. Default credentials pose a significant " +
					"security risk because they can be easily found on the Internet, giving anyone with network " +
					"access full control of the affected systems. All default credentials should be changed " +
					"immediately to strong, unique passwords."
				text "\n"

				heading1 "Summary"

				headers = ["Finding", "Affected Hosts"]
				header_widths = {0 => 362, 1 => 150}
				summary_data = []

				default_credential_plugins.each do |plugin_id|
					next unless item_count_by_plugin_id(plugin_id).positive?

					items = Item.where(:plugin_id => plugin_id)
					plugin_name = items.first.plugin_name
					host_count = items.map(&:host_id).uniq.size

					summary_data.push [plugin_name, host_count.to_s]
				end

				table headers, header_widths, summary_data
				text "\n"

				new_page

				heading1 "Detailed Findings"

				default_credential_plugins.each do |plugin_id|
					next unless item_count_by_plugin_id(plugin_id).positive?

					items = Item.where(:plugin_id => plugin_id)
					plugin = Plugin.find_by(:id => plugin_id)
					next if plugin.nil?

					heading2 plugin.plugin_name

					definition "Description", plugin.description.gsub(/[ ]{2,}/, " ") if plugin.description
					definition "Synopsis", plugin.synopsis
					definition "Solution", plugin.solution
					text "\n"

					headers = ["IP Address", "FQDN", "Port", "Plugin Output"]
					header_widths = {0 => 90, 1 => 110, 2 => 40, 3 => 272}

					data = []
					items.each do |item|
						host = Host.find_by(:id => item.host_id)
						next if host.nil?

						plugin_output = String.new
						if item.plugin_output
							plugin_output = item.plugin_output.gsub(/[ ]{2,}/, " ").slice(0, 200)
						end

						data.push [
							host.ip,
							host.fqdn || "N/A",
							item.port.to_s,
							plugin_output
						]
					end

					table headers, header_widths, data
					text "\n"
				end

				@output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
