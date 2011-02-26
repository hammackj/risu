# encoding: utf-8

module NessusDB
	module CLI
		
		#
		#
		class Application
			
			#
			#
			def initialize
				@options = {}
			end
			
			#
			#
			def create_config 
				File.open(CONFIG_FILE, 'w+') do |f|
					f.write("report:  \n")
					f.write("  author:  \n")
					f.write("  title:  \n")
					f.write("  company:  \n")
					f.write("  classification:  \n")
					f.write("  date:  \n\n")
					f.write("database:  \n")
					f.write("  adapter:  \n")
					f.write("  host:  \n")
					f.write("  port:  \n")
					f.write("  database:  \n")
					f.write("  username:  \n")
					f.write("  password:  \n")
					f.write("  timeout:  \n\n")
				end
			end
			
			#
			#
			def parse_options			
				opts = OptionParser.new do |opt|
					opt.banner =	"#{APP_NAME} v#{VERSION}\nJacob Hammack\nhttp://www.hammackj.com\n\n"
					opt.banner << "Usage: #{APP_NAME} <options>"
					opt.separator('')
					opt.separator("Parsing Options")
					
					
					opt.separator('')
					opt.separator("Reporting Options")

					opt.on('-t','--template FILE','The filename of the template to use') do |option|
					end					
					
					opt.on('-o','--output-file FILE','The filename to output the generated report to') do |option|
					end
					
					
					opt.separator('')
					opt.separator('Database Options')
					
					#--create-tables
					#--drop-tables
					#--test-connection
					
					
					opt.separator ''
					opt.separator 'Other Options'
					
					opt.on_tail('-v', '--version', "Shows application version information") do
						puts "#{APP_NAME} - #{VERSION}"
						exit
					end

					opt.on_tail("-?", "--help", "Show this message") do
						puts opt.to_s + "\n"
						exit
					end
					
				end
			end
			
			#
			#
			def run(args)
			end
			
		end
	end
end
