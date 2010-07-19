#!/usr/bin/env ruby

require 'rubygems'
require "pdf/writer"

require 'nessus_db_model'
require 'findings'

report = "report-mccamey.pdf"
assessment_title = "McCamey Hospital"

assessment_date = "24 May 2010"
assessment_assessor = "Jacob Hammack, CISSP"
company_name = "RT & Associates"
assessment_objective = "The primary objective of this engagement was to fulfill requirements for annual security assessments under the HIPAA guidelines"

#assessment_title = "SIAN"
#company_name = "Tangent Security"
#assessment_objective = "The primary objective of this engagement was to fulfill requirements for network certification"

#create our new pdf
pdf = PDF::Writer.new
#set the PDFS Font
pdf.select_font "Times-Roman"

findings = Findings.new
findings.number_of_hosts = Host.find(:all).count
findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4)"]).count
findings.number_of_critical = Item.find(:all, :conditions => ["severity = 3"]).count
findings.number_of_high = Item.find(:all, :conditions => ["severity = 2"]).count
findings.number_of_medium = Item.find(:all, :conditions => ["severity = 1"]).count
findings.number_of_low = Item.find(:all, :conditions => ["severity = 0"]).count
#findings.number_of_none = Item.find(:all, :conditions => ["severity = 0"]).count
findings.findings_by_service = Item.find_by_sql("SELECT svc_name, count(*) as c FROM items where svc_name != 'unknown' and svc_name != 'general' group by svc_name order by c desc limit 10").map(&:svc_name)#Item.find(:all, :group => :svc_name).map(&:svc_name)
findings.other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%'"], :group => :os).map(&:os)
findings.windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%'"], :group => :os).map(&:os)
findings.critical_findings = Item.find(:all, :conditions => ["severity = 3"], :joins => "INNER JOIN plugins ON items.plugin_id = plugins.id", :order => 'plugins.cvss_base_score')
findings.high_findings = Item.find(:all, :conditions => ["severity = 2"])
findings.top_plugins = Item.find_by_sql("SELECT *, count(plugin_id) FROM items WHERE plugin_id NOT IN (1) AND severity in (3) GROUP BY plugin_id ORDER BY count(plugin_id) DESC LIMIT 5").map(&:plugin_id)


#print out the header, centered
pdf.text("CONFIDENTIAL", :font_size => 16, :justification => :center)
#pdf.text("UNCLASSIFIED", :font_size => 16, :justification => :center)
pdf.text("\n")
pdf.text(assessment_title, :font_size => 20, :justification => :center)
pdf.text("Information Systems Risk Report", :font_size => 16, :justification => :center)
pdf.text("\n")
pdf.text("This report prepared by:", :font_size => 12, :justification => :center)
pdf.text(assessment_assessor, :font_size => 12, :justification => :center)
pdf.text("\n")
pdf.text("\n")

#print out the executive summary ( pdf/writer indents by default)
pdf.text("<b>Executive Summary</b>", :font_size => 14, :justification => :left)
pdf.text("This report details the findings discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by #{company_name}. #{assessment_objective}. The primary activity executed by #{company_name} was to evaluate the security of the network at #{assessment_title} by performing an on-site assessment of computer network security through automated scanning and analysis. This engagement did not include the auditing of wireless devices, external networks or system exploitation. ", :font_size => 12, :justification => :left)
pdf.text("\n")
#pdf.text("\tThis report details information system risks discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by RT & Associates. The primary activity executed by RT & Associates was to evaluate the security of the network at #{assessment_title} by performing an on site assessment of computer network security, excluding wireless device scanning and detection. There were a total of #{numofhosts} hosts scanned during this assessment with a total of #{numofrisks} risks discovered during this assessment. The majority of risks discovered can easiled be corrected with simple configuration changes to the affected system or the application of the appropriate patch. Due to the limited time frame of the assessment and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continuing vigilance to mitigate these vulnerabilities and threats.", :font_size => 12, :justification => :left)
pdf.text("#{company_name} identified a total of #{findings.number_of_hosts} hosts containing a total of #{findings.number_of_risks} risks discovered during this assessment. The majority of the risks discovered can easily be corrected through configuration changes, system hardening, and effective patch management. Due to the scoping of this engagement and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continued vigilance to mitigate the potential for threats to exploit vulnerabilities.", :font_size => 12, :justification => :left)
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
pdf.save_as("#{report}")
