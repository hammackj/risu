# News

#1.6.1 (March 1, 2013)
- Models
	- Reference Model
		- Added usn
	- HostProperty Model ***NEW***
		- New model for each HostProperty off of ReportHost
		- The table is name / value for each property
		- All netstat / traceroute tags will be in this new table there can be up to 65k entries for each protocol and 255 traceroute entries per host

# 1.6 (February 27, 2013)
***Official support for Ruby versions less than 1.9.3 has been dropped due to Rails 4***

- Changed all copyright to Arxopia LLC. instead of myself for legal protection, **Nothing changes** the project will always be open source and free (as in cost)
- Fixed several missing requires for Sqlite3 and Rails
- Default template font size is now 10pt
- Added TemplateHelper mixin for templates to use. The goal is to abstract Prawn in-line code out of the templates over the next few releases to allow for dynamic output to different formats.Currently it adds the following methods to each template it is included in:
	- report_title(title, newline=false) #font size 24 + bold + center
	- report_subtitle(title, newline=false) #font size 18 + bold + center
	- report_author(author, newline=false) #font size 24 + bold + center
	- report_classification(classification=Report.classification.upcase, newline=true)
	- report_text(text, options={})
	- heading1 #font size 24 + bold
	- heading2 #font size 18 + bold
	- heading3 #font size 14 + bold
	- heading4 #font size 12 + bold
	- heading5 #font size 10 + bold
	- heading6 #font size 8 + bold
- Models
	- Reference Model
		- Added methods
			- reference_string #Returns a full string of all the references
			- reference_string_by(type) #Returns a string of all the references by type, Where type is the output of a Reference.type(ex. Reference.cve)
	- Host Model
		- Added methods
			- ip_list #Generates a list of hosts from the database, returns a string \n delimited
			- unsupported_os? #Checks to see if there was any unsupported OS in the scan
			- os_windows_8
			- not_os_windows_8
			- os_windows_2k12
			- not_is_windows_2k12
		- Changed the wording `other_os_graph_text` to indicate that its just a percentage of the non windows computers
		- Added 'bios_uuid' Property 
	- Reference Model
		- Added cert-cc, 
		- Added apple-sa
		- Added icsa 
		- Added msvr
	- Plugin Model
		- cvss_base_score is now a float in the schema, this change should be transparent
			- When assigning to it, the value is converted to a float and when retrieving it, it is converted to a string.
	- Item Model
		- Added methods
			- medium_risks_by_host
			- low_risks_by_host
			- plugin
		- Rewrote the notable_order_by_cvss_raw
- Schema Changes
	- Added owner and visibility to the Policy Table
	- Added traceroute_hop_0-2 to the Host Properties
- Templates
	- notable
		- cleaned up and updated to use the TemplateHelper mixin
	- notable_detailed
		- cleaned up and updated to use the TemplateHelper mixin
		- the new reference helpers
		- host names are now show with ip addresses
	- technical_findings
		- cleaned up and updated to use the TemplateHelper mixin
		- new reference helpers
		- also fixed a bug with a trailing blank page
		- host names are now show with ip addresses
	- findings_summary
		- cleaned up and updated to use the TemplateHelper mixin
		- simplified the repeated code
	- ms_patch_summary
		- cleaned up and updated to use the TemplateHelper mixin
	- pci_compliance
		- cleaned up and updated to use the TemplateHelper mixin
	- template
		- cleaned up and updated to use the TemplateHelper mixin
- Wiki Pages
	- New page for installing on [Fedora](https://github.com/arxopia/risu/wiki/Fedora-Installation-Guide)
	- New page for installing on [CentOS](https://github.com/arxopia/risu/wiki/CentOS-Installation-Guide)
	- New page for installing on [Gentoo](https://github.com/arxopia/risu/wiki/Gentoo-Installation-Guide)
	- New page for installing on [ArchLinux](https://github.com/arxopia/risu/wiki/Arch-Linux-Install-Guide)

#1.5.3 (August 29, 2012)
- New Parsed Tags
	- cm_compliance_info
	- cm_compliance_actual_value
	- cm_compliance_check_id
	- cm_compliance_policy_value
	- cm_compliance_audit_file
	- cm_compliance_check_name
	- cm_compliance_result
	- cm_compliance_output
- Model Changes
	- Host
		- Added os_windows_98
		- Added not_os_windows_98
		- Added os_windows_95
		- Added not_os_windows_95
		- Added os_windows_me
		- Added not_os_windows_me
		- Updated the unsupported operating systems text to take into account these operating systems

#1.5.2 (July 30, 2012)
- New Parsed Tags
	- vmsa
	- cert-vu
- Model Changes
	- Reference Model
		- Added vmsa() method
		- Added cert_vu() method
- Switched from the 'mysql' gem to the 'mysql2' gem for better rails3 support with mysql databases
	- Note: **This means you need to specify mysql2 as the database adapter**
- Fixed Ticket #57, which had a sqlite specific query, breaking the query on MySql. Reported by Drew Brunson
- A few typos and spelling errors corrected
- Added some PRAGMA's that might speed up SQLite3 usage. If it is still to slow (on insert) It is recommended to use MySQL.

#1.5.1 (July 10, 2012)
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
	- added cisco_sr method
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
	- cisco-sr as a reference
	- always_run added to the Item Model (Related to a Registry Svc Check)
- Spell-checked all of the templates and fixed some spelling issues
- Added a template for the WSUS Patch Management Report Nessus Plugin ID: 58133
- In the -v, --version option displays the version of ruby and the version of rubygems
- Thank you to everyone that has submitted new tags/bug reports/etc
- Also Thank you for all the kind words related to the tool also.
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
- Please report any missing tags that risu outputs to risu[@]arxopia[.]com, I expect a ton of Microsoft Patch tags missing

#1.4.8 (August 21, 2011)
- Fixed a gemspec dependency error reported by mlpotgieter
- Fixed a parser error related to Microsoft Bulletins report by stevelodin
- Added a Table for all host related patches, currently only has Microsoft Bulletins
You can access it via `Host.first.patches` or `Patch.all`
- Please report any missing tags that risu outputs to risu[@]arxopia[.]com, I expect a ton of Microsoft Patch tags missing

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

**This is the last release under the NessusDB name, I received a legal notice to change the name. They gave me a few weeks to change the name but I do not have a new name yet. If you have any suggestions please submit them to risu[@]arxopia[.]com**

- Fixed small bug in Windows/Other OS graphs
- Increased the verboseness of Error messages Ticket #29
- Added named scopes off the Plugin class Ticket #34
- Added new PCI related HostProperties Ticket #35
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
