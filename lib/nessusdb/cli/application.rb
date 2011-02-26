# encoding: utf-8

module NessusDB
	module CLI
		
		# 
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Application
			
			#
			#
			def initialize
				@options = {}
			end
			
			# Creates a blank config file
			#
			def create_config(file=CONFIG_FILE)
				File.open(file, 'w+') do |f|
					f.write("report:\n")
					f.write("  author: \n")
					f.write("  title: \n")
					f.write("  company: \n")
					f.write("  classification: \n")
					f.write("database:\n")
					f.write("  adapter: \n")
					f.write("  host: \n")
					f.write("  port: \n")
					f.write("  database: \n")
					f.write("  username: \n")
					f.write("  password: \n")
					f.write("  timeout: \n\n")
				end
			end
			
			# Parses all the command line
			#
			def parse_options
				begin
					opts = OptionParser.new do |opt|
						opt.banner =	"#{APP_NAME} v#{VERSION}\nJacob Hammack\nhttp://www.hammackj.com\n\n"
						opt.banner << "Usage: #{APP_NAME} <options>"
						opt.separator('')
						opt.separator("Parsing Options")
					
						opt.on('-f', '--input-files *FILES', 'Nessus result files to be parsed') do |option|
						end
					
						opt.separator('')
						opt.separator("Reporting Options")

						opt.on('-t','--template FILE','The filename of the template to use') do |option|
							@options[:template] = option
						end					
					
						opt.on('-o','--output-file FILE','The filename to output the generated report to') do |option|
							@options[:output_file] = option
						end

						opt.separator('')
						opt.separator('Configuration Options')

						opt.on('--config-file FILE','Loads configuration settings for the specified file. Default is ./nessusdb') do |option|
						end
					
						opt.on('--create-config-file FILE','Creates a config file in the current directory with the specified name') do |option|
						end
					
						opt.separator('')
						opt.separator('Database Options')
					
						opt.on('--test-connection','Tests the database connection settings') do |option|
						end
					
						opt.on('--create-tables','Creates the tables required for NessusDB') do |option|
						end
					
						opt.on('--drop-tables','Deletes the tables and data from NessusDB') do |option|
						end
															
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
				
					if ARGV.length != 0
				    opts.parse!
				  else
				    puts opts.to_s + "\n"
					  exit
					end
				rescue OptionParser::MissingArgument => m
					puts opts.to_s + "\n"
					exit
				rescue OptionParser::InvalidOption => i
					puts opts.to_s + "\n"
					exit
				end
			end
			
			# 
			#
			def run
				parse_options
				
				
			end
			
		end
	end
end
