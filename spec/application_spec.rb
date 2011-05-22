require "spec_helper"

module NessusDB
	module CLI
		describe Application do
			before(:all) do
				@app = Application.new
					
				printf "%s\n\n", @app.inspect						
			end
			
			it "should create a config file for Application.create_config" do				
				file_name = (1...25).map{65.+(rand(25)).chr}.join
				@app.create_config("/tmp/#{file_name}")
				sleep(1)
				result = File.exist?("/tmp/#{file_name}")
				File.delete("/tmp/#{file_name}") if result
				result.should == true
			end
			
			it "should return true for Application.test_connection" do
				@app.test_connection?[0].should == true
			end
			
			#parser_file
			#run
			#parse_options
			#consolize
			
		end
	end
end
