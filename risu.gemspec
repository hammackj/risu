# Copyright (c) 2010-2019 Jacob Hammack.
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

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'risu/version'

Gem::Specification.new do |s|
	s.name = Risu::APP_NAME
	s.version = Risu::VERSION
	s.homepage = Risu::HOME_PAGE
	s.authors = Risu::AUTHORS
	s.email = Risu::EMAIL

	s.summary = Risu::APP_NAME
	s.description = "#{Risu::APP_NAME} is a Nessus .nessus XML parser and report generation tool"
	s.license = "MIT"

	s.files	= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['risu.gemspec']
	s.bindir = "bin"
	s.executables = "#{Risu::APP_NAME}"
	s.require_paths = ["lib"]
	s.has_rdoc = 'yard'
	s.extra_rdoc_files = ["README.markdown", "LICENSE", "docs/NEWS.markdown"]

	s.rubyforge_project	= "#{Risu::APP_NAME}"

	s.cert_chain  = ['certs/hammackj.pem']
	s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

	s.add_runtime_dependency 'rails', '~> 5.0', '>= 5.0.1'
	s.add_runtime_dependency 'libxml-ruby', '~> 2.9', '>= 2.9.0'
	s.add_runtime_dependency 'prawn', '~> 2.1', '>= 2.1.0'
	s.add_runtime_dependency 'prawn-table', '~> 0.2', '>= 0.2.2'
	s.add_runtime_dependency 'gruff', '~> 0.7', '>= 0.7.0'
	s.add_runtime_dependency 'mysql2', '~> 0.4', '>= 0.4.6'
	s.add_runtime_dependency 'rmagick', '~> 2.15', '>= 2.15.4'
	s.add_runtime_dependency 'sqlite3', '~> 1.3', '>= 1.3.11'
	s.add_runtime_dependency 'nokogiri', '~> 1.7', '>= 1.7.0.1'

	s.add_development_dependency 'simplecov', '~> 0.15', '>= 0.15'
	s.add_development_dependency "yard", ">= 0.9.11"
	s.add_development_dependency 'minitest', '~> 5.0', '>= 5.9'
	s.add_development_dependency 'test-unit', '~> 3.2', ">= 3.2.4"
end
