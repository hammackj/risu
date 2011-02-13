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

				#
				#@number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
				#
				def risks
					where(:severity => [0,1,2,3,4])
				end
			
				#
				# @number_of_critical = Item.find(:all, :conditions => ["severity IN (3) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
				#
				def critical_risks
					where(:severity => 3)
				end
			
				#
				#@number_of_high = Item.find(:all, :conditions => ["severity IN (2) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
				#
				def high_risks
					where(:severity => 2)
				end
				
				#
				#@number_of_medium = Item.find(:all, :conditions => ["severity IN (1) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
				#
				def medium_risks
					where(:severity => 1)
				end
				
				#
				#@number_of_low = Item.find(:all, :conditions => ["severity IN (0) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
				#
				def low_risks
					where(:severity => 0)
				end
				
				#
				#@critical_findings_unique = Item.find(:all, :conditions => ["severity = 3 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score', :group => :plugin_id)
				#
				def critical_risks_unique
					where(:severity => 3).joins(:plugin).order("plugins.cvss_base_score").group(:plugin_id)
				end
				
				#
				#
				#
				def high_risks_unique
					where(:severity => 2).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				#
				#
				#
				def medium_risks_unique
					where(:severity => 1).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				#
				#
				#
				def low_risks_unique
					where(:severity => 0).joins(:plugin).order(:cvss_base_score).group(:plugin_id)
				end
				
				#
				#@findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
				#
				def risks_by_service(limit=10)
					select("items.*").select("count(*) as count_all").where("svc_name != 'unknown' and svc_name != 'general'").group(:svc_name).order("count_all DESC").limit(limit)#.all
				end
				
				#
				##@top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)
				#
				def risks_by_plugin(limit=10)
					select("items.*").select("count() as count_all").joins(:plugin).where("plugin_id != 1").where(:severity => 3).group(:plugin_id).order("count_all DESC").limit(limit)#.all
				end
				
				#
				##@top_vuln_hosts = Item.find_by_sql("SELECT host_id, count(host_id) FROM items WHERE plugin_id != 1 AND plugin_id NOT IN (#{@blacklist_plugins}) AND severity IN (3,2) GROUP BY host_id ORDER BY count(host_id) DESC LIMIT 10").map(&:host_id)
				#
				def risks_by_host(limit=10)
					select("items.*").select("count(*) as count_all").joins(:host).where("plugin_id != 1").where(:severity => [3,2]).group(:host_id).order("count_all DESC").limit(limit)#.all
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
