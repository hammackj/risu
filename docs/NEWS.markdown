# News

# 1.8.4 (Feburary 6, 2020)
- A great deal of changes/bug fixes/post processing

# 1.8.3 (July 11, 2017)
- Updated PostProcessing plugin id's
- Added new PostProcessing plugin NormalizePluginNames
	- It removes most of the (STRING) things from plugin names, the list is still going,
		please submit issues for any that have been missed.
- Fixed #62, removed stacktrace from common error
- Close all other open issues, some were several years old
- Added basic Code of Conduct and Contributing guidelines

# 1.8.2 (July 6, 2017)
- Fixed documentation issue

# 1.8.1 (July 6, 2017)
- Updated PostProcessing plugins
- Fixed #107 where plugin_name was to short in the schema

# 1.8.0 (February 11, 2017)
- **Moved repo from http://github.com/arxopia/risu to http://github.com/hammackj/risu**
- **Upgraded to Rails 5**
- Added gem signing
- Lots of clean up for Rails 5 and Ruby 2.4
- Various improvements / fixes [@abenson]
- Post Processing Updates
	- Added 7-Zip
	- Added Foxit Phantom PDF
	- Added RealPlayer
	- Added Skype
	- Updated OpenSSH plugin list
	- Updated VMware ESXi plugin list
	- Updated Apple QuickTime
	- Updated Cisco AnyConnect
	- Updated Firefox
	- Updated Foxit Reader
	- Updated Google Chrome
	- Updated Java
	- Updated Libre Office
	- Updated Windows updates
	- Updated Wireshark

# 1.7.9 (July 1, 2016)
- Updated RootCauses
- Fixed issue #99 with the FindingsHost template enumerating the wrong findings. [@ghuisman]
- Fixed issue #94 Where some fields in the Schema were strings instead of bool [@abenson]

# 1.7.8 (June 25, 2016)
- Changed license from 3 clause BSD to MIT.

# 1.7.7 (June 25, 2016)
- **NOTICE** Only ruby-2.2.1 and above are supported now. Please upgrade.
- Merge pull request #90 to add a new Banner for the console from [abenson]
- Updated Java, Windows, ESXi post-processing plugin-ids
- Templates
	- Added a count of hosts on the host listings on the notable_detailed and technical_findings templates.
	- Added more fields to the host_findings_csv template.
- Loads of updates to the PostProcessing Plugins
- Some changes based on code climate reports

# 1.7.6 (December 02, 2015)
- **NOTICE** Upon next major release, "1.8.0" ruby-2.2.1+ will only be supported. This is due to rails5 dropping support for all previous versions. Risu 1.8.0 will be release shortly after rails5 with this change.
- **API CHANGES** Several APIs have been marked deprecated they will be moved in 1.8.0. Stubs will be left behind with warnings until 1.9.0. These changes are mostly to clean up the Models. Right now the models are very fat and interdependent on things they shouldn't. Some of the notable changes will be:
	- Graphs will be moved to Risu::Graphs
	- TemplateHelpers will be moved to Risu::TemplateHelpers
- When new tags are encountered they are reported after each file now, as a uniqued list. This removes the spam of new tags.
- Updated the dependent gems to the latest versions and removed exact version pinning.
	- rails 4.2.5
	- libxml-ruby 2.8.0
	- prawn 2.0.2
	- gruff 0.6.0
	- mysql2 0.4.2
	- rmagick 2.15.4
	- sqlite3 1.3.11
	- nokogiri 1.6.7
- Massive updates to unit tests
- Post Processing
	- Updated OpenSSH plugin list
	- Updated VMware ESXi plugin list
- Tons of minor tweaks and other changes

# 1.7.5 (November 6, 2015)
- Added initial test for HostProperties
- Added fixture for HostProperties testing
- Added VMware vCenter Post Processing
- Added VMware Player Post Processing
- Added WinSCP Post Processing
- Added non rounded risk % text methods
- Added SigPlus Pro post process
- Added epo HostProperty
- Updated Flash Player plugin list
- Updated Adobe Reader plugin list
- Updated Root Cause post processing
- Updated Windows Post Processing
- Updated Apache Post Processing
- Updated Java Post Processing
- Updated Item.notable_order_by_cvss_raw to pull in high findings if there are less than 10 critical findings
- Added new tags in_the_news, exploited_by_nessus, unsupported_by_vendor, default_account
- Downgraded FTP Privileged Port Bounce Scan to 0
- Added vSphere client post processing
- Added PCanywhere Post Processing
- Added Foxit Reader Post Processing
- Added Firefox Postprocessing
- Added VLC Post Processing
- Added a postprocess for downgrading plugins
- Added blackberry enterprise server Post Processing
- More support for windows 2003 unsupported
- Added DNS to the cvs output
- Added potentinal_vulnerability field
- Added support for unsupported windows 2003
- Test for potential_vunerability field
- Fixture for new field test
- Added docker container [jkordish]
- Added support for the agent field
- Added a default creds plugin

