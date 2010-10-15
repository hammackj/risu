TODO
===
1.0 - Complete

1.1
---
	- Provide more templates
		- PCI Complience
		- Virtual Machines
		- 
	- Add Schema checks to make sure the schema is compatible
	- Sort Technical Findings Report by count/score	
	- add blacklist stuff to config file
	- [added] New HostProperties attribute: pci-dss-compliance. Please report this to jacob.hammack@hammackj.com
	- [added] New XML element detected: exploitability_ease. Please report this to jacob.hammack@hammackj.com
	- [added] New XML element detected: cvss_temporal_vector. Please report this to jacob.hammack@hammackj.com
	- [added] New XML element detected: exploit_framework_core. Please report this to jacob.hammack@hammackj.com
	- [added] New XML element detected: cvss_temporal_score. Please report this to jacob.hammack@hammackj.com
	- [added] New XML element detected: exploit_available. Please report this to jacob.hammack@hammackj.com
	
	[hammackj@taco:~/Projects/private/hammackjllc/assessments/2010/rockstarunix]$ nessusdb -t /Library/Ruby/Gems/1.8/gems/nessusdb-1.0.0/lib/nessusdb/templates/technical_findings.rb --author "Jacob Hammack, CISSP" -o rockstarunix-technical-findings.pdf
	/Library/Ruby/Gems/1.8/gems/nessusdb-1.0.0/bin/../lib/nessusdb/findings.rb:43:in `initialize': undefined method `[]' for nil:NilClass (NoMethodError)
		from /Library/Ruby/Gems/1.8/gems/nessusdb-1.0.0/bin/nessusdb:203:in `new'
		from /Library/Ruby/Gems/1.8/gems/nessusdb-1.0.0/bin/nessusdb:203:in `main'
		from /Library/Ruby/Gems/1.8/gems/nessusdb-1.0.0/bin/nessusdb:222
		from /usr/bin/nessusdb:19:in `load'
		from /usr/bin/nessusdb:19

	- Error check the blacklist stuff =\

1.2
---
	- Move to ActiveRecord 3.0
	- tests!
