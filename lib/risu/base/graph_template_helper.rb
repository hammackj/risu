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
		module GraphTemplateHelper

			#
			def other_os_graph_page
				if Host.other_os_graph_has_data?
					new_page
					@output.image Host.other_os_graph, :width => 500, :height => 375, :position => :center
					text Host.other_os_graph_text
				end
			end

			#
			def windows_os_graph_page
				if Host.windows_os_graph_has_data?
					new_page
					@output.image Host.windows_os_graph, :width => 500, :height => 375, :position => :center
					text Host.windows_os_graph_text
				end
			end

			#
			def root_cause_graph_page
				new_page
				@output.image Plugin.root_cause_graph, :width => 500, :height => 375, :position => :center
				text Plugin.root_cause_graph_text
			end

			#
			def risks_by_service_graph_page
				new_page
				@output.image Item.risks_by_service_graph(10), :width => 500, :height => 375, :position => :center
				text Item.risks_by_service_graph_text
			end

			#
			def risks_by_severity_graph_page
				new_page
				@output.image Item.risks_by_severity_graph, :width => 500, :height => 375, :position => :center
				text Item.risks_by_severity_graph_text, :inline_format => true
			end
		end
	end
end
