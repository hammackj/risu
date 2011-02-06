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
text "#{Report.scan_date}"
text "\n"

table([["Number of hosts","Number of risks","Critical Risks", "High Risks", "Medium Risks", "Low Risks"], 
[Host.count, Item.risks.count, Item.critical_risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count]], 
:cell_style => { :padding =>12 }, :width => bounds.width)
