#!/usr/bin/env ruby
# Looks up Nessus plugin IDs from Tenable's API and outputs
# a CSV mapping of plugin_id, severity, name.
#
# Usage:
#   ruby tools/lookup_plugin_ids.rb > tools/plugin_lookup.csv
#   ruby tools/lookup_plugin_ids.rb --file lib/risu/parsers/nessus/postprocess/servu.rb
#
# Rate limited to 2 requests per second to be polite to Tenable's servers.

require 'net/http'
require 'uri'
require 'json'

SEVERITY_MAP = {
  "critical" => "CRITICAL",
  "high" => "HIGH",
  "medium" => "MEDIUM",
  "low" => "LOW",
  "info" => "INFO",
  "none" => "INFO"
}

def extract_ids_needing_lookup(file)
  ids = []
  File.readlines(file).each do |line|
    # Match any plugin ID line that doesn't have the severity format
    next unless line =~ /^\s*(\d+),/
    id = $1.to_i
    next if id == 0
    next if line =~ /#(CRITICAL|HIGH|MEDIUM|LOW|INFO),/
    ids << id
  end
  ids.uniq
end

def lookup_plugin(plugin_id)
  url = URI("https://www.tenable.com/plugins/api/v1/nessus/#{plugin_id}")

  begin
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.open_timeout = 10
    http.read_timeout = 10

    request = Net::HTTP::Get.new(url)
    request["User-Agent"] = "Mozilla/5.0 (compatible; risu-lookup/1.0)"
    request["Accept"] = "application/json"

    response = http.request(request)

    if response.code == "200"
      data = JSON.parse(response.body)

      if data["success"] && data["data"] && data["data"]["_source"]
        source = data["data"]["_source"]

        name = source["script_name"]
        severity = source["risk_factor"] || source["severity"] || "High"
        severity = SEVERITY_MAP[severity.downcase.strip] || severity.upcase

        return { id: plugin_id, severity: severity, name: name }
      end
    end

    STDERR.puts "  Failed for plugin #{plugin_id} (HTTP #{response.code})"
    return { id: plugin_id, severity: "UNKNOWN", name: nil }

  rescue => e
    STDERR.puts "  Error fetching plugin #{plugin_id}: #{e.message}"
    return { id: plugin_id, severity: "UNKNOWN", name: nil }
  end
end

# Parse args
target_file = nil
if ARGV.include?("--file")
  idx = ARGV.index("--file")
  target_file = ARGV[idx + 1]
end

# Collect IDs
all_ids = []

if target_file
  all_ids = extract_ids_needing_lookup(target_file)
  STDERR.puts "Extracted #{all_ids.size} IDs from #{target_file}"
else
  Dir.glob("lib/risu/parsers/nessus/postprocess/*.rb").sort.each do |file|
    ids = extract_ids_needing_lookup(file)
    all_ids += ids
  end
  all_ids.uniq!
  STDERR.puts "Extracted #{all_ids.size} unique IDs across all postprocessors"
end

# Output header
puts "plugin_id,severity,name"

# Lookup each ID
success = 0
failed = 0

all_ids.sort.each_with_index do |id, idx|
  result = lookup_plugin(id)

  if result[:name]
    puts "#{result[:id]},#{result[:severity]},#{result[:name]}"
    success += 1
  else
    puts "#{result[:id]},UNKNOWN,Plugin #{result[:id]}"
    failed += 1
  end

  STDERR.puts "  [#{idx + 1}/#{all_ids.size}] #{id} => #{result[:severity]}, #{result[:name]}" if (idx + 1) % 50 == 0 || idx == 0

  # Rate limit
  sleep 0.5
end

STDERR.puts "Done. #{success} succeeded, #{failed} failed out of #{all_ids.size} plugins."
