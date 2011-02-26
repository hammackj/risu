# TODO #

**Release dates are estimates, and features can be changed at any time.**

## 1.3 (5/4/2011)

- Rework the blacklisting stuff
- Create a config file to store variables in
	- add blacklist stuff to config
	- Move all report generation options to config file
- Provide more templates
	- Virtual Machine Summary
	- Fix list Report?
- Add Schema checks to make sure the schema is compatible with the version of nessusdb
- Sort Technical Findings Report by count/score	
- Add template validation and more error checking
- Colorize the reports with better style
- DSL for report creation to abstract the reports to have different output types
- Migrate away from Choice for command line parsing
- Check to see that the xml is version 2
	- Version 1 = NessusClientData
	- Version 2 = NessusClientData_V2
- Move the YAML/Database code out of models.rb
- Update all the Migration code to use the new AR3 format
- Migrate to OptionParser Choice seems to be an abandoned gem with bugs
- Add a command line option for passing it a config file to use
- Comment all named scope from 1.2

## 1.4 (7/4/2011)
- Clean up / Bug fixes before 2.0
- Create rSpec tests for everything
- Create test fixtures
- Create a Nessus document generator, for testing the parser
- 100% code coverage for testing
- Add a irb like console to manually interact with the manuals

## 1.5 (9/4/2011)
- Look at moving to nokogiri for xml parsing, current benchmarks so it faster than libxml-ruby; http://nokogiri.org
- Move to ruby 1.9.x only support

## 2.0 (12/4/2011)
- Rails FrontEnd to NessusDB
