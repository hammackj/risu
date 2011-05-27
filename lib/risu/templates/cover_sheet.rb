image File.dirname(template) + "/data/nessuslogo.jpg", :scale => 0.2, :position => :left, :vposition => :top

text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"

font_size(24) { text Report.title, :align => :center }

font_size(18) { 
    text "Coversheet Example", :align => :center
    text "\n"
    text "This report was prepared by\n#{Report.author}", :align => :center
}

text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"
text "\n"

text "Nessus is a Registered Trademark of Tenable Network Security, Inc."
