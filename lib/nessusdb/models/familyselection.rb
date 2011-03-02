# encoding: utf-8

module NessusDB
	module Models	
		# FamilySelection Model
		#
		# @author Jacob Hammack
		class FamilySelection < ActiveRecord::Base
		  belongs_to :Policy
		end
	end
end
