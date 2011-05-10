# NessusDB

NessusDB is [Nessus](http://www.nessus.org) parser, that converts the generated reports into a  [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, this allows for easy report generation and vulnerability verification. 

Version 1.4.1 is the current release.

## Requirements

### Ruby
NessusDB has been tested with ruby-1.8.7-p334, ruby-1.9.1-p431, ruby-1.9.2-p180. Please try to use one of these versions if possible. I recommend using RVM to setup your ruby environment you can get it [here](https://rvm.beginrescueend.com/).

### RubyGems
NessusDB relies heavily on RubyGems to install other dependencies I highly recommend using it. RubyGems is included by default in the Ruby 1.9 branches.


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

	% gem install rmagick gruff prawn sham faker rspec rcov machinist yard mysql libxml-ruby rails sqlite3 logger yaml
	
**You my need sudo/root access depending on your system setup**

Any database that ActiveRecord supports should work. NessusDB has been tested with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/). 

## Installation
Installation is really easy just gem install!

	% gem install nessusdb

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


# Viewing Data
The data can be viewed with a query browser available for your database. A Rails front end will be available in the future.

## Generating Reports
To generate a technical summary report please execute the following after the the data is parsed into the database.

	% nessusdb -t "TEMPLATE_PATH" -o "REPORT_NAME.pdf"
	
## NessusDB Console

Using the NessusDB Console is just like using Rails. You can access all of the ActiveRecord models directly and pull specific data from each model. Like SQL only easier!

	[hammackj@taco:~/Projects/public/nessusdb]$ ../bin/nessusdb --console

	                                   _ _       
	 _ __   ___  ___ ___ _   _ ___  __| | |__  
	| '_ \ / _ \/ __/ __| | | / __|/ _` | '_ \ 
	| | | |  __/\__ \__ \ |_| \__ \ (_| | |_) |
	|_| |_|\___||___/___/\__,_|___/\__,_|_.__/ 

	NessusDB Console v1.4
	>> Host.first
	=> #<NessusDB::Models::Host id: 1, report_id: 1, name: "10.69.69.74", os: "Linux Kernel 2.6 on Debian 4.0 (etch)", mac: "XX:XX:XX:XX:XX:XX", start: "2011-04-20 16:29:37", end: "2011-04-20 16:32:14", ip: "10.69.69.74", fqdn: "redada.hammackj.net", netbios: "REDADA", local_checks_proto: nil, smb_login_used: nil, ssh_auth_meth: nil, ssh_login_used: nil, pci_dss_compliance: nil, notes: nil>
	
## Templates
Several templates are included:

1. graphs.rb - several graphs written to disk as png's and as a complete pdf
2. technical_findings.rb - a detailed pdf of the high and medium findings from the assessment
3. finding_statistics.rb - this is a pdf summary of the assessment
4. assets.rb - this is a summary of all the hosts found during the scan
5. pci_compliance.rb - this generates of list of hosts that pass or failed pci/dss auditing
6. exec_summary.rb - A sample executive summary report
7. executive_summary.rb - A more detailed sample executive summary report
8. findings_summary.rb - A summary of all the findings report
9. ms_update_summary.rb - a summary of all the windows update enable hosts
10. ms_patch_summary.rb - a summary of all the missing windows patches
11. cover_sheet.rb - a example coversheet report
12. findings_host.rb - list of findings per host
	
The templates are located in the nessusdb/templates folder, where ever the gem was installed. On a typical Mac OSX install the path is:

	[hammackj@taco:~]$ ruby -v
	ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]
	[hammackj@taco:~]$ l /Library/Ruby/Gems/1.8/gems/nessusdb-1.4.0/lib/nessusdb/templates/
	total 40
	drwxr-xr-x  7 hammackj  admin   238B Oct 21 19:24 ./
	drwxr-xr-x  8 hammackj  admin   272B Oct 21 19:24 ../
	-rw-r--r--   1 hammackj  staff   695B Mar  9 15:59 assets.rb
	-rw-r--r--   1 hammackj  staff   691B Mar  9 15:59 cover_sheet.rb
	drwxr-xr-x   3 hammackj  staff   102B Mar  9 15:59 data/
	-rw-r--r--   1 hammackj  staff   2.0K Mar  9 15:59 exec_summary.rb
	-rw-r--r--   1 hammackj  staff   6.7K Mar  9 15:59 executive_summary.rb
	-rw-r--r--   1 hammackj  staff   724B Mar  9 15:59 finding_statistics.rb
	-rw-r--r--@  1 hammackj  staff   1.2K Mar 17 14:55 findings_host.rb
	-rw-r--r--   1 hammackj  staff   1.5K Mar  9 15:59 findings_summary.rb
	-rw-r--r--   1 hammackj  staff   831B Mar  9 15:59 graphs.rb
	-rw-r--r--   1 hammackj  staff   1.2K Mar  9 15:59 host_summary.rb
	-rw-r--r--   1 hammackj  staff   663B Mar  9 15:59 ms_patch_summary.rb
	-rw-r--r--   1 hammackj  staff   924B Mar  9 15:59 ms_update_summary.rb
	-rw-r--r--   1 hammackj  staff   1.6K Mar  9 15:59 pci_compliance.rb
	-rw-r--r--   1 hammackj  staff   2.8K Mar  9 15:59 technical_findings.rb
	[hammackj@taco:~]$ 

The templates are written in ruby using [prawn](http://prawn.majesticseacreature.com/), they are fairly easy to make. I will add any templates as requested.

# Issues
If you have any problems, bugs or feature requests please use the [github issue tracker](http://github.com/hammackj/nessusdb/issues).

# Contact
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

