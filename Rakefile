$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'rubygems' # not sure why...
require "nessusdb"
require 'rake'
require 'rspec/core/rake_task'
 
task :build do
  system "gem build nessusdb.gemspec"
end
 
task :release => :build do
  system "gem push nessusdb-#{NessusDB::VERSION}.gem"

	puts "Just released NessusDB v#{NessusDB::VERSION}. NessusDB is always available in RubyGems!"
end

task :clean do
	system "rm *.gem"
	system "rm *.db"
	system "rm *.cfg"
	system "rm *.pdf"	
	system "rm -rf coverage"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rcov = true
  t.rcov_opts = ['--exclude', 'specs']
end
