#!/usr/bin/env bash

echo "assets" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/assets.rb -o assets.pdf &&

echo "stats" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/finding_statistics.rb -o stats.pdf &&

echo "graphs" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/graphs.rb -o graphs.pdf &&

echo "pci" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/pci_compliance.rb -o pci.pdf &&

echo "tech" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/technical_findings.rb -o tech.pdf &&

echo "exec_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/exec_summary.rb -o exec.pdf &&

echo "findings_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/findings_summary.rb -o findings_summary.pdf &&

echo "host_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/host_summary.rb -o host_summary.pdf &&

echo "ms_patch_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/ms_patch_summary.rb -o patches.pdf &&

echo "ms_update_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/ms_update_summary.rb -o updates.pdf &&

echo "findings_host" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/findings_host.rb -o findings_host.pdf &&

echo "cover_sheet" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/cover_sheet.rb -o cover_sheet.pdf &&

echo "executive_summary" &&
../bin/risu --config-file test.cfg -t ../lib/risu/templates/executive_summary.rb -o executive_summary.pdf
