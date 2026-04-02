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


require 'yaml'

module Risu
	module Base

		# EngagementConfig loads per-engagement configuration from a YAML file.
		#
		# This provides all non-scan data needed by report templates: phishing
		# campaign results, pen test findings, recommendations, unmitigated
		# findings from risu_db_diff, and engagement metadata.
		#
		# == Config File Resolution
		#
		# The config file is resolved in this order:
		#   1. Explicit file path passed to initialize
		#   2. RISU_ENGAGEMENT_CONFIG environment variable
		#   3. First match from SEARCH_FILES in the current working directory
		#   4. Falls back to DEFAULTS if no file is found
		#
		# == Usage
		#
		#   config = Risu::Base::EngagementConfig.new
		#   config = Risu::Base::EngagementConfig.new("/path/to/risu_engagement.yml")
		#
		# == YAML Structure
		#
		# The config file has four top-level sections:
		#
		#   engagement:     Vulnerability assessment settings (external assessment,
		#                   unmitigated findings, previous scan date)
		#   phishing:       Phishing campaign data (campaigns, results files)
		#   recommendations: Prioritized remediation list (plain strings or
		#                   title/detail objects)
		#   pen_test:       Penetration test data (targets, findings, risk matrix,
		#                   tools, glossary, references, conclusion)
		#
		# See docs/risu_engagement.yml.example for the full schema.
		#
		class EngagementConfig
			# @return [Hash] The merged configuration data
			attr_reader :data

			# Default config filename
			DEFAULT_FILE = "risu_engagement.yml"

			# Default values for all config sections. Merged with the loaded
			# YAML so that missing keys don't cause nil errors.
			DEFAULTS = {
				"engagement" => {
					"external_assessment" => false,
					"external_date" => nil,
					"has_unmitigated_findings" => false,
					"unmitigated_file" => nil,
					"unmitigated_min_severity" => 3,
					"previous_scan_date" => nil,
					"confidentiality_level" => "Confidential"
				},
				"phishing" => {
					"enabled" => false,
					"has_results" => false,
					"campaigns" => []
				},
				"recommendations" => [],
				"pen_test" => {
					"enabled" => false,
					"overall_risk" => "Low",
					"start_date" => nil,
					"end_date" => nil,
					"summary" => "",
					"targets" => {},
					"open_ports" => [],
					"findings" => [],
					"risk_matrix" => [],
					"recommendations" => [],
					"tools" => [],
					"glossary" => {},
					"references" => {}
				}
			}

			# Files to search for in the current working directory
			SEARCH_FILES = [
				"risu_engagement.yml",
				"risu_pen_test.yml"
			].freeze

			# Loads engagement configuration from a YAML file.
			#
			# @param file [String, nil] Path to config file. If nil, searches
			#   ENV["RISU_ENGAGEMENT_CONFIG"] then SEARCH_FILES in the CWD.
			def initialize(file = nil)
				file ||= ENV["RISU_ENGAGEMENT_CONFIG"]
				file ||= find_config_file

				if file && File.exist?(file)
					@data = DEFAULTS.merge(YAML.load(File.open(file)) || {})
				else
					@data = DEFAULTS.dup
				end
			end

			private

			# Searches SEARCH_FILES for the first existing config file
			#
			# @return [String, nil] Path to found file or nil
			def find_config_file
				SEARCH_FILES.each do |f|
					return f if File.exist?(f)
				end
				nil
			end

			public

			# --- Engagement Section ---

			# @return [Hash] Raw engagement configuration
			def engagement
				@data["engagement"] || {}
			end

			# @return [Boolean] Whether an external assessment was performed
			def external_assessment?
				engagement["external_assessment"] == true
			end

			# @return [String, nil] Date of the external assessment
			def external_date
				engagement["external_date"]
			end

			# @return [Boolean] Whether unmitigated findings data is available
			def has_unmitigated_findings?
				engagement["has_unmitigated_findings"] == true
			end

			# @return [String, nil] Date label for the previous scan
			def previous_scan_date
				engagement["previous_scan_date"]
			end

			# @return [String] Confidentiality level for the report (e.g. "Confidential", "Internal Use Only")
			def confidentiality_level
				engagement["confidentiality_level"] || "Confidential"
			end

			# --- Phishing Section ---

			# @return [Hash] Raw phishing configuration
			def phishing
				@data["phishing"] || {}
			end

			# @return [Boolean] Whether phishing assessment is enabled
			def phishing_enabled?
				phishing["enabled"] == true
			end

			# @return [Boolean] Whether phishing has per-user result CSVs
			def phishing_has_results?
				phishing["has_results"] == true
			end

			# @return [Array<Hash>] List of phishing campaign configs. Each
			#   campaign has keys: name, description, date_range, timespan_hours,
			#   sent, delivered, opened, clicked, submitted, reported, results_file
			def campaigns
				phishing["campaigns"] || []
			end

			# --- Recommendations Section ---

			# @return [Array] List of recommendations. Each element is either a
			#   plain String or a Hash with "title" and "detail" keys.
			def recommendations
				@data["recommendations"] || []
			end

			# --- Pen Test Section ---

			# @return [Hash] Raw pen test configuration
			def pen_test
				@data["pen_test"] || {}
			end

			# @return [Boolean] Whether the pen test section is enabled
			def pen_test_enabled?
				pen_test["enabled"] == true
			end

			# @return [Hash] Targets keyed by asset ID (e.g. "H-001").
			#   Each value has "ip" and "description" keys.
			def pen_test_targets
				pen_test["targets"] || {}
			end

			# @return [Array<Hash>] List of pen test findings. Each finding has
			#   keys: id, title, severity, likelihood, impact, status,
			#   affected_assets, description, evidence_description, impact_detail,
			#   likelihood_detail, recommendation, evidence_files
			def pen_test_findings
				pen_test["findings"] || []
			end

			# Looks up a single finding by its ID (e.g. "F-001")
			#
			# @param finding_id [String] The finding ID to look up
			# @return [Hash] The finding hash, or empty hash if not found
			def pen_test_finding_details(finding_id)
				finding = pen_test_findings.find { |f| f["id"] == finding_id }
				finding || {}
			end

			# @return [Array<Hash>] Open ports discovered during the pen test.
			#   Each entry has: host, port, protocol, service, version, notes
			def pen_test_open_ports
				pen_test["open_ports"] || []
			end

			# @return [Array<Hash>] Risk matrix rows. Each row has: impact,
			#   low, medium, high (cell contents for each likelihood column)
			def pen_test_risk_matrix
				pen_test["risk_matrix"] || []
			end

			# @return [Array<String>] Pen test specific recommendations
			def pen_test_recommendations
				pen_test["recommendations"] || []
			end

			# @return [Array<Hash>] Tools used during the pen test.
			#   Each entry has: name, version, description
			def pen_test_tools
				pen_test["tools"] || []
			end

			# @return [Hash] Glossary of terms (term => definition)
			def pen_test_glossary
				pen_test["glossary"] || {}
			end

			# @return [Hash] References (name => URL)
			def pen_test_references
				pen_test["references"] || {}
			end

			# @return [String] Overall risk rating (e.g. "Critical", "High", "Medium", "Low")
			def pen_test_overall_risk
				pen_test["overall_risk"] || "Low"
			end

			# @return [Date] Pen test start date
			def pen_test_start_date
				d = pen_test["start_date"]
				d.is_a?(Date) ? d : (d ? Date.parse(d.to_s) : Date.today)
			end

			# @return [Date] Pen test end date
			def pen_test_end_date
				d = pen_test["end_date"]
				d.is_a?(Date) ? d : (d ? Date.parse(d.to_s) : Date.today)
			end

			# @return [String] Executive summary narrative for the pen test
			def pen_test_summary
				pen_test["summary"] || ""
			end

			# Builds a severity count hash from pen test findings for graphing.
			#
			# @return [Hash] e.g. {"Critical"=>1, "High"=>2, "Medium"=>1, "Low"=>0}
			def pen_test_severity_counts
				counts = { "Critical" => 0, "High" => 0, "Medium" => 0, "Low" => 0 }
				pen_test_findings.each do |f|
					sev = f["severity"]
					counts[sev] = (counts[sev] || 0) + 1 if counts.key?(sev)
				end
				counts
			end

			# --- Unmitigated Findings ---

			# Loads unmitigated findings from the risu_db_diff shared_items_global.csv.
			# Findings are grouped by plugin name, ranked by severity then affected
			# host count, and limited to the top N results.
			#
			# The CSV format is: host,mac,plugin_name,severity,unpatch_since
			#
			# @param limit [Integer] Maximum number of findings to return (default 10)
			# @return [Array<Hash>] Each hash has keys: :finding, :severity,
			#   :host_count, :hosts, :since, :sort_sev
			def unmitigated_findings(limit = 10)
				require 'csv'
				file = engagement["unmitigated_file"]
				return [] if file.nil? || !File.exist?(file)

				min_sev = (engagement["unmitigated_min_severity"] || 3).to_i
				severity_order = { "Critical" => 4, "High" => 3, "Medium" => 2, "Low" => 1, "Info" => 0 }

				# Collect all findings above min severity
				all_findings = []
				CSV.foreach(file, headers: true) do |row|
					severity = row["severity"].to_i
					next if severity < min_sev

					all_findings << {
						host: row["host"],
						mac: row["mac"],
						finding: row["plugin_name"],
						severity: severity,
						severity_label: severity_label(severity),
						since: row["unpatch_since"] || "unknown"
					}
				end

				# Group by finding name, rank by severity then affected host count
				grouped = all_findings.group_by { |f| f[:finding] }
				ranked = grouped.map do |finding_name, instances|
					worst_sev = instances.max_by { |f| f[:severity] }
					hosts = instances.map { |f| f[:host] }.uniq
					{
						finding: finding_name,
						severity: worst_sev[:severity_label],
						host_count: hosts.size,
						hosts: hosts,
						since: worst_sev[:since],
						sort_sev: worst_sev[:severity]
					}
				end

				ranked.sort_by { |f| [-(f[:sort_sev]), -(f[:host_count])] }
					.first(limit)
			end

			# --- Findings Trend Graph ---

			# Generates a bar chart comparing persistent vs new findings between
			# the current scan and the previous scan. Persistent findings are
			# counted from the diff CSV; new findings are the difference between
			# the current DB total and the persistent count.
			#
			# Requires the unmitigated_file to be configured.
			#
			# @return [StringIO, nil] PNG image data, or nil if no diff file
			def findings_trend_graph
				require 'csv'
				file = engagement["unmitigated_file"]
				return nil if file.nil? || !File.exist?(file)

				# Count persistent findings from the diff (severity >= 1)
				persistent = 0
				CSV.foreach(file, headers: true) do |row|
					persistent += 1 if row["severity"].to_i >= 1
				end

				# Current total findings (non-rollup, severity > 0)
				current_total = Item.where("severity > 0").where(:rollup_finding => false)
					.group(:plugin_id, :host_id).count.size

				# New = current findings minus persistent
				new_findings = [current_total - persistent, 0].max

				g = Gruff::Bar.new(Risu::GRAPH_WIDTH)
				g.title = "Findings Trend"
				g.sort = false
				g.marker_count = 1
				g.theme = {
					:colors => Risu::GRAPH_COLORS,
					:background_colors => %w(white white)
				}

				g.data("Persistent (#{persistent})", persistent)
				g.data("New (#{new_findings})", new_findings)

				image = g.to_image
				image.format = 'png'
				StringIO.new(image.to_blob)
			end

			# --- Phishing Results ---

			# Loads phishing campaign results from a CSV file.
			# Returns an array of arrays suitable for passing to a Prawn table.
			#
			# Expected CSV format: name,ip,email,status
			#
			# @param file [String, nil] Path to the phishing results CSV
			# @return [Array<Array<String>>] Each inner array is [name, ip, email, status]
			def load_phishing_results(file)
				require 'csv'
				return [] if file.nil? || !File.exist?(file)

				results = []
				CSV.foreach(file, headers: true) do |row|
					results << [row["name"], row["ip"], row["email"], row["status"]]
				end

				results
			end

			private

			# Converts a numeric severity to a label string
			#
			# @param sev [Integer] Severity value (0-4)
			# @return [String] "Critical", "High", "Medium", "Low", or "Info"
			def severity_label(sev)
				case sev
				when 4 then "Critical"
				when 3 then "High"
				when 2 then "Medium"
				when 1 then "Low"
				else "Info"
				end
			end
		end
	end
end
