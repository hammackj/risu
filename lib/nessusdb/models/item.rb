# encoding: utf-8

module NessusDB
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
			
				# Queries for all the critical risks in the database
				# 
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks
					where(:severity => 3)
				end
			
				# Queries for all the high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results 
				def high_risks
					where(:severity => 2)
				end
				
				# Queries for all the medium risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks
					where(:severity => 1)
				end
				
				# Queries for all the low risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks
					where(:severity => 0)
				end
				
				# Queries for all the unique critical risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def critical_risks_unique
					where(:severity => 3).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end
				
				# Queries for all the unique high risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def high_risks_unique
					where(:severity => 2).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				# Queries for all the unique medium risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def medium_risks_unique
					where(:severity => 1).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				# Queries for all the unique low risks in the database
				#
				# @return [ActiveRecord::Relation] with the query results
				def low_risks_unique
					where(:severity => 0).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				# Queries for all the risks grouped by service type, used for the Vulnerbilities by Service graph
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_service(limit=10)
					select("items.*").select("count(*) as count_all").where("svc_name != 'unknown' and svc_name != 'general'").group(:svc_name).order("count_all DESC").limit(limit)
				end
				
				# Queries for all the risks by plugin
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_plugin(limit=10)
					select("items.*").select("count() as count_all").joins(:plugin).where("plugin_id != 1").where(:severity => 3).group(:plugin_id).order("count_all DESC").limit(limit)
				end
				
				# Queries for all the risks by host
				#
				# @return [ActiveRecord::Relation] with the query results
				def risks_by_host(limit=10)
					select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => [3,2]).group(:host_id).order("count_all DESC").limit(limit)
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
					g.title = sprintf "Top %d Findings By Service", Item.risks_by_service(limit).all.count
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_service(limit).all.each { |service| 
						g.data(service.svc_name, Item.find(:all, :conditions => {:svc_name => service.svc_name}).count)
					}

					StringIO.new(g.to_blob)
				end
				
				# Generates a Graph of all the risks by severity
				#
				# @return [StringIO] Object containing the generated PNG image
				def risks_by_severity_graph
				  g = Gruff::Bar.new(GRAPH_WIDTH)
				  g.title = "Findings By Severity"
				  g.sort = false
				  g.theme = {
				     :background_colors => %w(white white)
				  }

				  g.data("Critical", Item.critical_risks.count, "red") unless Item.critical_risks.count == 0
				  g.data("High", Item.high_risks.count, "orange") unless Item.high_risks.count == 0
				  g.data("Medium", Item.medium_risks.count, "yellow") unless Item.medium_risks.count == 0
				  g.data("Low", Item.low_risks.count, "blue") unless Item.low_risks.count == 0

				  StringIO.new(g.to_blob)
				end
			end
		end
	end
end
