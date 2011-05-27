# encoding: utf-8

module Risu
	module Models

		# ServerPreference Model
		#
		# @author Jacob Hammack
		class ServerPreference < ActiveRecord::Base
		  belongs_to :policy
		end
	end
end
