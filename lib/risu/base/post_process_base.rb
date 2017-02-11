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
			def self.inherited child
				possible_postprocesses << child
			end

			def == other

				if self.info == nil || self.info[:plugin_id] == nil
					false
				elsif other == nil || other.info == nil || other.info[:plugin_id] == nil
					false
				else
					self.info[:plugin_id] == other.info[:plugin_id]
				end
			end

			def <=> other
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

				if Plugin.where(:id => @info[:plugin_ids], :exploit_available => true).count > 0
					plugin.exploit_available = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploit_framework_core => "true").count > 0
					plugin.exploit_framework_core = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploit_framework_metasploit => "true").count > 0
					plugin.exploit_framework_metasploit = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploit_framework_canvas => "true").count > 0
					plugin.exploit_framework_canvas = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploit_framework_exploithub => "true").count > 0
					plugin.exploit_framework_exploithub = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploit_framework_d2_elliot => "true").count > 0
					plugin.exploit_framework_d2_elliot = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :in_the_news => true).count > 0
					plugin.in_the_news = true
				end

				if Plugin.where(:id => @info[:plugin_ids], :exploited_by_malware => "true").count > 0
					plugin.exploited_by_malware = true
				end

				["Critical", "High", "Medium", "Low", "Info"].each do |risk|
					if Plugin.where(:id => @info[:plugin_ids], :risk_factor => risk).size > 0
						plugin.risk_factor = risk
						break
					end
				end

				begin
					p = Plugin.where(:id => @info[:plugin_ids]).where.not(:stig_severity => nil).order(:stig_severity).first
					unless p.nil?
						plugin.stig_severity = p.stig_severity
					end
				end

				# Broken
				#plugin.references << References.where(:plugin_id => @info[:plugin_ids], :reference_name => "cve")

				plugin.save
			end

			#
			def create_item host_id, severity
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
