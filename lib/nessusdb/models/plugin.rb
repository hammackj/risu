# encoding: utf-8

module NessusDB
	module Models
		# Plugin Model
		#
		# @author Jacob Hammack
		class Plugin < ActiveRecord::Base
		  belongs_to :item
		  belongs_to :family
		  has_many :references
		  has_many :individualpluginselections
		end
	end
end
