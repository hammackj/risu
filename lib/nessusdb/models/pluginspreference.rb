# encoding: utf-8

module NessusDB
	module Models
		# PluginPreference Model
		#
		# @author Jacob Hammack
		class PluginsPreference < ActiveRecord::Base
		  belongs_to :policy
		end
	end
end
