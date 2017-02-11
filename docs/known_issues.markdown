# Known Issues

## RMagick Breaks on ImageMagick Updates
The easy way to fix this is to just reinstall RMagick, like below:

	[hammackj@taco:~/Projects/public/risu]$ risu
	/Library/Ruby/Gems/1.8/gems/rmagick-2.13.1/lib/RMagick2.bundle: This installation of RMagick was configured with ImageMagick 6.6.5 but ImageMagick 6.6.7-0 is in use. (RuntimeError)
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `require'
		from /Library/Ruby/Gems/1.8/gems/rmagick-2.13.1/lib/RMagick.rb:11
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:34:in `gem_original_require'
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:34:in `require'
		from /Library/Ruby/Gems/1.8/gems/gruff-0.3.6/lib/gruff/base.rb:2
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `gem_original_require'
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `require'
		from /Library/Ruby/Gems/1.8/gems/gruff-0.3.6/lib/gruff.rb:25
		from /Library/Ruby/Gems/1.8/gems/gruff-0.3.6/lib/gruff.rb:5:in `each'
		from /Library/Ruby/Gems/1.8/gems/gruff-0.3.6/lib/gruff.rb:5
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:34:in `gem_original_require'
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:34:in `require'
		from ./bin/../lib/risu.rb:10
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `gem_original_require'
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `require'
		from ./bin/risu:22

	[hammackj@taco:~/Projects/public/risu]$ sudo gem install rmagick

## Mac OSX Native Dependencies
The gems for mysql and rmagick will fail to build if these are not installed.

### Mac Ports
	% sudo port install sqlite3 ImageMagick mysql5
	% gem install sqlite3

### Brew
	% brew install sqlite3 ImageMagick mysql5

## Linux Native Dependencies

### Ubuntu 10.10
	% sudo apt-get install ruby1.8-dev libzip1 libzip-dev libxml2-dev libxml2 libmysqlclient-dev imagemagick libmagickwand3 libmagick9-dev sqlite3 libsqlite3-dev
	% gem install sqlite3
### Backtrack
	sudo apt-get install ruby1.8-dev libzip1 libzip-dev libxml2-dev libxml2 libmysqlclient-dev imagemagick libmagickwand3 libmagick9-dev

## Sqlite

Sqlite is a great database to use as a light weight solution. I use Sqlite for all of my assessments. Setting it up on various platforms can be tricky, so here are some examples for what is required to set it up.
