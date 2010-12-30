TODO
===

1.2
---
	- Move to ActiveRecord 3.0
	- Use named scope to clean up the interface to using findings
	- Create rSpec tests for everything
	- Create test fixutures
	- Check to see that the xml is version 2
		- Version 1 = NessusClientData
		- Version 2 = NessusClientData_V2
	
1.3
---
	- Rework the blacklisting stuff
	- Create a config file to store variables in
		- add blacklist stuff to config
	- Provide more templates
		- Virtual Machine Summary
		- Microsoft Patches Summary
		- Fix list Report?
	- Add Schema checks to make sure the schema is compatible with the version of nessusdb
	- Sort Technical Findings Report by count/score	
	- Add template validation and more error checking
	- Colorize the reports with better style

1.4
---
	- Clean up / Bug fixes before 1.5

1.5
---
	- Rails FrontEnd to NessusDB