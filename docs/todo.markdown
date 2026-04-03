# TODO

**Release dates and road map are estimates, and features can be changed at any time.**

# Known Bugs
- OS's with 2000 or XP can be misidentified by Nessus showing both, messing up some of the graphs

# Ideas

## Templates
- SSL Summary report (certificate issues, weak ciphers, expired certs across the network)
- Fix List report (per host, ordered by risk, with CVE references)
- Virtual Machine Summary (plugin 20094)
- Compliance audit summary (pass/fail by category using cm_compliance_* fields)
- Root cause breakdown report (dedicated report for Vendor Patch / Configuration / Vendor Support)

## Models
- Add IBM to the OS named scopes
- Item.search_plugin_output(keyword) for ad-hoc searches

## Graphs
- Unsupported vs supported OS graph
- Malware infection graph (infected vs clean hosts)
- Detailed Linux OS distribution graph

## Parsers
- Add parser for Nmap XML
- Add parser for OpenVAS output

## Console
- Generate reports from the console
- List scans in database via CLI

## Testing
- Add mock data for WSUS plugin 58133
- Add mock data for PCI DSS compliance (passed/failed)
- Parser tests for new XML elements and host property tags

## Documentation
- Template creation tutorial
- Config file documentation
- Update GitHub pages
