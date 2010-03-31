NessusDB
===

NessusDB is [Nessus](http://www.nessus.org) XMLv2 parser, which pushes reports into an [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) database, easing report generation. 


It is currently under heavy development. When a working copy is ready it will be tagged 1.0.0 and noted in this document.

Requirements
---

* ruby
* rubygems
* libxml
* active_record
* yaml

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

	% ./nessus_parser.rb report1.nessus [report2.nessus ...]

1. Parse the files by passing their names on the command line.


Viewing Data
---
The data can be viewed with a query browser available for your database. A Rails front end will be available in the future.

Contributors
---
* Jacob Hammack
* Andrew Benson


Contact
-------------------------
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

