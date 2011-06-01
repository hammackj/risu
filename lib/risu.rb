# encoding: utf-8

module Risu
	APP_NAME = "risu"
	VERSION = "1.4.4"
	GRAPH_WIDTH = 750
	EMAIL = "jacob.hammack@hammackj.com"
	CONFIG_FILE = "./risu.cfg"
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
	require 'risu/schema'
end

require 'risu/nessus_sax_listener'
require 'risu/prawn_templater'
require 'risu/nessusdocument'

require 'risu/cli'
require 'risu/exceptions'
require 'risu/models'

include Risu::Models
