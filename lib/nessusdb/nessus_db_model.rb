require 'rubygems'
require 'active_record'
require 'yaml'
require 'nessus_db'

class Policy < ActiveRecord::Base
  has_many :ServerPreferences
  has_many :FamilySelections
  has_many :IndividualPluginSelections
  has_many :Reports
  has_many :PluginsPreferences
end

class ServerPreference < ActiveRecord::Base
  belongs_to :policies
end

class FamilySelection < ActiveRecord::Base
  belongs_to :policies
end

class IndividualPluginSelection < ActiveRecord::Base
  belongs_to :policies
end

class PluginsPreference < ActiveRecord::Base
  belongs_to :policies
end

class Report < ActiveRecord::Base
  has_many :Hosts
  belongs_to :policies
end

class Host < ActiveRecord::Base
  belongs_to :Reports
  has_many :Items
end

class Item < ActiveRecord::Base
  belongs_to :hosts
  has_many :plugins
end

class Plugin < ActiveRecord::Base
  belongs_to :items
  belongs_to :family
  has_many :References
  has_many :IndividualPluginSelections
end

class Reference < ActiveRecord::Base
  has_many :plugins
end
