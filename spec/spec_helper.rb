base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))


require 'rspec'
require 'nessusdb'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

config = 
"report:
  author: 
  title: 
  company: 
  classification: 

database:
  adapter: sqlite3
  database: test_data/test.db"


begin
	app = NessusDB::CLI::Application.new
	app.load_config(config, true)
	app.db_connect
	app.migrate(:down)
	app.migrate(:up)
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

RSpec.configure do |config|
#	config.before(:all)    { Sham.reset(:before_all)  }
	config.before(:each)   { Sham.reset }
end
