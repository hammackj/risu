# NessusDB

NessusDB is [Nessus](http://www.nessus.org) parser, that converts the generated reports into a  [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, this allows for easy report generation and vulnerbility verification. 

Version 1.4.0 is the current release.

## Requirements

### Ruby
NessusDB has been tested with ruby-1.8.7-p330, ruby-1.9.1-p378, ruby-1.9.2-p136. Please try to use one of these versions if possible

### RubyGems
NessusDB relies heavily on the RubyGems framework to install other dependencies I highly recommend using it. RubyGems is included by default in the Ruby 1.9 branches.


- libxml
- rails
- yaml 
- logger
- rmagick
- gruff
- prawn
- mysql

## Developmental Requirements

These are all available through [RubyGems](http://rubygems.org/). The should be installed automatically when you install nessusdb, If not this command will install them all:

	% gem install libxml-ruby choice yaml rails logger gruff prawn rmagick mysql
	
**You my need sudo/root access depending on your system setup**

Any database that ActiveRecord supports should work. NessusDB has been tested with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/). 

## Installation
Installation is really easy just gem install!

	% sudo gem install nessusdb

## Database Setup

	% nessusdb --create-config
	% $EDITOR nessusdb.cfg
	% nessusdb --create-tables

1. Generate the nessusdb.cfg file.
2. Edit the nessusdb.cfg file, filling in the variables as needed. Please see [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) for more details.
3. Migrate the database schema.


## Parsing Nessus Output

	% nessusdb report1.nessus [report2.nessus ...]

1. Parse the files by passing their names on the command line.


# Viewing Data #
The data can be viewed with a query browser available for your database. A Rails front end will be available in the future.

## Generating Reports ##
To generate a technical summary report please execute the following after the the data is parsed into the database.

	% nessusdb -t "TEMPLATE_PATH" -o "REPORT_NAME.pdf"
	
## Templates ##
Serveral templates are included:

1. graphs.rb - several graphs written to disk as png's and as a complete pdf
2. technical_findings.rb - a detailed pdf of the critical and highs from the assessment
3. finding_statistics.rb - this is a pdf summary of the assessment
4. assets.rb - this is a summary of all the hosts found during the scan
5. pci_compliance.rb - this generates of list of hosts that pass or failed pci/dss auditing
6. exec_summary.rb - A sample executive summary report
7. executive_summary.rb - A more detailed sample executive summary report
8. findings_summary.rb - A summary of all the findings report
9. ms_update_summary.rb - a summary of all the windows update enable hosts
10. ms_patch_summary.rb - a summary of all the missing windows patches
11. cover_sheet.rb - a example coversheet report

	
The templates are located in the nessusdb/templates folder, where ever the gem was installed. On a typical Mac OSX install the path is:

	[hammackj@taco:~]$ ruby -v
	ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]
	[hammackj@taco:~]$ l /Library/Ruby/Gems/1.8/gems/nessusdb-1.1.0/lib/nessusdb/templates/
	total 40
	drwxr-xr-x  7 hammackj  admin   238B Oct 21 19:24 ./
	drwxr-xr-x  8 hammackj  admin   272B Oct 21 19:24 ../
	-rw-r--r--  1 root      admin   847B Oct 21 19:24 assets.rb
	-rw-r--r--  1 root      admin   686B Oct 21 19:24 finding_statistics.rb
	-rw-r--r--  1 root      admin   873B Oct 21 19:24 graphs.rb
	-rw-r--r--  1 root      admin   1.6K Oct 21 19:24 pci_compliance.rb
	-rw-r--r--  1 root      admin   2.2K Oct 21 19:24 technical_findings.rb
	[hammackj@taco:~]$ 

The templates are written in ruby using [prawn](http://prawn.majesticseacreature.com/), they are fairly easy to make. I will add any templates as requested.

# Issues #
If you have any problems, bugs or feature requests please use the [github issue tracker](http://github.com/hammackj/nessusdb/issues).

# Contact #
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

