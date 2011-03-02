module NessusDB
	module Models
		# ServerPreference Model
		#
		# @author Jacob Hammack
		class ServerPreference < ActiveRecord::Base
		  belongs_to :Policy
		end
	end
end
