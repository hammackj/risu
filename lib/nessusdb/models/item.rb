module NessusDB
	module Modules
		# Item Model
		#
		# @author Jacob Hammack
		class Item < ActiveRecord::Base
		  belongs_to :hosts
		  has_many :plugins
		end
	end
end
