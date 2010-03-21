#!/usr/bin/env ruby 

#Jacob Hammack
#Hammackj LLC.
#A active record migration script for creating tables for parsing the data from .nessus v2 files

#To use this file type:
#./nessus_db_migrate.rb

require 'rubygems'  
require 'active_record'  
require 'yaml'
require 'nessus_db'
require 'sqlite3'

class NessusCreateTables < ActiveRecord::Migration
  def self.new
    db = SQLite3::Database.new( "db/development.sqlite3" )
  end
  
	def self.up
		create_table :policies do |t|
			t.column :name, :string
			t.column :comments, :string
		end
		
		create_table :serverpreferences do |t|
		  t.column :policy_id, :integer
		  t.column :name, :string
		  t.column :value, :string
		end		
		
		create_table :pluginpreferences do |t|
		  t.column :policy_id, :integer
		  t.column :plugin_name, :string
		  t.column :plugin_id, :string
		  t.column :fullname, :string
		  t.column :preference_name, :string
		  t.column :preference_type, :string		  		  
		  t.column :preference_values, :string
		  t.column :selected_values, :string		  		  		  		  
		end

		create_table :familyselections do |t|
		  t.column :policy_id, :string
		  t.column :family_name, :string
		  t.column :status, :string
		end	
		
		create_table :individualpluginselections do |t|
		  t.column :policy_id, :string
		  t.column :plugin_id, :integer
		  t.column :plugin_name, :string
		  t.column :family, :string
		  t.column :status, :string
		end
		
		create_table :reports do |t|
		  t.column :policy_id, :integer
		  t.column :name, :string
		end
		
		create_table :reporthosts do |t|
		  t.column :report_id, :integer
		  t.column :name, :string
		  t.column :os, :string
		  t.column :mac, :string
		  t.column :start, :datetime
		  t.column :end, :datetime
		end
	
		create_table :reportitems do |t|
		  t.column :reporthost_id, :integer
		  t.column :port, :integer
		  t.column :svc_name, :string
		  t.column :protocol, :string
		  t.column :severity, :integer
		  t.column :plugin_id, :integer
		  t.column :checked, :boolean
		end	
		
		create_table :plugins do |t|
		  t.column :plugin_id, :integer
		  t.column :plugin_name, :string
		  t.column :plugin_family, :string
		  t.column :description, :string
		  t.column :plugin_version, :string
		  t.column :plugin_output, :string
		  t.column :plugin_version, :string
		  t.column :plugin_publication_date, :datetime
		  t.column :vuln_publication_date, :datetime
      t.column :cvss_vector, :string
      t.column :cvss_base_score, :string
		  t.column :risk_factor, :string
		  t.column :solution, :string
		  t.column :synopsis, :string
	  end
	  
	  create_table :plugincves do |t|
	    t.column :plugin_id, :integer
		  t.column :cve, :string
    end
    
    create_table :pluginbids do |t|
		  t.column :plugin_id, :integer      
		  t.column :bid, :string
    end
    
    create_table :pluginxrefs do |t|
		  t.column :plugin_id, :integer      
		  t.column :xref, :string
    end
    
    create_table :pluginseealsos do |t|
		  t.column :plugin_id, :integer      
		  t.column :see_also, :string
    end    
    
	end
	
	def self.down
	  drop_table :policies
	  drop_table :serverpreferences
	  drop_table :pluginpreferences
	  drop_table :familyselections
	  drop_table :individualpluginselection
	  drop_table :reports
	  drop_table :reporthosts
	  drop_table :reportitems
	  drop_table :pluginseealsos
	  drop_table :pluginxrefs
	  drop_table :pluginbids
	  drop_table :plugincves
	  drop_table :plugins
  end
end
#NessusCreateTables.new
#NessusCreateTables.migrate(:down)
NessusCreateTables.migrate(:up)
