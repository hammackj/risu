# risu

[![Gem Version](https://badge.fury.io/rb/risu.png)](http://badge.fury.io/rb/risu) [![Build Status](https://travis-ci.org/arxopia/risu.png?branch=master)](https://travis-ci.org/arxopia/risu) [![Coverage Status](https://coveralls.io/repos/arxopia/risu/badge.svg?branch=master&service=github)](https://coveralls.io/github/arxopia/risu?branch=master)

Risu is [Nessus](http://www.nessus.org) parser, that converts the generated reports into a [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, this allows for easy report generation and vulnerability verification.

Version **1.7.5** is the current release.

## Requirements

### Ruby
Risu has been tested with ruby-1.9.3-p392, ruby-2.0.0 and ruby-2.1.0. Please try to use one of these versions if possible. I recommend using RVM to setup your ruby environment you can get it [here](https://rvm.beginrescueend.com/).

### RubyGems
Risu relies heavily on [RubyGems](http://rubygems.org/) to install other dependencies I highly recommend using it. RubyGems is included by default in the 1.9.x versions of [Ruby](http://ruby-lang.org/).

- libxml
- rails
- yaml
- logger
- rmagick
- gruff
- prawn
- mysql2
- nokogiri

## Installation
Installation is really easy just gem install!

    % gem install risu

## Developmental Requirements

These are all available through [RubyGems](http://rubygems.org/). The should be installed automatically when you install risu, If not this command will install them all:

	% gem install rmagick gruff prawn yard mysql2 libxml-ruby rails sqlite3 logger yaml nokogiri

**You my need sudo/root access depending on your system setup**

Any database that ActiveRecord supports should work. Risu has been tested with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/).

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
The data can be viewed with a query browser available for your database.

## Generating Reports
To generate a report please execute the following after the the data is parsed into the database.

	% risu -t <TEMPLATE_NAME> -o "REPORT_NAME.pdf"

## Risu Console

Using the risu Console is just like using Rails. You can access all of the ActiveRecord models directly and pull specific data from each model. Like SQL only easier!

	$ risu --console

	      _
	 _ __(_)___ _   _
	| '__| / __| | | |
	| |  | \__ \ |_| |
	|_|  |_|___/\__,_|


	risu Console v1.7.2
	>> Host.first
	=> #<Risu::Models::Host id: 1, report_id: 1, name: "10.69.69.74", os: "Linux Kernel 2.6 on Debian 4.0 (etch)", mac: "XX:XX:XX:XX:XX:XX", start: "2011-04-20 16:29:37", end: "2011-04-20 16:32:14", ip: "10.69.69.74", fqdn: "redada.arxopia.net", netbios: "REDADA", local_checks_proto: nil, smb_login_used: nil, ssh_auth_meth: nil, ssh_login_used: nil, pci_dss_compliance: nil, notes: nil>

## Templates
Several templates are included:

	$ risu -l
    Available Templates
        stig_findings_summary - DISA Stig findings summary report
        pci_compliance - Generates a PCI Compliance Overview Report
        technical_findings - Generates a Technical Findings Report
        ms_patch_summary - Generates a Microsoft Patch Summary Report
        findings_summary_with_pluginid - Generates a Findings Summary with Nessus Plugin ID
        findings_host - Generates a findings report by host
        exec_summary - Generates a simple executive summary.
        finding_statistics - Generates report finding statistics
        graphs - Generates a report with all the graphs in it
        findings_summary - Generates a findings summary report
        assets - Generates a Assets Summary Report
        cover_sheet - Generates a coversheet with a logo (Example Template)
        notable_detailed - Notable Vulnerabilities Detailed
        ms_update_summary - Generates a Microsoft Update Summary Report
        template - template
        notable - Notable Vulnerabilities
        ms_wsus_findings - Generates a report based on the findings of the Patch Management: WSUS Report plugin
        exec_summary_detailed - Generates a detailed executive summary report
        host_summary - Generates a Host Summary Report
	$

The templates are written in ruby using [prawn](http://prawn.majesticseacreature.com/), they are fairly easy to make. I will add any templates as requested. See the 'template' example for creating your own template.

# Contributing
If you would like to contribute templates/bug fixes/etc to risu. The easiest way is to fork the project on [github](http://github.com/arxopia/risu) and make the changes in your fork and the submit a pull request to the project.

# Issues
If you have any problems, bugs or feature requests please use the [github issue tracker](http://github.com/arxopia/risu/issues).

# Donations / tips
Feel free to donate or tip to BTC: 1Cfd5G6rJmSBrNcTHxEgE4uYgH7XZJPY7Z

# Contact
You can reach me at risu[at]arxopia[dot]com.

You can also contact me on IRC as hammackj on irc.freenode.net, #risu
