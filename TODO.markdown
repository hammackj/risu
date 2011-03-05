# TODO

**Release dates are estimates, and features can be changed at any time.**

## 1.4 (5/4/2011)
- Clean up / Bug fixes before 2.0
- Create rSpec tests for everything
- Create test fixtures
- Comment all named scope from 1.2
- Create a Nessus document generator, for testing the parser
- 100% code coverage for testing
- Add a irb like console to manually interact with the manuals
- Rework the blacklisting stuff
	- Add blacklisting to config
- Add Schema checks to make sure the schema is compatible with the version of nessusdb
	- Check to see that the xml is version 2
		- Version 1 = NessusClientData
		- Version 2 = NessusClientData_V2	

## 1.5 (7/4/2011)
- Look at moving to nokogiri for xml parsing, current benchmarks so it faster than libxml-ruby; http://nokogiri.org
- Move to ruby 1.9.x only support
- Add Parser for NBE Format
- Add Parser for NSR Format
- Add Parser for V1 of the XML Format
- Add Parser for OpenVas Output
- Add Parser for SecurityCenter Output
- DSL for report creation to abstract the reports to have different output types
- Provide more templates
	- Virtual Machine Summary
	- Fix list Report?
- Add template validation and more error checking
- Colorize the reports with better style
- Sort Technical Findings Report by count/score	

## 2.0 (12/4/2011)
- Rails FrontEnd to NessusDB
