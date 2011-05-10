#!/usr/bin/env bash

echo "assets" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/assets.rb -o assets.pdf &&

echo "stats" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/finding_statistics.rb -o stats.pdf &&

echo "graphs" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/graphs.rb -o graphs.pdf &&

echo "pci" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/pci_compliance.rb -o pci.pdf &&

echo "tech" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/technical_findings.rb -o tech.pdf &&

echo "exec_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/exec_summary.rb -o exec.pdf &&

echo "findings_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/findings_summary.rb -o findings_summary.pdf &&

echo "host_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/host_summary.rb -o host_summary.pdf &&

echo "ms_patch_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/ms_patch_summary.rb -o patches.pdf &&

echo "ms_update_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/ms_update_summary.rb -o updates.pdf &&

echo "findings_host" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/findings_host.rb -o findings_host.pdf &&

echo "cover_sheet" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/cover_sheet.rb -o cover_sheet.pdf &&

echo "executive_summary" &&
../bin/nessusdb --config-file test.cfg -t ../lib/nessusdb/templates/executive_summary.rb -o executive_summary.pdf
