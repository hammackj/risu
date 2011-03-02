module NessusDB
	module Models
		# IndividualPluginSelection Model
		#
		# @author Jacob Hammack
		class IndividualPluginSelection < ActiveRecord::Base
		  belongs_to :Policy
		end
	end
end
