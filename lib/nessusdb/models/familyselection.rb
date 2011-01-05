# encoding: utf-8

module NessusDB
	module Modules	
		# FamilySelection Model
		#
		# @author Jacob Hammack
		class FamilySelection < ActiveRecord::Base
		  belongs_to :policies
		end
	end
end
