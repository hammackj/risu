base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))


require 'rspec'
require 'nessusdb'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

begin
	app = NessusDB::CLI::Application.new
	app.load_config("test_data/nessusdb_spec.cfg")
	app.db_connect
	app.migrate(:down)
	app.migrate(:up)
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

RSpec.configure do |config|
	config.before(:all)    { Sham.reset(:before_all)  }
	config.before(:each)   { Sham.reset(:before_each) }
end
