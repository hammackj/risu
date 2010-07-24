base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'nessusdb'

Gem::Specification.new do |s|
	s.name = %q{librex}
	s.version = "0.0.1"
	s.has_rdoc = 'yard'
	s.required_ruby_version = ">= 1.8.7"
	s.platform = "ruby"
	s.default_executable = 'nessusdb'
	s.executables = [ 'nessusdb' ]
	s.require_paths = ["lib"]
	s.required_rubygems_version = ">= 0"
	s.author = "Jacob Hammack"
	s.email = ["jacob.hammack@hammackj.com"]
	s.extra_rdoc_files = ["README.md"]
	s.summary = %q{Nessus}
	s.homepage = %q{http://www.hammackj.com/}
	s.description = %q{NessusDB is a nessus xml parser and reporting tool}
	s.files = Dir['[A-Z]*'] + Dir['lib/**/*']
end

