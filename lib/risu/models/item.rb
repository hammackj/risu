# encoding: utf-8

module Risu
	module Models

		# Item Model
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Item < ActiveRecord::Base
			belongs_to :host
			belongs_to :plugin

			class << self

				# Queries for all risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks
					where(:severity => [0,1,2,3])
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

				# Queries for all the unique high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_unique
					where(:severity => 3).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end

				# Queries for all the unique high findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_unique_sorted
					select("items.*").select("count(*) as count_all").where(:severity => 3).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the unique medium risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_unique
					where(:severity => 2).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end

				# Queries for all the unique medium findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_unique_sorted
					select("items.*").select("count(*) as count_all").where(:severity => 2).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the unique low risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks_unique
					where(:severity => 1).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
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
					where(:severity => 0).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end

				# Queries for all the unique info findings and sorts them by count
				#
				# @return [ActiveRecord::Relation] with the query results
				def info_risks_unique_sorted
					select("items.*").select("count(*) as count_all").where(:severity => 0).group(:plugin_id).order("count_all DESC")
				end

				# Queries for all the risks grouped by service type, used for the Vulnerbilities by Service graph
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_service(limit=10)
					select("items.*").select("count(*) as count_all").where("svc_name != 'unknown' and svc_name != 'general'").group(:svc_name).order("count_all DESC").limit(limit)
				end

				# Queries for all the high risks by plugin
				#
				# @todo update this
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_plugin(limit=10)
					select("items.*").select("count(*) as count_all").joins(:plugin).where("plugin_id != 1").where(:severity => 3).group(:plugin_id).order("count_all DESC").limit(limit)
				end

				# Queries for all the risks by host
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_host(limit=10)
					select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => [3, 2]).group(:host_id).order("count_all DESC").limit(limit)
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
				# @return [StringIO] Object containing the generated PNG image
				def risks_by_service_graph(limit=10)
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d Vulnerable Services", Item.risks_by_service(limit).all.count
					g.sort = false
					g.theme = {
						:colors => %w(red orange yellow blue green purple black grey brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_service(limit).all.each { |service|
						g.data(service.svc_name, Item.find(:all, :conditions => {:svc_name => service.svc_name}).count)
					}

					StringIO.new(g.to_blob)
				end
				
				def risks_by_service_graph_text
					"This graph is a representation of the risks found by service. This graph can help " +
					"understand what services are running on the network and if they are vulnerable, where " +
					"the risks are and how they should be protected."
					
				end
				

				# Generates a Graph of all the risks by severity
				#
				# @return [StringIO] Object containing the generated PNG image
				def risks_by_severity_graph
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = "Risks By Severity"
					g.sort = false
					g.theme = {
						:colors => %w(red orange yellow blue green purple black grey brown pink),
						:background_colors => %w(white white)
					}

					high = Item.high_risks.count
					medium = Item.medium_risks.count
					low = Item.low_risks.count
					info = Item.info_risks.count
					
					if high == nil then high = 0 end
					if medium == nil then medium = 0 end
					if low == nil then low = 0 end		
					if info == nil then info = 0 end

					g.data("High", high, "red")
					g.data("Medium", medium, "orange")
					g.data("Low", low, "yellow")
					g.data("Info", info, "blue")

					StringIO.new(g.to_blob)
				end

				# @todo change Report.title to a real variable
				#
				def risks_by_severity_graph_text
					high = Item.high_risks.count
					medium = Item.medium_risks.count
					
					if high == nil then high = 0 end
					if medium == nil then medium = 0 end
						
					percentage = high
					
					adjective = case percentage
						when 0..5
							"excellent"
						when 6..10
							"great"
						when 11..20
							"very good"
						when 21..30
							"good"
						when 31..40
							"fair"
						else
							"poor"
					end
					
					hosts_with_high = Hash.new
					
					Item.high_risks.all.each do |item|
						ip = Host.find_by_id(item.host_id).name
						if hosts_with_high[ip] == nil
							hosts_with_high[ip] = 1
						end
								
						hosts_with_high[ip] = hosts_with_high[ip] + 1
					end
					
					host_percent = (hosts_with_high.count.to_f / Host.all.count.to_f) * 100
					
					percent_text = case host_percent
						when 0..5			
							"This implies that only a handful of computers are missing patches, and the current patch management is working well."
						when 6..20
							"This implies that there is a minor patch management issue. If there is a patch management system, it should be checked for problems. " +
							"Each host should also be inspect to be certain it can receive patches."
						else
							"This implies that there is a significant patch management problem on the network. Any patch management solutions should " +
							"be inspected for issues and they should be correct as soon as possible. Each host should also be inspect to be certain it can receive patches."
					end
							
					graph_text = "This bar graph is a representation of the risks by severity; the " +
					"graph shows that, overall, #{Report.title} has a #{adjective} handle on the patch " +
					"management of the network.\n\n"
					
					graph_text += "The majority of the high risks were found on #{host_percent.round}% of the total assessed computers. #{percent_text}\n\n"
					
					graph_text += "The systems with high vulnerbilities represent the largest threat to the network, " +
					"so patching this group is paramount to the overall network security. It only takes one vulnerable system " +
					"to create a security incident.\n\n"
					
					graph_text += "Low and information risks represent the discovery of network services and open ports. " +
					"These are used in conjunction with the high and medium risks to determine if computers and services " +
					"are vulnerable.\n"

					return graph_text
				end
			end
		end
	end
end
