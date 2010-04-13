#!/usr/bin/env ruby

#Jacob Hammack
#jacob.hammack@hammackj.com
#http://www.hammackj.com
#
#This script generates a tehcnical fix list and finding guide for the customer

require 'rubygems'
require 'pdf/writer'
require 'nessus_db_model'
require 'findings'

# Technical Findings class 
#
class TechnicalFindings
  attr_accessor :title, :author, :findings, :output_file
  
  # Generates a PDF report
  #
  def generate_report()
    @findings = Findings.new
    @findings.number_of_hosts = Host.find(:all).count
    @findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
    @findings.number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
    @findings.number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
    @findings.number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
    @findings.number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
    @findings.findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
    @findings.operating_systems = Host.find(:all, :group => :os).map(&:os)
    @findings.critical_findings = Item.find(:all, :conditions => ["severity = 3"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
    @findings.high_findings = Item.find(:all, :conditions => ["severity = 2"])
    
    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"

    print_header(pdf)

    print_findings(pdf, @findings.critical_findings, "Critical Findings", Color::RGB::Red)
    print_findings(pdf, @findings.high_findings, "High Findings", Color::RGB::Orange)
    
    pdf.save_as(@output_file)
  end
  
  # Prints the findings in a structured way
  #
  # @param pdf pdf object to write to
  #
  # @author Jacob Hammack
  #
  def print_header(pdf)
    pdf.text("CONFIDENTIAL", :font_size => 16, :justification => :center)
    pdf.text("\n")
    pdf.text(@title, :font_size => 20, :justification => :center)
    pdf.text("Technical Summary", :font_size => 18, :justification => :center)
    pdf.text("Critical and High Findings", :font_size => 18, :justification => :center)
    pdf.text("\n")
    pdf.text("This report prepared by:", :font_size => 12, :justification => :center)
    pdf.text(@author, :font_size => 12, :justification => :center)
    pdf.text("\n")
    pdf.text("\n")
  end
  
  # Prints the findings in a structured way
  #
  # @param pdf pdf object to write to
  # @param findings findings to enumerate for the output
  # @param finding_type Type of finding section used as title
  # @param color Color of the finding section
  #
  # @author Jacob Hammack
  #
  def print_findings(pdf, findings, finding_type, color)
    pdf.fill_color  color
    pdf.text("<b>#{finding_type}</b>", :font_size => 18, :justification => :left)
    pdf.fill_color  Color::RGB::Black
    pdf.text("\n")
    
    findings.each { |finding|
      host = Host.find_by_id(finding.host_id)
      plugin = Plugin.find_by_id(finding.plugin_id)
      references = Reference.find(:all, :group => :value, :order => :reference_name, :order => :reference_name, :conditions => {:plugin_id => plugin.id})

      pdf.text("<b>#{plugin.plugin_name}</b>", :font_size => 14)  
      pdf.text("\n")
      pdf.text("<b>Host</b>")
      pdf.text(host.name, :font_size => 12)
      pdf.text("\n")
      
      if finding.plugin_output != nil
        pdf.text("<b>Plugin Output</b>")
        pdf.text(finding.plugin_output, :font_size => 12)
        pdf.text("\n")
      end
      
      if plugin.description != nil
        pdf.text("<b>Description</b>")
        pdf.text(plugin.description, :font_size => 12)
        pdf.text("\n")
      end
      
      if plugin.synopsis != nil
        pdf.text("<b>Synopsis</b>")
        pdf.text(plugin.synopsis, :font_size => 12)
        pdf.text("\n")  
      end
      
      if plugin.cvss_base_score != nil
        pdf.text("<b>CVSS Base Score</b>")
        pdf.text(plugin.cvss_base_score, :font_size => 12)
        pdf.text("\n")
      end
  
      if plugin.solution != nil
        pdf.text("<b>Solution</b>")
        pdf.text(plugin.solution, :font_size => 12)
        pdf.text("\n")
      end
      
      if references.size != 0
        pdf.text("<b>References</b>")
        references.each { |ref|
          ref_text = sprintf "%s: %s\n", ref.reference_name, ref.value
          pdf.text(ref_text, :font_size => 12)
        }
        pdf.text("\n")
      end
      
      pdf.text("\n")
    }  
  end
  
  # Main function for the technical findings class
  #
  # @author Jacob Hammack
  #
  def main()
    @opt = OptionParser.new { |opt|
    	opt.banner =  "NessusDB Technical Report Summary Generator v1.0\nJacob Hammack\nhttp://hammackj.com\n\n"
    	opt.banner << "usage: #{$0} [command] <options> [targets]"
    	opt.separator('')
    	opt.separator('Commands:')

    	opt.on('-a AUTHOR', '--author', 'Author of the report') { |a|
    		@author = a.to_s
    	}

    	opt.on('-t TITLE', '--title', 'Title of the report') { |t|
    		@title = t.to_s
    	}

    	opt.on('-o FILE', '--output-file', 'The name of the output file, the format will be in pdf') { |f|
        @output_file = f.to_s
    	}    

    	opt.on_tail("-h", "--help", "Show this message") { |help|
    		puts opt.to_s + "\n"
    		exit
    	}
    }
    
    if ARGV.length != 0 
    	@opt.parse!
    	generate_report
    else
    	puts @opt.to_s + "\n"
    	exit
    end
  end
end

report =  TechnicalFindings.new()
report.main()
