# TODO

**Release dates and roadmap are estimates, and features can be changed at any time.**

#**Bugs**
- Notable reports show an incorrect number, might be fixed already.

#Roadmap

##1.5.1 (Aug, 2012) -
- Fix SQLite3 issue where it has to wait for the OS to write every insert.(MAJOR SPEED ISSUE)
- Simple Sinatra based database viewer

##1.5.2 (May, 1 2012) - Filtering Magic
- add high/med/low_risks_by_host functions Item Model
- Do all the @todo / @fix  items!
- Add a filtering system for lowering the rating of plugins based on config
	- Implement the ability to filter data out of the report
		- Filter on
			- Host Mac Address
			- Host IP
			- Plugin ID
			- Host id
		- Arbitrary number of filters
		- Add filtered api, to use the filters
			- Option 1: eg critical_risks_filtered()
			- Option 2: eg critical_risks(:filtered => true)
- Nexpose Detailed xml parsing
- Nexpose Simple xml parsing
- list scan in database via cli
- generate report based on scan_id/report id
- finding summary: crit/high spacing
- page kerning?
- 100% Code coverage for all unit testing

#1.5.3 (June 1, 2012) - Rendering
- Ruby 1.8.x will no longer be officially supported.
- Official support for ruby 1.9.3+ only (Due to rails v4)
- Look at moving to nokogiri for xml parsing; http://nokogiri.org if its faster
- Implement different renderers
	- pdf
	- cvs
	- html
	- rtf
	- openoffice xml
- Abstract the api for prawn to support different renders
- DSL for report creation to abstract the reports to have different output types
- Language abstraction for text generation

## 1.6 (??) - Additional Parsers
- Remove rmagick (GRRRR!)
- Add Parser for Nessus NBE Format
- Add Parser for Nessus NSR Format
- Add Parser for Nessus V1 of the XML Format
- Add Parser for OpenVas Output
- Add Parser for SecurityCenter Output
- Add Parser for Nexpose xml
- Add Parser for Qualys xml
- Easier way to select the Scan to generate reports from

## 2.0 (??)
-

##List of things TODO
###Core
- In the -v, --version option display the version of ruby and the version of rubygems
- migration error handling
  - catch mysql/sqlite/postgres errors during up/down
- bug report info collection option
- Complete comments for all existing code
- create an api determining vulnerability % based on the network
- create an api for creating a vulnerability score per host to show a risk %
- More text generation from graphs
- pdf bookmarks
- add postgres and test it
- rewrite the application class

###Parsers
- move all pci related host properties to their own table
- Nexpose SimpleXML parser
- Create a Nessus document generator, for testing the parser
- Add Schema checks to make sure the schema is compatible with the version of risu

###Models
- Plugin reference accessors with auto text

###Graphs
- most common os graph
- vulns by service bar chart
- most common services graph
- most common vuln category
- # hosts by severity
- stig bar graph for cat 1 / 2 /3
- unsupported vs supported os graph
- Add a CVSS risk factor graph
- security risk graph

###Reports / Templates
- SANS TOP XX report
- add (hostname) to reports
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
- clean up old templates, some are nasty
- stig detailed report
	-http://www.scribd.com/doc/3752867/6/Vulnerability-Severity-Code-Definitions
	- Category I
		- Vulnerabilities that allow an attacker immediate access into a machine, allow superuser access, or bypass a firewall.These can lead to the immediate compromise of the web serverallowing the attacker to take complete control of the web serverand associated operating system, which can then be used as aresource to control other systems in your network.Some examples would be the running of unsupported software,anonymous access to privledge accounts, and the presence of sample applications installed on the web server.
	- Category II
		- Vulnerabilities aide the ability of an attacker to gain access into a machine, compromise sensitive data, or bypass a firewall.These will lead to the eventual compromise of the web serverallowing the attacker to manipulate the content or server settingson the web server and have access to other systems in yournetwork.Some examples would be trust relationships with unauthorizedseparate enclaves, non compliance with appropriate hostoperating system security controls, and the non compliance withthe IAVM program.
	- Category III
		- Vulnerabilities that impact the security posture of the system and if configured, will improve the overall security of asset.These could result in the degradation of service, compromise of information, and in some cases lead to unauthorized access to thesystem.Some examples would be untrained staff, development tools on aproduction environment, and the uncontrolled release of information to the web server.
- template for rhs plugins
- template for wsus plugins
- Update Assets templates to use this if possible plugin: http://www.nessus.org/plugins/index.php?view=single&id=54615 for extra data
- Colorize the reports with better style
- Ensure font sizes are standard in the templates
- The font in tech findings could be 1 size smaller
- add more detailed pci templates
- Provide more templates
	- Virtual Machine Summary
	- Fix list Report?
	- Compact the data in tech findings to be more printer friendly
	- finding summary coversheet looks odd
	- unsupported OS template
	- add list of unsupported os ip's accessor
	- detailed findings should be combined to save paper on printing
	- Sort Technical Findings Report by count/score
	- Add template validation and more error checking
- Added TOC/Index to the technical findings report, issue 15
- More text blocks for various plugins services
- finish implementation of service descriptions
- outstanding/very good/good/improvement needed/unsatisfactory
- report type rtf
  Per host
    - scan time start/end
    - remote host info is/netbios/name/dns/ip/mac
- All types of reports nessus does
  -vuln by host
    -hosts.each
      - host.items.each
        - name
        - synopsis
        - description
        - solution
        - risk
        - reference
        - ports
        - plugin output

###Testing
- Move all tests to use Fixtures
- hash all template results to make sure templates are being created correctly
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
- Add tests for Patch model

###Web GUI
- Move to http://twitter.github.com/bootstrap/index.html for the web gui

###Marketing
- CentOS 6 setup Tutorial
- Debian 6 setup Tutorial
- Backtrack5 r2 setup Tutorial
- Ubuntu 11.10 setup Tutorial
- Presentation on Risu

####Website
- Increase the readability of the site some
- Bold the current version info
