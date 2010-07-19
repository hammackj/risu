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
require 'choice'

module NessusDB
  # Technical Findings class 
  #
  class TechnicalFindings
    attr_accessor :title, :author, :classification, :findings, :output_file
    PROGRAM_VERSION = 1.0
  
    # Generates a PDF report of the findings
    #
    def generate_report()
      @findings = Findings.new

      #@findings.number_of_hosts = Host.find(:all).count
      #@findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
      #@findings.number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
      #@findings.number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
      #@findings.number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
      #@findings.number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
      #@findings.findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
      #@findings.other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%'"], :group => :os).map(&:os)
      #@findings.windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%'"], :group => :os).map(&:os)
      #@findings.critical_findings = Item.find(:all, :conditions => ["severity = 3 AND plugin_id NOT IN (26928, 45411, 42873, 20007, 31705, 18405, 10882)"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
      #@findings.high_findings = Item.find(:all, :conditions => ["severity = 2 AND plugin_id NOT IN (26928, 45411, 42873, 20007, 31705, 18405, 10882)"])
    
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
      pdf.text(@classification, :font_size => 16, :justification => :center)
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
      Choice.options do
        banner sprintf 'NessusDB - Technical Findings Report Summary Generator v%s', PROGRAM_VERSION
        header 'Jacob Hammack'
        header 'http://hammackj.com'
        header 'Usage: technical_findings.rb [OPTIONS]'
        header ''

        header 'Options:'
      
        option :author do
          short '-a'
          long '--author AUTHOR'
          desc 'Author of the report'
        end
      
        option :title do
          short '-t'
          long '--title TITLE'
          desc 'Title of the Report'
        end
        
        option :classification do
          short '-c'
          long '--classificiation STRING'
          desc 'Overall classification of the report, default is Confidential'
        end
        
        option :output_file do
          short '-o'
          long '--output-file FILE'
          desc 'The Name of output PDF'
        end
        
        option :help do
          short ''
          long '--help'
          desc 'Show this message'
        end

        option :version do
          short '-v'
          long '--version'
          desc 'Show version'
          action do
            puts "NessusDB - Technical Findings Report Summary Generator v#{PROGRAM_VERSION}"
            exit
          end
        end

        footer ''
      end
    
      if ARGV.length == 0
        puts Choice.help
      end
    
      if Choice.choices[:author]
        @author = Choice.choices[:author]
      else
        @author = "Null Author"
      end
    
      if Choice.choices[:title]
        @title = Choice.choices[:title]
      else
        @title = "Untitled Report"
      end
      
      if Coice.choices[:classification]
        @classification = Choice.choices[:classification]
      else
        @classification = "CONFIDENTIAL"
      end
      
      if Choice.choices[:output_file]
        @output_file = Choice.choices[:output_file]
      else
        @output_file = "technical_findings.pdf"
      end
      
      generate_report
    end
  end
end

report = NessusDB::TechnicalFindings.new()
report.main()
