# Copyright (c) 2010-2013 Arxopia LLC.
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
	module Parsers
		module Nessus
			module PostProcess
				class RiskScore

					#
					def initialize
					end

					# Calculates the RiskScore for a Item which is == to the Plugin's
					# RiskScore
					#
					def calculate_item_risk_score
						Item.all.each do |item|
							plugin = Plugin.where(:id => item.plugin_id).first

							risk_score = 0.0
							cvss_base_score = plugin.cvss_base_score.to_f || 1.0
							vuln_publication_date = plugin.vuln_publication_date

							vuln_pub_days = 1
							vuln_pub_days = (DateTime.now.to_date - vuln_publication_date.to_date).to_i if vuln_publication_date != nil

							exploitable = plugin.exploit_available
							exploitable_factor = 1

							if exploitable == "true"
								exploitable_factor = 0.6
							end

							risk_score = (cvss_base_score * vuln_pub_days * 0.8) * exploitable_factor

							item.risk_score = risk_score
							item.save
						end
					end

					#
					def calculate_plugin_risk_score
						Plugin.all.each do |plugin|
							items = Item.where(:plugin_id => plugin.id).to_a

							plugin.risk_score = items.first.risk_score * items.count
							plugin.save
						end
					end

					#
					def calculate_host_risk_score
						Host.all.each do |host|
							risk_score = 0.0

							host.items.to_a.each do |item|
								risk_score = risk_score + item.risk_score
							end

							#weighting goes here

							host.risk_score = risk_score
							host.save
						end
					end

					#
					def run
						calculate_item_risk_score()
						calculate_plugin_risk_score()
						calculate_host_risk_score()
					end
				end
			end
		end
	end
end
