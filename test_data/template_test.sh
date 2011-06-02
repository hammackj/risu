#!/usr/bin/env bash

rm *.pdf

echo "assets" &&
../bin/risu --config-file test.cfg -t assets -o assets.pdf &&

echo "stats" &&
../bin/risu --config-file test.cfg -t finding_statistics -o stats.pdf &&

echo "graphs" &&
../bin/risu --config-file test.cfg -t graphs -o graphs.pdf &&

echo "pci" &&
../bin/risu --config-file test.cfg -t pci_compliance -o pci.pdf &&

echo "tech" &&
../bin/risu --config-file test.cfg -t technical_findings -o tech.pdf &&

echo "exec_summary" &&
../bin/risu --config-file test.cfg -t exec_summary -o exec.pdf &&

echo "findings_summary" &&
../bin/risu --config-file test.cfg -t findings_summary -o findings_summary.pdf &&

echo "host_summary" &&
../bin/risu --config-file test.cfg -t host_summary -o host_summary.pdf &&

echo "ms_patch_summary" &&
../bin/risu --config-file test.cfg -t ms_patch_summary -o patches.pdf &&

echo "ms_update_summary" &&
../bin/risu --config-file test.cfg -t ms_update_summary -o updates.pdf &&

echo "findings_host" &&
../bin/risu --config-file test.cfg -t findings_host -o findings_host.pdf &&

echo "cover_sheet" &&
../bin/risu --config-file test.cfg -t cover_sheet -o cover_sheet.pdf &&

echo "executive_summary" &&
../bin/risu --config-file test.cfg -t executive_summary -o executive_summary.pdf
