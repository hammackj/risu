require 'rubygems'
require 'active_record'
require 'yaml'
require 'nessus_db'

class Policy < ActiveRecord::Base
  has_many :Serverpreferences
  has_many :Pluginpreferences
  has_many :Familyselections
  has_many :Individualpluginselections
  has_many :Reports
end

class Serverpreference < ActiveRecord::Base
  belongs_to :policy
end

class Pluginpreference < ActiveRecord::Base
  belongs_to :policy
end

class Familyselection < ActiveRecord::Base
  belongs_to :policy
end

class Individualpluginselection < ActiveRecord::Base
  belongs_to :policy
end

class Report < ActiveRecord::Base
  has_many :Reporthosts
end

class Reporthost < ActiveRecord::Base
  belongs_to :Report
  has_many :Reportitems
end

class Reportitem < ActiveRecord::Base
  belongs_to :Reporthosts
  has_many :Plugins
end

class Plugin < ActiveRecord::Base
  belongs_to :Reportitems
  has_many :Plugincves
  has_many :Pluginbids
  has_many :Pluginseealsos
  has_many :Pluginxrefs
end
  
class Plugincve < ActiveRecord::Base
  belongs_to :plugins
end

class Pluginbid < ActiveRecord::Base
  belongs_to :plugins
end

class Pluginxref < ActiveRecord::Base
  belongs_to :plugins
end

class Pluginseealso < ActiveRecord::Base
  belongs_to :plugins
end
