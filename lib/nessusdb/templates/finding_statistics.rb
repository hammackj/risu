text Report.classification, :align => :center
text "\n"

font_size(22) { text Report.title, :align => :center }
font_size(18) {
	text "Finding Statistics", :align => :center
	text "\n"
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

text "Scan Date:", :style => :bold
text "#{Report.scan_date}"
text "\n"

headers = ["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"]
data = [Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]

table([headers] + [data], :header => true, :width => bounds.width) do
	row(0).style(:font_style => :bold, :background_color => 'cccccc')
	cells.borders = [:top, :bottom, :left, :right]
end
