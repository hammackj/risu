# Copyright (c) 2010-2017 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	module Templates
		class NotableTemplateDetailed < Risu::Base::TemplateBase
			include TemplateHelper

			#Creates an instance of the [NotableTemplateDetailed] class and initializes its meta-data
			def initialize
				@template_info =
				{
					:name => "notable_detailed",
					:author => "hammackj",
					:version => "0.0.6",
					:renderer => "PDF",
					:description => "Notable Vulnerabilities Detailed"
				}
			end

			#
			#
			def render output
				@output.text Report.classification.upcase, :align => :center
				@output.text "\n"

				report_title Report.title
				report_subtitle "Notable Vulnerabilities"
				report_author "This report was prepared by\n#{Report.author}"

				@output.text "\n\n\n"

				@output.text "Scan Date:", :style => :bold
				@output.text "#{Report.scan_date}"
				@output.text "\n"

				#data = Item.top_10_sorted_raw

				unique_risks = Array.new
				unique_risks << Hash[:title => "Notable Findings", :color => "9B30FF", :values => Item.top_10_sorted_raw[0..9]]
				counter = 1

				unique_risks.each do |h|
					if h[:values].length > 1
						@output.text "\n"

						h[:values].each do |f|
							plugin_id = f[0]

							hosts = Item.where(:plugin_id => plugin_id).group(:host_id)
							#item = Item.where(:plugin_id => plugin_id)
							plugin = Plugin.find_by_id(plugin_id)

							references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)

							heading3 "#{counter}: #{Item.scrub_plugin_name(plugin.plugin_name)}\n"

							if hosts.length > 1
								@output.text "Hosts (#{hosts.length})", :style => :bold
							else
								@output.text "Host", :style => :bold
							end

							hostlist = Array.new
							hosts.each do |host|
								h = Host.find_by_id(host.host_id)
								host_string = "#{h.name}"
								host_string << " (#{h.fqdn})" if h.fqdn != nil
								hostlist << host_string
							end

							@output.text hostlist.join(', ')

							#if item.plugin_output != nil
							#	@output.text "\nPlugin output", :style => :bold
							#	@output.text f.plugin_output
							#end

							if plugin.description != nil
								@output.text "\nDescription", :style => :bold
								@output.text plugin.description.gsub(/[ ]{2,}/, " ")
							end

							if plugin.synopsis != nil
								@output.text "\nSynopsis", :style => :bold
								@output.text plugin.synopsis
							end

							if plugin.cvss_base_score != nil
								@output.text "\nCVSS Base Score", :style => :bold
								@output.text plugin.cvss_base_score
							end

							if plugin.exploit_available != nil
								@output.text "\nExploit Available", :style => :bold

								plugin.exploit_available? ? "Yes" : "No"
							end

							if plugin.solution != nil
								@output.text "\nSolution", :style => :bold
								@output.text plugin.solution
							end

							if references.size != 0
								@output.text "\nReferences", :style => :bold
								@output.text plugin.references.reference_string, :inline_format => true
								@output.text "<b>nessus_plugin</b>: http://www.tenablesecurity.com/plugins/index.php?view=single&id=#{plugin_id}", :inline_format => true
							end



							@output.text "\n"
							counter += 1
						end
					end

					@output.start_new_page unless h[:values] == nil
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
