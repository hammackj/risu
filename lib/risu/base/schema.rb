# encoding: utf-8

module Risu
	
	# Risu Schema
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
				t.integer :report_id
				t.string :name
				t.string :os
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
				t.string :pci_dss_compliance_
				t.string :pcidss_compliance_failed
				t.string :pcidss_compliance_passed
				t.string :pcidss_deprecated_ssl
				t.string :pcidss_expired_ssl_certificate
				t.string :pcidss_high_risk_flaw
				t.string :pcidss_medium_risk_flaw
				t.string :pcidss_reachable_db
				t.string :pcidss_www_xss				
				t.text :notes
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
				t.string :plugin_name
				t.string :family_name
				t.text :description
				t.string :plugin_version
				t.datetime :plugin_publication_date
				t.datetime :vuln_publication_date
				t.string :cpe
				t.string :cvss_vector
				t.string :cvss_base_score
				t.string :cvss_temporal_score
				t.string :cvss_temporal_vector
				t.string :exploitability_ease
				t.string :exploit_framework_core
				t.string :exploit_framework_metasploit
				t.string :metasploit_name
				t.string :exploit_framework_canvas
				t.string :canvas_package
				t.string :exploit_available
				t.string :risk_factor
				t.text :solution
				t.text :synopsis
				t.string :plugin_type
			end
			
			create_table :individual_plugin_selections do |t|
				t.string :policy_id
				t.integer :plugin_id
				t.string :plugin_name
				t.string :family
				t.string :status
			end
		
			create_table :references do |t|
				t.integer :plugin_id
				t.string :reference_name
				t.string :value
			end
	
			create_table :versions do |t|
				t.string :version
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
