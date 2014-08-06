# Copyright (c) 2010-2014 Arxopia LLC.
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
	module Models

		# Plugin Model
		#
		class Plugin < ActiveRecord::Base
			has_many :items
			belongs_to :family
			has_many :references
			has_many :individual_plugin_selections

			def cvss_base_score=(cvss_base_score)
				write_attribute(:cvss_base_score, cvss_base_score.to_f)
			end

			def cvss_base_score
				read_attribute(:cvss_base_score).to_s
			end

			class << self

				# Queries for all risks based on Plugin.risk_factor
				#
				# @return [Array] of all risks
				def risks
					critical_risks + high_risks + medium_risks + low_risks + none_risks
				end

				# Queries for all the critical risks based on Plugin.risk_factor
				#
				# @return [ActiveRelation] of Critical Risks
				def critical_risks
					where(:risk_factor => "Critical")
				end

				#Queries for all the critical risks based on Plugin.risk_factor
				#
				# @return [ActiveRelation] of High Risks
				def high_risks
					where(:risk_factor => "High")
				end

				# Queries for all the critical risks based on Plugin.risk_factor
				#
				# @return [ActiveRelation] of Medium Risks
				def medium_risks
					where(:risk_factor => "Medium")
				end

				# Queries for all the critical risks based on Plugin.risk_factor
				#
				# @return [ActiveRelation] of Low Risks
				def low_risks
					where(:risk_factor => "Low")
				end

				# Queries for all the critical risks based on Plugin.risk_factor
				#
				# @return [ActiveRelation] of None Risks
				def none_risks
					where(:risk_factor => "None")
				end

				# Creates a graph based on the top plugins sorted by count
				#
				# @return Filename of the created graph
				def top_by_count_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d Critical Findings By Plugin", Item.risks_by_plugin(limit).to_a.count
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => %w(red orange yellow blue green purple black gray brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_plugin(limit).to_a.each do |plugin|
						plugin_name = Plugin.find_by_id(plugin.plugin_id).plugin_name

						#We need to filter the names a little to make everything look nice on the graph
						#@todo this concept should be added to the database via a yaml file
						plugin_name = case plugin.plugin_id
							when 35362 then plugin_name.split(":")[0]
							when 34477 then plugin_name.split(":")[0]
							when 35635 then plugin_name.split(":")[0]
							when 21564 then "VNC Remote Authentication Bypass"
							when 38664 then "Intel Common Base Agent Remote Command Execution"
							when 42411 then "Windows SMB Shares Unprivileged Access"
							else
								plugin_name = Plugin.find_by_id(plugin.plugin_id).plugin_name
						end

						if plugin_name =~ /^(MS\d{2}-\d{3}):/
							plugin_name = $1
						end

						g.data(plugin_name, Item.where(:plugin_id => plugin.plugin_id).count)
					end

					StringIO.new(g.to_blob)
				end

				def root_cause_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = sprintf "Vulnerability Root Cause"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => %w(red orange yellow blue green purple black gray brown pink),
						:background_colors => %w(white white)
					}

					g.data('Vendor Patch', Plugin.where(:root_cause => 'Vendor Patch').count)
					g.data('Vendor Support', Plugin.where(:root_cause => 'Vendor Support').count)
					g.data('Configuration', Plugin.where(:root_cause => 'Configuration').count)

					StringIO.new(g.to_blob)					
				end

				def root_cause_graph_text
					graph_text = "This graph shows the basic root cause of a vulnerability, the data is broken up into " +
					"three categories. Vendor Patch, Vendor Support and Configuration.\n\n"

					graph_text << "Vendor Patch represents vulnerabilities from missing patches. IE missing Microsoft patches.\n"
					graph_text << "Vendor Support represents vulnerabilities caused by the lack of vendor support. IE unsupported software.\n"
					graph_text << "Configuration represents vulnerabilities caused by misconfiguration of software or hardware. IE default passwords.\n\n"

					return graph_text
				end
			end
		end
	end
end
