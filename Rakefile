$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "nessusdb"
 
task :build do
  system "gem build nessusdb.gemspec"
end
 
task :release => :build do
  system "gem push nessusdb-#{NessusDB::VERSION}.gem"
end

task :clean do
	system "rm *.gem"
end
