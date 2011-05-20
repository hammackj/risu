base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))


require 'rspec'
require 'nessusdb'
require 'cover_me'
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
	@app = NessusDB::CLI::Application.new
	@app.load_config(config, true)
	@app.db_connect
	@app.migrate(:down)
	@app.migrate(:up)
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

RSpec.configure do |config|
	config.before(:each) do 
		Sham.reset 
	end
end

CoverMe.config do |c|
  # where is your project's root:
  c.project.root = "."

  # what files are you interested in coverage for:
  #c.file_pattern /(#{CoverMe.config.project.root}\/lib\/.+\.rb)/i

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
end
