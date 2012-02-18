require 'simplecov'
SimpleCov.start

base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'rails'
require 'rails/test_help'
require 'test/unit'

require 'active_record'
require 'active_record/fixtures'
require "active_support"

require 'risu'

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
	@app = Risu::CLI::Application.new
	@app.load_config(config, true)
	@app.db_connect
	@app.migrate(:down)
	@app.migrate(:up)
	
	fixtures = Dir.glob(File.join('test', 'fixtures', '*.{yml,csv}'))
	fixtures.each do |fixture_file|
		ActiveRecord::Fixtures.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
	end
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

class ActiveSupport::TestCase
 # fixtures :all
end
