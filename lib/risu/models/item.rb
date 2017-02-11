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
	module Models

		# Item Model
		#
		class Item < ActiveRecord::Base
			belongs_to :host
			belongs_to :plugin
			has_many :attachments

			class << self

				# Queries for all risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks
					where(:severity => [0,1,2,3,4])
				end

				# Queries for all the high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks
					where(:severity => 4)
				end

				# Queries for all the high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks
					where(:severity => 3)
				end

				# Queries for all the medium risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks
					where(:severity => 2)
				end

				# Queries for all the low risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks
					where(:severity => 1)
				end

				# Queries for all the info risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def info_risks
					where(:severity => 0)
				end

				# Queries for all the unique Critical risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks_unique
					where(:severity => 4).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_unique
					where(:severity => 3).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique Critical findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks_unique_sorted
					#Item.select("items.*").select("count(*) as count_all").where(:severity => 4).group(:plugin_id).order("count_all DESC")
					Item.where(:severity => 4).group(:plugin_id).order('count(*) desc')
				end

				# Queries for all the unique high findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_unique_sorted
					Item.where(:severity => 3).group(:plugin_id).order('count(*) desc')
					#select("items.*").select("count(*) as count_all").where(:severity => 3).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the unique medium risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_unique

					where(:severity => 2).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique medium findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_unique_sorted
					Item.where(:severity => 2).group(:plugin_id).order('count(*) desc')
					#select("items.*").select("count(*) as count_all").where(:severity => 2).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the unique low risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks_unique
					where(:severity => 1).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique low findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks_unique_sorted
					select("items.*").select("count(*) as count_all").where(:severity => 1).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the unique info risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def info_risks_unique
					#where(:severity => 0).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
					where(:severity => 0).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique info findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def info_risks_unique_sorted
					select("items.*").select("count(*) as count_all").where(:severity => 0).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the risks grouped by service type, used for the Vulnerabilities by Service graph
				#
				# @TODO rewrite
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_service(limit=10)
					select("items.*").select("count(*) as count_all").where("svc_name != 'unknown' and svc_name != 'general'").group(:svc_name).order("count_all DESC").limit(limit)
				end

				# Queries for all the Critical risks by plugin
				#
				# @TODO rewrite
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_plugin(limit=10)
					select("items.*").select("count(*) as count_all").joins(:plugin).where("plugin_id != 1").where(:severity => 4).group(:plugin_id).order("count_all DESC").limit(limit)
				end

				# Queries for all the Critical risks by host
				#
				# @deprecated This function shouldn't be used it has been replaced by critical_risks_by_host
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_host(limit=10)
					#select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => 4).group(:host_id).order("count_all DESC").limit(limit)
					Item.joins(:host).where.not(plugin_id: 1).where(:severity => 4).group(:host_id).order('count(*) desc').limit(limit)
				end

				# Queries for all the Critical risks by host
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks_by_host(limit=10)
					#select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => 4).group(:host_id).order("count_all DESC").limit(limit)
					Item.joins(:host).where.not(plugin_id: 1).where(:severity => 4).group(:host_id).order('count(*) desc').limit(limit)
				end

				# Queries for all the High risks by host
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_by_host(limit=10)
					#select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => 3).group(:host_id).order("count_all DESC").limit(limit)

					Item.joins(:host).where.not(plugin_id: 1).where(:severity => 3).group(:host_id).order('count(*) desc').limit(limit)
				end

				# Queries for all the Medium risks by host
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_by_host(limit=10)
					#select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => 2).group(:host_id).order("count_all DESC").limit(limit)
					Item.joins(:host).where.not(plugin_id: 1).where(:severity => 2).group(:host_id).order('count(*) desc').limit(limit)
				end

				# Queries for all the Low risks by host
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks_by_host(limit=10)
					#select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => 1).group(:host_id).order("count_all DESC").limit(limit)
					Item.joins(:host).where.not(plugin_id: 1).where(:severity => 1).group(:host_id).order('count(*) desc').limit(limit)
				end

				# Queries for all the hosts with the Microsoft patch summary plugin (38153)
				#
				# @return [ActiveRecord::Relation] with the query results
				def ms_patches
					where(:plugin_id => 38153).joins(:host)
				end

				# Queries for all host with the Microsoft Update Summary plugin(12028)
				#
				# @return [ActiveRecord::Relation] with the query results
				def ms_update
					where(:plugin_id => 12028).joins(:host)
				end

				# Generates a Graph of all the risks by service
				#
				# @param limit Limits the result to a specific number, default 10
				#
				# @deprecated
				# @return [StringIO] Object containing the generated PNG image
				def risks_by_service_graph(limit=10)
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d Services By Vulnerability", Item.risks_by_service(limit).to_a.count
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					Item.risks_by_service(limit).to_a.each do |service|
						g.data(service.svc_name, Item.all.where(:svc_name => service.svc_name).count)
					end

					StringIO.new(g.to_blob)
				end

				# Generates text for the Risks by Service graph
				#
				# @deprecated
				# @return [String] Text based on the Risks by Service graph
				def risks_by_service_graph_text
					"This graph is a representation of the findings found by service. This graph can help " +
					"understand what services are running on the network and if they are vulnerable, where " +
					"the risks are and how they should be protected.\n\n"
				end

				# Generates a Graph of all the risks by severity
				#
				# @deprecated
				# @return [StringIO] Object containing the generated PNG image
				def risks_by_severity_graph
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = "Risks By Severity"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					crit = Item.critical_risks.count
					high = Item.high_risks.count
					medium = Item.medium_risks.count
					low = Item.low_risks.count
					#info = Item.info_risks.count

					if crit == nil then crit = 0 end
					if high == nil then high = 0 end
					if medium == nil then medium = 0 end
					if low == nil then low = 0 end
					#if info == nil then info = 0 end

					g.data("Critical", crit)
					g.data("High", high)
					g.data("Medium", medium)
					g.data("Low", low)

					StringIO.new(g.to_blob)
				end

				# Queries for all DISA Stig findings by category
				#
				# @param category The DISA Stig category I, II, III
				#
				# @return [ActiveRecord::Relation] with the query results
				def stig_findings(category="I")
					where('plugin_id IN (:plugins)', :plugins => Plugin.where(:stig_severity => category).select(:id)).order("severity DESC")
				end

				# Generates a Graph of all the risks by severity
				#
				# @deprecated
				# @return [StringIO] Object containing the generated PNG image
				def stigs_severity_graph
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = "Stigs By Severity"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					i = Item.stig_findings("I").count
					ii = Item.stig_findings("II").count
					iii = Item.stig_findings("III").count

					if i == nil then i = 0 end
					if ii == nil then ii = 0 end
					if iii == nil then iii = 0 end

					g.data("Cat I", i)
					g.data("Cat II", ii)
					g.data("Cat III", iii)

					StringIO.new(g.to_blob)
				end

				# Calculates a vulnerable host percent based on Critical and High findings
				# (unique_vuln_crit_high_count / host_count) * 100
				#
				# @deprecated
				# @return [FixNum] Percentage of vulnerable hosts
				def calculate_vulnerable_host_percent
					#patch to fix double counting
					#unique_hosts_with_critical_and_high = Host.unique_hosts_with_critical.count + Host.unique_hosts_with_high.count
					unique_hosts_with_critical_and_high = Host.unique_hosts_with_critical_and_high_count
					host_percent = (unique_hosts_with_critical_and_high.to_f / Host.count.to_f) * 100
				end

				# @TODO w t f
				# @deprecated
				def calculate_vulnerable_host_percent_with_patches_applied

					exclude_list = []
					hosts = []

					risks = Item.top_10_sorted_raw[0..9]

					risks.each do |risk|
						exclude_list << risk[0]
					end

					Item.critical_risks.where.not(:plugin_id => exclude_list).each do |item|
						hosts << item.host_id
					end

					Item.high_risks.where.not(:plugin_id => exclude_list).each do |item|
						hosts << item.host_id
					end

					hosts.uniq!
					(hosts.count.to_f / Host.count.to_f) * 100
				end

				# Based on the risk_percent returns a adjective representative
				#
				# @param risk_percent Calculated percentage of risk based on {Item::calculate_vulnerable_host_percent}
				#
				# @deprecated
				# @return [String] Textual representation of the risk_percent
				def adjective_for_risk_text risk_percent
					adjective = case risk_percent
						when 0..5
							"excellent"
						when 6..10
							"great"
						when 11..15
							"good"
						when 16..20
							"fair"
						else
							"poor"
					end
				end

				# Builds a sentence based on the risk_percent to describe the risk
				#
				# @param risk_percent Calculated percentage of risk based on {Item::calculate_vulnerable_host_percent}
				#
				# @deprecated
				# @return [String] Sentence describing the implied significance of the risk_percent
				def risk_text risk_percent
					percent_text = case risk_percent
						when 0..5.99
							"This implies that only a handful of computers are missing patches, and the current patch management is working well."
						when 6..10.99
							"This implies that there is a minor patch management issue. If there is a patch management system, it should be checked for problems. " +
							"Each host should also be inspected to be certain it can receive patches."
						when 11..15.99
							"This implies that there is a substantial patch management issue. If there is a patch management system, it should be checked for problems. " +
							"Each host should also be inspected to be certain it can receive patches."
						when 16..20
							"This implies that there is a significant patch management issue. If there is a patch management system, it should be checked for problems. " +
							"Each host should also be inspected to be certain it can receive patches."
						else
							"This implies that there is a critical patch management problem on the network. Any patch management solutions should " +
							"be inspected for issues and they should be corrected as soon as possible. Each host should also be inspected to be certain it can receive patches."
					end
				end

				# @TODO change Report.title to a real variable
				# @TODO rewrite this
				# @deprecated
				def risks_by_severity_graph_text
					host_percent = calculate_vulnerable_host_percent()
					adjective = adjective_for_risk_text(host_percent)
					risk_text = risk_text(host_percent)

					graph_text = "This bar graph is a representation of the findings by severity; the " +
					"graph shows that, overall, #{Report.title} has a #{adjective} handle on the patch " +
					"management of the network. "

					#graph_text = "This bar graph is a representation of the findings by severity; the " +
					#{}"graph shows that, Overall #{Report.title} needs to implement patch management and configuration management as a priority."

					#if adjective == "good" or adjective == "fair"
					#	graph_text << "But improvements in patch management could be made to ensure an excellent rating."
					#end

					graph_text << "\n\n"

					graph_text << "The majority of the critical findings were found on #{host_percent.round}% of the total assessed computers. #{risk_text}\n\n"

					graph_text << "The systems with critical vulnerabilities represent the largest threat to the network, " +
					"so patching this group is paramount to the overall network security. It only takes one vulnerability " +
					"to create a security incident.\n\n"

					graph_text << "It should be noted that low findings and open ports represent the discovery "
					graph_text << "of network services and open ports. Typically, these are not an indication of "
					graph_text << "a serious problem and pose little to no threat. However, the correlation of "
					graph_text << "data between the different severity levels could be used to determine degree "
					graph_text << "of vulnerability for a given system.\n"

					return graph_text
				end

				# @deprecated
				def risk_percent_rounded_text
					"#{calculate_vulnerable_host_percent().round}%"
				end

				# @deprecated
				def risk_percent_patched_rounded_text
					"#{calculate_vulnerable_host_percent_with_patches_applied().round}%"
				end

				# @deprecated
				def risk_percent_text
					"%.2f%" % calculate_vulnerable_host_percent()
				end

				# @deprecated
				def risk_percent_patched_text
					"%.2f%" % calculate_vulnerable_host_percent_with_patches_applied()
				end

				#
				# @TODO comment
				# @FIXME this doesn't work with PostProcess plugins
				#
				def notable_order_by_cvss_raw

					#MIGHT NOT BE CORRECT @TODO

					#return Item.joins(:plugin).where(:severity => 4).order("plugins.cvss_base_score").count(:all, :group => :plugin_id)
					#return Item.joins(:plugin).where(:severity => 4).order("plugins.cvss_base_score").group(:plugin_id).distinct.count

					critical = Item.joins(:plugin).where(:severity => 4).order("plugins.cvss_base_score").group(:plugin_id).distinct.count
					#critical = Item.joins(:plugin).where(:severity => 4).group(:plugin_id).distinct.count

					if critical.size < 10
						high = Item.joins(:plugin).where(:severity => 3).order("plugins.cvss_base_score").group(:plugin_id).distinct.count
						critical = critical.merge high
					end

					return critical
				end

				# Scrubs a plugin_name to remove all pointless data
				#
				# @return [String] Scrubbed plugin name
				def scrub_plugin_name name
					return name.gsub("(remote check)", "").gsub("(uncredentialed check)", "").gsub(/(\(\d.*\))/, "")
				end

				# Returns an array of plugin_id and plugin_name for the top 10
				# findings unsorted
				#
				# @return [Array] Unsorted top 10 findings
				def top_10_sorted_raw
					raw = notable_order_by_cvss_raw

					data = Array.new

					raw.each do |vuln|
						row = Array.new
						plugin_id = vuln[0]
						count = vuln[1]

						row.push(plugin_id)
						row.push(count)
						data.push(row)
					end

					data = data.sort do |a, b|
						b[1] <=> a[1]
					end

					return data
				end

				# Returns an array of plugin_id and plugin_name for the top 10
				# findings sorted by CVSS score
				#
				# @return [Array] Sorted top 10 findings
				def top_10_sorted
					raw = notable_order_by_cvss_raw
					data = Array.new

					raw.each do |vuln|
						row = Array.new
						plugin_id = vuln[0]
						count = vuln[1]

						name = scrub_plugin_name(Plugin.find_by_id(plugin_id).plugin_name)

						row.push(name)
						row.push(count)
						data.push(row)
					end

					data = data.sort do |a, b|
						b[1] <=> a[1]
					end

					return data
				end

				# Returns a prawn pdf table for the top 10 notable findings
				#
				# @TODO change this method to return a array/table and let the template render it
				# @TODO rename to notable_table also
				#
				# @param output device to write the table to
				def top_10_table(output)
					headers = ["Description", "Count"]
					header_widths = {0 => (output.bounds.width - 50), 1 => 50}

					data = top_10_sorted

					output.table([headers] + data[0..9], :header => true, :column_widths => header_widths, :width => output.bounds.width) do
						row(0).style(:font_style => :bold, :background_color => 'cccccc')
						cells.borders = [:top, :bottom, :left, :right]
					end
				end

				# Queries for all unique risks and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def all_risks_unique_sorted
				    select("items.*").select("count(*) as count_all").group(:plugin_id).order("count_all DESC")
				end

				# Returns the plugin that this [Item] belongs to
				#
				# @return [Plugin] the that this [Item] references
				def plugin
					Plugin.where(:id => Item.first.attributes["plugin_id"])
				end

				# Builds a array of findings with their exploitablity values
				#
				# @param [ActiveRecord::Relation] findings to build matrix on
				#
				# @return [Array] with the rows of name, total, core, metasploit, canvas, exploithub, d2elliot
				def exploitablity_matrix findings
					results = Array.new

					findings.each do |item|
						plugin = Plugin.where(:id => item.plugin_id).first

						name = scrub_plugin_name(plugin.plugin_name)
						total = Item.where(:plugin_id => item.plugin_id).count
						core = plugin.exploit_framework_core? ? "Yes" : nil
						metasploit = plugin.exploit_framework_metasploit? ? "Yes" : nil
						canvas = plugin.exploit_framework_canvas? ? "Yes" : nil
						exploithub = plugin.exploit_framework_exploithub? ? "Yes" : nil
						d2elliot = plugin.exploit_framework_d2_elliot? ? "Yes" : nil

						results.push [name, total, core, metasploit, canvas, exploithub, d2elliot]
					end

					return results
				end
			end
		end
	end
end
