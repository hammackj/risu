module NessusDB
	module Modules
		# Reference Model
		#
		# @author Jacob Hammack
		class Reference < ActiveRecord::Base
		  has_many :plugins
		end
	end
end
