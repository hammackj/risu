#!/usr/bin/env ruby

#Jacob Hammack
#This script generates a tehcnical fix list and finding guide for the customer

require 'rubygems'
require "pdf/writer"

require 'nessus_db_model'
require 'findings'

module NessusDB
  class ReportFindings
    attr_accessor :title, :author, , :classification, :findings, :output_file
    
    def generate_report()  

      findings = Findings.new
      findings.number_of_hosts = Host.find(:all).count
      findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
      findings.number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
      findings.number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
      findings.number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
      findings.number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
      #findings.number_of_none = Item.find(:all, :conditions => ["severity = 0"]).count
      findings.findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
      findings.operating_systems = Host.find(:all, :group => :os).map(&:os)
      findings.critical_findings = Item.find(:all, :conditions => ["severity = 3"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
      findings.high_findings = Item.find(:all, :conditions => ["severity = 2"])

      pdf = PDF::Writer.new
      pdf.select_font "Times-Roman"

      #print out the header, centered
      pdf.text(@classification, :font_size => 16, :justification => :center)
      pdf.text("\n")
      pdf.text(@title, :font_size => 20, :justification => :center)
      pdf.text("Technical Summary", :font_size => 18, :justification => :center)
      pdf.text("Critical and High Findings", :font_size => 18, :justification => :center)
      pdf.text("\n")
      pdf.text("\n")

      pdf.fill_color  Color::RGB::Red
      pdf.text("<b>Critical Findings</b>", :font_size => 18, :justification => :left)
      pdf.fill_color  Color::RGB::Black
      pdf.text("\n")

      findings.critical_findings.each { |finding|
        host = Host.find_by_id(finding.host_id)
        plugin = Plugin.find_by_id(finding.plugin_id)
        references = Reference.find(:all, :group => :value, :order => :reference_name, :order => :reference_name, :conditions => {:plugin_id => plugin.id})

        pdf.text("<b>#{plugin.plugin_name}</b>", :font_size => 14)  
        pdf.text("\n")
        pdf.text("<b>Host</b>")
        pdf.text(host.name, :font_size => 12)
        pdf.text("\n")
        pdf.text("<b>Description</b>")
        pdf.text(plugin.description, :font_size => 12)
        pdf.text("\n")
        pdf.text("<b>Synopsis</b>")
        pdf.text(plugin.synopsis, :font_size => 12)
        pdf.text("\n")  
        pdf.text("<b>CVSS Base Score</b>")
        pdf.text(plugin.cvss_base_score, :font_size => 12)
        pdf.text("\n")
        pdf.text("<b>Solution</b>")
        pdf.text(plugin.solution, :font_size => 12)
        pdf.text("\n")
        pdf.text("<b>References</b>")
        references.each { |ref|
          ref_text = sprintf "%s: %s\n", ref.reference_name, ref.value
          pdf.text(ref_text, :font_size => 12)
        }
        pdf.text("\n")
        pdf.text("\n")
      }

      pdf.text("\n")
      pdf.fill_color  Color::RGB::Orange
      pdf.text("<b>High Findings</b>", :font_size => 18, :justification => :left)
      pdf.fill_color  Color::RGB::Black
      pdf.text("\n")
      findings.high_findings.each { |finding|
          host = Host.find_by_id(finding.host_id)
          plugin = Plugin.find_by_id(finding.plugin_id)
          references = Reference.find(:all, :group => :value, :order => :reference_name, :order => :reference_name, :conditions => {:plugin_id => plugin.id})

          pdf.text("<b>#{plugin.plugin_name}</b>", :font_size => 14)  
          pdf.text("\n")
          pdf.text("<b>Host</b>")
          pdf.text(host.name, :font_size => 12)
          pdf.text("\n")
          pdf.text("<b>Description</b>")
          pdf.text(plugin.description, :font_size => 12)
          pdf.text("\n")
          pdf.text("<b>Synopsis</b>")
          pdf.text(plugin.synopsis, :font_size => 12)
          pdf.text("\n")  
          pdf.text("<b>CVSS Base Score</b>")
          pdf.text(plugin.cvss_base_score, :font_size => 12)
          pdf.text("\n")
          pdf.text("<b>Solution</b>")
          pdf.text(plugin.solution, :font_size => 12)
          pdf.text("\n")
          pdf.text("<b>References</b>")
          references.each { |ref|
            ref_text = sprintf "%s: %s\n", ref.reference_name, ref.value
            pdf.text(ref_text, :font_size => 12)
          }
          pdf.text("\n")
          pdf.text("\n")
        }


      pdf.save_as(@output_file)
    end
    
    # Main Function for Report Findings
    #
    #
    def main
      Choice.options do
        banner sprintf 'NessusDB - Executive Report Summary Generator v%s', PROGRAM_VERSION
        header 'Jacob Hammack'
        header 'http://hammackj.com'
        header 'Usage: report_findings.rb [OPTIONS]'
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
        
        option :output_file do
          short '-o'
          long '--output-file FILE'
          desc 'The Name of output PDF'
        end
        
        option :classification do
          short '-c'
          long '--classificiation STRING'
          desc 'Overall classification of the report, default is Confidential'
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
        @output_file = "report_findings.pdf"
      end
      
      generate_report
    end
  end
end

report = NessusDB::ReportFindings.new
report.main()