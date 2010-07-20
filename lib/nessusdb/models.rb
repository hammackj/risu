ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))  

# normally disabled due to peformance, enable for debugging
#ActiveRecord.colorize_logging = false
#ActiveRecord::Base.logger = Logger.new("db.log")

module NessusDB
	
	# Policy Model
	#
	# @author Jacob Hammack
	class Policy < ActiveRecord::Base
	  has_many :ServerPreferences
	  has_many :FamilySelections
	  has_many :IndividualPluginSelections
	  has_many :Reports
	  has_many :PluginsPreferences
	end

	# ServerPreference Model
	#
	# @author Jacob Hammack
	class ServerPreference < ActiveRecord::Base
	  belongs_to :policies
	end

	# FamilySelection Model
	#
	# @author Jacob Hammack
	class FamilySelection < ActiveRecord::Base
	  belongs_to :policies
	end

	# IndividualPluginSelection Model
	#
	# @author Jacob Hammack
	class IndividualPluginSelection < ActiveRecord::Base
	  belongs_to :policies
	end

	# PluginPreference Model
	#
	# @author Jacob Hammack
	class PluginsPreference < ActiveRecord::Base
	  belongs_to :policies
	end

	# Report Model
	#
	# @author Jacob Hammack
	class Report < ActiveRecord::Base
	  has_many :Hosts
	  belongs_to :policies
	end

	# Host Model
	#
	# @author Jacob Hammack
	class Host < ActiveRecord::Base
	  belongs_to :Reports
	  has_many :Items
	end

	# Item Model
	#
	# @author Jacob Hammack
	class Item < ActiveRecord::Base
	  belongs_to :hosts
	  has_many :plugins
	end

	# Plugin Model
	#
	# @author Jacob Hammack
	class Plugin < ActiveRecord::Base
	  belongs_to :items
	  belongs_to :family
	  has_many :References
	  has_many :IndividualPluginSelections
	end

	# Reference Model
	#
	# @author Jacob Hammack
	class Reference < ActiveRecord::Base
	  has_many :plugins
	end
end