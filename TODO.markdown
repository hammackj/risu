# TODO

**Release dates are estimates, and features can be changed at any time.**

## 1.5 (??)
- Nessus 5.0 compatible

##1.5.1 (??) -
- clean up tests move to fixtures
- hash all template results to make sure templates are being created correctly

- clean up old plugins, some are nasty
- Fix list report
	- by host ordered by risk
		- vulnerability name
		- first cve
		- Host
		- vuln name     |   cve
		- vuln name     |   cve	
- add findings by host report 
- ms_wsus_findings: Takes the plugin_output from plugin ####pluginid### 
- windows policy report
- stig pie graph for cat 1 / 2 /3
- move all pci related host properties to their own table
- stig detailed report
- migration error handling
- bug report info collection option
- template for rhs plugins
- template for wsus plugins
- Complete comments for all existing code
- Create tests for everything (95%+ code coverage goal)
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
- CentOS 6 tutorial
- Ubuntu latest tutorial
- Implement the ability to filter data out of the report
	- Filter on
		- Host Mac Address
		- Host IP
		- Plugin ID
- Ensure font sizes are standard in the templates
- The font in tech findings could be 1 size smaller
- Add a filtering system for lowering the rating of plugins based on config
- Compact the data in tech findings to be more printer friendly
- Add tests for Patch model
- Plugin reference accessors with auto text
- finding summary coversheet looks odd
- unsupported OS template
- unsupported vs supported os graph
- add list of unsupported os ip's accessor
- detailed findings should be combined to save paper on printing
- add more detailed pci templates
- Provide more templates
	- Virtual Machine Summary
	- Fix list Report?
- Add a CVSS risk factor graph
- Update Assets templates to use this if possible plugin: http://www.nessus.org/plugins/index.php?view=single&id=54615 for extra data
- Sort Technical Findings Report by count/score
- Add template validation and more error checking
- Colorize the reports with better style
- Added TOC/Index to the technical findings report, issue 15
- Category I
	- Vulnerabilities that allow an attacker immediate access into amachine, allow superuser access, or bypass a firewall.These can lead to the immediate compromise of the web serverallowing the attacker to take complete control of the web serverand associated operating system, which can then be used as aresource to control other systems in your network.Some examples would be the running of unsupported software,anonymous access to privledge accounts, and the presence of sample applications installed on the web server.
- Category II
	- Vulnerabilities aide the ability of an attacker to gain access into amachine, compromise sensitive data, or bypass a firewall.These will lead to the eventual compromise of the web serverallowing the attacker to manipulate the content or server settingson the web server and have access to other systems in yournetwork.Some examples would be trust relationships with unauthorizedseparate enclaves, non compliance with appropriate hostoperating system security controls, and the non compliance withthe IAVM program.
- Category III
	- Vulnerabilities that impact the security posture of the system andif configured, will improve the overall security of asset.These could result in the degradation of service, compromise of information, and in some cases lead to unauthorized access to thesystem.Some examples would be untrained staff, development tools on aproduction environment, and the uncontrolled release of information to the web server.

	
##1.5.2 (??) - Parser work
- Add Schema checks to make sure the schema is compatible with the version of risu
- Create a Nessus document generator, for testing the parser

#1.5.3 (??) - Template Work
- Implement different renderers
	- pdf
	- cvs
	- html
	- rtf
- Abstract the api for prawn to support different renders
- DSL for report creation to abstract the reports to have different output types

## 1.6 (??)
- Remove rmagick (GRRRR!)
- Move to ruby 1.9.3 only support
- Add Parser for Nessus NBE Format
- Add Parser for Nessus NSR Format
- Add Parser for Nessus V1 of the XML Format
- Add Parser for OpenVas Output
- Add Parser for SecurityCenter Output
- Add Parser for Nexpose xml
- Add Parser for Qualys xml
- Look at moving to nokogiri for xml parsing; http://nokogiri.org
- Easier way to select the Scan to generate reports from

## 2.0 (??)
- Rails FrontEnd to Risu
