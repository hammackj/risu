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
	module Base

		#
		class PostProcessBase
			@possible_postprocesses = Array.new

			class << self
				attr_reader :possible_postprocesses
			end

			#
			attr_accessor :info

			#
			def self.inherited(child)
				possible_postprocesses << child
			end

			def == (other)

				if self.info == nil || self.info[:plugin_id] == nil
					false
				elsif other == nil || other.info == nil || other.info[:plugin_id] == nil
					false
				else
					self.info[:plugin_id] == other.info[:plugin_id]
				end
			end

			def <=> (other)
				if self.info[:plugin_id] < other.info[:plugin_id]
					-1
				elsif self.info[:plugin_id] > other.info[:plugin_id]
					1
				else
					0
				end
			end

			# Create a plugin based on a combination of all plugins
			# to be rolled up.
			def create_plugin

				plugin = Plugin.find_by_id(@info[:plugin_id])

				if plugin == nil
					plugin = Plugin.new
				end

				# Populate items from post process module
				plugin.id = @info[:plugin_id]
				plugin.plugin_name = @info[:plugin_name]
				plugin.description = @info[:description]
				plugin.plugin_version = @info[:version]
				plugin.plugin_publication_date = @info[:publication_date]
				plugin.plugin_modification_date = @info[:modification_date]
				
				# Boiler plate for all roll up plugins
				plugin.family_name = "Risu Rollup Plugins"
				plugin.synopsis = "Software often has vulnerabilities that are corrected in newer versions. It was determined that an older version of the software is installed on this system."
				plugin.solution = "If possible, update to the latest version of the software."
				plugin.plugin_type = "Rollup"
				plugin.rollup = true
				plugin.compliance = false
				
				# Find oldest vuln date.
				begin
					p = Plugin.where(:id => @info[:plugin_ids]).where.not(:vuln_publication_date => nil).order(:vuln_publication_date).first
					unless p.nil?
						plugin.vuln_publication_date = p.vuln_publication_date
					end
				end
				
				begin
					p = Plugin.where(:id => @info[:plugin_ids]).where.not(:cvss_base_score => nil).order(:cvss_base_score).last
					unless p.nil?
						plugin.cvss_base_score = p.cvss_base_score
						plugin.cvss_vector = p.cvss_vector
					end
				end

				begin
					p = Plugin.where(:id => @info[:plugin_ids]).where.not(:cvss_temporal_score => nil).order(:cvss_temporal_score).last
					unless p.nil?
						plugin.cvss_temporal_score = p.cvss_temporal_score
						plugin.cvss_temporal_vector = p.cvss_temporal_vector
					end
				end
				
				begin
					p = Plugin.where(:id => @info[:plugin_ids]).select("sum(risk_factor) as risk_factor")
					unless p.nil? or p.total_risk.nil?
						plugin.risk_factor = p.total_risk
					end
				end
				
				plugin.save
			end

			#
			def create_item(host_id, severity)
				item = Item.new

					item.host_id = host_id
					item.plugin_id = @info[:plugin_id]
					item.plugin_output = nil
					item.port = 0
					item.severity = severity
					item.plugin_name = @info[:item_name]

				item.save
			end

			#
			def has_findings
				Item.where(:plugin_id => @info[:plugin_ids]).count > 0
			end

			def has_host_findings(host_id)
				Item.where(:plugin_id => @info[:plugin_ids]).where(:host_id => host_id).count > 0
			end

			#
			def calculate_severity current_severity, severity
				if severity >= current_severity
					return severity
				else
					return current_severity
				end
			end

			#
			def run
				if !has_findings()
					return
				end

				# If this is a "roll up" post-process, create a plugin 
				if Plugin.where(:id => @info[:plugin_ids]).count > 0
					create_plugin()
				end

				Host.all.each do |host|
					if !has_host_findings(host.id)
						next
					end

					finding_severity = 0

					@info[:plugin_ids].each do |plugin_id|
						Item.where(:plugin_id => plugin_id).each do |item|
							severity = item.severity
							item.real_severity = severity
							item.severity = -1
							item.save

							finding_severity = calculate_severity(finding_severity, severity)
						end
					end

					create_item(host.id, finding_severity)
				end
			end
		end
	end
end
