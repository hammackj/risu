# Copyright (c) 2010-2025 Jacob Hammack.
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
        g = Gruff::Pie.new(GRAPH_WIDTH)
        g.title = "Windows Operating Systems By Percentage"
        g.sort = false
        g.marker_count = 1
        g.theme = {
          :colors => Risu::GRAPH_COLORS,
          :background_colors => %w(white white)
        }

        nt = Host.os_windows_nt.to_a.count
        w2k = Host.os_windows_2k.to_a.count
        xp = Host.os_windows_xp.to_a.count
        w2k3 = Host.os_windows_2k3.to_a.count
        vista = Host.os_windows_vista.to_a.count
        w2k8 = Host.os_windows_2k8.to_a.count
        w2k12 = Host.os_windows_2k12.to_a.count
        w7 = Host.os_windows_7.to_a.count
        w8 = Host.os_windows_8.to_a.count
        other = (Host.os_windows.os_windows_other).to_a.count

        g.data("NT", nt) if nt >= 1
        g.data("2000", w2k) if w2k >= 1
        g.data("XP", xp) if xp >= 1
        g.data("Server 2003", w2k3) if w2k3 >= 1
        g.data("Vista", vista) if vista >= 1
        g.data("Server 2008", w2k8) if w2k8 >= 1
        g.data("Server 2012", w2k12) if w2k12 >= 1
        g.data("7", w7) if w7 >= 1
        g.data("8", w8) if w8 >= 1
        g.data("Other Windows", other) if other >= 1

        image = g.to_image
        image.format = 'png'

        #puts image.inspect
        #puts image.methods

        image.write("TopVulnGraph.png")

        return "TopVulnGraph.png"
        #StringIO.new(image.to_blob)
      end

      def text
        nt = Host.os_windows_nt.to_a.count
        w2k = Host.os_windows_2k.to_a.count
        xp = Host.os_windows_xp.to_a.count
        w2k3 = Host.os_windows_2k3.to_a.count
        vista = Host.os_windows_vista.to_a.count
        w2k8 = Host.os_windows_2k8.to_a.count
        w2k12 = Host.os_windows_2k12.to_a.count
        w7 = Host.os_windows_7.to_a.count
        w8 = Host.os_windows_8.to_a.count
        other = (Host.os_windows.os_windows_other).to_a.count

        windows_os_count = nt + w2k + xp + w2k3 + vista + w7 + w8 + w2k8 + w2k12 + other

        nt_percent = (nt.to_f / windows_os_count.to_f) * 100
        w2k_percent = (w2k.to_f / windows_os_count.to_f) * 100
        xp_percent = (xp.to_f / windows_os_count.to_f) * 100
        w2k3_percent = (w2k3.to_f / windows_os_count.to_f) * 100
        vista_percent = (vista.to_f / windows_os_count.to_f) * 100

        w2k8_percent = (w2k8.to_f / windows_os_count.to_f) * 100
        w7_percent = (w7.to_f / windows_os_count.to_f) * 100
        w8_percent = (w8.to_f / windows_os_count.to_f) * 100
        w2k12_percent = (w2k12.to_f / windows_os_count.to_f) * 100

        text = "This graph shows the percentage of the different Microsoft Windows based operating systems " +
        "found on the #{Report.title} network.\n\n"

        text << "#{nt_percent.round.to_i}% of the network is Windows NT. " if nt_percent >= 1
        text << "#{w2k_percent.round.to_i}% of the network is Windows 2000. " if w2k_percent >= 1
        text << "#{xp_percent.round.to_i}% of the network is Windows XP. " if xp_percent >= 1
        text << "#{w2k3_percent.round.to_i}% of the network is Windows Server 2003. " if w2k3_percent >= 1
        text << "#{vista_percent.round.to_i}% of the network is Windows Vista. " if vista_percent >= 1
        text << "#{w2k8_percent.round.to_i}% of the network is Windows Server 2008. " if w2k8_percent >= 1
        text << "#{w7_percent.round.to_i}% of the network is Windows 7. " if w7_percent >= 1
        text << "#{w8_percent.round.to_i}% of the network is Windows 8. " if w8_percent >= 1
        text << "#{w2k12_percent.round.to_i}% of the network is Windows Server 20012. " if w2k12_percent >= 1

        text << "\n\n" << unsupported_os_windows if nt > 0 or w2k > 0

        return text
      end

      #
      # @TODO comments
      #
      def has_data?
        nt = Host.os_windows_nt.to_a.size
        w2k = Host.os_windows_2k.to_a.size
        xp = Host.os_windows_xp.to_a.size
        w2k3 = Host.os_windows_2k3.to_a.size
        vista = Host.os_windows_vista.to_a.size
        w2k8 = Host.os_windows_2k8.to_a.size
        w2k12 = Host.os_windows_2k12.to_a.size
        w7 = Host.os_windows_7.to_a.size
        w8 = Host.os_windows_8.to_a.size
        other = (Host.os_windows.os_windows_other).to_a.size

        if nt == 0 && w2k == 0 && xp == 0 && w2k3 == 0 && vista == 0 && w2k8 == 0 && w2k12 == 0 && w7 == 0 && w8 == 0 && other == 0
          return false
        else
          return true
        end
      end
		end
	end
end
