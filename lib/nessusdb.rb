
module NessusDB
	VERSION = "0.6.6"
end

require 'rubygems'
require 'libxml'
require 'choice'  
require 'active_record'  
require 'yaml'
require 'gruff'
require 'prawn'
require 'prawn/layout' 

require 'nessusdb/models'
require 'nessusdb/listener'
require 'nessusdb/findings'
require 'nessusdb/schema'
require 'nessusdb/templater'
require 'nessusdb/prawn_templater'
