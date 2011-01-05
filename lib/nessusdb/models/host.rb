module NessusDB
	module Modules
		# Host Model
		#
		# @author Jacob Hammack
		class Host < ActiveRecord::Base
		 belongs_to :Reports
		 has_many :Items
		end
	end
end
