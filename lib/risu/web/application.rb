module Risu
	module Web
		class Application < Sinatra::Base
			set :port, 8969
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
			
			get '/plugins' do
				haml :plugins
			end
		end
	end
end
