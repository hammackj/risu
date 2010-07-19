#!/usr/bin/env ruby

require 'nessus_db_model'

report = "report-sian.html"
#assessment_title = "Pecos County Memorial Hospital"
assessment_title = "SIAN"
assessment_date = "23 March 2010"
assessment_assessor = "Jacob Hammack, CISSP"
#company_name = "RT & Associates"
company_name = "Tangent Security"
#assessment_objective = "The primary objective of this engagement was to fulfill requirements for annual security assessments under the HIPAA guidelines"
assessment_objective = "The primary objective of this engagement was to fulfill requirements for network certification"


file = File.open("#{report}", "w+")

class Findings
  attr_accessor :number_of_hosts, :number_of_risks, :number_of_critical, :number_of_high
  attr_accessor :number_of_medium, :number_of_low, :number_of_none
end

findings = Findings.new
findings.number_of_hosts = Host.find(:all).count
findings.number_of_risks = Item.find(:all, :conditions => ["severity IN (0,1,2,3,4,5)"]).count
findings.number_of_critical = Item.find(:all, :conditions => ["severity = 4"]).count
findings.number_of_high = Item.find(:all, :conditions => ["severity = 3"]).count
findings.number_of_medium = Item.find(:all, :conditions => ["severity = 2"]).count
findings.number_of_low = Item.find(:all, :conditions => ["severity = 1"]).count
findings.number_of_none = Item.find(:all, :conditions => ["severity = 0"]).count

#print out the header, centered
#pdf.text("CONFIDENTIAL", :font_size => 16, :justification => :center)

file.puts("<html><head><title>#{assessment_title}</title><link rel='stylesheet' type='text/css' href='report_style.css' /></head><body>")
file.puts("<p class='report_classification'>UNCLASSIFIED</p>")
file.puts("<p class='assessment_title'>#{assessment_title}</p>")
file.puts("<p class='assessment_type'>Information Systems Risk Report</p>")
file.puts("<p class='assessment_assessor'>This report prepared by:<br />#{assessment_assessor}</p>")
file.puts("<br />")
file.puts("<br />")


file.puts("<h1>Executive Summary</h1>")
file.puts("<p class='report_details'>This report details the findings discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by #{company_name}. #{assessment_objective}. The primary activity executed by #{company_name} was to evaluate the security of the network at #{assessment_title} by performing an on-site assessment of computer network security through automated scanning and analysis. This engagement did not include the auditing of wireless devices, external networks or system exploitation.</p>")
#file.puts("<p>This report details information system risks discovered during an audit of the networks operated by #{assessment_title} on #{assessment_date} by RT & Associates. The primary activity executed by RT & Associates was to evaluate the security of the network at #{assessment_title} by performing an on site assessment of computer network security, excluding wireless device scanning and detection. There were a total of #{numofhosts} hosts scanned during this assessment with a total of #{numofrisks} risks discovered during this assessment. The majority of risks discovered can easiled be corrected with simple configuration changes to the affected system or the application of the appropriate patch. Due to the limited time frame of the assessment and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continuing vigilance to mitigate these vulnerabilities and threats.</p>")
file.puts("<p class='report_details'>#{company_name} identified a total of #{findings.number_of_hosts} hosts containing a total of #{findings.number_of_risks} risks discovered during this assessment. The majority of the risks discovered can easily be corrected through configuration changes, system hardening, and effective patch management. Due to the scoping of this engagement and the fact that networks are dynamic entities, vulnerabilities may arise that were not identified during this assessment. Because new vulnerabilities emerge often, networks require continued vigilance to mitigate the potential for threats to exploit vulnerabilities.</p>")


#Scope may change by assessment and things performed
#pdf.text("<b>Scope</b>", :font_size => 14, :justification => :left)
#pdf.text("\n")
#pdf.text("The scope of the technical risk assessment included an automated vulnerability scan of the internal Internet Protocol (IP) range which #{assessment_title} Technical staff have assigned. #{assessment_title} Technical staff excluded Six (6) machines from the scan due to known technical issues with automated scanning. Wireless network scanning was not performed during this site visit. An external technical risk assessment was not performed and has not been coordinated.", :font_size => 12, :justification => :left)
#pdf.text("\n")

#technical summary, explain the categorization that nessus does, also explain what to tackle first
file.puts("<h1>Technical Summary</h1>")
file.puts("<p class='report_details'>#{findings.number_of_hosts} were scanned during this risk assessment, #{findings.number_of_hosts} risks were found. The #{findings.number_of_risks} are broken down into risk factors (severity). There were #{findings.number_of_critical} Critical, #{findings.number_of_high} High, #{findings.number_of_medium} Medium, #{findings.number_of_low} Low, and #{findings.number_of_none} with no risk factor. The vulnerability scanner has two categorization systems. The first categorizes items by either a security hole, security warning, security note, or informational note. Security holes are items that are broken down into risk factors. These items present a risk of some type of \"hole\" present in the system which could lead to the system being compromised. Security warnings are items that can lead to information disclosure such as user names, or configuration settings. Security warnings present a risk, but not as immediate as a hole. Security notes are items you should be aware of, but do not necessarily present a great risk to the system. Information notes are simply information items such as the host name or domain of the system.</p>")
file.puts("<p class='report_details'>Security items are broken down into Risk Factors or Severity levels from Critical to None. Security Holes with a risk factor of Critical are known vulnerabilities with cursory exploitation, Remedial action should be IMMEDIATE. Security holes with a high risk are known vulnerabilities with a high probability of exploitation, therefore they should be taken care of immediately. Security Holes with a risk factor of Medium have a limited risk in isolation, but may have an impact in combination wtih other discovered vulnerabilities. These risk should be noted and scheduled for remediation. Security Holes with a low risk factor have little risk of exploitation. No recommendation to take remedial action is attached to low vulnerabilities. A Risk Factor of \"None\" warrents no remedial action, nor does it necessarily present a threat to the system.</p>")

file.puts("<img src='findings_by_severity.png' />")
file.puts("<img src='findings_by_service.png' />")
file.puts("<img src='operating_system_by_count.png' />")

file.puts("</body></html>")
file.close
