module Risu
	APP_NAME = "risu"
	VERSION = "1.5.1"
	GRAPH_WIDTH = 750
	EMAIL = "jacob.hammack@hammackj.com"
	CONFIG_FILE = "./risu.cfg"
	USER_TEMPLATES_DIR = "~/.risu/templates/"
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
require 'sinatra'
require 'haml'


require 'optparse'

require 'risu/base'
require 'risu/cli'
require 'risu/web'
require 'risu/exceptions'
require 'risu/models'
require 'risu/parsers'
require 'risu/renderers'

include Risu::Models
