# Copyright (c) 2010-2018 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	# @TODO 1.8.1 - move graph variables to graphs.rb
	GRAPH_WIDTH = 750
	#                  red     orange  yellow  green    blue   purple        grey           pink
	GRAPH_COLORS = %w(#d2403f #ec9241 #fcc343 #50ad51 #397bbb #8E6B8E black #cccccc brown #e52d89)

	CONFIG_FILE = "./risu.cfg"
	USER_TEMPLATES_DIR = "~/.risu/templates/"
end

# TODO move these require to another file or move the above metadata to a config.rb
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

require 'risu/version'
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

# Suppress Prawn Font Warning
# @TODO update default font to a TTF font
Prawn::Font::AFM.hide_m17n_warning = true
