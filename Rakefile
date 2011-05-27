$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'rubygems' # not sure why...
require "risu"
require 'rake'
require 'rspec/core/rake_task'

task :build do
  system "gem build #{Risu::APP_NAME}.gemspec"
end

task :release => :build do
  system "gem push #{Risu::APP_NAME}-#{Risu::VERSION}.gem"

	puts "Just released #{Risu::APP_NAME} v#{Risu::VERSION}. #{Risu::APP_NAME} is always available in RubyGems!"
end

task :clean do
	system "rm *.gem"
	system "rm *.db"
	system "rm *.cfg"
	system "rm *.pdf"
	system "rm -rf coverage"
end

task :report do
  require 'cover_me'
  CoverMe.complete!
end

RSpec::Core::RakeTask.new(:spec) do |t|
	Rake::Task['report'].invoke
end
