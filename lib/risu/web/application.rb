#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '/../lib'))

require 'rubygems'
require 'risu'
require 'sinatra'

config = 
"report:
  author: TEST
  title: TEST
  company: TEST
  classification: TEST

database:
  adapter: sqlite3
  database: test.db"

begin
	@app = Risu::CLI::Application.new
	@app.load_config(config, true)
	@app.db_connect
rescue => e
	puts "[!] #{e.message}\n#{e.backtrace}\n\n"
end

set :haml, :format => :html5

get '/' do	
	haml :index
end

get '/hosts' do
	haml :hosts
end

get '/host/:id' do
	@host = Host.find(params[:id])
	haml :host, :layout => :layout
end

get '/reports' do
	haml :reports
end

get '/report/:id' do
	@report = Host.find(params[:id])
	haml :report
end

get '/items' do
	haml :items
end

