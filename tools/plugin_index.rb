#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '/../lib'))

$stdout.sync = true
$stderr.sync = true

require 'risu'

app = Risu::CLI::Application.new
app.load_config
app.db_connect


@nessus_plugin_path = "/Library/Nessus/run/lib/nessus/plugins"
@post_plugin_ids = {}
@nessus_files = {}

@postprocess_manager = Risu::Base::PostProcessManager.new "risu/parsers/nessus/postprocess"
@postprocess_manager.registered_postprocesses.each do |p|
	@post_plugin_ids.store(p.info[:description], p.info[:plugin_ids])
end

plugin_files = Dir["#{@nessus_plugin_path}/*.nasl"]
plugin_files.delete("/Library/Nessus/run/lib/nessus/plugins/crl_expiry.nasl")
plugin_files.delete("/Library/Nessus/run/lib/nessus/plugins/traq_authenticate_function_code_execution.nasl")

plugin_files.each do |file|
	contents = File.read(file)
	@nessus_files.store(file, contents)
end

NessusPluginMetadata.delete_all

puts "Processing Nessus plugins"
@nessus_files.each do |file, contents|
	script_id_match = contents.match(/script_id\((\d+)\);/)
	if script_id_match != nil && script_id_match[1] != nil
		plugin_id = script_id_match[1]
		script_name_match = contents.match(/script_name\(english\:["|'](.*)["|']/)
		script_name = script_name_match[1] if script_name_match

		plugin_metadata = NessusPluginMetadata.new
		plugin_metadata.plugin_id = plugin_id
		plugin_metadata.plugin_name = script_name
		plugin_metadata.save!
	end
end

puts "Building metadata"
@post_plugin_ids.each do |family, plugin_ids|
	results = []

	if plugin_ids == nil
		next
	end

	plugin_ids.each do |plugin_id|

		plugin = NessusPluginMetadata.where(:plugin_id => plugin_id).first
		if plugin != nil
			plugin_id = plugin.plugin_id
			script_name = plugin.plugin_name
			line = "#{plugin_id}, ##{script_name}\n"
			results << line
		end
	end

	File.open("output/#{family}.txt", "w") do |f|
		results.each do |line|
			f.write(line)
		end
	end
end

#
# @post_plugin_ids.each do |family, plugin_ids|
# 	@nessus_files.each do |file, contents|
# 		results = []
#
# 		if plugin_ids == nil
# 			next
# 		end
#
# 		plugin_ids.each do |plugin_id|
# 			if contents.match(/script_id\(#{plugin_id}\);/)
# 				match = contents.match(/script_name\(english\:\"(.*)\"/)
# 				script_name = match[1] if match
# 				line = "#{plugin_id}, ##{script_name}\n"
# 				results << line
# 				next
# 			end
# 		end
#
# 		File.open("output/#{family}.txt", "w") do |f|
# 			results.each do |line|
# 				f.write(line)
# 			end
# 		end
# 	end
# end
