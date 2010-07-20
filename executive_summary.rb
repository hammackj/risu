#!/usr/bin/env ruby

require 'rubygems'
require "pdf/writer"
require 'choice'
require 'nessus_db_model'
require 'findings'

module NessusDB
  class ExecutiveSummary
	attr_accessor :title, :author, :company, :classification, :findings, :output_file, :date
	PROGRAM_VERSION = "1.0"
    def generate_report
			#create our new pdf
			pdf = PDF::Writer.new
			#set the PDFS Font
			pdf.select_font "Times-Roman"

			findings = Findings.new

			#print out the header, centered
			pdf.text(@classification, :font_size => 16, :justification => :center)
			pdf.text("\n")
			pdf.text(@title, :font_size => 20, :justification => :center)
			pdf.text("Information Systems Risk Report", :font_size => 16, :justification => :center)
			pdf.text("\n")
			pdf.text("This report prepared by:", :font_size => 12, :justification => :center)
			pdf.text(@author, :font_size => 12, :justification => :center)
			pdf.text("\n")
			pdf.text("\n")

			#print out the executive summary ( pdf/writer indents by default)
			pdf.text("<b>Executive Summary</b>", :font_size => 14, :justification => :left)
			pdf.text("This report details the findings discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by #{company_name}. #{assessment_objective}. The primary activity executed by #{@company} was to evaluate the security of the network at #{@title} by performing an on-site assessment of computer network security through automated scanning and analysis. This engagement did not include the auditing of wireless devices, external networks or system exploitation. ", :font_size => 12, :justification => :left)
			pdf.text("\n")
			#pdf.text("\tThis report details information system risks discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by RT & Associates. The primary activity executed by RT & Associates was to evaluate the security of the network at #{assessment_title} by performing an on site assessment of computer network security, excluding wireless device scanning and detection. There were a total of #{numofhosts} hosts scanned during this assessment with a total of #{numofrisks} risks discovered during this assessment. The majority of risks discovered can easiled be corrected with simple configuration changes to the affected system or the application of the appropriate patch. Due to the limited time frame of the assessment and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continuing vigilance to mitigate these vulnerabilities and threats.", :font_size => 12, :justification => :left)
			pdf.text("#{@company} identified a total of #{findings.number_of_hosts} hosts containing a total of #{findings.number_of_risks} risks discovered during this assessment. The majority of the risks discovered can easily be corrected through configuration changes, system hardening, and effective patch management. Due to the scoping of this engagement and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continued vigilance to mitigate the potential for threats to exploit vulnerabilities.", :font_size => 12, :justification => :left)
			pdf.text("\n")

			#Scope may change by assessment and things performed
			#pdf.text("<b>Scope</b>", :font_size => 14, :justification => :left)
			#pdf.text("\n")
			#pdf.text("The scope of the technical risk assessment included an automated vulnerability scan of the internal Internet Protocol (IP) range which #{assessment_title} Technical staff have assigned. #{assessment_title} Technical staff excluded Six (6) machines from the scan due to known technical issues with automated scanning. Wireless network scanning was not performed during this site visit. An external technical risk assessment was not performed and has not been coordinated.", :font_size => 12, :justification => :left)
			#pdf.text("\n")

			#technical summary, explain the categorization that nessus does, also explain what to tackle first
			pdf.text("<b>Technical Summary</b>", :font_size => 14, :justification => :left)
			pdf.text("#{findings.number_of_hosts} were scanned during this risk assessment, #{findings.number_of_risks} risks were found. The #{findings.number_of_risks} are broken down into risk factors (severity). There were #{findings.number_of_critical} Critical, #{findings.number_of_high} High, #{findings.number_of_medium} Medium and #{findings.number_of_low} Low. The vulnerability scanner has two categorization systems. The first categorizes items by either a security hole, security warning, security note, or informational note. Security holes are items that are broken down into risk factors. These items present a risk of some type of \"hole\" present in the system which could lead to the system being compromised. Security warnings are items that can lead to information disclosure such as user names, or configuration settings. Security warnings present a risk, but not as immediate as a hole. Security notes are items you should be aware of, but do not necessarily present a great risk to the system. Information notes are simply information items such as the host name or domain of the system.", :font_size => 12, :justification => :left)

			pdf.text("\n")
			pdf.text("Security items are broken down into Risk Factors or Severity levels from Critical to None. Security Holes with a risk factor of Critical are known vulnerabilities with cursory exploitation, Remedial action should be IMMEDIATE. Security holes with a high risk are known vulnerabilities with a high probability of exploitation, therefore they should be taken care of immediately. Security Holes with a risk factor of Medium have a limited risk in isolation, but may have an impact in combination wtih other discovered vulnerabilities. These risk should be noted and scheduled for remediation. Security Holes with a low risk factor have little risk of exploitation. No recommendation to take remedial action is attached to low vulnerabilities.", :font_size => 12, :justification => :left)

			#pdf.image("findings_by_severity.jpg", :justification => :center)
			#pdf.image("findings_by_service.jpg", :justification => :center)
			#pdf.image("operating_system_by_count.jpg", :justification => :center)
			pdf.save_as(@output_file)	
	
    end
    
    def main
  		Choice.options do
				banner sprintf 'NessusDB - Executive Summary Generator v%s', PROGRAM_VERSION
				header 'Jacob Hammack'
  	    header 'http://hammackj.com'
      	header 'Usage: executive_summary.rb [OPTIONS]'
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
          desc 'Title of the report'
        end
	
  			option :date do
  				long '--date DATE'
  				desc 'Date of assessment'
  			end

        option :classification do
          long '--classificiation STRING'
          desc 'Overall classification of the report, default is Confidential'
        end

  			option :company do
  				long '--company-name COMPANY'
  				desc 'Date of assessment'
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
            puts "NessusDB - Executive Summary Generator v#{PROGRAM_VERSION}"
            exit
          end
		  	end
		
    end
  end
end




