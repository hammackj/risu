NessusDB
===


NessusDB is Nessus XMLv2 (*.nessus) parser, which pushes reports into an ActiveRecord database, easing report generation. 


It is currently under heavy development. When a working copy is ready it will be tagged 1.0.0 and noted in this document.

Requirements
---

* ruby
* rubygems
* libxml
* active_record
* yaml

These can all be installed with sudo gem install.

Any database engine that active record supports should work. It has been tested with Mysql and Sqlite3


Setting up the database
-------------------------
1. Run the nessus_migrator.rb script with the -f option to create the database.yml file
2. Fill out the generated database.yml file
3. Run the nessus_migrator.rb script again with the -c option and all the database will be created


Parsing the .nessus files
-------------------------
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
You can reach me at jacob[dot]hammack[at]hammackj[dot]com

