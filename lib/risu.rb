# Copyright (c) 2010-2015 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	APP_NAME = "risu"
	VERSION = "1.7.6"
	# @todo move graph variables to graphs.rb
	GRAPH_WIDTH = 750
	#                  red     orange  yellow  green    blue   purple        grey           pink
	GRAPH_COLORS = %w(#d2403f #ec9241 #fcc343 #50ad51 #397bbb #8E6B8E black #cccccc brown #e52d89)
	GITHUB = "http://github.com/arxopia/risu"
	EMAIL = "risu@arxopia.com"
	CONFIG_FILE = "./risu.cfg"
	USER_TEMPLATES_DIR = "~/.risu/templates/"
end

require 'rails'
require 'active_record'
require "active_support"
require 'libxml'
require 'logger'
require 'ipaddr'
require 'yaml'
require 'gruff'
require 'prawn'
require 'prawn/table'
require 'stringio'
require 'mysql2'
require 'irb'
require 'sqlite3'
require 'nokogiri'

require 'optparse'

require 'risu/base'
require 'risu/cli'
require 'risu/exceptions'
require 'risu/models'
require 'risu/graphs'
require 'risu/template_helpers'
require 'risu/parsers'
require 'risu/parsers/nessus/postprocess'
require 'risu/renderers'

include Risu::Models
