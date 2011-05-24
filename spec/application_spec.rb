require "spec_helper"

module NessusDB
	module CLI
		describe Application do
			before(:all) do
				@app = Application.new
					
				printf "\n%s\n\n", @app.inspect						
			end
			
			after(:all) do
				Report.delete_all
				Host.delete_all
				Plugin.delete_all
				Item.delete_all
				FamilySelection.delete_all
				IndividualPluginSelection.delete_all
				PluginsPreference.delete_all
				Policy.delete_all
				Reference.delete_all
				ServerPreference.delete_all
				Version.delete_all
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
