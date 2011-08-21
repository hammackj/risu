module Risu
	module Models

		# Version Model for the DB
		#
		# @author Jacob Hammack
		class Patch < ActiveRecord::Base
			belongs_to :host
		end
	end
end
