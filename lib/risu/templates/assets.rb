# Copyright (c) 2010-2017 Arxopia LLC.
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
		class AssetsTemplate < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize
				@template_info =
				{
					:name => "assets",
					:author => "hammackj",
					:version => "0.0.3",
					:renderer => "PDF",
					:description => "Generates a Assets Summary Report"
				}
			end

			def render output
				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Networked Assets"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				Host.sorted.each do |host|
					text "Name: #{host.name}\n"
					text "FQDN: #{host.fqdn}\n" unless host.fqdn == nil
					text "IP Address: #{host.ip}\n" unless host.ip == nil
					text "NetBios: #{host.netbios}\n" unless host.netbios == nil
					text sprintf "Mac Address: %s\n", host.mac.chomp.gsub("\n", ", ") unless host.mac == nil
					text sprintf "Operation System: %s\n", host.os.chomp.gsub("\n", "/") unless host.os == nil
					text "\n"
				end
			end
		end
	end
end
