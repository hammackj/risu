#!/usr/bin/env ruby

# technical_findings.rb - This tool generates a report of technical fixes.
# 
# hammackj -  07-25-2010 - Version 1.0 of technical_findings.rb complete. 
#

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

$stdout.sync = true
$stderr.sync = true

require 'nessusdb'

module NessusDB
	
  # Technical Findings class 
  #
	# @author Jacob Hammack
  class TechnicalFindings
    attr_accessor :title, :author, :classification, :findings, :output_file
    PROGRAM_VERSION = 1.0
  
    # Generates a PDF report of the findings
    #
    def generate_report()
      @findings = Findings.new
    
      pdf = PDF::Writer.new
      pdf.select_font "Times-Roman"

      print_header(pdf)

      print_findings(pdf, @findings.critical_findings, "Critical Findings", Color::RGB::Red) unless @findings.critical_findings.length < 1
      print_findings(pdf, @findings.high_findings, "High Findings", Color::RGB::Orange) unless @findings.high_findings.length < 1
    
      pdf.save_as(@output_file)
    end
  
    # Prints the findings in a structured way
    #
    # @param pdf pdf object to write to
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
    def main()
      Choice.options do
        banner sprintf 'NessusDB - Technical Findings Report Generator v%s', PROGRAM_VERSION
        header 'Jacob Hammack'
        header 'http://hammackj.com'
        header 'Usage: technical_findings.rb [OPTIONS]'
        header ''

        header 'Options:'
      
        option :author do
          short '-a'
          long '--author AUTHOR'
          desc 'Author of the report'
					default 'Null Author'
        end
      
        option :title do
          short '-t'
          long '--title TITLE'
          desc 'Title of the Report'
					default 'Untitled Report'
        end
        
        option :classification do
          short '-c'
          long '--classificiation STRING'
          desc 'Overall classification of the report, default is Confidential'
					default 'CONFIDENTIAL'
        end
        
        option :output_file do
          short '-o'
          long '--output-file FILE'
          desc 'The Name of output PDF'
					default 'technical_findings.pdf'
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
    
			@author = Choice.choices[:author]
			@title = Choice.choices[:title]
			@classification = Choice.choices[:classification]
			@output_file = "technical_findings.pdf"
            
      generate_report
    end
  end
end

report = NessusDB::TechnicalFindings.new()
report.main()
