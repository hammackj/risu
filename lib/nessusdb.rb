# encoding: utf-8

module NessusDB
	APP_NAME = "nessusdb"
	VERSION = "1.2"
	GRAPH_WIDTH = 750
end

require 'active_record'
require "active_support"
require 'libxml'
require 'logger'

require 'yaml'
require 'gruff'
require 'prawn'
require 'prawn/layout'
require 'stringio'
require 'mysql'

require 'nessusdb/models'

if ActiveRecord::Base.connected? == true
	require 'nessusdb/schema'
end

require 'nessusdb/listener'
require 'nessusdb/prawn_templater'
require 'nessusdb/nessusdocument'

require 'nessusdb/models/host'
require 'nessusdb/models/familyselection'
require 'nessusdb/models/item'
require 'nessusdb/models/individualpluginselection'
require 'nessusdb/models/plugin'
require 'nessusdb/models/pluginspreference'
require 'nessusdb/models/policy'
require 'nessusdb/models/report'
require 'nessusdb/models/reference'
require 'nessusdb/models/serverpreference'
require 'nessusdb/models/version'

include NessusDB::Models
