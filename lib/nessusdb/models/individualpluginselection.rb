module NessusDB
	module Models
		# IndividualPluginSelection Model
		#
		# @author Jacob Hammack
		class IndividualPluginSelection < ActiveRecord::Base
		  belongs_to :policy
		end
	end
end
