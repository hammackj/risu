# Copyright (c) 2010-2025 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	module CLI

		# Application class for Risu
		class Application
			include Risu::Base
			attr_accessor :database

			# Initializes a CLI Application
			def initialize
				@options = {}
				@database = {}
				@report = {}
				@blacklist = {}

				@options[:debug] = false
				@options[:list_templates] = false
				@options[:post_process] = false

				@template_manager = Risu::Base::TemplateManager.new "risu/templates"
				@postprocess_manager = Risu::Base::PostProcessManager.new "risu/parsers/nessus/postprocess"
			end

			# Creates a blank configuration file
			#
			# @TODO does this need exception handling
			#
			# @param file Path to configuration file
			def create_config(file=CONFIG_FILE)
				File.open(file, 'w+') do |f|
					f.write("report:\n")
					f.write("  author: \n")
					f.write("  title: \n")
					f.write("  company: \n")
					f.write("  network: \n")
					f.write("  owner: \n")
					f.write("  location: \n")
					f.write("  classification: \n\n")
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

			# Loads the configuration file
			#
			# @param file Path to configuration file
			# @param in_memory_config [Boolean] If the configuration is in memory
			def load_config file=CONFIG_FILE, in_memory_config=false
				if File.exist?(file) == true or in_memory_config == true
					begin
						if in_memory_config
							yaml = YAML::load(file)
						else
							yaml = YAML::load(File.open(file))
						end

						@database = yaml["database"]
						@report = yaml["report"]

						puts @database.inspect if @options[:debug]

						#If no values were entered put a default value in
						@report.each do |k, v|
							if v == nil
								@report[k] = "No #{k}"
							end
						end
					rescue => e
						puts "[!] Error loading configuration! - #{e.message}"
						exit
					end
				else
					puts "[!] Configuration file does not exist!"
					exit
				end
			end

			# Initiator for [ActiveRecord] migrations.
			#
			# @param direction [Symbol] :up or :down
			def migrate direction
				begin
					if @database["adapter"] == nil
						return false, "[!] Invalid database adapter, please check your configuration file"
					end

					ActiveRecord::Base.establish_connection(@database)
					require 'risu/base/schema'
					Schema.migrate(direction)

					if direction == :up
						puts "[*] Creating tables" if @options[:debug]
						ver = Version.create
						ver.version = Risu::VERSION
						ver.save
					end

					puts "[*] Dropping tables" if direction == :down

				#@TODO temp hack, fix this by checking the schema on :up or :down for exiting data
				rescue SQLite3::SQLException => sqlitex
					puts "#{sqlitex.message}\n #{sqlitex.backtrace}" if @options[:debug]
					continue
				rescue ActiveRecord::AdapterNotSpecified => ans
					puts "[!] Database adapter not found, please check your configuration file"
					puts "#{ans.message}\n #{ans.backtrace}" if @options[:debug]
					exit
				rescue ActiveRecord::AdapterNotFound => anf
					puts "[!] Database adapter not found, please check your configuration file"
					puts "#{anf.message}\n #{anf.backtrace}" if @options[:debug]
					exit
				rescue => e
					puts "[!] Exception! #{e.message}"
					exit
				end
			end

			# Establishes an [ActiveRecord::Base] database connection
			# @TODO better comments
			def db_connect
				begin
					if @database["adapter"] == nil
						puts "[!] #{@database['adapter']}" if @options[:debug]

						return false, "[!] Invalid database adapter, please check your configuration file"
					end

					ActiveRecord::Base.establish_connection(@database)
					connection = ActiveRecord::Base.connection

					if @database["adapter"] =~ /sqlite/
						connection.execute("PRAGMA default_synchronous=OFF;")
						connection.execute("PRAGMA synchronous=OFF;")
						connection.execute("PRAGMA journal_mode=OFF;")
						#connection.execute("PRAGMA wal_autocheckpoint=10000;")
					end

					connection
				rescue ActiveRecord::AdapterNotSpecified => ans
					puts "[!] Database adapter not found, please check your configuration file"
					puts "#{ans.message}\n #{ans.backtrace}" if @options[:debug]
					exit
				rescue ActiveRecord::AdapterNotFound => anf
					puts "[!] Database adapter not found, please check your configuration file"
					puts "#{anf.message}\n #{anf.backtrace}" if @options[:debug]
					exit
				rescue ActiveRecord::NoDatabaseError => nde
					puts "[!] Database not found. Please check your configuration file"
					puts "#{nde.message}\n #{nde.backtrace}" if @options[:debug]
					exit
				#rescue Mysql2::Error => mse
				#	puts "[!] Unable to connect to MySQL. \"#{mse.message}\" Please check your configuration file"
				#	puts "#{mse.message}\n #{mse.backtrace}" if @options[:debug]
				#	exit
				rescue SQLite3::Exception => se
					puts "[!] Unable to open database. Please check your configuration file"
					puts "#{se.message}\n #{se.backtrace}" if @options[:debug]
					exit
				rescue => e
					puts "[!] Exception (#{e.class})! #{e.message}\n #{e.backtrace}"
				end
			end

			# Tests the database connection
			#
			# @return [Boolean] True on successful, False on failure
			def test_connection?
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

			# Starts a console and executes anything in a block sent to it
			#
			# @param block Code block to transfer control
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

			# Parses all the command line options
			def parse_options
				begin
					opts = OptionParser.new do |opt|
						opt.banner =	"#{APP_NAME} v#{VERSION}\nJacob Hammack\nhttp://www.hammackj.com\n\n"
						opt.banner << "Usage: #{APP_NAME} [options] [files_to_parse]"
						opt.separator('')
						opt.separator("Parse Options")

						opt.on('--post-process', 'Preform post processing on the data') do |option|
							@options[:post_process] = option
						end

						opt.separator('')
						opt.separator("Reporting Options")

						opt.on('-t', '--template FILE', 'The filename of the template to use') do |option|
							@options[:template] = option
						end

						opt.on('-o', '--output-file FILE', 'The filename to output the generated report to') do |option|
							@options[:output_file] = option
						end

						opt.on('--list-templates', "Lists all of the templates available to #{APP_NAME}") do |option|
							@options[:list_templates] = option
						end

						opt.on('--list-post-process', "Lists all of the post processors available to #{APP_NAME}") do |option|
							@options[:list_postprocesses] = option
						end

						# @TODO THIS NO WORK
						#opt.on('--create-template NAME', "Creates a template file in the ~/.risu/templates directory") do |option|
						#	if File.exists?(option) == true
						#		puts "[!] Template "
						#	end
						#end

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

						opt.on('--create-config-file [FILE]',"Creates a configuration file in the current directory with the specified name, Default is #{CONFIG_FILE}") do |option|
							if option == nil
								option = CONFIG_FILE
							end

							if File.exists?(option) == true
								puts "[!] Configuration file already exists; If you wish to over-write this file please delete it."
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

						opt.on('--create-tables',"Creates the tables required for #{APP_NAME}") do |option|
							@options[:create_tables] = option
						end

						opt.on('--drop-tables', "Deletes the tables and data from #{APP_NAME}") do |option|
							@options[:drop_tables] = option
						end

						opt.separator ''
						opt.separator 'Other Options'

						opt.on_tail('-v', '--version', "Shows application version information") do
							puts "#{APP_NAME}: #{VERSION}\nRuby Version: #{RUBY_VERSION}\nRubygems Version: #{Gem::VERSION}"
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
				rescue OptionParser::AmbiguousOption
					puts opts.to_s + "\n"
					exit
				rescue OptionParser::MissingArgument
					puts opts.to_s + "\n"
					exit
				rescue OptionParser::InvalidOption
					puts opts.to_s + "\n"
					exit
				end
			end

			# Main Application loop, handles all of the command line arguments and
			#parsing of files on the command line
			def run
				parse_options

				if @options[:list_templates]
					@template_manager.display_templates
					exit
				end

				if @options[:list_postprocesses]
					@postprocess_manager.display_postprocesses
					exit
				end

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
						puts Risu::CLI::Banner
						puts "#{APP_NAME} Console v#{VERSION}"
					end
					exit
				end

				if @options[:test_connection] != nil
					puts "#{test_connection?[1]}"
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
					if @template_manager.find_template_by_name(@options[:template]) == nil
						puts "[!] Template \"#{@options[:template]}\" does not exist. Please check the name"
						exit
					end

					@findings = Report

					@findings.author = @report["author"]
					@findings.title = @report["title"]
					@findings.company = @report["company"]
					@findings.classification = @report["classification"]
					@findings.network = @report["network"]
					@findings.owner = @report["owner"]
					@findings.location = @report["location"]
					@findings.stakeholders = @report["stakeholders"]
					@findings.reviewers = @report["reviewers"]
					@findings.extra = @report

					template = Templater.new(@options[:template], @findings, @options[:output_file], @template_manager)
					template.generate
				end

				ARGV.each do |file|
					begin
						parse_file file

					rescue Risu::Exceptions::InvalidDocument => id
						puts "[!] #{id.message}"
						next
					rescue ActiveRecord::StatementInvalid
						puts "[!] Please run #{Risu::APP_NAME} --create-tables, to create the required database schema!"
						exit
					rescue => e
						puts e.inspect
						puts "[!] Error: #{file}"
						next
					end
				end

				process_post_processing
			end

			# Preforms PostProcessing on the dataset
			#
			def process_post_processing
				if @options[:post_process] == true

					puts "[*] Preforming Post Processing"

					@postprocess_manager.registered_postprocesses.each do |p|
						#p = post.new
						puts "\t[*] Running #{p.info[:description]}"
						p.run()
					end
				end
			end

			# Handles the parsing of a single file
			#
			# @param file The to parse
			def parse_file file
				begin
					puts "[*] Parsing #{file}..."
					tstart = Time.new

					if File.exist?(file) == false
						raise Risu::Exceptions::InvalidDocument, "[!] Document does not exist - #{file}"
					end

					nessus_doc = Risu::Parsers::Nessus::NessusDocument.new file
					nexpose_doc = Risu::Parsers::Nexpose::NexposeDocument.new file

					if nessus_doc.valid? == true
						nessus_doc.parse

						puts "[*] Fixing IP Address field"
						nessus_doc.fix_ips
					elsif nexpose_doc.valid? == true
						nexpose_doc.parse

						puts "[*] Fixing IP Address field"
						nexpose_doc.fix_ips
					else
						raise Risu::Exceptions::InvalidDocument, "[!] Invalid Document - #{file}"
					end

					printf "[*] Finished parsing %s. Parse took %.02f seconds\n", file, Time.now - tstart
					puts nessus_doc.new_tags.uniq.join("\n") #@TODO add a verbose check
				rescue Interrupt
					puts "[!] Parse canceled!"
					exit(1)
				#rescue Mysql2::Error => m
				#	if m.errno == 1146
				#		puts "[!] Error: Tables were not created. Please run #{Risu::APP_NAME} --create-tables"
				#		exit(1)
				#	end
				rescue => e
					puts "[!] #{e.message}\n #{e.backtrace.join("\n")}\n"
					exit(1)
				end
			end
		end
	end
end
