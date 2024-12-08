# Copyright (c) 2010-2025 Jacob Hammack.
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
		class AuthenticationSummary < Risu::Base::TemplateBase
			include TemplateHelper

			#
			def initialize
				@template_info =
				{
					:name => "authentication_summary",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "PDF",
					:description => "Generates a Authentication Summary Report"
				}
			end

			#
			#
			def render output
				@output.text Report.classification.upcase, :align => :center
				@output.text "\n"

				report_title Report.title
				report_subtitle "Authentication Summary Report"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"


				credentialied_scans = HostProperty.where(:name => "Credentialed_Scan")
				auth = []
				unauth = []

				credentialied_scans.each do |s|
					if s.value == "true"
						auth.push(s.host_id)
					else
						unauth.push(s.host_id)
					end
				end

				auth_hosts = []

				auth.each do |h|
					auth_hosts.push Host.find(h).ip
				end

				@output.text "Authenticated Count:", :style => :bold
				@output.text "#{auth.size}"
				@output.text "\n"
				@output.text "#{auth_hosts.join(", ")}"
				@output.text "\n"

				@output.text "UnAuthenticated Count:", :style => :bold
				@output.text "#{unauth.size}"
				@output.text "\n"

				results = Array.new

				headers = ["Hostname", "OS", "Authenticated"]
				header_widths = {0 => 230, 1 => 138, 2 => 138}

				Host.sorted.each do |host|
					row = Array.new

					authenticated = nil

					if host.host_properties.where(:name => "Credentialed_Scan").first != nil
						authenticated = host.host_properties.where(:name => "Credentialed_Scan").first.value
					end

					os = host.os

					host_name = host.name
					host_name = "#{host.name} (#{host.netbios})" if host.netbios != nil

					row.push(host_name)
					row.push(os)
					row.push(authenticated)

					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'E5E5E5']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
