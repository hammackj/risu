# encoding: utf-8

module NessusDB
	module Modules
		# Host Model
		#
		# @author Jacob Hammack
		class Host < ActiveRecord::Base
			belongs_to :Reports
			has_many :Items
			
			class << self
				
				#
				#
				#
				def hosts_with_blacklist blacklist_hosts_id
					if blacklist_host_id == nil
						where("id != ?", blacklist_host_id).count
					else
						count
					end
				end
			
		end
	end
end
