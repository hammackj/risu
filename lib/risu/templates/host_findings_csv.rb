# Copyright (c) 2010-2016 Arxopia LLC.
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
		class HostFindingsCSV < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "host_findings_csv",
					:author => "hammackj",
					:version => "0.0.2",
					:renderer => "CSV",
					:description => "Generates a findings report by host and outputs to CSV"

				}
			end

			# Writes out a CSV block for the risks passed.
			# @param risks, A query from the Plugin model of the risks
			#
			def csv risks
				risks.order(:cvss_base_score).each do |plugin|
					items = Item.where(:plugin_id => plugin.id).group(:host_id)

					items.each do |item|
						# Skip all PostProcssed Items
						if item.severity == -1
							next
						end

						host = Host.where(:id => item.host_id).first

						solution = plugin.solution.gsub("\n", " ").gsub(",", "")

						@output.text "#{host.ip}, #{host.fqdn}, #{host.netbios}, #{item.plugin_name}, #{plugin.risk_factor}, #{plugin.cvss_base_score}, #{solution}"
					end
				end
			end

			# TODO doc
			#
			def render(output)
				@output.text "IP Address, FQDN, Netbios Name, Finding, Risk Factor, CVSS Base Score, Solution"
				csv Plugin.critical_risks.order(cvss_base_score: :desc)
				csv Plugin.high_risks.order(cvss_base_score: :desc)
			end
		end
	end
end
