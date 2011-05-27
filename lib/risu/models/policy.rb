# encoding: utf-8

module Risu
	module Models
		
		# Policy Model
		#
		# @author Jacob Hammack
		class Policy < ActiveRecord::Base
		  has_many :family_selections
		  has_many :individual_plugin_selections
		  has_many :reports
		  has_many :plugins_preferences
			has_many :server_preferences
		end
	end
end
