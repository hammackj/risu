NessusDB
===

NessusDB is [Nessus](http://www.nessus.org) XMLv2 parser, which pushes reports into an [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, easing report generation. 

Version 1.0 Alpha is the current release.

Requirements
---

* ruby (Tested with 1.8.7)
* rubygems
* libxml
* choice
* active_record
* yaml
* logger
* pdf-writer (sudo gem install pdf-writer)

These are all available through [RubyGems](http://rubygems.org/).

Any database that ActiveRecord supports should work. Testing has been with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/). 


Database Setup
---

	% ./migrate.rb -f
	% $EDITOR database.yml
	% ./migrate -c

1. Generate the database.yml file.
2. Edit the database.yml file, filling in the variables as needed. Please see [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) for more details.
3. Migrate the database schema.


Parsing Nessus Output
---

	$ ./nessus_parser.rb report1.nessus [report2.nessus ...]

1. Parse the files by passing their names on the command line.


Viewing Data
---
The data can be viewed with a query browser available for your database. A Rails front end will be available in the future.

Generating Reports
---
To generate a technical summary report please execute the following after the the data is parsed into the database.

 	$./technical_findings.rb -t "REPORT_NAME" -a "REPORT_AUTHOR" -o "REPORT_NAME.pdf"

Contributors
---
* Jacob Hammack
* Andrew Benson


Contact
-------------------------
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

