# encoding: utf-8

module NessusDB
	
	# NessusDB Schema
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Schema < ActiveRecord::Migration

		# Creates all of the database tables required by the parser
		# 
		def self.up
			create_table :policies do |t|
				t.string :name
				t.string :comments
			end
		
			create_table :server_preferences do |t|
				t.integer :policy_id
				t.string :name
				t.string :value
			end		
		
			create_table :plugins_preferences do |t|
				t.integer :policy_id
				t.integer :plugin_id
				t.string :plugin_name
				t.string :fullname
				t.string :preference_name
				t.string :preference_type
				t.string :preference_values
				t.string :selected_values
			end

			create_table :family_selections do |t|
				t.integer :policy_id
				t.string :family_name
				t.string :status
			end		
				
			create_table :reports do |t|
				t.integer :policy_id
				t.string :name
			end
		
			create_table :hosts do |t|
				t.integer :report_id, :integer
				t.string :name, :string
				t.string :os, :string
				t.string :mac
				t.datetime :start
				t.datetime :end
				t.string :ip
				t.string :fqdn
				t.string :netbios
				t.string :local_checks_proto
				t.string :smb_login_used
				t.string :ssh_auth_meth
				t.string :ssh_login_used
				t.string :pci_dss_compliance
			end
	
			create_table :items do |t|
				t.integer :host_id
				t.integer :plugin_id
				t.text :plugin_output
				t.integer :port
				t.string :svc_name
				t.string :protocol
				t.integer :severity
				t.boolean :verified
			end 
		
			create_table :plugins do |t|
				t.column :plugin_name, :string
				t.column :family_name, :string
				t.column :description, :text
				t.column :plugin_version, :string
				t.column :plugin_publication_date, :datetime
				t.column :vuln_publication_date, :datetime
				t.column :cvss_vector, :string
				t.column :cvss_base_score, :string
				t.column :cvss_temporal_score, :string
				t.column :cvss_temporal_vector, :string
				t.column :exploitability_ease, :string
				t.column :exploit_framework_core, :string
				t.column :exploit_framework_metasploit, :string
				t.column :metasploit_name, :string
				t.column :exploit_framework_canvas, :string
				t.column :canvas_package, :string
				t.column :exploit_available, :string
				t.column :risk_factor, :string
				t.column :solution, :text
				t.column :synopsis, :text
			end
			
			create_table :individual_plugin_selections do |t|
				t.column :policy_id, :string
				t.column :plugin_id, :integer
				t.column :plugin_name, :string
				t.column :family, :string
				t.column :status, :string
			end
		
			create_table :references do |t|
				t.column :plugin_id, :integer
				t.column :reference_name, :string
				t.column :value, :string
			end
	
			create_table :versions do |t|
				t.column :version, :string
			end
		end
	
		# Deletes all of the database tables created
		#
		def self.down
			drop_table :policies
			drop_table :server_preferences
			drop_table :plugins_preferences
			drop_table :family_selections
			drop_table :individual_plugin_selections
			drop_table :reports
			drop_table :hosts
			drop_table :items
			drop_table :plugins
			drop_table :references
			drop_table :versions
		end

	end
end