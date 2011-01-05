module NessusDB
	module Modules
		# Policy Model
		#
		# @author Jacob Hammack
		class Policy < ActiveRecord::Base
		  has_many :ServerPreferences
		  has_many :FamilySelections
		  has_many :IndividualPluginSelections
		  has_many :Reports
		  has_many :PluginsPreferences
		end
	end
end
