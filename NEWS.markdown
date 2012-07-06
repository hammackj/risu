# News

#1.5.1 (August 1, 2012)
- Initial release of a web gui for viewing data
  - Enabled via risu --webgui
	- Browse to http://localhost:8969 to view it
- Host Model
  - top_n_vulnerable(n)
  - risks_by_host(n); updated the query critical instead of high
- Item Model
  - adjective_for_risk_text
  - risk_text
  - calculate_vulnerable_host_percent
- References Model
	- added iavb method
	- added iavt method
	- added cisco_sa method
	- added cisco_bug_id method
	- added ics_alert method
- Lots of unit tests added along with travis-ci
- Fixed a divided by zero bug on all graphs related to Gruff on Ruby 1.9.3
- New Tags
	- pcidss_backup_files added to the Host Model
	- iavb added as a reference
	- iavt added as a reference
	- cisco-sa as a reference
	- cisco-bug-id as a reference
	- ics-alert as a reference
- Known Issues
	- Sqlite3 is really slow when parsing, This seems to be a known Sqlite issue.
		I recommend using Mysql for the time being as the default database.

#1.5.0 (February 20, 2012)
- Updated the Item model to be compatible with Nessus 5.0
	- Added critical_risks()
	- Added critical_risks_unique()
	- Added critical to the Risks by Severity Graph
	- Everything that used High as its data now uses Critical
	- The new methods also have associated tests.
- Updated the Plugin model to be compatible with Nessus 5.0
	- Added critical_risks()
- Added New tags
	- Plugin Model
		- fname
	- Item Model
		- plugin_name (Not all plugins seem to support this XML struct yet, maybe nil at times; might add a fix up post processing like ips)
- Added new Methods to the Reference class for accessing references easier
	- cve
	- cpe
	- cwe
	- iava
	- msft
	- osvdb
	- owasp
	- cert
	- edb_id
	- rhsa
	- secunia
	- suse
- Added new methods to the Item class
	- stigs_severity_graph()
	- stig_findings()
	- all_risks_unique_sorted() from [aeriff] on github
- New Templates
	- stig_findings_summary - Quick summary of all the stig related findings by severity
- Template Updates
	- technical_findings - Added critical risks
	- exec_summary - added critical risks and a stig graph
	- findings_host - added critical and lowered the font sizes a bunch
	- notable_detailed - added critical and changed header to Notable
	- exec_summary_detailed - added critical risks
	- host_summary - added critical risks
	- graphs - added stig graph
	- host_summary - added critical risks and page numbers
	- Misc changes in other templates
- Added test::unit tests for most of the specs

#1.4.9 (January 23, 2012)
- Added a simple notable vulnerability template table report
- Added a detailed notable vulnerability template like the technical_findings report just limited to the top vulnerabilities up to 10
- API for the top 10 vulnerabilities can be found on the Item model
	- top_10_sorted_raw(), returns the top 10 vulnerabilities in an Array sorted in the form of [plugin_id, count]
	- top_10_sorted(), returns the top 10 vulnerabilities in an Array sorted in the form of [name, count]
	- top_10_table(output), inserts a table into the output parameter object with the top 10 data using the top_10_sorted() method
- All report template classification headers are forced upper case
- Added 6 PCI related fields
	- pcidss:directory_browsing
	- pcidss:known_credentials
	- pcidss:compromised_host:worm
	- pcidss:unprotected_mssql_db
	- pcidss:obsolete_software
	- pcidss:www:sql_injection
- Added New XML fields
	- exploit_framework_exploithub
	- exploithub_sku
	- stig_severity
- Item.risks_by_host now only returns High findings. New accessors for each level will be added for 1.5 with support for the next version of Nessus
- Fixed a bug on the exec_summary_detailed detailed report
- A quick reference for Microsoft findings can now be found in the Patch model,
You are able to get host_id, name(patch name, ie MS01-001), value (plugin_id)
- Please report any missing tags that risu outputs to jacob[dot]hammackj[@]hammackj[.]com, I expect a ton of Microsoft Patch tags missing

#1.4.8 (August 21, 2011)
- Fixed a gemspec dependency error reported by mlpotgieter
- Fixed a parser error related to Microsoft Bulletins report by stevelodin
- Added a Table for all host related patches, currently only has Microsoft Bulletins
You can access it via `Host.first.patches` or `Patch.all`
- Please report any missing tags that risu outputs to jacob[dot]hammackj[@]hammackj[.]com, I expect a ton of Microsoft Patch tags missing

#1.4.7 (August 13, 2011)
- Fixed issue #39 Ruby 1.8.7 Syntax error reported by mlpotgieter
- Ruby 1.8.7 will no longer be supported in v1.5, please upgrade your ruby installs.

#1.4.6 (July 12, 2011)
- Added pcidss:dns_zone_transfer to the Nessus parser
- Added pcidss:obsolete_operating_system to the Nessus parser
- Removed warnings about several Microsoft patch tags, not sure what to do with them at the moment.
- Added a user template directory. Risu will scan ~/.risu/templates for user templates.

#1.4.5 (July 4, 2011)
- Implemented an modular template system, **breaks all existing templates**.
	- All templates are now implemented as Ruby classes this allows them to be dynamically loaded and removes the need to type the entire path to the template
	- This allows me to implement rendering systems that will be able to write pdf/html/rtf/csv in the future without having to have templates for each type
- Updated the Severity Graph and added some auto generated text based on the graph percentages
- Added a method to generate text for the other_os_graph
- Added a method to generate text for the windows_os_graph
- Added some auto generated text for unsupported operating systems to put into a report.
- Added AIX named_scopes on the Host model (os_aix and not_os_aix)
- Unified the colors to be the same for all the graphs
- Added validation of the XML files for Nessus Documents
- Added 'system_type' field to the Nessus parser

#1.4.4 (May 28, 2011)
- NessusDB has been renamed to risu, NessusDB gem now install risu and warns you.
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
