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
		module HostTemplateHelper

			#
			def unsupported_os title, plugin_name
				if item_count_by_plugin_name(plugin_name) <= 0
					return
				end

				heading2 title

				headers = ["Host"]
				data = Array.new

				findings =  Item.where(:plugin_id => Plugin.where(:plugin_name => plugin_name).first.id)

				findings.each do |finding|
					host = Host.find_by_id(finding.host_id)

					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if host.fqdn != nil

					row = Array.new
					row.push host_string

					data << row
				end

				@output.table([headers] + data, :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

				text "\n"

			end

			#
			def unsupported_os_appendix_section
				unsupported_os("Unsupported Windows NT Installations", "Microsoft Windows NT 4.0 Unsupported Installation Detection")
				unsupported_os("Unsupported Windows 2000 Installations", "Microsoft Windows 2000 Unsupported Installation Detection")
				unsupported_os("Unsupported Windows XP Installations", "Microsoft Windows XP Unsupported Installation Detection")
				unsupported_os("Unsupported Windows 2003 Installations", "Microsoft Windows Server 2003 Unsupported Installation Detection")

				text "\n"
			end
		end
	end
end
