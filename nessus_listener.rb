require 'libxml'
require 'nessus_db_model'
#require 'thread'

class NessusSaxListener
	include LibXML::XML::SaxParser::Callbacks

	def initialize
		@vals = Hash.new
	end
	
	def on_start_element(element, attributes)
	  @vals = Hash.new
	  @tag = element
	  @vals[@tag] = ""

	  case element
      when "policyName"
        @policy = Policy.create
        @policy.save
      when "preference"
        @sp = @policy.Serverpreferences.create
        @sp.save
      when "item"
        @item = @policy.Pluginpreferences.create
        @item.save
      when "FamilyItem"
        @fi = @policy.Familyselections.create
        @fi.save
      when "PluginItem"
        @plugin = @policy.Individualpluginselections.create
        @plugin.save
      when "Report"
        @report = @policy.Reports.create
        @report.name = attributes["name"]
        @report.save
      when "ReportHost"
        @rh = @report.Reporthosts.create
        @rh.name = attributes["name"]
        @rh.save
      when "tag"
        if attributes["name"] == "HOST_END"
          @vals["end"] = true
        elsif attributes["name"] == "mac-address"
          @vals["mac"] = true
        elsif attributes["name"] == "HOST_START"
          @vals["start"] = true
        elsif attributes["name"] == "operating-system"
          @vals["os"] = true
        end
      when "ReportItem"
        @ri = @rh.Reportitems.create
        @plugin = Plugin.create
        
        @ri.port  = attributes["port"]
        @ri.svc_name = attributes["svc_name"]
        @ri.protocol = attributes["protocol"]
        @ri.severity = attributes["severity"]
        
        @ri.plugin_id = attributes["pluginID"]
        @plugin.plugin_id = @ri.plugin_id
        
        @plugin.plugin_name = attributes["pluginName"]
        @plugin.plugin_family = attributes["pluginFamily"]
        @plugin.save
        @ri.save
      when "see_also"
        @sa = @plugin.Pluginseealsos.create
        @sa.save
      when "cve"
        #@cve = @plugin.Plugincves.create
        #@cve.save
      when "bid"
        @bid = @plugin.Pluginbids.create
        @bid.save
      when "xref"
        @xref = @plugin.Pluginxrefs.create
        @xref.save
    end
  end
  
  # Called when the inner text of a element is reached
  def on_characters(text)
    if @vals[@tag] == nil then
      @vals[@tag] = text
    else
      @vals[@tag] << text
    end
  end
  
  # Called when the end of the xml element is reached
  def on_end_element(element)
    @tag = nil
    case element
      when "policyName"     
        @policy.attributes = { :name => @vals["policyName"] }
        @policy.save
      when "preference"
        @sp.attributes = { :name => @vals["name"], :value => @vals["value"]}
        @sp.save
      when "item"
        @item.attributes = {
          :plugin_name => @vals["pluginName"], 
          :plugin_id => @vals["pluginId"],
          :fullname => @vals["fullName"],
          :preference_name => @vals["preferenceName"],
          :preference_type => @vals["preferenceType"],
          :preference_values => @vals["preferenceValues"],
          :selected_values => @vals["selectedValue"]
        }
        @item.save
      when "FamilyItem"
        @fi.attributes = {
          :family_name => @vals["FamilyName"],
          :status => @vals["Status"], 
        }
        @fi.save
      when "PluginItem"
        @plugin.attributes = {
          :plugin_id => @vals["PluginId"],
  		    :plugin_name => @vals["PluginName"],
  		    :family => @vals["Family"],
  		    :status => @vals["Status"]
		    }
		    @plugin.save
	    when "tag"
	      if @vals["end"]
	        @rh.attributes = { :end => @vals["tag"] } 
	      elsif @vals["start"]
	        @rh.attributes = { :start => @vals["tag"] }	        
	      elsif @vals["os"]
	        @rh.attributes = { :os => @vals["tag"].gsub("\n", ",") }	        
        elsif @vals["mac"]
	        @rh.attributes = { :mac => @vals["tag"] } 
	      end
	      @rh.save
      when "solution"
        @plugin.attributes = { :solution => @vals["solution"]}
        @plugin.save
      when "risk_factor"
        @plugin.attributes = { :risk_factor => @vals["risk_factor"]} 
        @plugin.save
      when "description"
        @plugin.attributes = { :description => @vals["description"]} 
        @plugin.save
      when "plugin_publication_date"
        @plugin.attributes = { :plugin_publication_date => @vals["plugin_publication_date"]} 
        @plugin.save
      when "synopsis"
        @plugin.attributes = { :synopsis => @vals["synopsis"]} 
        @plugin.save
      when "cvss_vector"
        @plugin.attributes = { :cvss_vector => @vals["cvss_vector"]} 
        @plugin.save
      when "cvss_base_score"
        @plugin.attributes = { :cvss_base_score => @vals["cvss_base_score"]} 
        @plugin.save
      when "vuln_publication_date"
        @plugin.attributes = { :vuln_publication_date => @vals["vuln_publication_date"]} 
        @plugin.save
      when "see_also"
        @sa.attributes = { :see_also => @vals["see_also"] }
        @sa.save
      when "cve"
        #@cve.attributes = { :cve => @vals["cve"] }
        #@cve.save
      when "bid"
        @bid.attributes = { :bid => @vals["bid"] }
        @bid.save
      when "xref"
        @xref.attributes = { :xref => @vals["xref"] }
        @xref.save
      when "plugin_output"
        @plugin.attributes = { :plugin_output => @vals["plugin_output"]}
        @plugin.save
      when "plugin_version"
        @plugin.attributes = { :plugin_version => @vals["plugin_version"]} 
        @plugin.save
    end  
  end
end