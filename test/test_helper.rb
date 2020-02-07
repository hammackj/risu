# Copyright (c) 2010-2020 Jacob Hammack.
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

# Disable Coverage always on
require 'simplecov'
SimpleCov.start

base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'rails'
require 'rails/test_help'
require 'test/unit'
require 'active_record'
require 'active_record/fixtures'
require 'active_support'
require 'tmpdir'

require 'risu'

ActiveSupport::TestCase.test_order = :sorted

def config_sqlite
	{
		"report" =>
			{
				"author" => "TEST",
				"title" => "TEST",
				"company" => "TEST",
				"classification" => "TEST",
			},
			"database" =>
			{
				"adapter" => "sqlite3",
				"database" => "test_data/test.db"
			}
	}.to_yaml
end

def config_sqlite_memory
	{
		"report" =>
			{
				"author" => "TEST",
				"title" => "TEST",
				"company" => "TEST",
				"classification" => "TEST",
			},
			"database" =>
			{
				"adapter" => "sqlite3",
				"database" => ":memory:"
			}
	}.to_yaml
end

def config_parser_sqlite
	{
		"report" =>
			{
				"author" => "TEST",
				"title" => "TEST",
				"company" => "TEST",
				"classification" => "TEST",
			},
			"database" =>
			{
				"adapter" => "sqlite3",
				"database" => "test_data/parser_test.db"
			}
	}.to_yaml
end

def config_mysql
	{
		"report" =>
			{
				"author" => "TEST",
				"title" => "TEST",
				"company" => "TEST",
				"classification" => "TEST",
			},
			"database" =>
			{
				"adapter" => "mysql2",
				"database" => "risu_test",
				"host" => "localhost",
				"username" => "risu",
				"password" => "risurisu"
			}
	}.to_yaml
end

def config_parser_mysql
	{
		"report" =>
			{
				"author" => "TEST",
				"title" => "TEST",
				"company" => "TEST",
				"classification" => "TEST",
			},
			"database" =>
			{
				"adapter" => "mysql2",
				"database" => "risu_parser_test",
				"host" => "localhost",
				"username" => "risu",
				"password" => "risurisu"
			}
	}.to_yaml
end

@app = nil

def setup_test_database run_fixtures=true

	begin
		File.delete("test_data/test.db") if File.exist?("test_data/test.db")
		File.delete("test_data/parser_test.db") if File.exist?("test_data/parser_test.db")

		@app = Risu::CLI::Application.new

		if ENV['RISU_TEST_ENV'] == 'sqlite'
			#puts "[*] Testing Sqlite"
			@app.load_config(config_sqlite_memory, true)
		elsif ENV['RISU_TEST_ENV'] == 'mysql'
			#puts "[*] Testing MySql"
			@app.load_config(config_mysql, true)
		else
			puts "[!] Unable to read RISU_TEST_ENV variable."
			exit
		end

		@app.db_connect

		if !ActiveRecord::Base.connection.data_sources.empty?
			@app.migrate(:down)
		end

		#@app.migrate(:up)
		#@app.migrate(:down)
		@app.migrate(:up)

		fixtures = Dir.glob(File.join('test', 'fixtures', '*.{yml,csv}'))
		fixtures.each do |fixture_file|
			ActiveRecord::FixtureSet.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
		end if run_fixtures
	rescue => e
		puts "[!] #{e.message}\n#{e.backtrace}\n\n"
	end
end

def debug_console
	@app = Risu::CLI::Application.new
	@app.consolize do

	end
	exit
end

#setup_test_database()

#debug_console

class ActiveSupport::TestCase

end
