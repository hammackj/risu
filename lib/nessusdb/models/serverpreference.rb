module NessusDB
	module Modules
		# ServerPreference Model
		#
		# @author Jacob Hammack
		class ServerPreference < ActiveRecord::Base
		  belongs_to :policies
		end
	end
end
