# Copyright (c) 2010-2017 Arxopia LLC.
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
	module Parsers
		module Nessus
			module PostProcess
				class RiskScore < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "RiskScore Calculator",
							:plugin_id => 0
						}						
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

							#@TODO weighting goes here

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
