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
		class HostFindingsCSVOlderThan < Risu::Base::TemplateBase

			#
			#
			def initialize
				@template_info =
				{
					:name => "host_findings_csv_older_than",
					:author => "hammackj",
					:version => "0.0.1",
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
                        vuln_publication_date = plugin.vuln_publication_date

                        date_older_than = is_older_than(vuln_publication_date)
						
						mac_address = ""

                        plugin_name = flatten item.plugin_name

						if host.mac != nil
							mac_address = host.mac.gsub("\n", " ").gsub(",", "")
						else
							mac_address = "FF:FF:FF:FF:FF:FF"
						end

						@output.text "#{host.ip}, #{host.fqdn}, #{host.netbios}, #{mac_address}, #{plugin_name}, #{plugin.risk_factor}, #{plugin.cvss_base_score}, #{solution}, #{vuln_publication_date}, #{date_older_than}"
					end
				end
			end

            def is_older_than(date)

                if date == nil
                    return nil
                end

                date_to_check = Time.new(date.to_s)

                if date_to_check < Time.now - 3.months
                    return true
                else
                    return false
                end
            end

			# Flattens CVS output removing newlines and commas
			def flatten text
				if text == nil
					return nil
				end

				output = text.gsub("\n", " ")
				output = output.gsub(",", ";")

				return "'" + output + "'"
			end

			# TODO doc
			#
			def render output
				@output.text "IP Address, FQDN, Netbios Name, MAC Address, Finding, Risk Factor, CVSS Base Score, Solution, Vulnerability Publication Date, Older than 3 Months"
				csv Plugin.critical_risks.order(cvss_base_score: :desc)
				csv Plugin.high_risks.order(cvss_base_score: :desc)
                csv Plugin.medium_risks.order(cvss_base_score: :desc)
			end
		end
	end
end
