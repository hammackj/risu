require 'test_helper'
 
class ConsoleTest < ActiveSupport::TestCase	
	
	def setup
		@app = Risu::CLI::Application.new
	end
	
	test "should create a config file for Application.create_config" do				
		file_name = (1...25).map{65.+(rand(25)).chr}.join
		@app.create_config("/tmp/#{file_name}")
		sleep(1)
		result = File.exist?("/tmp/#{file_name}")
		File.delete("/tmp/#{file_name}") if result
		assert result == true
	end

	test "should return true for Application.test_connection" do
		assert @app.test_connection?[0] == true
	end
end
