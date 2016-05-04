#OSX 10.9 Risu Installation

## Step 1: System Pre-requirements
A few system packages need to be installed before we can install the Risu gem. These packages will be managed by [HomeBrew](http://brew.sh). For instructions on how to configure and install Homebrew please visit their [site](http://brew.sh). Make sure brew is working correctly before proceeding. You can also use Macports, but you will be on your own.

	# brew install ghostscript mysql imagemagick ruby-install chruby

## Step 2: Configure chruby
I prefer using chruby for installing and managing my ruby installs. You may also use RVM, but you will be on your own.

	% ruby-install ruby 2
	% echo 'source /usr/local/opt/chruby/share/chruby/chruby.sh' >> ~/.bash_profile
	% echo 'source /usr/local/opt/chruby/share/chruby/auto.sh' >> ~/.bash_profile
	% source ~/.bash_profile
	% echo "ruby-2" > ~/.ruby-version
	% ruby-install ruby 2

## Step 3: Install Risu
Risu is configured to auto install any dependent gems that is depends on, this makes installation much easier.

	% gem install risu

## Step 4: Test Risu
To test and see if the install run the following command

	% risu -v

You should see output like the following:

	% risu -v
	risu: 1.7.0
	Ruby Version: 2.1.0
	Rubygems Version: 2.2.0
