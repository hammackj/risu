# Copyright (c) 2010-2018 Jacob Hammack.
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
		class StigFindingsSummaryTemplate < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "stig_findings_summary",
					:author => "hammackj",
					:version => "0.0.5",
					:renderer => "PDF",
					:description => "DISA Stig findings summary report"
				}

				@output = nil
			end

			def header
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Stig Findings Summary"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"
			end

			# Creates a list of hosts from an list of Items
			#
			# @param items
			def host_list_from_plugin_id(plugin_id)
 				Host.where('id IN (:hosts)', :hosts => Item.where(:plugin_id => plugin_id).select(:host_id).select('host_id AS id'))
			end

			#
			# @TODO pull to main Host api
			#
			def host_list_text(hosts)
				host_string = ""
				hosts.all.each do |host|
					host_string << "#{host.ip}"
					host_string << " (#{host.netbios})" if host.netbios
					host_string << ", "
				end

				return host_string.chomp!(", ")
			end

			# Generates STIG finding text for
			#
			# @param category I/II/III for each STIG severity
			def stig_findings_text(category="I")
				if category != "I" || category != "II" || category != "III"
					return
				end

				stigs = Item.stig_findings(category).group(:plugin_id)

				stigs.each do |stig|
					text "#{stig.plugin_name}", :size => 16
					hosts = host_list_from_plugin_id(stig.plugin_id)
					hosts_string = host_list_text(hosts)

					if hosts.count > 1
						text "<b>Hosts</b>: #{hosts_string}", :inline_format => true
					else
						text "<b>Host</b>: #{hosts_string}", :inline_format => true
					end

					text "<b>Risk</b>: #{stig.plugin.risk_factor}", :inline_format => true
					text "<b>CVE Reference</b>: #{ref_string(stig.plugin.references.cve)}", :inline_format => true
					text "<b>IAVA Reference</b>: #{ref_string(stig.plugin.references.iava)}", :inline_format => true

					if stig.plugin.description != nil
						text "\nDescription:", :style => :bold
						text stig.plugin.description
					end

					text "\n"
				end
			end

			#
			#
			def ref_string ref
				return "" if ref == nil

				ref_string = ""
				ref.each do |r|
					ref_string << r.value + ", "
				end

				ref_string.chomp!(", ")
			end

			def render output
				header

				if Item.stig_findings("I").count > 0
					text "<color rgb='551A8B'>Category I Findings</color>", :size => 18, :style => :bold, :inline_format => true
					stig_findings_text("I")
				end

				if Item.stig_findings("II").count > 0
					@output.start_new_page
					text "<color rgb='FF0000'>Category II Findings</color>", :size => 18, :style => :bold, :inline_format => true
					stig_findings_text("II")
				end

				if Item.stig_findings("III").count > 0
					@output.start_new_page
					text "<color rgb='FF8040'>Category III Findings</color>", :size => 18, :style => :bold, :inline_format => true
					stig_findings_text("III")
				end

				@output.number_pages "<page> of <total>", :at => [@output.bounds.right - 75, 0], :width => 150, :page_filter => :all
			end
		end
	end
end

