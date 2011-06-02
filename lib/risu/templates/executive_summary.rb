module NaslTidy
	module Modules
		class Template < Risu::Base::TemplateBase
			
			#
			#
			def initialize ()
				@template_info = 
				{ 
					:name => "exec_summary_detailed", 
					:author => "Ed Davison <EDavison@getmns.com>", 
					:version => "0.0.1", 
					:description => "Generates a detailed executive summary report"
				}
			end
			
			#
			#
			def render
				font_size 10
				font "Times-Roman"

				image File.dirname(template) + "/data/nessuslogo.jpg", :scale => 1.0, :position => :left, :vposition => :top

				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"

				font_size(24) { text Report.title, :align => :center }

				font_size(18) {
					text "Executive Summary Report", :align => :center
					text "\n"
					text "This report was prepared by\n", :align => :center
					text "#{Report.author}", :align => :center
					text "#{Report.company}", :align => :center
					text "\n"
					text "#{Report.scan_date}", :align => :center
					text "\n"
				}

				text "\n"

				start_new_page

				font_size(18) { text "Executive Summary Report", :align => :center }
				text "\n"

				text "This report contains the results of a security audit performed on #{Report.scan_date}. It contains confidential information about the state of your network. Access to this information by unauthorized personnel may allow them to compromise your network.\n"
				text "\n"

				text "The periodic assessment of risk to company assets resulting from the operation of an information system is an important activity required by various audit standards.	 #{Report.company} prepared this Security Assessment Report and it summarizes the risks associated with the vulnerabilities identified during the systems Vulnerability Assessment, audits and any other risk assessment activities.	All results were analyzed to provide an assessment of the management, operational and technical controls implemented to protect the confidentiality, integrity and availability of the system.\n"
				text "\n"

				text "Scan Statistics", :style => :bold
				text "\n"

				headers = ["Number of hosts","Number of risks","High Risks", "Medium Risks", "Low Risks", "Info Risks"]
				data = [[Host.count, Item.risks.count, Item.high_risks.count, Item.medium_risks.count, Item.low_risks.count, Item.info_risks.count]]

				table([headers] + data, :header => true, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end unless data == nil

				text "\n\n\n"

				text "A total of #{Host.count} hosts were found and scanned for vulnerabities.\n"
				text "\n"

				text "There were #{Item.risks.count} risks found during this scan.	Of these, #{Item.high_risks.count} were High risk vulnerabilities.	High risk vulnerabilities require immediate attention to handle as they are relatively easy for attackers to exploit frequently resulting in full access to affected systems.	 There were #{Item.medium_risks.count} findings which were Medium risk.	 High risk vulnerabilities are harder to exploit and may not result in full control of the affected system and should be addressed rapidly and with priority.	 There were #{Item.low_risks.count} findings which were Low risk vulnerabilities.	 These risks usually let attackers gain information about your network making it easier for launching more advanced attacks and should be handled in a timely manner.	 And #{Item.info_risks.count} findings which were information findings.\n"
				text "\n"

				high_host_count = Item.where(:severity => 3).group(:host_id).all.count
				medium_host_count = Item.where(:severity => 2).group(:host_id).all.count
				low_host_count = Item.where(:severity => 1).group(:host_id).all.count
				info_host_count = Item.where(:severity => 0).group(:host_id).all.count

				text "There were #{high_host_count} hosts with High risk vulnerabilities, #{medium_host_count} hosts with Medium risk vulnerabilities, #{low_host_count} hosts with Low risk vulnerabilities and #{info_host_count} hosts with information findings."
				text "\n"

				text "The following table shows the top 5 vulnerabilities that were found.	These are the most important vulnerabilities to address as they represent a sizeable footprint for an attacker to exploit in an attempt to compromise.\n"
				text "\n"

				results = Array.new
				headers = ["Count", "Vulnerability"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_plugin(5)

				top10vulns.each do |vuln|
					row = Array.new

					plugin = Plugin.find_by_id(vuln.plugin_id)
					plug = Item.find(:all, :conditions => {:plugin_id => vuln.plugin_id})
					#text "#{plug.count} - #{plugin.plugin_name}"

					row.push(plug.count)
					row.push(plugin.plugin_name)
					results.push(row)
				end

				table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				text "\n"

				text "The following table shows the top 5 hosts with the most vulnerabilities.	These should be addressed first and resolved in order or priority of the vulnerabilities found for a given host.\n"
				text "\n"

				results = Array.new
				headers = ["Count", "Host"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_host(5)

				top10vulns.each do |vuln|
					row = Array.new

					#plugin = Plugin.find_by_id(vuln.plugin_id)
					ip = Host.find_by_id(vuln.host_id).name
					count = Item.where(:host_id => vuln.host_id).where("severity IN (?)", [0,1,2,3]).count
					#text "#{plugin.plugin_name}"

					row.push(count)
					row.push(ip)
					results.push(row)
				end

				table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				text "\n"

				text "The following table shows the top 5 services with the most vulnerabilities.	 These services represent the avenues that an attacker would utilize based on scans to try to gain a foothold into your enterprise.\n"
				text "\n"

				results = Array.new
				headers = ["Count", "Service"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_service(5)

				top10vulns.each do |service|
					row = Array.new

					#plugin = Plugin.find_by_id(service.plugin_id)
					svc = Item.find(:all, :conditions => {:svc_name => service.svc_name})
					#text "#{svc.count} - #{service.svc_name}"

					row.push(svc.count)
					row.push(service.svc_name)
					results.push(row)
				end

				table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				text "\n\n\n"
				if (y <= 300)
						start_new_page
						move_down 50
				end

				text "Summary Graphs of Key Finding Statistics", :style => :bold
				text "\n\n\n"
				text "\n"
				text "\n"

				cury = y
				image Item.risks_by_severity_graph, :width => 250, :at => [bounds.left, cury]
				image Host.top_vuln_graph(10), :width => 250, :at => [bounds.right - 250, cury]
				move_down 225
				if (y <= 300)
						start_new_page
						move_down 50
				end
				cury = y
				image Item.risks_by_service_graph(10), :width => 250, :at => [bounds.left, cury]
				image Host.other_os_graph, :width => 250, :at => [bounds.right - 250, cury]
				move_down 225
				if (y <= 300)
						start_new_page
						move_down 50
				end
				cury = y
				image Host.windows_os_graph, :width => 250, :at => [bounds.left, cury]

				number_pages "<page> of <total>", :at => [bounds.right - 50, 0], :width => 150, :page_filter => :all
			end
		end
	end
end

