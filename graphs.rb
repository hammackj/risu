#!/usr/bin/env ruby

#Jacob Hammack
#This script generates all graphs for the report

require 'rubygems'
require 'gruff'
require "pdf/writer"
require 'nessus_db_model'
require 'findings'

def graph_findings_by_severity(findings)
  g = Gruff::Bar.new(500)
  g.title = "Findings By Severity"
  g.sort = false
  g.theme = {
     :background_colors => %w(white white)
  }

  g.data("Critical", findings.number_of_critical, "red") unless findings.number_of_critical == 0
  g.data("High", findings.number_of_high, "orange") unless findings.number_of_high == 0
  g.data("Medium", findings.number_of_medium, "yellow") unless findings.number_of_medium == 0
  g.data("Low", findings.number_of_low, "blue") unless findings.number_of_low == 0

  g.write("findings_by_severity.png")
end

def graph_top_plugins_by_count(findings)
  g = Gruff::Bar.new(500)
  g.title = sprintf "Top %d Critical Findings By Plugin", findings.top_plugins.count
  g.sort = false
  g.theme = {
    :colors => %w(red green blue orange yellow purple black grey brown pink),
    :background_colors => %w(white white)
  }
  
  findings.top_plugins.each { |plugin|
    plugin_name = Plugin.find_by_id(plugin).plugin_name
    
    #We need to filter the names a little to make everything look nice on the graph
    plugin_name = case plugin
      when 35362 then plugin_name.split(":")[0]
      when 34477 then plugin_name.split(":")[0]
      when 35635 then plugin_name.split(":")[0]
      when 21564 then "VNC Remote Authentication Bypass"
      when 38664 then "Intel Common Base Agent Remote Command Execution"  
    end
    
    g.data(plugin_name, Item.find(:all, :conditions => {:plugin_id => plugin}).count)
  }
  
  g.write("findings_top_plugins.png")
end

def graph_top_vuln_hosts(findings)
  g = Gruff::Bar.new(500)
  g.title = sprintf "Top %d Critical/High Finding Count Per Host ", findings.top_vuln_hosts.count
  g.sort = false
  g.theme = {
    :colors => %w(red green blue orange yellow purple black grey brown pink),
    :background_colors => %w(white white)
  }
  
  findings.top_vuln_hosts.each { |host|
    ip = Host.find_by_id(host).name
        
    g.data(ip, Item.find(:all, :conditions => ["host_id = ? AND plugin_id != 1 AND severity in (3,2)", host]).count)
  }
  
  g.write("findings_top_vuln_hosts.png")
end

def graph_findings_by_service(findings)
  g = Gruff::Pie.new(600)
  g.title = sprintf "Top %d Findings By Service", findings.findings_by_service.count
  g.sort = false
  g.theme = {
    :colors => %w(red green blue orange yellow purple black grey brown pink),
    :background_colors => %w(white white)
  }
  
  findings.findings_by_service.each { |service| 
    g.data(service, Item.find(:all, :conditions => {:svc_name => service}).count)
  }
  
  g.write("findings_by_service.png")
end

def graph_other_operating_systems_by_count(findings)
  g = Gruff::Pie.new(600)
  g.title = "Other Operating Systems By Count"
  g.sort = false
  g.theme = {
    :colors => %w(red green blue orange yellow purple black grey brown pink),
    :background_colors => %w(white white)
  }
  
  findings.other_operating_systems.each { |os|
    g.data(os.gsub("\n", '/').gsub("Microsoft",'').gsub("Service Pack", 'SP').gsub("Red Hat Enterprise Linux", "RHEL"), Host.find(:all, :conditions => {:os => os}).count) unless os == nil
  }
  
  g.write("other_operating_system_by_count.png")  
end

def graph_windows_operating_systems_by_count(findings)
  g = Gruff::Pie.new(600)
  g.title = "Windows Operating Systems By Count"
  g.sort = false
  g.theme = {
    :colors => %w(red green blue orange yellow purple black grey brown pink),
    :background_colors => %w(white white)
  }
  
  findings.windows_operating_systems.each { |os|
    g.data(os.gsub("\n", '/').gsub("Microsoft",'').gsub("Service Pack", 'SP').gsub("Red Hat Enterprise Linux", "RHEL"), Host.find(:all, :conditions => {:os => os}).count) unless os == nil
  }
  
  g.write("windows_operating_system_by_count.png")  
end

findings = Findings.new
findings.number_of_hosts = Host.find(:all).count
findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
findings.number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
findings.number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
findings.number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
findings.number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
#findings.number_of_none = Item.find(:all, :conditions => ["severity = 0"]).count
findings.findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
findings.other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%'"], :group => :os).map(&:os)
findings.windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%'"], :group => :os).map(&:os)
findings.critical_findings = Item.find(:all, :conditions => ["severity = 3"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
findings.high_findings = Item.find(:all, :conditions => ["severity = 2"])
findings.top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)
findings.top_vuln_hosts = Item.find_by_sql("SELECT host_id, count(host_id) FROM items WHERE plugin_id != 1 AND severity IN (3,2) GROUP BY host_id ORDER BY count(host_id) DESC LIMIT 10").map(&:host_id)

graph_findings_by_severity(findings)
graph_findings_by_service(findings)
graph_windows_operating_systems_by_count(findings)
graph_other_operating_systems_by_count(findings)
graph_top_plugins_by_count(findings)
graph_top_vuln_hosts(findings)

