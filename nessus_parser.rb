#!/usr/bin/env ruby

#Jacob Hammack
#jacob.hammack@hammackj.com
#http://www.hammackj.com

require 'rubygems'
require 'libxml'
require 'nessus_db'
require 'nessus_db_model'
require 'nessus_listener'

#add debug mode for output

#pass each .nessus file to be pasrsed into the database on the command line
#each will be parsed into the database as seperate policy/reports

puts "NessusDB Parser v1.0\nJacob Hammack\nhttp://hammackj.com\n\n"

ARGV.each { |arg| 
  begin
    	puts "[*] Parsing #{arg}..."
    	tstart = Time.new
    	parser = LibXML::XML::SaxParser.file arg
    	parser.callbacks = NessusSaxListener.new
    	parser.parse
    	printf "[*] Finished parsing %s. Parse took %.02f seconds\n", arg, Time.now - tstart

  rescue Interrupt => i
  	puts "[!] Parse cancelled!"
  rescue => e
    puts "[!] Error: #{arg}"
  	#puts "An error occurred: #{e}"
  	#puts "Backtrace: #{e.backtrace.join("\n")}"
    next
  end  
}
