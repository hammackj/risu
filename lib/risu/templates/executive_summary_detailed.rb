# Copyright (c) 2010-2013 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Templates
		class ExecutiveSummaryDetailed < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "exec_summary_detailed",
					:author => "Ed Davison <EDavison@getmns.com>",
					:version => "0.0.4",
					:description => "Generates a detailed executive summary report"
				}
			end

			#
			#
			def render(output)
				output.font_size 10
				output.font "Times-Roman"

				output.image "#{File.expand_path(File.dirname(__FILE__))}/data/nessuslogo.jpg", :scale => 1.0, :position => :left, :vposition => :top

				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"
				output.text "\n"

				output.font_size(24) do
					output.text Report.title, :align => :center
				end

				output.font_size(18) do
					output.text "Executive Summary Report", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n", :align => :center
					output.text "#{Report.author}", :align => :center
					output.text "#{Report.company}", :align => :center
					output.text "\n"
					output.text "#{Report.scan_date}", :align => :center
					output.text "\n"
				end

				output.text "\n"

				output.start_new_page

				output.font_size(18) { output.text "Executive Summary Report", :align => :center }
				output.text "\n"

				output.text "This report contains the results of a security audit performed on #{Report.scan_date}. It contains confidential information about the state of your network. Access to this information by unauthorized personnel may allow them to compromise your network.\n"
				output.text "\n"

				output.text "The periodic assessment of risk to company assets resulting from the operation of an information system is an important activity required by various audit standards.	 #{Report.company} prepared this Security Assessment Report and it summarizes the risks associated with the vulnerabilities identified during the systems Vulnerability Assessment, audits and any other risk assessment activities.	All results were analyzed to provide an assessment of the management, operational and technical controls implemented to protect the confidentiality, integrity and availability of the system.\n"
				output.text "\n"

				output.text "Scan Statistics", :style => :bold
				output.text "\n"

				headers = [
					"Number of hosts",
					"Number of risks",
					"Critical Risks",
					"High Risks",
					"Medium Risks",
					"Low Risks",
					"Info Risks"]
				data = [[
					Host.count,
					Item.risks.count,
					Item.critical_risks.count,
					Item.high_risks.count,
					Item.medium_risks.count,
					Item.low_risks.count,
					Item.info_risks.count]]

				output.table([headers] + data, :header => true, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end unless data == nil

				output.text "\n\n\n"

				output.text "A total of #{Host.count} hosts were found and scanned for vulnerabilities.\n"
				output.text "\n"

				output.text "There were #{Item.risks.count} risks found during this scan. Of these, #{Item.high_risks.count} were High risk vulnerabilities.	High risk vulnerabilities require immediate attention to handle as they are relatively easy for attackers to exploit frequently resulting in full access to affected systems.	 There were #{Item.medium_risks.count} findings which were Medium risk.	 High risk vulnerabilities are harder to exploit and may not result in full control of the affected system and should be addressed rapidly and with priority.	 There were #{Item.low_risks.count} findings which were Low risk vulnerabilities.	 These risks usually let attackers gain information about your network making it easier for launching more advanced attacks and should be handled in a timely manner.	 And #{Item.info_risks.count} findings which were information findings.\n"
				output.text "\n"

				crit_host_count = Item.where(:severity => 4).group(:host_id).count
				high_host_count = Item.where(:severity => 3).group(:host_id).count
				medium_host_count = Item.where(:severity => 2).group(:host_id).count
				low_host_count = Item.where(:severity => 1).group(:host_id).count
				info_host_count = Item.where(:severity => 0).group(:host_id).count

				output.text "There were #{crit_host_count} hosts with Critical risk vulnerabilities, #{high_host_count} hosts with High risk vulnerabilities, #{medium_host_count} hosts with Medium risk vulnerabilities, #{low_host_count} hosts with Low risk vulnerabilities and #{info_host_count} hosts with information findings."
				output.text "\n"

				output.text "The following output.table shows the top 5 vulnerabilities that were found.	These are the most important vulnerabilities to address as they represent a sizable footprint for an attacker to exploit in an attempt to compromise.\n"
				output.text "\n"

				results = Array.new
				headers = ["Count", "Vulnerability"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_plugin(5)

				top10vulns.each do |vuln|
					row = Array.new

					plugin = Plugin.find_by_id(vuln.plugin_id)
					#rails3
					#plug = Item.find(:all, :conditions => {:plugin_id => vuln.plugin_id})
					#rails4
					plug = Item.all.where(:plugin_id => vuln.plugin_id)

					#output.text "#{plug.count} - #{plugin.plugin_name}"

					row.push(plug.count)
					row.push(plugin.plugin_name)
					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				output.text "\n"

				output.text "The following output.table shows the top 5 hosts with the most vulnerabilities.	These should be addressed first and resolved in order or priority of the vulnerabilities found for a given host.\n"
				output.text "\n"

				results = Array.new
				headers = ["Count", "Host"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_host(5)

				top10vulns.each do |vuln|
					row = Array.new

					#plugin = Plugin.find_by_id(vuln.plugin_id)
					ip = Host.find_by_id(vuln.host_id).name
					count = Item.where(:host_id => vuln.host_id).where("severity IN (?)", [0,1,2,3]).count
					#output.text "#{plugin.plugin_name}"

					row.push(count)
					row.push(ip)
					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				output.text "\n"

				output.text "The following output.table shows the top 5 services with the most vulnerabilities.	 These services represent the avenues that an attacker would utilize based on scans to try to gain a foothold into your enterprise.\n"
				output.text "\n"

				results = Array.new
				headers = ["Count", "Service"]
				header_widths = {0 => 75, 1=> 400}

				top10vulns = Item.risks_by_service(5)

				top10vulns.each do |service|
					row = Array.new

					#plugin = Plugin.find_by_id(service.plugin_id)
					#rails3
					#svc = Item.find(:all, :conditions => {:svc_name => service.svc_name})
					svc = Item.all.where(:svc_name => service.svc_name)

					#output.text "#{svc.count} - #{service.svc_name}"

					row.push(svc.count)
					row.push(service.svc_name)
					results.push(row)
				end

				output.table([headers] + results, :header => true, :column_widths => header_widths, :row_colors => ['ffffff', 'f0f0f0']) do
					row(0).style(:font_style => :bold, :background_color => 'D0D0D0')
					cells.borders = [:top, :bottom, :left, :right]
				end unless results == nil

				output.start_new_page

				output.text "Summary Graphs of Key Finding Statistics", :style => :bold
				output.text "\n\n\n"
				output.text "\n"
				output.text "\n"

				cury = output.y
				output.image Item.risks_by_severity_graph, :width => 250, :at => [output.bounds.left, cury]
				output.image Host.top_vuln_graph(10), :width => 250, :at => [output.bounds.right - 250, cury]

				cury = output.y
				output.image Item.risks_by_service_graph(10), :width => 250, :at => [output.bounds.left, cury]
				output.image Host.other_os_graph, :width => 250, :at => [output.bounds.right - 250, cury]
				output.move_down 225

				cury = output.y
				output.image Host.windows_os_graph, :width => 250, :at => [output.bounds.left, cury]
				output.number_pages "<page> of <total>", :at => [output.bounds.right - 50, 0], :width => 150, :page_filter => :all
			end
		end
	end
end

