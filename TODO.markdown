# TODO

**Release dates are estimates, and features can be changed at any time.**

## 1.4.7
- Make sure all classification headers are upcase
- Ensure font sizes are standard in the templates
- The font in tech findings could be 1 size smaller
- Add a filtering system for lowering the rating of plugins based on config
- Compact the data in tech findings to be more printer friendly

- pcidss:directory_browsing
- pcidss:known_credentials
- pcidss:compromised_host:worm

## 1.5 (8/4/2011)
- Rework the blacklisting of plugins/hosts add to the config file
- Complete comments for all existing code
- Create rSpec tests for everything (95%+ code coverage goal)
	- Parser tests
		- Add test for new xml element
		- Add test for new host properties tag
	- Model Specs
		- Report
		- Item
		- Host
	- Application specs
		- Add a failed load_config() test
		- add test for load config from file
		- add test for non existent config file
	- Template specs
		- Assets
		- Coversheet
		- exec summary
		- executive summary(detailed)
		- finding stats
		- findings host
		- findings summary
		- findings summary with plugin id
		- host summary
		- ms patch summary
		- ms update summary
		- pci compliance
		- tech findings

##1.5.1 (10/4/2011) - Template work
- Provide more templates
	- Virtual Machine Summary
	- Fix list Report?
- Add a CVSS risk factor graph
- Update Assets templates to use this if possible plugin: http://www.nessus.org/plugins/index.php?view=single&id=54615 for extra data
- Sort Technical Findings Report by count/score
- Add template validation and more error checking
- Colorize the reports with better style
	
##1.5.2 (11/4/2011) - Parser work
- Add Schema checks to make sure the schema is compatible with the version of risu
- Create a Nessus document generator, for testing the parser

#1.5.3 (12/4/2011) - Template Work
- Implement different renderers
	- pdf
	- cvs
	- html
	- rtf
- Abstract the api for prawn to support different renders
- DSL for report creation to abstract the reports to have different output types

## 1.6 (01/4/2012)
- Remove rmagick (GRRRR!)
- Move to ruby 1.9.2 only support
- Add Parser for Nessus NBE Format
- Add Parser for Nessus NSR Format
- Add Parser for Nessus V1 of the XML Format
- Add Parser for OpenVas Output
- Add Parser for SecurityCenter Output
- Add Parser for Nexpose xml
- Add Parser for Qualys xml
- Look at moving to nokogiri for xml parsing, current benchmarks so it faster than libxml-ruby; http://nokogiri.org

## 2.0 (?)
- Rails FrontEnd to Risu
