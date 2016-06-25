# Copyright (c) 2010-2016 Arxopia LLC.
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


require 'test_helper'

class ConsoleTest < ActiveSupport::TestCase

	def setup
		setup_test_database

		@app_test = Risu::CLI::Application.new
	end

	test "should create a config file for Application.create_config" do
		file_name = (1...25).map{65.+(rand(25)).chr}.join
		@app_test.create_config("/tmp/#{file_name}")
		sleep(1)
		result = File.exist?("/tmp/#{file_name}")
		File.delete("/tmp/#{file_name}") if result
		assert result == true
	end

	test "should return true for Application.test_connection" do
		assert @app_test.test_connection?[0] == true
	end

	#load_config from file
	#load_config from file that doesn't exist
	#load_config from memory

	#migrate up
	#migrate down
	
	#db_connect
	#consoleize
	#parse_options
	#run
	#process_post_processing
	#parse_file
end
