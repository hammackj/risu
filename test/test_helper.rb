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

def setup_test_database
config = 
"report:
  author: TEST
  title: TEST
  company: TEST
  classification: TEST

database:
  adapter: sqlite3
  database: test_data/test.db"

begin	
	File.delete("test_data/test.db") if File.exist?("test_data/test.db")
			
	@app = Risu::CLI::Application.new
	@app.load_config(config, true)
	@app.db_connect
	
	@app.migrate(:up)
	
	if !ActiveRecord::Base.connection.tables.empty?
		Risu::Base::Schema.migrate(:down)
	end
	
	@app.migrate(:up)
	
	fixtures = Dir.glob(File.join('test', 'fixtures', '*.{yml,csv}'))
	fixtures.each do |fixture_file|
		ActiveRecord::Fixtures.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
	end
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end
end

setup_test_database()

class ActiveSupport::TestCase

end
