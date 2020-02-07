# Copyright (c) 2010-2020 Jacob Hammack.
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


$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "risu"
require 'rake'
require 'rake/testtask'
require 'digest/sha2'

task :build do
	system "gem build #{Risu::APP_NAME}.gemspec"
end

task :checksum do
	built_gem_path = "#{Risu::APP_NAME}-#{Risu::VERSION}.gem"
	checksum = Digest::SHA512.new.hexdigest(File.read(built_gem_path))
	checksum_path = "checksum/#{Risu::APP_NAME}-#{Risu::VERSION}.gem.sha512"
	File.open(checksum_path, 'w' ) {|f| f.write(checksum) }
	system "git add #{checksum_path}"
	system "git commit #{checksum_path} -m 'Added #{Risu::APP_NAME}-#{Risu::VERSION}.gem checksum'"
end

task :tag_and_bag do
	system "git tag -a v#{Risu::VERSION} -m 'version #{Risu::VERSION}'"
	system "git push --tags"
	system "git checkout master"
	system "git merge dev"
	system "git push"
end

task :push do
	system "gem push #{Risu::APP_NAME}-#{Risu::VERSION}.gem"
end

task :tweet do
	puts "Just released #{Risu::APP_NAME} v#{Risu::VERSION}. #{Risu::APP_NAME} is an Nessus XML parser/database/report generator. More information at #{Risu::HOME_PAGE}"
end

task :release => [:build, :checksum, :tag_and_bag, :push, :tweet] do
end

task :clean do
	system "rm *.gem"
	system "rm *.db"
	system "rm *.cfg"
	system "rm *.pdf"
	system "rm -rf coverage"
end

task :test_sqlite do
	ENV['RISU_TEST_ENV'] = "sqlite"
	Rake::Task['run_tests'].invoke
end

task :test_mysql do
	ENV['RISU_TEST_ENV'] = "mysql"
	Rake::Task['run_tests'].invoke
end

Rake::TestTask.new("run_tests") do |t|
	t.libs << "test"
	t.pattern = 'test/**/*_test.rb'
	t.verbose = true
end

task :merge do
	system "git checkout master"
	system "git merge #{Risu::VERSION}"
	system "git push"
end

task :default => [:test_sqlite]
