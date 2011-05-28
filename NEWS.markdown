# News

#1.4.4 (May 28, 2011)
- NessusDB has been renamed to risu
- Fixed a bug in --create-config, where tabs were being inserted with spaces
- Fixed a bug in load_config where the exception was not printed.
- Added more banners to the console for fun

#1.4.3 (May 23, 2011)

**This is the last release under the NessusDB name, I received a legal notice to change the name. They gave me a few weeks to change the name but I do not have a new name yet. If you have any suggestions please submit them to jacob.hammack[@]hammackj.com**

- Fixed small bug in Windows/Other OS graphs
- Increased the verboseness of Error messages Ticket #29
- Added named scopes off the Plugin class Ticket #34
- Added new PCI related HostProperties Tocket #35
	- New HostProperties attribute: pci-dss-compliance:
	- New HostProperties attribute: pcidss:compliance:failed
	- New HostProperties attribute: pcidss:compliance:passed
	- New HostProperties attribute: pcidss:deprecated_ssl
	- New HostProperties attribute: pcidss:expired_ssl_certificate
	- New HostProperties attribute: pcidss:high_risk_flaw
	- New HostProperties attribute: pcidss:medium_risk_flaw
	- New HostProperties attribute: pcidss:reachable_db
	- New HostProperties attribute: pcidss:www:xss
- Added more unit tests 91.7% code coverage for testing at the moment. Not including templates.	

#1.4.2 (May 13, 2011)

- Added a fix for all of the MSXX-XXX Host Properties tags that don't serve any purpose
- Added sqlite3 as an install dependency to help with sqlite usage
- Fixed a privately report bug with the *_risks_unique_sorted functions not working on MySQL

#1.4.1 (May 10, 2011)

- Fixed a issue with a nonexistent 'Critical' severity.
- Added VMware ESX to the Other OS graph Ticket #33
- windows_os_graph were using the wrong counters Ticket #32
- Updated the Prawn gem version to 0.11.1

#1.4.0 (April 20, 2011)

- Added a --console option for creating a ActiveRecord console into the database
- Updated the parser to handle the new plugin_type field on the plugins table
- Fixed a issue with the parser where Nessus leaves the ip field blank for some reason but the name field is the ip. Validates the correctness of the ip and puts it in the ip field
- Added 'cpe' field from the updated Nessus XML
- Added 'plugin_type' field from the updated Nessus XML
- New Templates
	- Simple list of findings by host, in findings_host.rb [Ticket #27]

# 1.3.0 (March 4, 2011)
**Command line options have changed slightly, run risu -? for a full list of commands**

**The default config file name is now risu.cfg**

- New templates
	- Microsoft Patches Summary
	- Microsoft Update Enabled Summary
	- Sample Exec Summary
	- Host Summary
	- Findings Summary
	- Cover Sheet example
- Updated more yardoc documentation
- Reports
	- Set a default font size of 12
	- Set default margins of 50,75,50,75
	- Cleaned up the graphs to be a little easier to read
- Added significantly more error checking to the command line	application
- Updated the config file format to handle all of the report generation options as well as the database configuration options
- Added a command line option for passing it a config file to use instead of forcing the default ./risu.cfg
- Migrated to OptionParser Choice seems to be an abandoned gem with bugs
- Updated all the Migration code to use the new AR3 format

- Special thanks to **Ed Davison** for numerous bug reports and template testing.
- Special thanks to **Andrew Benson** for helping track down a major ActiveRecord bug.

# 1.2.0 (February 13, 2011)
**This update breaks all existing templates, included templates are updated**
	
- Preformed tons code clean up
- Fixed a ton of typos
- Removed the Findings class, please use the named scopes on each ActiveRecord object now
- All queries are now using ActiveRecord 3
	- Use named scope off each Model to access data
- Ported all the templates to use the new ActiveRecord3 style
- Solved some missing dependency issues that are now accounted for!

# 1.1.0 (October 22, 2010)
- Fixed a typo on the classification argument
- Added a assets report template
- Added a simple PCI/DSS compliance report template (Requires Nessus Professional Feed for the plugin)
- Updated the parser to take into account the new fields
	- HostProperties attribute: pci-dss-compliance
	- New XML element: exploitability_ease. 
	- New XML element: cvss_temporal_vector.
	- New XML element: exploit_framework_core.
	- New XML element: cvss_temporal_score. 
	- New XML element: exploit_available.
	- New XML element: exploit_framework_metasploit.
	- New XML element: metasploit_name
	- New XML element: exploit_framework_canvas
	- New XML element: canvas_package
- Updated technical findings template to account for the new exploitability values
- Fixed a bug with the way I was blacklisting the scan box
	
# 1.0.0 (October 8, 2010)
- Cleaned up more code
- Fixed a Mysql error for when the tables do not exist.
	
# 0.6.6 (October 4, 2010)
- Moved to prawn for pdf output
- added templates for the new prawn output
- added checks to warn when there are new xml tags
- moved everything into the risu executable
- cleaned up the code
	
# 0.6.5 (August 15, 2010)
- Initial public release
