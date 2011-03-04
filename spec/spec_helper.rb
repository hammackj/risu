base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'nessusdb'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

app = NessusDB::CLI::Application.new
app.load_config
app.db_connect
app.migrate(:down)
app.migrate(:up)

RSpec.configure do |config|
	config.before(:all)    { Sham.reset(:before_all)  }
	config.before(:each)   { Sham.reset(:before_each) }
end