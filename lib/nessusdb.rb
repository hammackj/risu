
module NessusDB
	VERSION = "0.6.6"
end

require 'rubygems'
require 'libxml'
require 'choice'  
require 'active_record'  
require 'yaml'
#require 'logger'
require 'prawn'
require 'prawn/layout' 

#require 'erb'

require 'nessusdb/models'
require 'nessusdb/listener'
require 'nessusdb/findings'
require 'nessusdb/schema'
require 'nessusdb/templater'
require 'nessusdb/prawn_templater'


# config/initializers/pdfkit.rb
#PDFKit.configure do |config|
#	if File.exists? "/opt/local/bin/wkhtmltopdf"
#  	config.wkhtmltopdf = '/opt/local/bin/wkhtmltopdf'
#	else
#		config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
#	end
#  config.default_options = {
#    :page_size => 'letter',
#    :print_media_type => true
#  }
#end
