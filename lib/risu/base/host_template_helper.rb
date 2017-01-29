# Copyright (c) 2010-2017 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		module HostTemplateHelper

			#
			def unsupported_os(title, plugin_name)
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
