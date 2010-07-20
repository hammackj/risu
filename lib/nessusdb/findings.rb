module NessusDB
  
  # Overall findings for easy access for report / graph generation
  #
  # @author Jacob Hammack
  class Findings
    attr_accessor :number_of_hosts, :number_of_risks, :number_of_critical, :number_of_high
    attr_accessor :number_of_medium, :number_of_low, :number_of_none, :findings_by_service
    attr_accessor :windows_operating_systems, :critical_findings, :high_findings, :top_plugins
    attr_accessor :other_operating_systems, :top_vuln_hosts
    
    # Pulls in all of the data required for report generation and graph generation
    #
    def initialize
      @number_of_hosts = Host.find(:all).count
      @number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
      @number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
      @number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
      @number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
      @number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
      @findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
      @other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%'"], :group => :os).map(&:os)
      @windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%'"], :group => :os).map(&:os)
      @critical_findings = Item.find(:all, :conditions => ["severity = 3 AND plugin_id NOT IN (26928, 45411, 42873, 20007, 31705, 18405, 10882)"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
      @high_findings = Item.find(:all, :conditions => ["severity = 2 AND plugin_id NOT IN (26928, 45411, 42873, 20007, 31705, 18405, 10882)"])      
      @top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)
			@top_vuln_hosts = nil
			@top_plugins = nil
    end
  end
end
