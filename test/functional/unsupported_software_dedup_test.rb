require 'test_helper'

class UnsupportedSoftwareDedupTest < ActiveSupport::TestCase
	def setup
		setup_test_database

		@report = Report
		@report.title = "Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end

	# Replicates the dedup logic from unsupported_software.rb template
	def dedup_unsupported_plugins(active_plugins)
		plugin_host_map = {}
		active_plugins.each do |pid|
			plugin_host_map[pid] = Item.where(:plugin_id => pid).where("severity >= 0").pluck(:host_id).uniq
		end

		generic_plugin_ids = [33850, 108797]
		generic_pids = active_plugins & generic_plugin_ids

		generic_pids.each do |gpid|
			specific_host_ids = (active_plugins - [gpid]).flat_map { |pid| plugin_host_map[pid] || [] }.uniq
			plugin_host_map[gpid] = plugin_host_map[gpid] - specific_host_ids
		end

		active_plugins.reject! { |pid| generic_pids.include?(pid) && plugin_host_map[pid].empty? }

		{ active_plugins: active_plugins, plugin_host_map: plugin_host_map }
	end

	test "generic Unix plugin is suppressed when specific ESXi plugin covers same host" do
		# Create generic Unix unsupported plugin (33850)
		Plugin.create!(:id => 33850, :plugin_name => "Unix Operating System Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")

		# Create specific ESXi unsupported plugin
		Plugin.create!(:id => 55555, :plugin_name => "VMware ESXi Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")

		# Both fire on host 1
		Item.create!(:host_id => 1, :plugin_id => 33850, :port => 0, :severity => 4)
		Item.create!(:host_id => 1, :plugin_id => 55555, :port => 0, :severity => 4)

		result = dedup_unsupported_plugins([33850, 55555])

		# Generic should be removed (no remaining hosts)
		assert_equal false, result[:active_plugins].include?(33850),
			"Generic Unix plugin should be suppressed"
		assert_equal true, result[:active_plugins].include?(55555),
			"Specific ESXi plugin should remain"

		# Clean up
		Item.where(:plugin_id => [33850, 55555]).delete_all
		Plugin.where(:id => [33850, 55555]).delete_all
	end

	test "generic Windows plugin is suppressed when specific version plugin covers same host" do
		Plugin.create!(:id => 108797, :plugin_name => "Microsoft Windows Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")
		Plugin.create!(:id => 192782, :plugin_name => "Microsoft Windows Server 2008 Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")

		Item.create!(:host_id => 1, :plugin_id => 108797, :port => 0, :severity => 4)
		Item.create!(:host_id => 1, :plugin_id => 192782, :port => 0, :severity => 4)

		result = dedup_unsupported_plugins([108797, 192782])

		assert_equal false, result[:active_plugins].include?(108797),
			"Generic Windows plugin should be suppressed"
		assert_equal true, result[:active_plugins].include?(192782),
			"Specific Server 2008 plugin should remain"

		Item.where(:plugin_id => [108797, 192782]).delete_all
		Plugin.where(:id => [108797, 192782]).delete_all
	end

	test "generic plugin remains when it has hosts not covered by specific plugins" do
		Plugin.create!(:id => 33850, :plugin_name => "Unix Operating System Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")
		Plugin.create!(:id => 55555, :plugin_name => "VMware ESXi Unsupported Version Detection",
			:unsupported_by_vendor => true, :risk_factor => "Critical")

		# Generic fires on both hosts, specific only on host 1
		Item.create!(:host_id => 1, :plugin_id => 33850, :port => 0, :severity => 4)
		Item.create!(:host_id => 2, :plugin_id => 33850, :port => 0, :severity => 4)
		Item.create!(:host_id => 1, :plugin_id => 55555, :port => 0, :severity => 4)

		result = dedup_unsupported_plugins([33850, 55555])

		# Generic should remain with only host 2
		assert_equal true, result[:active_plugins].include?(33850),
			"Generic should remain for uncovered hosts"
		assert_equal [2], result[:plugin_host_map][33850],
			"Generic should only have host 2 remaining"
		assert_equal true, result[:active_plugins].include?(55555)

		Item.where(:plugin_id => [33850, 55555]).delete_all
		Plugin.where(:id => [33850, 55555]).delete_all
	end

	test "non-generic plugins are not affected by dedup" do
		Plugin.create!(:id => 55556, :plugin_name => "Some Unsupported App",
			:unsupported_by_vendor => true, :risk_factor => "High")
		Plugin.create!(:id => 55557, :plugin_name => "Another Unsupported App",
			:unsupported_by_vendor => true, :risk_factor => "High")

		Item.create!(:host_id => 1, :plugin_id => 55556, :port => 0, :severity => 3)
		Item.create!(:host_id => 1, :plugin_id => 55557, :port => 0, :severity => 3)

		result = dedup_unsupported_plugins([55556, 55557])

		# Both should remain — neither is a generic plugin
		assert_equal 2, result[:active_plugins].size
		assert_equal [1], result[:plugin_host_map][55556]
		assert_equal [1], result[:plugin_host_map][55557]

		Item.where(:plugin_id => [55556, 55557]).delete_all
		Plugin.where(:id => [55556, 55557]).delete_all
	end
end