# 1.7.4 (January 25, 2015)
- Added New tags to the model Item
	- cm:compliance-reference
	- cm:compliance-see-also-
	- cm:compliance-solution
- Increased the database size of all cm:compliance tags from string to text

# 1.7.3 (January 8, 2015)
- Parser Optimizations by [@bluehavana]
- Renamed Attachment.type to Attachment.ttype, due to a rails naming issue
- Added SAX Parser tests for Attachments
- Rewrote the technical_findings template
- Template Helper
	- Added title method
	- Added definition method
- Fixed various bugs

# 1.7.2 (January 5, 2015)
- Updated Copyrights / etc
- Added VMware ESXi Post Processing
- Added DB2 Post Processing
- Updated Default Credential plugin list
- Updated many of the post processing plugins
- Models
	- HostProperty Model
		- UnsupportedProduct

# 1.7.1 (September 25, 2014)
- Updated Windows Patch Rollup
- Added CA Brightstor Arcserve Backup Rollup
- Updated the RootCause plug-ins list
- Updated some of the default credential plug-ins list
- Models
	- HostProperty Model
		- UnsupportedProduct:microsoft:windows_xp
		- UnsupportedProduct:microsoft:windows_2000

# 1.7.0 (September 12, 2014)
- Update Copyrights to 2014
- Wiki
	- New page for installing on [OSX]((https://github.com/hammackj/risu/wiki/OSX-Installation-Guide)
- Models
	- Host Model
		- Changed the field type of 'mac' from string to text to increase the size
		- windows_os_graph_has_data()
	- HostProperty Model
		- Added pcidss:insecure_http_methods tag
		- Added cpe-XXXX, where XXXX is a digit of the number of CPE found for that host.
		- Added LastUnauthenticatedResults tag
		- Added LastAuthenticatedResults tag
		- Added Credentialed_Scan tag
		- Added policy-used tag
		- Added KBXXXXXX tag, used for Microsoft patches
	- Plugin
		- Added exploited_by_malware
		- Added compliance
		- Added root_cause; This is a custom field which will be manually filled over time with the root_cause of
			the vulnerability, this data will be inserted with a post-processing plug-in
		- Added root_cause_graph()
		- Added root_cause_graph_text()
	- Item
		- Added exploitablity_matrix method, returns and formatted array of findings based on parameters.
		- Added calculate_vulnerable_host_percent_with_patches_applied method, which calculates the vulnerable host percent
			after removing all of the notable findings. This gives a sense of how the network would be after patching
		- Added risk_percent_patched_rounded_text
	- Reference
		- Added hp.
		- Added glsa.
		- Added freebsd.
		- *Experimental Post Processing*, Sums up the findings and removes the duplicates. This allows for cleaner
			authenticated reports. Very experimental at the moment, the are auto loaded from the same directories as templates
			for the time being
	- Use of the --post-process command line option will turn this on and off
	- Java Plugins
	- Adobe Reader plugins
	- Flash Player plugins
	- Serv-U plugins
	- Adobe Air plugins
	- OpenSSH plugins
	- Wireshark plugins
	- Oracle Database plugins
	- Shockwave Player plugins
	- Google Chrome plugins
	- CoreFtp plugins
	- FLEXNet plugins
	- PHP plugins
	- Apache plugins
	- HP System Management Homepage
	- OpenSSL Plugins
	- Windows OS plugins
	- RootCause processing, this adds a subjective root cause to every plugin that I have seen / had to time do.
- Renderers
	- Added support for CSV output check out the host_findings_csv.rb template for an example of how to do it
- Templates
	- Updated the default color scheme for graphs to look a little better
	- Templates will now be searched for in the current directory.
		- Templates will be searched for in the following places:
			- The risu template directory in $GEM_HOME/gems/risu-1.7.0/lib/risu/templates/
			- The current directory
			- The user directory of ~/.risu/templates/
	- Added host_findings_csv.rb template
	- Added "Failed compliance audits" template [abenson]
	- Added "Exploitablity Summary Report" template
	- Added "Talking Points Report" template
	- Added "Missing Root Cause Report" template
	- Templates must now specify their renderer :renderer => "PDF" or :renderer => "CSV" in the template_info section.
		This will break all templates until it is added.
	- Template Helper
		- Added a table method to generate a table in 1 line of code
		- Added a new_page method to create a page break in the report
		- Added other_os_graph_page, This generates a page for the PDF renderer with the
			other_os_graph and other_os_graph_text followed by a new_page
		- item_count_by_plugin_name
		- item_count_by_plugin_id
		- default_credentials_section
		- default_credentials_appendix_section
		- has_default_credentials?
		- default_credential_plugins
		- Added MalwareTemplateHelper, this is included by TemplateHelper. It provides:
			- malware_section()
			- malware_appendix_section()
			- conficker_section()
			- conficker_appendix_section()
			- conficker_count()
		- Added HostTemplateHelper, this is included by TemplateHelper. It provides:
			- unsupported_os_appendix_section()
			- unsupported_os()
		- Added GraphTemplateHelper, this is included by TemplateHelper. It provides:
			- other_os_graph_page()
			- windows_os_graph_page()
			- risks_by_severity_graph_page()
			- risks_by_service_graph_page()
			- root_cause_graph_page()
- Probably other things I forgot to track...

#1.6.3 (October 01, 2013)
- Rails 4.0 compatibility, backwards rails compatibility doesn't exist. You will need to update any plugins using old Rails APIs
- Support for Ruby less than 1.9.3 also doesn't exist
- Schema
	- Changed size of ServerPreferences.value to text instead of string. Pull Request from [alanjones]
	- Changed size of HostProperties.value to text instead of string. Pull Request from [@alanjones]
	- Changed size of References.value to text instead of string. Pull Request from [@alanjones]
- Models
	- Policy Model
		- Added policy_comments
	- HostProperty Model
		- Added patch-summary-total-cves
		- Added patch-summary-cve-num-{HASH}
		- Added patch-summary-cves-{HASH}
		- Added patch-summary-txt-{HASH}
	- Plugin Model
		- Added script_version
		- Added d2_elliot_name
		- Added exploit_framework_d2_elliot
	- Attachment Model ***NEW***
		- New Model for attachment meta-data
			- Please note this is just the hash of the attachment, the real attachment is not in the .nessus file.
- Templates
	- Added initial malicious process detection template based on plugin #59275,
		it is rough at the moment but good for viewing all the findings. It requires
		that local checks were run, for the plugin to fire during the Nessus scan.
- Wiki
	- New page for installing on [Kali Linux](https://github.com/hammackj/risu/wiki/Kali-Linux-Risu-Installation-Guide)
- Post Processing (Alpha Support)
	- Started to develop a method for doing post processing on all the findings
		- Initial RiskScore plugin to calculate a risk score for Plugins / Findings / Hosts

#1.6.2 (March 13, 2013)
- pci_compliance template - Corrected a bug that prevented it from working. Reported by [jkordish]
- Added Report.extra to contain any extra risu.config yaml settings to be passed to a report
	- Check for nil before using it!
	- It will contain all tags in the report: section of the config file

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
	- New page for installing on [Fedora](https://github.com/hammackj/risu/wiki/Fedora-Installation-Guide)
	- New page for installing on [CentOS](https://github.com/hammackj/risu/wiki/CentOS-Installation-Guide)
	- New page for installing on [Gentoo](https://github.com/hammackj/risu/wiki/Gentoo-Installation-Guide)
	- New page for installing on [ArchLinux](https://github.com/hammackj/risu/wiki/Arch-Linux-Install-Guide)

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
- Please report any missing tags that risu outputs to jacob.hammack[@]hammackj[.]com, I expect a ton of Microsoft Patch tags missing

#1.4.8 (August 21, 2011)
- Fixed a gemspec dependency error reported by mlpotgieter
- Fixed a parser error related to Microsoft Bulletins report by stevelodin
- Added a Table for all host related patches, currently only has Microsoft Bulletins
You can access it via `Host.first.patches` or `Patch.all`
- Please report any missing tags that risu outputs to jacob.hammack[@]hammackj[.]com, I expect a ton of Microsoft Patch tags missing

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

**This is the last release under the NessusDB name, I received a legal notice to change the name. They gave me a few weeks to change the name but I do not have a new name yet. If you have any suggestions please submit them to jacob.hammack[@]hammackj[.]com**

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

# 1.4.2 (May 13, 2011)

- Added a fix for all of the MSXX-XXX Host Properties tags that don't serve any purpose
- Added sqlite3 as an install dependency to help with sqlite usage
- Fixed a privately report bug with the *_risks_unique_sorted* functions not working on MySQL

# 1.4.1 (May 10, 2011)

- Fixed a issue with a nonexistent 'Critical' severity.
- Added VMware ESX to the Other OS graph Ticket #33
- windows_os_graph were using the wrong counters Ticket #32
- Updated the Prawn gem version to 0.11.1

# 1.4.0 (April 20, 2011)

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
