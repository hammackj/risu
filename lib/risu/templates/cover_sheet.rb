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
		class CoverSheet < Risu::Base::TemplateBase
			include TemplateHelper

			def initialize ()
				@template_info =
				{
					:name => "cover_sheet",
					:author => "hammackj",
					:version => "0.0.3",
					:renderer => "PDF",
					:description => "Generates a coversheet with a logo (Example Template)"
				}
			end

			def render(output)
				output.image "#{File.expand_path(File.dirname(__FILE__))}/data/nessuslogo.jpg", :scale => 0.2, :position => :left, :vposition => :top

				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"

				text Report.classification.upcase, :align => :center
				text "\n"

				report_title Report.title
				report_subtitle "Coversheet Example"
				report_author "This report was prepared by\n#{Report.author}"

				text "\n\n\n"

				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"
				text "\n"

				text "Nessus is a Registered Trademark of Tenable Network Security, Inc."
			end
		end
	end
end



