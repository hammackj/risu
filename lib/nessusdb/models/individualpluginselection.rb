module NessusDB
	module Modules
		# IndividualPluginSelection Model
		#
		# @author Jacob Hammack
		class IndividualPluginSelection < ActiveRecord::Base
		  belongs_to :policies
		end
	end
end
