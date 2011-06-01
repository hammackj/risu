# encoding: utf-8

module Risu
	APP_NAME = "risu"
	VERSION = "1.5.0"
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

require 'risu/prawn_templater'

require 'risu/base'
require 'risu/cli'
require 'risu/exceptions'
require 'risu/models'
require 'risu/parsers'

include Risu::Models
