text findings.classification, :align => :center
text "\n"

font_size(22) { text findings.title, :align => :center }
font_size(18) { 
	text "Finding Statistics", :align => :center
	text "\n"
	text "This report was prepared by\n#{findings.author}", :align => :center
}

text "\n\n\n"


text "Scan Date:", :style => :bold
text "#{findings.scan_date}"
text "\n"

table([["Number of hosts","Number of risks","Critical Risks", "High Risks", "Medium Risks", "Low Risks"], 
[findings.number_of_hosts, findings.number_of_risks, findings.number_of_critical, findings.number_of_high, findings.number_of_medium, findings.number_of_low]], 
:cell_style => { :padding =>12 }, :width => bounds.width)

