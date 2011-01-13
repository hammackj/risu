# News #

# 1.2.0 (January 05, 2011) #
**This update breaks all existing templates, included templates are updated**
	
- Preformed some code clean up
- Fixed a ton of typos
- Deprecated the Findings class, please use the named scopes on each ActiveRecord object
- All queries should now be using ActiveRecord3, except for the Findings class that will be removed in the next release
- Ported all the templates to use the new ActiveRecord3 style

# 1.1.0 (October 22, 2010) #
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
	
# 1.0.0 (October 8, 2010) #
- Cleaned up more code
- Fixed a Mysql error for when the tables do not exist.
	
# 0.6.6 (October 4, 2010) #
- Moved to prawn for pdf output
- added templates for the new prawn output
- added checks to warn when there are new xml tags
- moved everything into the nessusdb executable
- cleaned up the code
	
# 0.6.5 (August 15, 2010) #
- Initial public release
