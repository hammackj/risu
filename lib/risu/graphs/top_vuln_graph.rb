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
	module Graphs

		# TopVulnGraph
		#
		class TopVulnGraph
			def graph
        g = Gruff::Bar.new(GRAPH_WIDTH)
        g.title = sprintf "Top 10 Hosts with Notable Findings Count"
        g.sort = false
        g.marker_count = 1
        g.theme = {
          :colors => Risu::GRAPH_COLORS,
          :background_colors => %w(white white)
        }

        Item.risks_by_host(limit).to_a.each do |item|
          ip = Host.find_by_id(item.host_id).name
          count = Item.where(:host_id => item.host_id).where(:severity => 4).count

          if count > 0
            g.data(ip, count)
          end
        end

        StringIO.new(g.to_blob)
      end

      def graph_text
      end
		end
	end
end
