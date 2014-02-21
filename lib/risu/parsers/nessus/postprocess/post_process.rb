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
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Parsers
		module Nessus
			module PostProcess
				class PostProcess

					#
					def initialize
						@plugin_id = -1
						@plugin_ids = []
						@plugin_name = ""
						@item_name = ""
					end

					#NOTE:
					#looks like its working
					def newest_reader_plugin
						newest = DateTime.new(0001, 01, 01)
						newest_plugin = nil

						@plugin_ids.each do |id|
							plugin = Plugin.find_by_id(id)

							if plugin == nil || plugin.plugin_modification_date == nil
								next
							end

							if plugin.plugin_modification_date >= newest
								newest = plugin.plugin_modification_date if plugin.plugin_modification_date != nil
								newest_plugin = plugin
							end
						end

						return newest_plugin
					end

					# Creates a rollup plugin based on the newest Adobe Reader
					#
					def create_plugin

						plugin = Plugin.find_by_id(@plugin_id)

						newest_plugin = newest_reader_plugin()

						if newest_plugin == nil
							return
						end

						if plugin == nil
							plugin = Plugin.new
						end

						plugin.id = @plugin_id
						plugin.plugin_name = @plugin_name
						plugin.family_name = "Risu Rollup Plugins"
						plugin.description = newest_plugin.description || ""
						plugin.plugin_version = newest_plugin.plugin_version || ""
						plugin.plugin_publication_date = newest_plugin.plugin_publication_date
						plugin.plugin_modification_date = newest_plugin.plugin_modification_date
						plugin.vuln_publication_date = newest_plugin.vuln_publication_date
						plugin.cvss_vector = newest_plugin.cvss_vector || ""
						plugin.cvss_base_score = newest_plugin.cvss_base_score
						plugin.cvss_temporal_score = newest_plugin.cvss_temporal_score
						plugin.cvss_temporal_vector = newest_plugin.cvss_temporal_vector
						plugin.risk_factor = newest_plugin.risk_factor
						plugin.solution = newest_plugin.solution
						plugin.synopsis = newest_plugin.synopsis
						plugin.plugin_type = "Rollup"
						plugin.rollup = true

						plugin.save
					end

					#
					def create_item(host_id, severity)
						item = Item.new

							item.host_id = host_id
							item.plugin_id = @plugin_id
							item.plugin_output = nil
							item.port = 0
							item.severity = severity
							item.plugin_name = @item_name

						item.save
					end

					#
					def has_reader_findings
						@plugin_ids.each do |plugin_id|
							if Item.where(:plugin_id => plugin_id)
								return true
							end
						end

						return false
					end

					def has_host_reader_findings (host_id)
						@plugin_ids.each do |plugin_id|
							if Item.where(:plugin_id => plugin_id).where(:host_id => host_id).count >= 1
								return true
							end
						end

						return false
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
						if !has_reader_findings()
							return
						end

						#Create the dummy plugin
						create_plugin()

						Host.all.each do |host|
							if !has_host_reader_findings(host.id)
								next
							end

							#puts "Found host with reader finding #{host.ip}"

							finding_severity = 0

							@plugin_ids.each do |plugin_id|
								Item.where(:plugin_id => plugin_id).each do |item|
									severity = item.severity
									item.real_severity = severity
									item.severity = -1
									item.save

									finding_severity = calculate_severity(finding_severity, severity)
								end
							end

							#puts "#{finding_severity}"

							create_item(host.id, finding_severity)
						end
					end
				end
			end
		end
	end
end
