# Debian 8 Risu Install Guide

For this guide we will use the system ruby of 2.1.x

# Step 1: System Prereq
apt-get install curl build-essential openssl libreadline6 libreadline6-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion libmysqlclient-dev graphicsmagick-libmagick-dev-compat libmagickwand-dev ruby ruby-dev

# Step 2: Install Risu

	% sudo gem install risu


# Step 3: Test Risu

	% risu -v

#Debian 6 / 7  Risu Installation

## Step 1: System Pre-requirements
A few system packages need to be installed before we can install the risu gem. These packages include packages that [RVM](https://rvm.io/) recommends to have installed also. Select Yes to any extra packages it adds. As root execute the following:

	# apt-get install curl build-essential openssl libreadline6 libreadline6-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion libmysqlclient-dev libmagick9-dev

## Step 2: Install RVM
Follow the instructions [here](https://rvm.io/rvm/install/) to setup a working RVM environment. The following is a quick list of commands to install it, check the site for the latest. As your user run the following:

	% curl -L https://get.rvm.io | bash -s stable
	% source ~/.rvm/scripts/rvm
	% rvm install 1.9.2
	% rvm use 1.9.2 --default

## Step 3: Install Risu
Risu is configured to auto install any dependent gems that is depends on, this makes installation much easier.

	% gem install risu

## Step 4: Test Risu
To test and see if the install run the following command

	% risu -v

You should see output like the following:

	% risu -v
	risu: 1.6.2
	Ruby Version: 1.9.2
	Rubygems Version: 1.8.24

