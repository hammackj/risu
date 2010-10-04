NessusDB
===

NessusDB is [Nessus](http://www.nessus.org) XMLv2 parser, which pushes reports into an [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, easing report generation. 

Version 0.6.6 Alpha is the current release, and under going major changes at the moment, but it should be functional.

Requirements
---

* ruby (Tested with 1.8.7)
* rubygems (Install it from source!, it is included with ruby 1.9.1+)
* libxml (sudo gem install libxml-ruby)
* choice (sudo gem install choice)
* active_record (best to just sudo gem install rails)
* yaml 
* logger
* rmagick (sudo gem install rmagick)
* gruff (sudo gem install gruff)
* prawn (sudo gem install prawn)

These are all available through [RubyGems](http://rubygems.org/).

Any database that ActiveRecord supports should work. Testing has been with [MySQL](http://www.mysql.com/) and [SQLite3](http://sqlite.org/). 

Installation
---
Installation is really easy just clone the repo and start.

	% git clone git://github.com/hammackj/nessusdb.git
	
Alternatively you can 

	% sudo gem install nessusdb [soon!]

Database Setup
---

	% nessusdb --create-config
	% $EDITOR database.yml
	% nessusdb -c

1. Generate the database.yml file.
2. Edit the database.yml file, filling in the variables as needed. Please see [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) for more details.
3. Migrate the database schema.


Parsing Nessus Output
---

	$ nessusdb -f report1.nessus [report2.nessus ...]

1. Parse the files by passing their names on the command line.


Viewing Data
---
The data can be viewed with a query browser available for your database. A Rails front end will be available in the future.

Generating Reports
---
To generate a technical summary report please execute the following after the the data is parsed into the database.

	% ./nessusdb -t "TEMPLATE_PATH" --title "REPORT_NAME" --author "REPORT_AUTHOR" -o "REPORT_NAME.pdf"
	
Templates
---
I have included several templates:

	1. graphs.rb - several graphs written to disk as png's and as a complete pdf
	2. technical_findings.rb - a detailed pdf of the critical and highs from the assessment
	3. finding_statistics.rb - this is a pdf summary of the assessment
	
The templates are located in the nessusdb/templates folder, where ever the gem was installed.

Issues
---
If you have any problems or bugs please use the [github issue tracker][http://github.com/hammackj/nessusdb/issues].

Special Thanks
---
I would like to give a special thanks to Eric Hulse for hooking me up with the gig that I developed all of this for.

Contact
---
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

