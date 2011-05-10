# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'rubygems'
require 'nessusdb'

Gem::Specification.new do |s|
	s.name = "#{NessusDB::APP_NAME}"
	s.version = NessusDB::VERSION
	s.homepage = "http://www.hammackj.com/"
	s.summary = "#{NessusDB::APP_NAME}"
	s.description = "#{NessusDB::APP_NAME} is a Nessus .nessus xml parser and report generation tool"
	s.license = "BSD"

	s.author = "Jacob Hammack"
	s.email = "jacob.hammack@hammackj.com"

	s.files	= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['nessusdb.gemspec']
	s.bindir = "bin"
	s.default_executable = "#{NessusDB::APP_NAME}"
	s.executables = "#{NessusDB::APP_NAME}"
	s.require_paths = ["lib"]
	s.has_rdoc = 'yard'
	s.extra_rdoc_files = ["README.markdown", "LICENSE", "NEWS.markdown", "TODO.markdown", "KNOWNISSUES.markdown"]

	s.required_rubygems_version = ">= 1.6.0"
	s.rubyforge_project	= "#{NessusDB::APP_NAME}"

	s.add_development_dependency("rspec", ">= 2.5.0")
	s.add_development_dependency("rcov", ">= 0.9.9")
	s.add_development_dependency("yard", ">= 0.6.4")
	s.add_development_dependency("machinist", ">= 1.0.6")
	s.add_development_dependency("sham", ">= 0.4.0")
	s.add_development_dependency("faker", ">= 0.9.5")

	s.add_dependency('rails', '>= 3.0.7')
	s.add_dependency('libxml-ruby', '>= 1.1.4')
	s.add_dependency('prawn', '>= 0.11.1')
	s.add_dependency('gruff', '>= 0.3.6')
	s.add_dependency('mysql', '>= 2.8.1')
	s.add_dependency('rmagick', ">= 2.13.1")
end
