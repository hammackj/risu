require 'libxml'
require 'nessus_db_model'
#require 'thread'

class NessusSaxListener
	include LibXML::XML::SaxParser::Callbacks

	def initialize
		@vals = Hash.new
	end
	
	def on_start_element(element, attributes)
	  #@vals = Hash.new
	  @tag = element
	  @vals[@tag] = ""

	  case element
      when "Policy"
        @policy = Policy.create
        @policy.save
      when "preference"
        @sp = @policy.ServerPreferences.create
        @sp.save
      when "item"
        @item = @policy.PluginsPreferences.create
        @item.save
      when "FamilyItem"
        @family = @policy.FamilySelections.create
        @family.save
      when "PluginItem"
        @plugin_selection = @policy.IndividualPluginSelections.create
        @plugin_selection.save
      when "Report"
        @report = @policy.Reports.create
        @report.name = attributes["name"]
        @report.save
      when "ReportHost"
        @rh = @report.Hosts.create
        @rh.name = attributes["name"]
        @rh.save
      when "tag"
        if attributes["name"] == "HOST_END"
          @vals["end"] = true
          @vals["mac"] = false
          @vals["start"] = false
          @vals["os"] = false
        elsif attributes["name"] == "mac-address"
          @vals["mac"] = true
          @vals["end"] = false
          @vals["start"] = false
          @vals["os"] = false
        elsif attributes["name"] == "HOST_START"
          @vals["start"] = true
          @vals["mac"] = false
          @vals["end"] = false
          @vals["os"] = false
        elsif attributes["name"] == "operating-system"
          @vals["os"] = true
          @vals["mac"] = false
          @vals["start"] = false
          @vals["end"] = false
        end
      when "ReportItem"
        @ri = @rh.Items.create
        @plugin = Plugin.find_or_create_by_id(attributes["pluginID"])
        
        @ri.port  = attributes["port"]
        @ri.svc_name = attributes["svc_name"]
        @ri.protocol = attributes["protocol"]
        @ri.severity = attributes["severity"]
        
        @ri.plugin_id = attributes["pluginID"]        
        @plugin.plugin_name = attributes["pluginName"]
        @plugin.family_name = attributes["pluginFamily"]
        @plugin.save
        @ri.save
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
        @policy.attributes = { 
          :name => @vals["policyName"] 
        } 
        
        @policy.save
      when "policyComments"
        @policy.attributes = { 
          :comments => @vals["policyComments"] 
        }
        
        @policy.save
      when "preference"
        @sp.attributes = { 
          :name => @vals["name"], 
          :value => @vals["value"]
        }
        
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
        @family.attributes = {
          :family_name => @vals["FamilyName"],
          :status => @vals["Status"]
        }
        
        @family.save
      when "PluginItem"    
        @plugin_selection.attributes = {
          :plugin_id => @vals["PluginId"],
  		    :plugin_name => @vals["PluginName"],
  		    :family => @vals["Family"],
  		    :status => @vals["Status"]
		    }
		    
		    @plugin_selection.save
	    when "tag"	      
	      if @vals["end"] == true
	        @rh.attributes = { :end => @vals["tag"] } 
	      elsif @vals["start"] == true
	        @rh.attributes = { :start => @vals["tag"] }	        
	      elsif @vals["os"] == true
	        @rh.attributes = { :os => @vals["tag"].gsub("\n", ",") }	        
        elsif @vals["mac"] == true
	        @rh.attributes = { :mac => @vals["tag"] } 
	      end
	      
	      @rh.save
      when "ReportItem"
        @plugin.attributes = { 
          :solution => @vals["solution"],
          :risk_factor => @vals["risk_factor"],
          :description => @vals["description"],
          :plugin_publication_date => @vals["plugin_publication_date"],
          :synopsis => @vals["synopsis"],
          :cvss_vector => @vals["cvss_vector"],
          :cvss_base_score => @vals["cvss_base_score"],
          :vuln_publication_date => @vals["vuln_publication_date"],
          :plugin_output => @vals["plugin_output"],
          :plugin_version => @vals["plugin_version"]
        }
        @plugin.save
        
        if @vals["cve"] != nil
          @cve = @plugin.References.create        
        
          @cve.attributes = { 
            :type => "cve",
            :value => @vals["cve"]
          }
          
          @cve.save
        end
        
        
  
  
    end  
  end
end