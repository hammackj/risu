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


Setting up the database
-------------------------

	% ./migrate.rb -f
	% $EDITOR database.yml
	% ./migrate -c

1. Generate the database.yml file.
2. Edit the database.yml file, filling in the variables as needed. Please see [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) for more details.
3. Migrate the database schema.


Parsing the .nessus files
-------------------------

	% ./nessus_parser.rb report1.nessus [report2.nessus ...]

1. Run the nessus_parser.rb script like this: ./nessus_parser.rb <file to be parsed>
2. The amount of time it takes to parse out the xml


Viewing the Data
-------------------------
The data can be view with any sql viewer made for you sql engine. I am working on a rails front end to the database but it is not available yet.

Contributors
-------------------------
* Jacob Hammack
* Andrew Benson


Contact
-------------------------
You can reach me at jacob[dot]hammack[at]hammackj[dot]com.

