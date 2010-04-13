#!/usr/bin/env ruby 

require 'rubygems'  
require 'active_record'  
require 'yaml'
require 'optparse' 

require 'db/schema.rb'

$stdout.sync = true


def migrate(direction)
	ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))

	if File.exists?("database.yml") == false
		puts "Could not find database.yml!"
		exit
	end
	
	Schema.migrate(direction)
end

@opt = OptionParser.new { |opt|
	opt.banner =  "DB Migration Tool"
	opt.banner << "usage: #{$0} [command] <options> [targets]"
	opt.separator('')
	opt.separator('Commands:')

	opt.on('-c', '--create-tables', 'Creates tables.') { 
		migrate(:up)
		puts "[*] Successfully created tables."
		exit
	}

	opt.on('-d', '--delete-tables', 'Deletes tables.') { 
		migrate(:down)
		puts "[*] Successfully deleted tables."
		exit
	}
     
	opt.on('-f', '--create-config-file', 'Creates an empty database.yml file to be edited.') { 
		if File.exists?("database.yml") == false
			File.open("database.yml", 'w+') { |f| 
				f.write("adapter: \nhost: \nport: \ndatabase: \nusername: \npassword: \ntimeout: \n") 
			}
          
				puts "[*] An empty database.yml has been created. Please edit and fill in the correct values."
				exit
		else
			puts "[!] Cowardly refusing to overwrite existing database.yml. Please delete it first and then try to recreate it."
		end
	}    

	opt.on_tail("-h", "--help", "Show this message") { |help|
		puts opt.to_s + "\n"
		exit
	}
}
      
if ARGV.length != 0 
	@opt.parse!
else
	puts @opt.to_s + "\n"
	exit
end    
