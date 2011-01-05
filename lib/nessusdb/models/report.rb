module NessusDB
	module Modules
		# Report Model
		#
		# @author Jacob Hammack
		class Report < ActiveRecord::Base
		  has_many :Hosts
		  belongs_to :policies
		end
	end
end