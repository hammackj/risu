# risu

Risu is [Nessus](http://www.nessus.org) parser, that converts the generated reports into a  [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, this allows for easy report generation and vulnerability verification. 

Version 1.4.9 is the current release.

## Requirements

### Ruby
Risu has been tested with ruby-1.8.7-p334, ruby-1.9.1-p431, ruby-1.9.2-p180. Please try to use one of these versions if possible. I recommend using RVM to setup your ruby environment you can get it [here](https://rvm.beginrescueend.com/).

### RubyGems
Risu relies heavily on [RubyGems](http://rubygems.org/) to install other dependencies I highly recommend using it. RubyGems is included by default in the 1.9.x versions of [Ruby](http://ruby-lang.org/).

- libxml
- rails
- yaml 
- logger
- rmagick
- gruff
- prawn
- mysql

## Developmental Requirements

These are all available through [RubyGems](http://rubygems.org/). The should be installed automatically when you install risu, If not this command will install them all:

	% gem install rmagick gruff prawn sham faker rspec rcov machinist yard mysql libxml-ruby rails sqlite3 logger yaml
	
**You my need sudo/root access depending on your system setup**

Any database that ActiveRecord supports should work. Risu has been tested with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/). 

## Installation
Installation is really easy just gem install!

	% gem install risu

## Database Setup

	% risu --create-config
	% $EDITOR risu.cfg
	% risu --create-tables

1. Generate the risu.cfg file.
2. Edit the risu.cfg file, filling in the variables as needed.
3. Migrate the database schema.

## Parsing Nessus Output

	% risu report1.nessus [report2.nessus ...]

1. Parse the files by passing their names on the command line.


# Viewing Data
The data can be viewed with a query browser available for your database. A Rails front end will be available in the **future**.

## Generating Reports
To generate a report please execute the following after the the data is parsed into the database.

	% risu -t <TEMPLATE_NAME> -o "REPORT_NAME.pdf"
	
## Risu Console

Using the risu Console is just like using Rails. You can access all of the ActiveRecord models directly and pull specific data from each model. Like SQL only easier!

	[hammackj@taco:~/Projects/public/risu]$ ../bin/risu --console

	      _           
	 _ __(_)___ _   _ 
	| '__| / __| | | |
	| |  | \__ \ |_| |
	|_|  |_|___/\__,_|


	risu Console v1.4.9
	>> Host.first
	=> #<Risu::Models::Host id: 1, report_id: 1, name: "10.69.69.74", os: "Linux Kernel 2.6 on Debian 4.0 (etch)", mac: "XX:XX:XX:XX:XX:XX", start: "2011-04-20 16:29:37", end: "2011-04-20 16:32:14", ip: "10.69.69.74", fqdn: "redada.hammackj.net", netbios: "REDADA", local_checks_proto: nil, smb_login_used: nil, ssh_auth_meth: nil, ssh_login_used: nil, pci_dss_compliance: nil, notes: nil>
	
## Templates
Several templates are included:

	[hammackj@taco:~/Projects/public/risu]$ ./bin/risu -l
	Available Templates
		assets - Generates a Assets Summary Report
		cover_sheet - Generates a coversheet with a logo (Example Template)
		exec_summary - Generates a simple executive summary.
		exec_summary_detailed - Generates a detailed executive summary report
		finding_statistics - Generates report finding statistics
		findings_host - Generates a findings report by host
		findings_summary - Generates a findings summary report
		findings_summary_with_pluginid - Geneates a Findings Summary with Nessus Plugin ID
		graphs - Generates a report with all the graphs in it
		host_summary - Generates a Host Summary Report
		ms_patch_summary - Generates a Microsoft Patch Summary Report
		ms_update_summary - Generates a Microsoft Update Summary Report
		pci_compliance - Generates a PCI Compliance Overview Report
		technical_findings - Generates a Technical Findings Report
		template - template
	[hammackj@taco:~/Projects/public/risu]$ 

The templates are written in ruby using [prawn](http://prawn.majesticseacreature.com/), they are fairly easy to make. I will add any templates as requested. See the 'template' example for creating your own template.

# Contributing
If you would like to contribute templates/bug fixes/etc to risu. The easiest way is to fork the project on [github](http://github.com/hammackj/risu) and make the changes in your fork and the submit a pull request to the project.

# Issues
If you have any problems, bugs or feature requests please use the [github issue tracker](http://github.com/hammackj/risu/issues).

# Contact
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.
