# Copyright (c) 2010-2026 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


require 'test_helper'
require 'tmpdir'

class EngagementConfigTest < ActiveSupport::TestCase
	def setup
		setup_test_database
		@tmpdir = Dir.mktmpdir
	end

	def teardown
		FileUtils.rm_rf(@tmpdir) if @tmpdir && File.exist?(@tmpdir)
	end

	def write_config(content)
		file = File.join(@tmpdir, "risu_engagement.yml")
		File.open(file, 'w') { |f| f.write(content) }
		file
	end

	def write_csv(content)
		file = File.join(@tmpdir, "shared_items_global.csv")
		File.open(file, 'w') { |f| f.write(content) }
		file
	end

	# Default config
	test "should load with defaults when no file exists" do
		config = Risu::Base::EngagementConfig.new("/nonexistent/path.yml")
		assert_equal false, config.external_assessment?
		assert_equal false, config.phishing_enabled?
		assert_equal false, config.has_unmitigated_findings?
		assert_equal [], config.recommendations
		assert_equal false, config.pen_test_enabled?
	end

	test "should return default data keys" do
		config = Risu::Base::EngagementConfig.new("/nonexistent/path.yml")
		assert config.data.key?("engagement")
		assert config.data.key?("phishing")
		assert config.data.key?("recommendations")
		assert config.data.key?("pen_test")
	end

	# Engagement section
	test "should read engagement settings from file" do
		file = write_config(<<~YAML)
			engagement:
			  external_assessment: true
			  external_date: "March 15, 2026"
			  previous_scan_date: "December 2025"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal true, config.external_assessment?
		assert_equal "March 15, 2026", config.external_date
		assert_equal "December 2025", config.previous_scan_date
	end

	# Phishing section
	test "should read phishing settings from file" do
		file = write_config(<<~YAML)
			phishing:
			  enabled: true
			  has_results: true
			  campaigns:
			    - name: "Test Campaign"
			      sent: 100
			      delivered: 100
			      opened: 20
			      clicked: 5
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal true, config.phishing_enabled?
		assert_equal true, config.phishing_has_results?
		assert_equal 1, config.campaigns.size
		assert_equal "Test Campaign", config.campaigns.first["name"]
		assert_equal 100, config.campaigns.first["sent"]
	end

	# Recommendations
	test "should read recommendations from file" do
		file = write_config(<<~YAML)
			recommendations:
			  - "Fix critical findings"
			  - "Patch servers"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal 2, config.recommendations.size
		assert_equal "Fix critical findings", config.recommendations.first
	end

	test "should read title/detail recommendations from file" do
		file = write_config(<<~YAML)
			recommendations:
			  - title: "Fix critical findings"
			    detail: "Apply patches immediately"
			  - title: "Patch servers"
			    detail: "Use WSUS"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal 2, config.recommendations.size
		assert_equal "Fix critical findings", config.recommendations.first["title"]
		assert_equal "Apply patches immediately", config.recommendations.first["detail"]
	end

	# Pen test section
	test "should read pen test settings from file" do
		file = write_config(<<~YAML)
			pen_test:
			  enabled: true
			  overall_risk: "Critical"
			  start_date: "2026-03-17"
			  end_date: "2026-03-31"
			  summary: "Test summary"
			  targets:
			    H-001:
			      ip: "10.0.0.1"
			      description: "Test Target"
			  findings:
			    - id: "F-001"
			      title: "Test Finding"
			      severity: "High"
			  recommendations:
			    - "Fix F-001"
			  tools:
			    - name: "nmap"
			      version: "7.95"
			      description: "Port Scanner"
			  glossary:
			    RCE: "Remote Code Execution"
			  references:
			    CVE-2024-1234: "https://example.com"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal true, config.pen_test_enabled?
		assert_equal "Critical", config.pen_test_overall_risk
		assert_equal "Test summary", config.pen_test_summary
		assert_equal 1, config.pen_test_targets.size
		assert_equal "10.0.0.1", config.pen_test_targets["H-001"]["ip"]
		assert_equal 1, config.pen_test_findings.size
		assert_equal "F-001", config.pen_test_findings.first["id"]
		assert_equal 1, config.pen_test_recommendations.size
		assert_equal 1, config.pen_test_tools.size
		assert_equal "nmap", config.pen_test_tools.first["name"]
		assert_equal 1, config.pen_test_glossary.size
		assert_equal "Remote Code Execution", config.pen_test_glossary["RCE"]
		assert_equal 1, config.pen_test_references.size
	end

	test "should parse pen test dates" do
		file = write_config(<<~YAML)
			pen_test:
			  enabled: true
			  start_date: "2026-03-17"
			  end_date: "2026-03-31"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		assert_equal Date.parse("2026-03-17"), config.pen_test_start_date
		assert_equal Date.parse("2026-03-31"), config.pen_test_end_date
	end

	test "should calculate pen test severity counts" do
		file = write_config(<<~YAML)
			pen_test:
			  enabled: true
			  findings:
			    - id: "F-001"
			      severity: "Critical"
			    - id: "F-002"
			      severity: "High"
			    - id: "F-003"
			      severity: "High"
			    - id: "F-004"
			      severity: "Medium"
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		counts = config.pen_test_severity_counts
		assert_equal 1, counts["Critical"]
		assert_equal 2, counts["High"]
		assert_equal 1, counts["Medium"]
		assert_equal 0, counts["Low"]
	end

	# Unmitigated findings
	test "should load unmitigated findings from CSV" do
		csv_file = write_csv(<<~CSV)
			host,mac,plugin_name,severity,unpatch_since
			10.0.0.1,AA:BB:CC:DD:EE:FF,Critical Finding,4,2024
			10.0.0.1,AA:BB:CC:DD:EE:FF,High Finding,3,2023
			10.0.0.2,AA:BB:CC:DD:EE:FE,Critical Finding,4,2024
			10.0.0.3,AA:BB:CC:DD:EE:FD,Low Finding,1,2024
		CSV

		file = write_config(<<~YAML)
			engagement:
			  has_unmitigated_findings: true
			  unmitigated_file: "#{csv_file}"
			  unmitigated_min_severity: 3
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		findings = config.unmitigated_findings

		assert findings.size > 0, "Should have findings"
		assert findings.size <= 10, "Should be limited to 10"

		# Low finding should be filtered out
		low = findings.select { |f| f[:severity] == "Low" }
		assert_equal 0, low.size, "Low findings should be filtered"
	end

	test "should sort unmitigated findings by severity then host count" do
		csv_file = write_csv(<<~CSV)
			host,mac,plugin_name,severity,unpatch_since
			10.0.0.1,AA:BB:CC:DD:EE:FF,Medium Finding,2,2024
			10.0.0.2,AA:BB:CC:DD:EE:FE,Medium Finding,2,2024
			10.0.0.3,AA:BB:CC:DD:EE:FD,Medium Finding,2,2024
			10.0.0.1,AA:BB:CC:DD:EE:FF,Critical Finding,4,2024
		CSV

		file = write_config(<<~YAML)
			engagement:
			  has_unmitigated_findings: true
			  unmitigated_file: "#{csv_file}"
			  unmitigated_min_severity: 2
		YAML

		config = Risu::Base::EngagementConfig.new(file)
		findings = config.unmitigated_findings

		assert_equal "Critical", findings.first[:severity], "Critical should be first"
	end

	test "should return empty array when no unmitigated file configured" do
		config = Risu::Base::EngagementConfig.new("/nonexistent/path.yml")
		assert_equal [], config.unmitigated_findings
	end

	# Phishing results
	test "should load phishing results from CSV" do
		csv_file = File.join(@tmpdir, "phishing.csv")
		File.open(csv_file, 'w') do |f|
			f.write("name,ip,email,status\n")
			f.write("John Doe,10.0.0.1,john@example.com,Clicked Link\n")
			f.write("Jane Doe,10.0.0.2,jane@example.com,Email Opened\n")
		end

		config = Risu::Base::EngagementConfig.new("/nonexistent/path.yml")
		results = config.load_phishing_results(csv_file)

		assert_equal 2, results.size
		assert_equal "John Doe", results.first[0]
		assert_equal "Clicked Link", results.first[3]
	end

	test "should return empty array for missing phishing file" do
		config = Risu::Base::EngagementConfig.new("/nonexistent/path.yml")
		assert_equal [], config.load_phishing_results(nil)
		assert_equal [], config.load_phishing_results("/nonexistent/file.csv")
	end

	# Config file search
	test "should search for risu_engagement.yml and risu_pen_test.yml" do
		assert Risu::Base::EngagementConfig::SEARCH_FILES.include?("risu_engagement.yml")
		assert Risu::Base::EngagementConfig::SEARCH_FILES.include?("risu_pen_test.yml")
	end

	# Environment variable override
	test "should respect RISU_ENGAGEMENT_CONFIG environment variable" do
		file = write_config(<<~YAML)
			engagement:
			  external_assessment: true
		YAML

		ENV["RISU_ENGAGEMENT_CONFIG"] = file
		config = Risu::Base::EngagementConfig.new
		assert_equal true, config.external_assessment?
		ENV.delete("RISU_ENGAGEMENT_CONFIG")
	end
end
