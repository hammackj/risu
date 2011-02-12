text Report.classification, :align => :center
text "\n"

font_size(24) { text Report.title, :align => :center }
font_size(18) { 
	text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n\n\n"

start_new_page

image Item.risks_by_severity_graph, :width => 500, :height => 375, :position => :center

start_new_page

image Item.risks_by_service_graph(10), :width => 500, :height => 375, :position => :center

start_new_page

image Plugin.top_by_count_graph(10), :width => 500, :height => 375, :position => :center

start_new_page

image Host.top_vuln_graph(10), :width => 500, :height => 375, :position => :center

start_new_page

image Host.other_os_graph, :width => 500, :height => 375, :position => :center

start_new_page

image Host.windows_os_graph, :width => 500, :height => 375, :position => :center