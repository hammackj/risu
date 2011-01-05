module NessusDB
	module Modules
		# Plugin Model
		#
		# @author Jacob Hammack
		class Plugin < ActiveRecord::Base
		  belongs_to :items
		  belongs_to :family
		  has_many :References
		  has_many :IndividualPluginSelections
		end
	end
end
