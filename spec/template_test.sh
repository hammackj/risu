#!/usr/bin/env bash

echo "assets" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/assets.rb -o assets.pdf &&

echo "stats" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/finding_statistics.rb -o stats.pdf &&

echo "graphs" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/graphs.rb -o graphs.pdf &&

echo "pci" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/pci_compliance.rb -o pci.pdf &&

echo "tech" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/technical_findings.rb -o tech.pdf &&

echo "exec_summary" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/exec_summary.rb -o exec.pdf &&

echo "findings_summary" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/findings_summary.rb -o findings_summary.pdf &&

echo "host_summary" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/host_summary.rb -o host_summary.pdf &&

echo "ms_patch_summary" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/ms_patch_summary.rb -o patches.pdf &&

echo "ms_update_summary" &&
../bin/nessusdb --author "Jacob" -t ../lib/nessusdb/templates/ms_updates_summary.rb -o updates.pdf