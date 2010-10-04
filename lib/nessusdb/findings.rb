# encoding: utf-8

module NessusDB
  
  # Overall findings for easy access for report / graph generation 
  #
  # @author Jacob Hammack
  class Findings
    attr_accessor :number_of_hosts, :number_of_risks, :number_of_critical, :number_of_high
    attr_accessor :number_of_medium, :number_of_low, :findings_by_service
    attr_accessor :windows_operating_systems, :critical_findings, :high_findings, :top_plugins
    attr_accessor :other_operating_systems, :top_vuln_hosts

		attr_accessor :critical_findings_unique
		attr_accessor :high_findings_unique
		attr_accessor :medium_findings_unique
		attr_accessor :low_findings_unique

		attr_accessor :title, :author, :company, :classification, :date
		attr_accessor :findings_array, :findings_array_unique
    
		attr_accessor :blacklist_plugins, :blacklist_host, :blacklist_host_id
		
		attr_accessor :scan_date
		
		GRAPH_WIDTH = 500

    # Pulls in all of the data required for report generation and graph generation
    #
		# @author Jacob Hammack
    def initialize
			@blacklist_plugins = "26928, 45411, 42873, 20007, 31705, 18405, 10882, 19506"

			#Used to blacklist the scanning box so it doesn't show up in the report
			#@blacklist_host_mac = "70:5a:b6:62:f6:d2"
			@blacklist_host_mac = ""
			@findings_array = Array.new
			@findings_array_unique = Array.new
			
			@scan_date = Host.find(:first, :conditions => ["start is not null"])[:start].to_s
			
			@blacklist_host_id = Host.find(:first, :conditions => ['mac like ?', "%#{@blacklist_host_mac}%"])[:id]
      @number_of_hosts = Host.find(:all, :conditions => ["id != #{@blacklist_host_id}"]).count
      @number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
      @number_of_critical = Item.find(:all, :conditions => ["severity IN (3) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
      @number_of_high = Item.find(:all, :conditions => ["severity IN (2) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
      @number_of_medium = Item.find(:all, :conditions => ["severity IN (1) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count
      @number_of_low = Item.find(:all, :conditions => ["severity IN (0) AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"]).count

      @findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
      @other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%' AND id != #{@blacklist_host_id}"], :group => :os).map(&:os)
      @windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%' AND id != #{@blacklist_host_id}"], :group => :os).map(&:os)
      @critical_findings = Item.find(:all, :conditions => ["severity = 3 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
			
			@critical_findings_unique = Item.find(:all, :conditions => ["severity = 3 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score', :group => :plugin_id)
      @high_findings_unique = Item.find(:all, :conditions => ["severity = 2 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score', :group => :plugin_id)
			@medium_findings_unique = Item.find(:all, :conditions => ["severity = 1 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score', :group => :plugin_id)
			@low_findings_unique = Item.find(:all, :conditions => ["severity = 0 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score', :group => :plugin_id)


			@high_findings = Item.find(:all, :conditions => ["severity = 2 AND plugin_id NOT IN (#{@blacklist_plugins}) AND host_id != #{@blacklist_host_id}"])      

      @top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)
			@top_vuln_hosts = Item.find_by_sql("SELECT host_id, count(host_id) FROM items WHERE plugin_id != 1 AND plugin_id NOT IN (#{@blacklist_plugins}) AND severity IN (3,2) GROUP BY host_id ORDER BY count(host_id) DESC LIMIT 10").map(&:host_id)
			@top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)
			
			@findings_array << Hash[:title => "Critical Findings", :color => "FF0000", :values => @critical_findings]
			@findings_array << Hash[:title => "High Findings", :color => "FF8040", :values => @high_findings]
			
			@findings_array_unique << Hash[:title => "Critical Findings", :color => "FF0000", :values => @critical_findings_unique]
			@findings_array_unique << Hash[:title => "High Findings", :color => "FF8040", :values => @high_findings_unique]
    end

		#
		#
		#
		def graph_findings_by_severity(findings, filename="findings_by_severity.png")
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

		  g.write(filename)
		
			return filename
		end		

		#
		# 
		#
		def graph_top_plugins_by_count(findings, filename="findings_top_plugins.png")
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

		  g.write(filename)
		
			return filename
		end

		#
		#
		#
		def graph_top_vuln_hosts(findings, filename="findings_top_vuln_hosts.png")
		  g = Gruff::Bar.new(500)
		  g.title = sprintf "Top %d Critical/High Finding Count Per Host ", findings.top_vuln_hosts.count
		  g.sort = false
		  g.theme = {
		    :colors => %w(red green blue orange yellow purple black grey brown pink),
		    :background_colors => %w(white white)
		  }

		  findings.top_vuln_hosts.each { |host|
		    ip = Host.find_by_id(host).name

		    g.data(ip, Item.find(:all, :conditions => ["host_id = ? AND plugin_id != 1 AND plugin_id NOT IN (#{findings.blacklist_plugins}) AND severity in (3,2)", host]).count)
		  }

		  g.write(filename)
		
			return filename
		end

		#
		#
		#
		def graph_findings_by_service(findings, filename="findings_by_service.png")
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

		  g.write(filename)
		
			return filename
		end

		#
		#
		#
		def graph_other_operating_systems_by_count(findings, filename="other_operating_system_by_count.png")
		  g = Gruff::Pie.new(600)
		  g.title = "Other Operating Systems By Count"
		  g.sort = false
		  g.theme = {
		    :colors => %w(red green blue orange yellow purple black grey brown pink),
		    :background_colors => %w(white white)
		  }

		  findings.other_operating_systems.each { |os|
		    g.data(os.gsub("\n", '/').gsub("Microsoft",'').gsub("Service Pack", 'SP').gsub("Red Hat Enterprise Linux", "RHEL").gsub("Kernel",""), Host.find(:all, :conditions => {:os => os}).count) unless os == nil
		  }

		  g.write(filename)  
		
			return filename
		end

		#
		#
		#
		def graph_windows_operating_systems_by_count(findings, filename="windows_operating_system_by_count.png")
		  g = Gruff::Pie.new(600)
		  g.title = "Windows Operating Systems By Count"
		  g.sort = false
		  g.theme = {
		    :colors => %w(red green blue orange yellow purple black grey brown pink),
		    :background_colors => %w(white white)
		  }

		  findings.windows_operating_systems.each { |os|
		    g.data(os.gsub("\n", '/').gsub("Microsoft",'').gsub("Service Pack", 'SP').gsub("Red Hat Enterprise Linux", "RHEL").gsub("Standard","Std").gsub("Windows",""), Host.find(:all, :conditions => {:os => os}).count) unless os == nil
		  }

		  g.write(filename)  
		
			return filename
		end
		
  end
end
