

Steve Lodin <swlodin@gmail.com>


1.0       Installation Instructions

1.1            Prerequisites

-          Windows Server

-          Standard Windows Installation (C:\ Drive)

-          New Volume for application and Data (D:\ Drive)

 

1.2            Additional Components

-          Ruby 1.9

-          MySQL 5.5

-          RubyDevKit

-          ImageMagick 6.7.1

-          RISU 1.4.x

-          SQLite DLL

1.3            Installation Steps

1.3.1      Software Download

-          Download hammackj-risu-v1.4.5-0-g42a0be8.zip from https://github.com/hammackj/risu/archives/master  

-          Download rubyinstaller-1.9.2-p180.exe from http://www.ruby-lang.org/en/downloads/ or http://rubyinstaller.org/downloads/

-          Download mysql-5.5.14-winx64.msi from http://dev.mysql.com/downloads/

-          Download DevKit-tdm-32-4.5.2-20110712-1620-sfx.exe from http://rubyinstaller.org/downloads/

-          Download ImageMagick-6.7.1-0-Q16-windows-dll.exe from a site at http://imagemagick.sourceforge.net/http/www/archives.html

-          Download sqlitedll-3_7_3.zip from http://www.sqlite.org/sqlitedll-3_7_3.zip

1.3.2      Installation Procedure

-          Install Ruby

o   Run installer

o   Choose D:\ as the installation drive

o   Add Ruby executables to the PATH

o   Associate .rb extension with Ruby

-          Install Ruby Developers Toolkit

o   Uncompress and unarchive the DevKit into Ruby directory on D:\

o   Run the DevKit installer in cmd window “ruby dk.rb init” and “ruby dk.rb install”

-          Install MySQL

o   Run installer MSI

o   Run MySQL Server Instance Configuration Wizard

§  Choose custom config

§  Put the Database on D: drive

§  No root password

§  Create the necessary databases for RISU by running the command in a MySQL command line client “create database name;” 

-          Install ImageMagick

o   Run the installer exe

o   Copy ImageMagick libraries to DevKit MinGW lib directory

o   Copy ImageMagick includes to DevKit MinGW includes directory

-          Install SQLite

o   Copy sqlite3.dll into Ruby bin directory

-          Update Ruby Gem libxml

o   Run from cmd window “gem install libxml”

o   Copy D:\Ruby192\lib\ruby\gems\1.9.1\gems\libxml-ruby-2.0.9-x86-mingw32\lib\libs\libxml2-2.dll into Ruby bin directory

-          Install MySQL libs

o   Copy C:\Program Files\MySQL\MySQL Server 5.5\lib\libmysql.dll to Ruby bin directory

o   Note: if a version mismatch occurs, you may have to find an older version of the DLL to store in that directory

-          Install RISU

o   Unzip the archive into a folder on the D:\ drive

o   Install the RISU gem by running in a cmd window “gem install risu”