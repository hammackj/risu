module NessusDB
	module Models
		# Policy Model
		#
		# @author Jacob Hammack
		class Policy < ActiveRecord::Base
		  has_many :serverpreferences
		  has_many :familyselections
		  has_many :individualpluginSelections
		  has_many :reports
		  has_many :pluginspreferences
		end
	end
end
