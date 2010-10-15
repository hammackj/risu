# encoding: utf-8

module NessusDB
	# NessusSaxListener
	#
	# 
	# @author Jacob Hammack
	class NessusSaxListener
	  include LibXML::XML::SaxParser::Callbacks
  
	  # 
	  #
	  def initialize
	    @vals = Hash.new
	
			@valid_elements = Array["see_also", "cve", "ReportItem", "xref", "bid", "plugin_version", "risk_factor",
				"description", "cvss_base_score", "solution", "item", "plugin_output", "tag", "synopsis", "plugin_modification_date",
				"FamilyName", "FamilyItem", "Status", "vuln_publication_date", "ReportHost", "HostProperties", "preferenceName",
				"preferenceValues", "preferenceType", "fullName", "pluginId", "pluginName", "selectedValue", "selectedValue",
				"name", "value", "preference", "plugin_publication_date", "cvss_vector", "patch_publication_date",
				"NessusClientData_v2", "Policy", "PluginName", "ServerPreferences", "policyComments", "policyName", "PluginItem",
				"Report", "Family", "Preferences", "PluginsPreferences", "FamilySelection", "IndividualPluginSelection", "PluginId",
				"pci-dss-compliance", "exploitability_ease", "cvss_temporal_vector", "exploit_framework_core", "cvss_temporal_score",
				"exploit_available"]
	  end
	
		# Callback for when the start of a xml element is reached
		#
		# @param element 
		# @param attributes 
	  def on_start_element(element, attributes)
	    @tag = element
	    @vals[@tag] = ""
				
			if !@valid_elements.include?(element)
				puts "New XML element detected: #{element}. Please report this to jacob.hammack@hammackj.com"
			end

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
	        @attr = ""
	        if attributes["name"] == "HOST_END"
	          @attr = "HOST_END"
	        elsif attributes["name"] == "mac-address"
	          @attr = "mac-address"
	        elsif attributes["name"] == "HOST_START"
	          @attr = "HOST_START"
	        elsif attributes["name"] == "operating-system"
	          @attr = "operating-system"
	        elsif attributes["name"] == "host-ip"
	          @attr = "host-ip"
	        elsif attributes["name"] == "host-fqdn"
	          @attr = "host-fqdn"
	        elsif attributes["name"] == "netbios-name"
	          @attr = "netbios-name"
	        elsif attributes["name"] == "local-checks-proto"
	          @attr = "local-checks-proto"
	        elsif attributes["name"] == "smb-login-used"
	          @attr = "smb-login-used" 
	        elsif attributes["name"] == "ssh-auth-meth"
	          @attr = "ssh-auth-meth"                               
	        elsif attributes["name"] == "ssh-login-used"
	          @attr = "ssh-login-used"
	       	elsif attributes["name"] == "pci-dss-compliance"
						@attr = "pci-dss-compliance"
	        else 
	          puts "New HostProperties attribute: #{attributes["name"]}. Please report this to jacob.hammack@hammackj.com\n"
	        end   
	      when "ReportItem"
	        @vals = Hash.new # have to clear this out or everything has the same references
	        @ri = @rh.Items.create
	        if attributes["pluginID"] == "0"
	          @plugin = Plugin.find_or_create_by_id(1)
	        else
	          @plugin = Plugin.find_or_create_by_id(attributes["pluginID"])
	        end
        
	        @ri.port  = attributes["port"]
	        @ri.svc_name = attributes["svc_name"]
	        @ri.protocol = attributes["protocol"]
	        @ri.severity = attributes["severity"]
        
	        @ri.plugin_id = @plugin.id       
	        @plugin.plugin_name = attributes["pluginName"]
	        @plugin.family_name = attributes["pluginFamily"]
	        @plugin.save
	        @ri.save
	    end
	  end
  
	  # Called when the inner text of a element is reached
	  #
	  # @param text
	  def on_characters(text)
	    if @vals[@tag] == nil then
	      @vals[@tag] = text
	    else
	      @vals[@tag] << text
	    end
	  end
  
	  # Called when the end of the xml element is reached
	  #
	  # @param element
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
        
	        #This takes a really long time, there is about 34,000 pluginIDs in this
	        #field and it takes about 36 minutes to parse just this info =\
	        #lets prepopulate the plugins table with the known pluginid's
	        #if @vals["name"] == "plugin_set"
	        #  @all_plugins = @vals["value"].split(";")
	        #  
	        #  @all_plugins.each { |p|
	        #     @plug = Plugin.find_or_create_by_id(p)
	        #     @plug.save
	        #  }
	        #end
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
		      if @attr == "HOST_END"
		        @rh.attributes = { :end => @vals["tag"] } 
		      elsif @attr == "mac-address"
		        @rh.attributes = { :mac => @vals["tag"] }	        
		      elsif @attr == "HOST_START"
		        @rh.attributes = { :start => @vals["tag"].gsub("\n", ",") }	        
	        elsif @attr == "operating-system"
		        @rh.attributes = { :os => @vals["tag"] } 
	        elsif @attr == "host-ip"
		        @rh.attributes = { :ip => @vals["tag"] }	        
	        elsif @attr == "host-fqdn"
		        @rh.attributes = { :fqdn => @vals["tag"] }
	        elsif @attr == "netbios-name"
		        @rh.attributes = { :netbios => @vals["tag"] }	 
		      elsif @attr == "local-checks-proto"
	  	      @rh.attributes = { :local_checks_proto => @vals["tag"] }   
		      elsif @attr == "smb-login-used"
	  	      @rh.attributes = { :smb_login_used => @vals["tag"] }  	      
		      elsif @attr == "ssh-auth-meth"
	  	      @rh.attributes = { :ssh_auth_meth => @vals["tag"] }  	    
		      elsif @attr == "ssh-login-used"
	  	      @rh.attributes = { :ssh_login_used => @vals["tag"] } 
	 	    	elsif @attr == "pci-dss-compliance"
						@rh.attributes = { :pci_dss_compliance => @vals["tag"] }
		      end
	      
		      @rh.save
		    #We cannot handle the references in the same block as the rest of the ReportItem tag because 
		    #there tends to be more than of the different types of reference per ReportItem, this causes issue for a sax 
		    #parser. To solve this we do the references before the final plugin data
		    when "cve"
	        @cve = @plugin.References.create        
	        @cve.reference_name = "cve"
	        @cve.value = @vals["cve"]
	        @cve.save
	      when "bid"
	        @bid = @plugin.References.create        
	        @bid.reference_name = "bid"
	        @bid.value = @vals["bid"]
	        @bid.save
	      when "see_also"
	        @see_also = @plugin.References.create        
	        @see_also.reference_name = "see_also"
	        @see_also.value = @vals["see_also"]
	        @see_also.save
	      when "xref"
	        @xref = @plugin.References.create        
	        @xref.reference_name = "xref"
	        @xref.value = @vals["xref"]
	        @xref.save        
	      when "ReportItem"
        
	        @ri.plugin_output = @vals["plugin_output"]
	        @ri.save
        
	        @plugin.attributes = { 
	          :solution => @vals["solution"],
	          :risk_factor => @vals["risk_factor"],
	          :description => @vals["description"],
	          :plugin_publication_date => @vals["plugin_publication_date"],
	          :synopsis => @vals["synopsis"],
	          :cvss_vector => @vals["cvss_vector"],
	          :cvss_base_score => @vals["cvss_base_score"],
	          :vuln_publication_date => @vals["vuln_publication_date"],
	          :plugin_version => @vals["plugin_version"],
						:cvss_temporal_score => @vals["cvss_temporal_score"],
						:cvss_temporal_vector => @vals["cvss_temporal_vector"],
						:exploitability_ease => @vals["exploitability_ease"],
						:exploit_framework_core => @vals["exploit_framework_core"],
						:exploit_available => @vals["exploit_available"]
	        }
	        @plugin.save
	    end  
	  end
	end
end
