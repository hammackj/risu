# encoding: utf-8

module NessusDB
	module CLI
		
		# 
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Application
			attr_accessor :database
			#
			#
			def initialize
				@options = {}
				@database = {}
				@report = {}
				@blacklist = {}
				
				@options[:debug] = false
			end
			
			# Creates a blank config file
			#
			def create_config(file=CONFIG_FILE)
				File.open(file, 'w+') do |f|
					f.write("report:\n")
					f.write("  author: \n")
					f.write("  title: \n")
					f.write("  company: \n")
					f.write("  classification: \n\n")
					f.write("database:\n")
					f.write("  adapter: \n")
					f.write("  host: \n")
					f.write("  port: \n")
					f.write("  database: \n")
					f.write("  username: \n")
					f.write("  password: \n")
					f.write("  timeout: \n\n")
					#TODO blacklisting
					#f.write("blacklist:\n")
					#f.write("  ips: \n")
					#f.write("  macs: \n")
					#f.write("  plugins: \n\n")
				end
			end
			
			# Loads the configuration file
			#
			def load_config(file=CONFIG_FILE)
				if File.exists?(file) == true
					begin
						yaml = YAML::load(File.open(file))
						
						@database = yaml["database"]
						@report = yaml["report"]
						
						puts @database.inspect if @options[:debug]
						
						#If no values were entered put a default value in
						@report.each do |k, v|
							if v == nil
								@report[k] = "No #{k}"
							end
						end
																		
						#@blacklist = yaml["blacklist"]
					rescue => e
						puts "[!] Error loading config! - #{ex.message}"
						exit
					end
				else
					puts "[!] Config file does not exist!"
					exit
				end
			end
			
			# Initiator for [ActiveRecord] migrations.
			#
			def migrate(direction)
				begin
					if @database["adapter"] == nil
						return false, "[!] Invalid database adapter, please check your config file"
					end
					
					ActiveRecord::Base.establish_connection(@database)
					require 'nessusdb/schema'
					Schema.migrate(direction)

					if direction == :up
						ver = Version.create
						ver.version = NessusDB::VERSION
						ver.save
					end

				rescue ActiveRecord::AdapterNotSpecified => ans
					puts "[!] Database adapter not found, please check your config file"
					puts "#{ans.message}\n #{ans.backtrace}" if @options[:debug]
					
					exit
				rescue ActiveRecord::AdapterNotFound => anf
					puts "[!] Database adapter not found, please check your config file"
					puts "#{ans.message}\n #{ans.backtrace}" if @options[:debug]
					
					exit
				rescue => e
					puts "[!] Exception! #{e.message}\n#{e.backtrace}"
					exit
				end
			end
			
			#
			#
			def db_connect
				begin
					if @database["adapter"] == nil
						puts "[!] #{@database['adapter']}" if @options[:debug]

						return false, "[!] Invalid database adapter, please check your config file"
					end

					ActiveRecord::Base.establish_connection(@database)
					
					ActiveRecord::Base.connection

				rescue ActiveRecord::AdapterNotSpecified => ans
					puts "[!] Database adapter not found, please check your config file"

					puts "#{ans.message}\n #{ans.backtrace}" if @options[:debug]

					exit
				rescue ActiveRecord::AdapterNotFound => anf
					puts "[!] Database adapter not found, please check your config file"

					puts "#{anf.message}\n #{anf.backtrace}" if @options[:debug]

					exit
				rescue => e
					puts "[!] Exception! #{e.message}\n #{e.backtrace}"
				end				
			end
			
			#
			#
			def test_connection
				begin
					
					db_connect
					
					if ActiveRecord::Base.connected? == true
						return true, "[*] Connection Test Successful"
					else
						return false, "[!] Connection Test Failed"
					end
				rescue => e
					puts "[!] Exception! #{e.message}\n #{e.backtrace}"
				end
			end
			
			def consolize &block

			  yield

				IRB.setup(nil)
				IRB.conf[:USE_READLINE] = true
				IRB.conf[:PROMPT_MODE] = :SIMPLE

				irb = IRB::Irb.new
				IRB.conf[:MAIN_CONTEXT] = irb.context

			  irb.context.evaluate("require 'irb/completion'", 0)

			  trap("SIGINT") do
			    irb.signal_handle
			  end
			  catch(:IRB_EXIT) do
			    irb.eval_input
			  end
			end
			
			# Parses all the command line
			#
			def parse_options
				begin
					opts = OptionParser.new do |opt|
						opt.banner =	"#{APP_NAME} v#{VERSION}\nJacob Hammack\nhttp://www.hammackj.com\n\n"
						opt.banner << "Usage: #{APP_NAME} [options] [files_to_parse]"					
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

						opt.on('--config-file FILE', "Loads configuration settings for the specified file. By default #{APP_NAME} loads #{CONFIG_FILE}") do |option|
							if File.exists?(option) == true
								@options[:config_file] = option
							else
								puts "[!] Specified config file does not exist. Please specify a file that exists."
								exit
							end
						end
					
						opt.on('--create-config-file [FILE]',"Creates a config file in the current directory with the specified name, Default is #{CONFIG_FILE}") do |option|
							if option == nil
								option = CONFIG_FILE
							end
							
							if File.exists?(option) == true
								puts "[!] Config file already exists; If you wish to over-write this file please delete it."
							else
								if option == nil
									create_config
								else
									create_config option
								end
								
								exit
							end
						end
					
						opt.separator('')
						opt.separator('Database Options')
					
						opt.on('--test-connection','Tests the database connection settings') do |option|
							@options[:test_connection] = option
						end
					
						opt.on('--create-tables','Creates the tables required for NessusDB') do |option|
							@options[:create_tables] = option
						end
					
						opt.on('--drop-tables','Deletes the tables and data from NessusDB') do |option|
							@options[:drop_tables] = option
						end
															
						opt.separator ''
						opt.separator 'Other Options'
					
						opt.on_tail('-v', '--version', "Shows application version information") do
							puts "#{APP_NAME} - #{VERSION}"
							exit
						end
						
						opt.on('-d','--debug','Enable Debug Mode (More verbose output)') do |option|
							@options[:debug] = true
						end
						
						opt.on('--console', 'Starts an ActiveRecord console into the configured database') do |option|
							@options[:console] = option
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
				
				if @options[:debug] == true
					puts "[*] Enabling Debug Mode"
				end
												
				if @options[:config_file] != nil
					load_config @options[:config_file]
				else
					load_config
				end
				
				db_connect
				
				if @options[:console] != nil
					consolize do
						puts NessusDB::CLI::Banner
						puts "NessusDB Console v#{VERSION}"
					end
					exit
				end
				
				if @options[:test_connection] != nil
					result = test_connection

					puts "#{result[1]}"
					exit
				end
				
				if @options[:create_tables] != nil
					migrate(:up)
					exit
				end
				
				if @options[:drop_tables] != nil
					migrate(:down)
					exit
				end
				
				if @options[:template] != nil and @options[:output_file] != nil
					if File.exists?(@options[:template]) == false
						puts "[!] Template \"#{@options[:template]}\" does not exist. Please check the filename"
						exit
					end
					
					@findings = Report
										
					@findings.author = @report["author"]
					@findings.title = @report["title"]
					@findings.company = @report["company"]
					@findings.classification = @report["classification"]
					
					template = PrawnTemplater.new(@options[:template], @findings, @options[:output_file])
					template.generate
				end
				
				ARGV.each do |file|
					begin
						parse_file file
						
					rescue NessusDB::Exceptions::InvalidDocument => id
						puts "[!] #{id.message}"
						next
					rescue ActiveRecord::StatementInvalid => si
						puts "[!] Please run nessusdb --create-tables, to create the required database schema!"
						exit
					rescue => e
						puts e.inspect
				    puts "[!] Error: #{file}"
						next
				  end
				end				
			end
			
			# Handles the parsing of a single file
			#
			def parse_file file
				begin
			    	puts "[*] Parsing #{file}..."
			    	tstart = Time.new
			
						if File.exists?(file) == false
							raise NessusDB::Exceptions::InvalidDocument, "[!] Document does not exist - #{file}"
						end

						doc = NessusDocument.new file
						if doc.valid? == true
							doc.parse
							
							puts "[*] Fixing IP Address field"
							
							doc.fix_ips
							
						else
							raise NessusDB::Exceptions::InvalidDocument, "[!] Invalid Document - #{file}" 
						end
										
			    	printf "[*] Finished parsing %s. Parse took %.02f seconds\n", file, Time.now - tstart
			  rescue Interrupt => i
			  	puts "[!] Parse cancelled!"
					exit(1)
				rescue Mysql::Error => m 
					if m.errno == 1146
						puts "[!] Error: Tables were not created. Please run nessusdb --create-tables"
						exit(1)
					end
				rescue => e
					puts "[!] #{e.message}\n #{e.backtrace.join("\n")}\n"
					exit(1)
			  end
			end
		end
	end
end
