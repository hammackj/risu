require 'simplecov'
SimpleCov.start

base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

#require 'cover_me'
require 'rspec'
require 'risu'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

@app = nil

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
	@app.migrate(:down) if File.exist?("test_data/test.db") == true
	@app.migrate(:up)
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

RSpec.configure do |config|
	config.before(:each) do 
		#Sham.reset 
	end
	
	config.after(:all) do
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
		
#		File.delete("test_data/test.db") if File.exist?("test_data/test.db")
	end
end

#CoverMe.config do |c|
  # where is your project's root:
#  c.project.root = "."

  # what files are you interested in coverage for:
#  c.file_pattern = /(lib\/.+\.rb)/i

  # where do you want the HTML generated:
  #c.html_formatter.output_path #=File.join(CoverMe.config.project.root, 'coverage') (default)

  # what do you want to happen when it finishes:
  #c.at_exit Proc.new {
  #  if CoverMe.config.formatter == CoverMe::HtmlFormatter
  #    index = File.join(CoverMe.config.html_formatter.output_path, 'index.html')
  #    if File.exists?(index)
  #     `open #{index}`
  #    end
  # end
  #}
#end
