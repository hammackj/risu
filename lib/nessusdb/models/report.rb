# encoding: utf-8

module NessusDB
	module Models
		
		# Report Model
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Report < ActiveRecord::Base
		  has_many :hosts
		  belongs_to :policy
		
			class << self
				
				attr_accessor :title, :author, :company, :classification
				
				#
				#@scan_date = Host.where("start is not null").first[:start].to_s
				#
				def scan_date
					Host.where("start is not null").first[:start].to_s
				end
			end
		end
	end
end
