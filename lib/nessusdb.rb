# encoding: utf-8

module NessusDB
	APP_NAME = "nessusdb"
	VERSION = "1.4"
	GRAPH_WIDTH = 750
	EMAIL = "jacob.hammack@hammackj.com"
	CONFIG_FILE = "./nessusdb.cfg"
end

require 'active_record'
require "active_support"
require 'libxml'
require 'logger'
require 'ipaddr'
require 'yaml'
require 'gruff'
require 'prawn'
require 'prawn/layout'
require 'stringio'
require 'mysql'
require 'irb'

require 'optparse'

if ActiveRecord::Base.connected? == true
	require 'nessusdb/schema'
end

require 'nessusdb/listener'
require 'nessusdb/prawn_templater'
require 'nessusdb/nessusdocument'

require 'nessusdb/cli'
require 'nessusdb/exceptions'
require 'nessusdb/models'

include NessusDB::Models
