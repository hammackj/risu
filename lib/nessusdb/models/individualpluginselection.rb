# encoding: utf-8

module NessusDB
	module Models

		# IndividualPluginSelection Model
		#
		# @author Jacob Hammack
		class IndividualPluginSelection < ActiveRecord::Base
			belongs_to :policy
			has_many :plugins
		end
	end
end
