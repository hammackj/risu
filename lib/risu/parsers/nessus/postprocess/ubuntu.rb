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
	module Parsers
		module Nessus
			module PostProcess
				class UbuntuLinux < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Ubuntu Linux Patch Rollup",
							:plugin_id => -99921,
							:plugin_name => "Missing the latest Ubuntu Linux",
							:item_name => "Update to the latest Ubuntu Linux",
							:plugin_ids => [
214997, #CRITICAL, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 :Kerberos vulnerability (USN-7257-1)
216055, #CRITICAL, Ubuntu 20.04 LTS : Firefox vulnerabilities (USN-7263-1)
214671, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : LibreOffice vulnerabilities (USN-7228-1)
214738, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : Linux kernel vulnerabilities (USN-7235-1)
214777, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS : libxml2 vulnerabilities (USN-7240-1)
214790, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : Bind vulnerabilities
172614, #HIGH, Ubuntu 16.04 ESM / 18.04 ESM / 20.04 ESM / 22.04 ESM : FFmpeg vulnerabilities (USN-5958-1)
183778, #HIGH, Ubuntu 18.04 ESM / 20.04 ESM / 22.04 ESM : FFmpeg vulnerabilities (USN-6449-1)
215062, #HIGH, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : GNU C Library vulnerability (USN-7259-1)
183116, #CRITICAL, Ubuntu 16.04 ESM / 18.04 ESM / 20.04 ESM : ZeroMQ vulnerabilities (USN-4920-1)
183123, #CRITICAL, Ubuntu 18.04 ESM / 20.04 ESM : libmysofa vulnerability (USN-5184-1)
214506, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : BlueZ vulnerabilities (USN-7222-1)
214894, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : HarfBuzz vulnerability (USN-7251-1)
198152, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 23.10 / 24.04 LTS : FFmpeg vulnerabilities(USN-6803-1)
206422, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS : FFmpeg vulnerability (USN-6983-1)
182982, #MEDIUM, Ubuntu 16.04 ESM / 18.04 ESM / 20.04 ESM : FFmpeg vulnerabilities (USN-6430-1)
213545, #MEDIUM, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS : FFmpeg vulnerability (USN-7188-1)
214505, #MEDIUM, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : OpenJPEG vulnerabilities (USN-7223-1)
214820, #MEDIUM, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : MySQL vulnerabilities
215238, #MEDIUM, Ubuntu 20.04 LTS / 22.04 LTS / 24.10 : Vim vulnerability (USN-7261-1)
282466, #CRITICAL, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : Net-SNMP vulnerability (USN-7944-1)
288869, #CRITICAL, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : klibc vulnerabilities (USN-7959-1)
297801, #CRITICAL, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS : FreeRDP vulnerabilities (USN-8004-1)
299346, #CRITICAL, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : FreeRDP vulnerabilities (USN-8042-1)
265698, #CRITICAL, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : OpenJPEG vulnerabilities (USN-7757-1)
243224, #CRITICAL, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS : SQLite vulnerabilities (USN-7679-1)
302895, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : libssh vulnerability (USN-8093-1)
302896, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : snapd vulnerability (USN-8102-1)
303027, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : Vim vulnerabilities (USN-8101-1)
303030, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : Exiv2 vulnerabilities (USN-8103-1)
303755, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : LibTIFF vulnerabilities (USN-8113-1)
284661, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : urllib3 vulnerability (USN-7955-1)
284663, #HIGH, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : Python vulnerability (USN-7951-1)
297270, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : FFmpeg vulnerabilities (USN-7982-1)
297276, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS : TeX Live vulnerabilities (USN-7985-1)
297802, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.10 : GNU C Library vulnerabilities (USN-8005-1)
265088, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : CUPS vulnerabilities (USN-7745-1)
266308, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : LibTIFF vulnerabilities (USN-7783-1)
266402, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : Linux kernel vulnerabilities (USN-7793-1)
270676, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS : FFmpeg vulnerabilities (USN-7823-1)
271190, #HIGH, Ubuntu 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS : FFmpeg vulnerabilities (USN-7830-1)
271836, #HIGH, Ubuntu 18.04 LTS / 20.04 LTS : GStreamer Good Plugins vulnerability (USN-7837-1)
274519, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : poppler vulnerability (USN-7858-1)
274751, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : Intel Microcode vulnerabilities (USN-7866-1)
277578, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : Linux kernel vulnerabilities (USN-7909-1)
233301, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 24.10 : zvbi vulnerabilities (USN-7367-1)
282467, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : Libxslt vulnerability (USN-7945-1)
282530, #HIGH, Ubuntu 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 / 25.10 : GnuPG vulnerability (USN-7946-1)
252945, #HIGH, Ubuntu 20.04 LTS / 22.04 LTS : Linux kernel vulnerabilities (USN-7704-1)
254434, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : Python vulnerabilities (USN-7710-1)
258124, #HIGH, Ubuntu 14.04 LTS / 16.04 LTS / 18.04 LTS / 20.04 LTS / 22.04 LTS / 24.04 LTS / 25.04 : UDisks vulnerability (USN-7723-1)

							]
						}
					end
				end
			end
		end
	end
end
