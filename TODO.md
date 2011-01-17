# TODO #

**Release dates are estimates, and features can be changed at any time.**

## 1.2 (2/4/2011) ##
- Move to ActiveRecord 3.0
	- Use named scope to clean up the interface to using findings
- Check to see that the xml is version 2
	- Version 1 = NessusClientData
	- Version 2 = NessusClientData_V2
- Move the YAML/Database code out of models.rb
	
## 1.3 (4/4/2011) ##

- Rework the blacklisting stuff
- Create a config file to store variables in
	- add blacklist stuff to config
	- Move all report generation options to config file
- Provide more templates
	- Virtual Machine Summary
	- Microsoft Patches Summary
	- Fix list Report?
- Add Schema checks to make sure the schema is compatible with the version of nessusdb
- Sort Technical Findings Report by count/score	
- Add template validation and more error checking
- Colorize the reports with better style
- DSL for report creation to abstract the reports to have different output types

## 1.4 (6/4/2011) ##
- Clean up / Bug fixes before 2.0
- Create rSpec tests for everything
- Create test fixtures
- Create a Nessus document generator, for testing the parser
- 100% code coverage for testing

## 1.5 (8/4/2011) ##
- Look at moving to nokogiri for xml parsing, current benchmarks so it faster than libxml-ruby; http://nokogiri.org

## 2.0 (10/4/2011) ##
- Rails FrontEnd to NessusDB
