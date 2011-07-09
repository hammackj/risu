module Risu
	module Models	
		# FamilySelection Model
		#
		# @author Jacob Hammack
		class FamilySelection < ActiveRecord::Base
		  belongs_to :policy
		end
	end
end
