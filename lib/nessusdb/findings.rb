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

    # Pulls in all of the data required for report generation and graph generation
    #
		# @author Jacob Hammack
    def initialize
			@blacklist_plugins = "26928, 45411, 42873, 20007, 31705, 18405, 10882, 19506"

			#Used to blacklist the scanning box so it doesn't show up in the report
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

		# ERB binding for report generation.
		#
		# @author Jacob Hammack
		def get_binding
			binding
		end
  end
end
