module NessusDB
	module Models
		# Reference Model
		#
		# @author Jacob Hammack
		class Reference < ActiveRecord::Base
		  has_many :Plugins
		end
	end
end
