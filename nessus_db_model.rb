require 'rubygems'
require 'active_record'
require 'yaml'
require 'nessus_db'

class Policy < ActiveRecord::Base
  has_many :ServerPreferences
  has_many :familyselections
  has_many :individualpluginselections
  has_many :reports
  has_many :preferences
  has_many :plugins
end

class ServerPreference < ActiveRecord::Base
  belongs_to :policy
end

class FamilySelection < ActiveRecord::Base
  belongs_to :family
end

class Family < ActiveRecord::Base
  has_many :plugins
  has_many :familyselections
end

class IndividualPluginSelection < ActiveRecord::Base
  belongs_to :policy
  belongs_to :plugin
end

class Report < ActiveRecord::Base
  has_many :hosts
  belongs_to :policy
end

class Host < ActiveRecord::Base
  belongs_to :report
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :hosts
  has_many :plugins
end

class Plugin < ActiveRecord::Base
  belongs_to :items
  belongs_to :family
  has_many :references
  has_many :ndividualpluginselection
end

class Preference < ActiveRecord::Base
  belongs_to :plugin
end
  
class Reference < ActiveRecord::Base
  has_many :plugins
end
