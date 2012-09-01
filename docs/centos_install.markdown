#CentOS Installation

## Step 1: System Pre-requirements
A few system packages need to be installed before we can install the risu gem. These packages include packages that [RVM](https://rvm.io/) recommends to have installed also. Select Yes to any extra packages it adds. As root execute the following:

	# yum install

	gcc glibc patch curl zlib readline libxml2 libxslt git autoconf automake diffutils make libtool bison subversion imagemagick openssl sqlite libyaml ncurses libmysqlclient gsfonts

## Step 2: Install RVM
Follow the instructions [here](https://rvm.io/rvm/install/) to setup a working RVM environment. The following is a quick list of commands to install it, check the site for the latest. As your user run the following:

	% curl -L https://get.rvm.io | bash -s stable
	% source ~/.rvm/scripts/rvm
	% rvm install 1.9.3
	% rvm use 1.9.3 --default

## Step 3: Install Risu
Risu is configured to auto install any dependent gems that is depends on, this makes installation much easier.

	% gem install risu

## Step 4: Test Risu
To test and see if the install run the following command

	% risu -v

You should see output like the following:

	% risu -v
	risu: 1.6.0
	Ruby Version: 1.9.3
	Rubygems Version: 1.8.24

