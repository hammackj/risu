# News

# 1.3.0 (May 5, 2011)
**Command line options have changed slightly, run nessusdb -? for a full list of commands**

- New templates
	- Microsoft Patches Summary
	- Microsoft Update Enabled Summary
	- Sample Exec Summary
	- Host Summary
	- Findings Summary
	- Cover Sheet example
- Fixed up the yardoc documentation
- Reports
	- Set a default font size of 12
	- Set default margins of 50,75,50,75
	- Cleaned up the graphs to be a little easier to read
- Added significantly more error checking to the command line	application
- Updated the config file format to handle all of the report generation options as well as the database configuration options
- Added a command line option for passing it a config file to use instead of forcing the default database.yml
- Migrated to OptionParser Choice seems to be an abandoned gem with bugs
- Updated all the Migration code to use the new AR3 format

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
- moved everything into the nessusdb executable
- cleaned up the code
	
# 0.6.5 (August 15, 2010)
- Initial public release
