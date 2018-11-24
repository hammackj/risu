# Copyright (c) 2010-2018 Jacob Hammack.
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


module Risu
	module Base

		# Risu database Schema
		class Schema < ActiveRecord::Migration[4.2]

			# Creates all of the database tables required by the parser
			def self.up
				create_table :policies do |t|
					t.string :name
					t.text :comments
					t.string :owner
					t.string :visibility
				end

				create_table :server_preferences do |t|
					t.integer :policy_id
					t.string :name
					t.text :value, limit: 4294967295
				end

				create_table :plugins_preferences do |t|
					t.integer :policy_id
					t.integer :plugin_id
					t.text :plugin_name, limit: 4294967295
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
					t.text :mac, limit: 4294967295
					t.datetime :start
					t.datetime :end
					t.string :ip
					t.string :fqdn
					t.string :netbios
					t.text :notes
					t.integer :risk_score
				end

				create_table :host_properties do |t|
					t.integer :host_id
					t.string :name
					t.text :value, limit: 4294967295
				end

				create_table :items do |t|
					t.integer :host_id
					t.integer :plugin_id
					t.integer :attachment_id
					t.text :plugin_output, limit: 4294967295
					t.integer :port
					t.string :svc_name
					t.string :protocol
					t.integer :severity
					t.string :plugin_name
					t.boolean :verified
					t.text :cm_compliance_info, limit: 4294967295
					t.text :cm_compliance_actual_value, limit: 4294967295
					t.text :cm_compliance_check_id, limit: 4294967295
					t.text :cm_compliance_policy_value, limit: 4294967295
					t.text :cm_compliance_audit_file, limit: 4294967295
					t.text :cm_compliance_check_name, limit: 4294967295
					t.text :cm_compliance_result, limit: 4294967295
					t.text :cm_compliance_output, limit: 4294967295
					t.text :cm_compliance_reference, limit: 4294967295
					t.text :cm_compliance_see_also, limit: 4294967295
					t.text :cm_compliance_solution, limit: 4294967295
					t.integer :real_severity
					t.integer :risk_score
					t.boolean :rollup_finding, :default => false
				end

				create_table :plugins do |t|
					t.text :plugin_name, limit: 4294967295
					t.string :family_name
					t.text :description, limit: 4294967295
					t.string :plugin_version
					t.datetime :plugin_publication_date
					t.datetime :plugin_modification_date
					t.datetime :vuln_publication_date
					t.string :cvss_vector
					t.float :cvss_base_score
					t.string :cvss_temporal_score
					t.string :cvss_temporal_vector
					t.string :exploitability_ease
					t.string :exploit_framework_core
					t.string :exploit_framework_metasploit
					t.string :metasploit_name
					t.string :exploit_framework_canvas
					t.string :canvas_package
					t.boolean :exploit_available
					t.string :risk_factor
					t.text :solution, limit: 4294967295
					t.text :synopsis, limit: 4294967295
					t.string :plugin_type
					t.string :exploit_framework_exploithub
					t.string :exploithub_sku
					t.string :stig_severity
					t.string :fname
					t.string :always_run
					t.string :script_version
					t.string :d2_elliot_name
					t.string :exploit_framework_d2_elliot
					t.boolean :exploited_by_malware
					t.boolean :rollup
					t.integer :risk_score
					t.string :compliance
					t.string :root_cause
					t.string :agent
					t.boolean :potential_vulnerability
					t.boolean :in_the_news
					t.boolean :exploited_by_nessus
					t.boolean :unsupported_by_vendor
					t.boolean :default_account
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
					t.text :value
				end

				create_table :attachments do |t|
					t.integer :item_id
					t.string :name
					t.string :ttype
					t.string :ahash
					t.text :value
				end

				create_table :versions do |t|
					t.string :version
				end

				create_table :service_descriptions do |t|
					t.string :name
					t.integer :port
					t.string :description
				end

				create_table :patches do |t|
					t.integer :host_id
					t.string :name
					t.string :value
				end

				create_table :nessus_plugin_metadata do |t|
					t.integer :plugin_id
					t.text :plugin_name, limit: 4294967295
				end

				#Index's for speed increases, possibly have these apply after parsing @TODO
				add_index :items, :host_id
				add_index :items, :plugin_id
				add_index :references, :plugin_id

				#Default data for service descriptions
				#@TODO Unused ATM, might be better to use a yaml file tho..
				# ServiceDescription.create :name => "www", :description => ""
				# ServiceDescription.create :name => "cifs", :description => ""
				# ServiceDescription.create :name => "smb", :description => ""
				# ServiceDescription.create :name => "netbios-ns", :description => ""
				# ServiceDescription.create :name => "snmp", :description => ""
				# ServiceDescription.create :name => "ftp", :description => ""
				# ServiceDescription.create :name => "epmap", :description => ""
				# ServiceDescription.create :name => "ntp", :description => ""
				# ServiceDescription.create :name => "dce-rpc", :description => ""
				# ServiceDescription.create :name => "telnet", :description => ""
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
				drop_table :service_descriptions
				drop_table :patches
				drop_table :host_properties
				drop_table :attachments
				drop_table :nessus_plugin_metadata
			end
		end
	end
end
