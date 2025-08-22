# Copyright (c) 2010-2025 Jacob Hammack.
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
	#GRAPH_COLORS = %w(#d2403f #ec9241 #fcc343 #50ad51 #397bbb #8E6B8E black #cccccc brown #e52d89)

        GRAPH_COLORS = %w(#C0392B #D35400 #F1C40F #27AE60 #08306B #ECF0F1).freeze

  # Critical (Rich Red)
  # High     (Warm Orange)
  # Medium   (Bright Yellow)
  # Low      (Emerald Green)
  # Info     (Light Gray)



        ALT_GRAPH_COLORS = %w(#08306B #08519C #2171B5 #4292C6 #6BAED6 #9ECAE1).freeze
	  # Shade 1 (Dark Navy)
  # Shade 2 (Deep Blue)
  # Shade 3 (Strong Blue)
  # Shade 4 (Sky Blue)
  # Shade 5 (Light Sky)
  # Shade 6 (Pale Blue)
	
	
	#%w(#4B0082 #8A2BE2 #9370DB #D8BFD8 #0000FF #1E90FF #87CEEB #8B4513 #404040 #DCDCDC)
	  # Indigo
  # BlueViolet
  # MediumPurple
  # Thistle
  # Blue
  # DodgerBlue
  # SkyBlue
  # SaddleBrown
  # DarkGray
  # Gainsboro

# 	%w(
#   #C0392B  # Critical (Rich Red)
#   #D35400  # High     (Warm Orange)
#   #F1C40F  # Medium   (Bright Yellow)
#   #27AE60  # Low      (Emerald Green)
#   #ECF0F1  # Info     (Light Gray)
# )

        CONFIG_FILE = File.expand_path("risu.cfg", __dir__).freeze
        USER_TEMPLATES_DIR = "~/.risu/templates/".freeze
end

# TODO move these require to another file or move the above metadata to a config.rb
require "logger"
require 'rails'
require 'active_record'
require "active_support"
require 'libxml'
require 'ipaddr'
require 'yaml'
require 'gruff'
require 'prawn'
require 'prawn/table'
require 'stringio'
#require 'mysql2'
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
