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
		class MaliciousProcessDetection < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "malicious_process_detection",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "Generates a Malicious Process Detection Report"
				}
			end

			def render output
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Malicious Process Detection Findings"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				unique_risks = Array.new
				unique_risks << Hash[:title => "Malicious Processes", :color => "9B30FF", :values => Item.where(:plugin_id => 59275)] if Item.where(:plugin_id => 59275).count != 0

				unique_risks.each_with_index do |h, index|
					if h[:values].length > 0

						output.font_size(18) do
							output.fill_color h[:color]
							text h[:title], :style => :bold
							output.fill_color "000000"
						end

						text "\n"

						h[:values].each do |f|
							plugin = Plugin.find_by_id(f.plugin_id)

							references = Reference.where(:plugin_id => plugin.id).group(:value).order(:reference_name)

							output.font_size(16) do
								text "#{plugin.plugin_name}\n"
							end

							text "Host", :style => :bold

							ho = Host.find_by_id(f.host_id)

							host_string = "#{ho.name}"
							host_string << " (#{ho.fqdn})" if ho.fqdn != nil

							text host_string

							if f.plugin_output != nil
								text "\nPlugin output", :style => :bold
								text f.plugin_output
							end

							if plugin.description != nil
								text "\nDescription", :style => :bold
								text plugin.description.gsub(/[ ]{2,}/, " "), :inline_format => true
							end

							if plugin.synopsis != nil
								text "\nSynopsis", :style => :bold
								text plugin.synopsis
							end

							if plugin.cvss_base_score != nil
								text "\nCVSS Base Score", :style => :bold
								text plugin.cvss_base_score
							end

							if plugin.exploit_available != nil
								text "\nExploit Available", :style => :bold

								plugin.exploit_available? ? "Yes" : "No"
							end

							if plugin.solution != nil
								text "\nSolution", :style => :bold
								text plugin.solution
							end

							if references.size != 0
								text "\nReferences", :style => :bold
								text plugin.references.reference_string, :inline_format => true
								plugin_url = "http://www.tenablesecurity.com/plugins/index.php?view=single&id=#{plugin.id}"
								text "<b>nessus_plugin</b>: #{plugin_url}", :inline_format => true, :link => plugin_url
							end

							text "\n"
						end
					end

					output.start_new_page if unique_risks[index+1] != nil
				end

				output.number_pages "<page> of <total>", :at => [output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end
