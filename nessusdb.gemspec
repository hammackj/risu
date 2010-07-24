# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'nessusdb'

Gem::Specification.new do |s|
	s.name 									= 'nessusdb'
	s.version 							= NessusDB::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "NessusDB"
	s.description 					= "NessusDB is a nessus xml parser and reporting tool"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['nessusdb.gemspec']
	s.default_executable 		= 'nessusdb'
	s.executables 					= ['nessusdb']
	s.require_paths 				= ["lib"]
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md"]
end
