# Copyright (c) 2010-2015 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

# Disable Coverage always on
#require 'simplecov'
#SimpleCov.start

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

def setup_test_database

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

		if !ActiveRecord::Base.connection.tables.empty?
			@app.migrate(:down)
		end

		#@app.migrate(:up)
    #@app.migrate(:down)
    @app.migrate(:up)

		fixtures = Dir.glob(File.join('test', 'fixtures', '*.{yml,csv}'))
		fixtures.each do |fixture_file|
			ActiveRecord::FixtureSet.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
		end
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
