# encoding: utf-8

module NessusDB
	module Models
		# Plugin Model
		#
		# @author Jacob Hammack
		class Plugin < ActiveRecord::Base
		  has_many :items
		  belongs_to :family
		  has_many :references
		  has_many :individualpluginselections
		end
	end
end
