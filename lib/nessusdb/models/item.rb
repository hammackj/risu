

module NessusDB
	module Modules
		# Item Model
		#
		# @author Jacob Hammack
		class Item < ActiveRecord::Base
		  belongs_to :hosts
		  has_many :plugins
		
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
					where(:severity => 3).includes(:plugins).order(:cvss_base_score).group(:plugin_id)
				end
				
				def high_risks_unique
					where(:severity => 2).includes(:plugins).order(:cvss_base_score).group(:plugin_id)
				end
				
				def medium_risks_unique
					where(:severity => 1).includes(:plugins).order(:cvss_base_score).group(:plugin_id)
				end
				
				def low_risks_unique
					where(:severity => 0).includes(:plugins).order(:cvss_base_score).group(:plugin_id)
				end
		end
	end
end
