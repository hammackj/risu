# Known Issues #

## RMagick Breaks on ImageMagick Updates ##
The easy way to fix this is to just reinstall RMagick, like below:

	[hammackj@taco:~/Projects/public/nessusdb]$ nessusdb 
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
		from ./bin/../lib/nessusdb.rb:10
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `gem_original_require'
		from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:29:in `require'
		from ./bin/nessusdb:22

	[hammackj@taco:~/Projects/public/nessusdb]$ sudo gem install rmagick