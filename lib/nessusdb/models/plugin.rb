# encoding: utf-8

module NessusDB
	module Models
		# Plugin Model
		#
		# @author Jacob Hammack
		class Plugin < ActiveRecord::Base
			has_many :items
			belongs_to :family
			has_many :references
			has_many :individualpluginselections
		
			class << self
				# Creates a graph based on the top plugins sorted by count
				#
				# 
				# @todo move to the plugins class
				# 
				# @return Filename of the created graph
				def top_by_count_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d Critical Findings By Plugin", Item.risks_by_plugin(limit).count
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}
					
					puts Item.risks_by_plugin(limit).count

					Item.risks_by_plugin(limit).each { |plugin|
					
						#puts plugin.inspect
					
						plugin_name = Plugin.find_by_id(plugin.plugin_id).plugin_name
						
						#puts "name = #{plugin_name} "						

						#We need to filter the names a little to make everything look nice on the graph
						plugin_name = case plugin
							when 35362 then plugin_name.split(":")[0]
							when 34477 then plugin_name.split(":")[0]
							when 35635 then plugin_name.split(":")[0]
							when 21564 then "VNC Remote Authentication Bypass"
							when 38664 then "Intel Common Base Agent Remote Command Execution"
							when /^(MS\d{2}-\d{3}):/ then 
								puts $1
								$1
							else
								plugin_name = plugin_name
						end unless plugin_name.length == 0

						#puts "name = #{plugin_name} "

						#g.data(plugin_name, Item.find(:all, :conditions => {:plugin_id => plugin}).count)
						g.data(plugin_name, Item.where(:plugin_id => plugin).count)
					}
				
					StringIO.new(g.to_blob)
				end
			end
		end
	end
end
