module Risu
	module Templates
		class TechnicalFindings < Risu::Base::TemplateBase

			#
			#
			def initialize ()
				@template_info =
				{
					:name => "technical_findings",
					:author => "hammackj",
					:version => "0.0.3",
					:description => "Generates a Technical Findings Report"
				}
			end

			#
			#
			def render(output)
				output.text Report.classification.upcase, :align => :center
				output.text "\n"

				output.font_size(22) { output.text Report.title, :align => :center }
				output.font_size(18) {
					output.text "Critical and High Findings", :align => :center
					output.text "\n"
					output.text "This report was prepared by\n#{Report.author}", :align => :center
				}

				output.text "\n\n\n"

				unique_risks = Array.new
				unique_risks << Hash[:title => "Critical Findings", :color => "9B30FF", :values => Item.critical_risks_unique]
				unique_risks << Hash[:title => "High Findings", :color => "FF0000", :values => Item.high_risks_unique]
#				unique_risks << Hash[:title => "Medium Findings", :color => "FF8040", :values => Item.medium_risks_unique]

				unique_risks.each do |h|
					if h[:values].length > 1
						output.font_size(18) do
							output.fill_color h[:color]
							output.text h[:title], :style => :bold
							output.fill_color "000000"
						end

						output.font_size(10)

						output.text "\n"

						h[:values].each do |f|

							hosts = Item.where(:plugin_id => f.plugin_id)
							plugin = Plugin.find_by_id(f.plugin_id)

							references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)

							output.font_size(16) do
								output.text "#{plugin.plugin_name}\n"
							end

							if hosts.length > 1
								output.text "Hosts", :style => :bold
							else
								output.text "Host", :style => :bold
							end

							hostlist = Array.new
							hosts.each do |host|
								h = Host.find_by_id(host.host_id)
								#if h.id != blacklist_host_id.first.id
									hostlist << h.name
								#end
							end

							output.text hostlist.join(', ')

							if f.plugin_output != nil
								output.text "\nPlugin output", :style => :bold
								output.text f.plugin_output
							end

							if plugin.description != nil
								output.text "\nDescription", :style => :bold
								output.text plugin.description
							end

							if plugin.synopsis != nil
								output.text "\nSynopsis", :style => :bold
								output.text plugin.synopsis
							end

							if plugin.cvss_base_score != nil
								output.text "\nCVSS Base Score", :style => :bold
								output.text plugin.cvss_base_score
							end

							if plugin.exploit_available != nil
								output.text "\nExploit Available", :style => :bold

								if plugin.exploit_available == "true"
									output.text "Yes"
								else
									output.text "No"
								end
							end

							if plugin.solution != nil
								output.text "\nSolution", :style => :bold
								output.text plugin.solution
							end

							if references.size != 0
								output.text "\nReferences", :style => :bold
								references.each do |ref|
									ref_text = sprintf "%s: %s\n", ref.reference_name, ref.value
									output.text ref_text
								end
								output.text "\nNessus Plugin", :style => :bold
								output.text "http://www.tenablesecurity.com/plugins/index.php?view=single&id=#{f.plugin_id}"
							end
								output.text "\n"
						end
					end

					output.start_new_page unless h[:values] == nil
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all

			end
		end
	end
end
