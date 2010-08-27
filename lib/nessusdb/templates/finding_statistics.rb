text "Finding Statistics"

table([["Number of hosts","Number of risks","Critical Risks", "High Risks", "Medium Risks", "Low Risks"], 
[findings.number_of_hosts, findings.number_of_risks, findings.number_of_critical, findings.number_of_high, findings.number_of_medium, findings.number_of_low]], 
:cell_style => { :padding =>12 }, :width => bounds.width)

