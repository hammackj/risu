module Risu
	module Modules
		class ExecSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "exec_summary", 
					:author => "hammackj", 
					:version => "0.0.1", 
					:description => "Generates a simple executive summary."
				}
			end
			
			#
			#
			def render(output)
				text Report.classification, :align => :center
				text "\n"

				font_size(22) { text Report.title, :align => :center }
				font_size(18) { 
				    text "Executive Summary", :align => :center
				    text "\n"
				    text "This report was prepared by\n#{Report.author}", :align => :center
				}

				text "\n\n\n"

				text "Scan Date:", :style => :bold
				text "#{Report.scan_date}"
				text "\n"

				text "This report contains the results of a security audit performed on #{Report.scan_date}. It contains confidential information about the state of your network. Access to this information by unauthorized personnel may allow them to compromise your network.\n\n"

				text "A total of #{Host.count} hosts were found and scanned for vulnerabities.\n\n"

				text "There were #{Item.risks.count} vulnerabilities found during this scan. Of these, #{Item.high_risks.count} were high vulnerabilities, #{Item.medium_risks.count} were medium vulnerabilities, #{Item.low_risks.count} were low vulnerabilities and #{Item.info_risks.count} were information findings.\n\n"

				text "Scan Statistics", :style => :bold
				text "\n"

				table([["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"], 
				[Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]], 
				:cell_style => { :padding =>12 }, :width => bounds.width)
				text "\n\n\n"

				text "Graphs of key finding statistics", :style => :bold
				text "\n\n\n"

				cury = y
				image Item.risks_by_severity_graph, :width => 250, :at => [bounds.left, cury]
				image Host.top_vuln_graph(10), :width => 250, :at => [bounds.right - 250, cury]
				move_down 50
				if (y <= 300) 
				    start_new_page
						move_down 75
				end
				cury = y
				image Item.risks_by_service_graph(10), :width => 250, :at => [bounds.left, cury]
				image Host.other_os_graph, :width => 250, :at => [bounds.right - 250, cury]
				move_down 250
				#if (y <= 300) 
				#    start_new_page
				#		cury = y
				#end
				cury = y
				#move_down 550
				image Host.windows_os_graph, :width => 250, :at => [bounds.left, cury]
			end
		end
	end
end
