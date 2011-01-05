module NessusDB
	module Modules
		# PluginPreference Model
		#
		# @author Jacob Hammack
		class PluginsPreference < ActiveRecord::Base
		  belongs_to :policies
		end
	end
end
