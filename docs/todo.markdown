# TODO

**Release dates and road map are estimates, and features can be changed at any time.**

#**Bugs**
*** OS's with 2000 or XP can be misidentified by Nessus showing both host messing up some of the graphs. ***

#Road map

## 1.7 (??)
- Update HostProperties to become a sql hash table with accessors for the common ones
- Do all the @todo / @fix  items!
- complacence plugins xml parser test?
- error check connection fail on the console to mysql
- migration error handling
  - catch mysql/sqlite/postgres errors during up/down
  - better integration with mysql/post/sqlite
  - catch mysql cannot connect exception
- CLI
	- list scan in database via cli
	- add a way to generate reports from the cli
	- add a way to spawn mysql/psql shell to the database
	- add tables for the OS data
	- prompt for password?
	- generate report based on scan_id/report id
- finding summary: crit/high spacing
- filter (uncredentialed check) from the title of MS vulns and put it in the body as a true/false kind of field
	- remove KB # also
- add postgres support and test it
- graph text is misleading
- create an api determining vulnerability % based on the network
- create an api for creating a vulnerability score per host to show a risk %
- add scanner info at a table plugin #19506
- Test Data
	- test data for Item.ms_patches
	- test data for References need real reference, for regex check
- Templates
	- MS AV errors (52544)
	- MS Pending Reboot report (35453)
	- findings by host report
	- unsupported OS first paragraph pluralization
	- remove ms patches from notable findings
	- add missing ms patch section
- Add a filtering system for lowering the rating of plugins based on config
	- Implement the ability to filter data out of the report
		- Filter on
			- Host Mac Address
			- Host IP
			- Plugin ID
			- Host id
		- Arbitrary number of filters
		- Add filtered API, to use the filters
			- Option 1: eg critical_risks_filtered()
			- Option 2: eg critical_risks(:filtered => true)
			- ALLOW CIDR BASED RANGES
- 100% Code coverage for all unit testing
- rewrite text for risks by severity
- Implement different renderer's
	- pdf
	- csv
	- html
	- rtf
	- OpenOffice.org xml
- Abstract the api for prawn to support different renders
- DSL for report creation to abstract the reports to have different output types
- Language abstraction for text generation
- Look at moving to Nokogiri for xml parsing; http://nokogiri.org if its faster
- page kerning?


##List of things TODO
###Core
- bug report info collection option
- Remove rmagick (GRRRR!)
- Complete comments for all existing code
- More text generation from graphs
- pdf bookmarks
- rewrite the application class
- check the config file for \t
- add create template option

###Parsers
- move all pci related host properties to their own table
- Nexpose SimpleXML parser
- Create a Nessus document generator, for testing the parser
- Add Schema checks to make sure the schema is compatible with the version of risu
- Add Parser for Nessus NBE Format
- Add Parser for Nessus NSR Format
- Add Parser for Nessus V1 of the XML Format
- Add Parser for OpenVas Output
- Add Parser for SecurityCenter Output
- Add Parser for Nexpose XML [Simple, Detailed]
- Add Parser for Qualys XML
- Add Parser for Nmap XML?
- Add Parser for SAINT XML

###Models
- add hosts with crit/high/med/low queries
- add ibm to the os named_scopes

###Graphs
- most common os graph
- vulns by service bar chart
- most common services graph
- most common vuln category
- # hosts by severity
- stig bar graph for cat 1 / 2 / 3
- unsupported vs supported os graph
- Add a CVSS risk factor graph
- security risk graph
- detailed linux graph
- detailed windows graph
- uniform graph colors
- vuln count by host graph top 10 vulns
- generate a graph matirx like exec summary detailed

###Reports / Templates
- Easier way to select the Scan to generate reports from
- Unsupported OS report
	- <= XP SP1 = oct 10, 2006
	- XP SP2 = July 13, 2010
	- Vista SP0 = APril 13, 2010
	- Vista SP1 = July 12, 2011
- Reports based on audit data
- Reports for mobile information
- web server statics report (plugin id)
- virtual machine stats report (20094)
- add pdf bookmarks to reports
- talking point report
- add netbios name to IPs (hostname)
- add table of contents on the tech findings template
- better exec template
	- intro
			-over view
			- details of major findings (3-5)
	- scope
	- impact of threats (generalized)
	- graphs
- SANS TOP XX report
- Fix list report
	- by host ordered by risk
		- vulnerability name
		- first cve
		- Host
		- vuln name     |   cve
		- vuln name     |   cve
- add findings by host report
- windows policy report
- clean up old templates, some are nasty
- stig detailed report
	-http://www.scribd.com/doc/3752867/6/Vulnerability-Severity-Code-Definitions
	- Category I
		- Vulnerabilities that allow an attacker immediate access into a machine, allow superuser access, or bypass a firewall.These can lead to the immediate compromise of the web server allowing the attacker to take complete control of the web server and associated operating system, which can then be used as a resource to control other systems in your network.Some examples would be the running of unsupported software, anonymous access to privileged accounts, and the presence of sample applications installed on the web server.
	- Category II
		- Vulnerabilities aide the ability of an attacker to gain access into a machine, compromise sensitive data, or bypass a firewall.These will lead to the eventual compromise of the web server allowing the attacker to manipulate the content or server settings on the web server and have access to other systems in your network.Some examples would be trust relationships with unauthorized separate enclaves, non compliance with appropriate host operating system security controls, and the non compliance with the IAVM program.
	- Category III
		- Vulnerabilities that impact the security posture of the system and if configured, will improve the overall security of asset.These could result in the degradation of service, compromise of information, and in some cases lead to unauthorized access to the system. Some examples would be untrained staff, development tools on a production environment, and the uncontrolled release of information to the web server.
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
	- [TEMPLATE] unsupported OS template
	- [API] add list of unsupported os ip's accessors
	- [TEMPLATE] detailed findings should be combined to save paper on printing
	- Sort Technical Findings Report by count/score
	- Add template validation and more error checking
- Added TOC/Index to the technical findings report, issue 15
- More text blocks for various plugins services
- finish implementation of service descriptions
- outstanding / very good / good / improvement needed / unsatisfactory
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

### Testing
- Create tests for everything (95%+ code coverage goal, 85% Current)
	- Parser tests
		- Add test for new XML element
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

### Marketing
- Backtrack5 r2 setup Tutorial
- Ubuntu LTS setup Tutorial
- Presentation on Risu

#### Website
- Increase the readability of the site some
- Bold the current version info

#### Documentation
- add hacking doc
- config file docs
