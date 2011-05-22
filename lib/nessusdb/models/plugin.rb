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
			has_many :individual_plugin_selections

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
					g.title = sprintf "Top %d High Findings By Plugin", Item.risks_by_plugin(limit).all.count
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_plugin(limit).all.each do |plugin|
						plugin_name = Plugin.find_by_id(plugin.plugin_id).plugin_name

						#We need to filter the names a little to make everything look nice on the graph
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
			end
		end
	end
end
