text findings.classification, :align => :center
text "\n"

font_size(24) { text findings.title, :align => :center }
font_size(18) { 
	text "This report was prepared by\n#{findings.author}", :align => :center
}

text "\n\n\n"

start_new_page

image findings.graph_findings_by_severity(findings), :width => 345, :position => :center

start_new_page

image findings.graph_top_vuln_hosts(findings), :width => 345, :position => :center

start_new_page

image findings.graph_top_vuln_hosts(findings), :width => 345, :position => :center

start_new_page

image findings.graph_findings_by_service(findings), :width => 345, :position => :center

start_new_page

image findings.graph_other_operating_systems_by_count(findings), :width => 345, :position => :center

start_new_page

image findings.graph_windows_operating_systems_by_count(findings), :width => 345, :position => :center