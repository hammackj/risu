module Risu
	module Templates
		class ExecSummary < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "exec_summary", 
					:author => "hammackj", 
					:version => "0.0.2", 
					:description => "Generates a simple executive summary."
				}
			end
			
			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) do
					output.text Report.title, :align => :center 
				end
				
				output.font_size(18) do
				    output.text "Executive Summary", :align => :center
				    output.text "\n"
				    output.text "This report was prepared by\n#{Report.author}", :align => :center
				end

				output.text "\n\n\n"

				output.text "Scan Date:", :style => :bold
				output.text "#{Report.scan_date}"
				output.text "\n"

				output.text "This report contains the results of a security audit performed on #{Report.scan_date}. It contains confidential information about the state of your network. Access to this information by unauthorized personnel may allow them to compromise your network.\n\n"

				output.text "A total of #{Host.count} hosts were found and scanned for vulnerabities.\n\n"

				output.text "There were #{Item.risks.count} vulnerabilities found during this scan. Of these, #{Item.high_risks.count} were high vulnerabilities, #{Item.medium_risks.count} were medium vulnerabilities, #{Item.low_risks.count} were low vulnerabilities and #{Item.info_risks.count} were information findings.\n\n"

				output.text "Scan Statistics", :style => :bold
				output.text "\n"

				output.table([["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"], 
				[Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]], 
				:cell_style => { :padding =>12 }, :width => output.bounds.width)
				output.text "\n\n\n"

				output.text "Graphs of key finding statistics", :style => :bold
				output.text "\n\n\n"

				cury = output.y
				output.image Item.risks_by_severity_graph, :width => 250, :at => [output.bounds.left, cury]
				output.image Host.top_vuln_graph(10), :width => 250, :at => [output.bounds.right - 250, cury]
				output.move_down 50
				if (output.y <= 300) 
				    output.start_new_page
						output.move_down 75
				end
				cury = output.y
				output.image Item.risks_by_service_graph(10), :width => 250, :at => [output.bounds.left, cury]
				output.image Host.other_os_graph, :width => 250, :at => [output.bounds.right - 250, cury]
				output.move_down 250
				#if (y <= 300) 
				#    output.start_new_page
				#		cury = y
				#end
				cury = output.y
				#move_down 550
				output.image Host.windows_os_graph, :width => 250, :at => [output.bounds.left, cury]
			end
		end
	end
end
