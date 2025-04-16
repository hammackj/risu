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
							]
						}
					end
				end
			end
		end
	end
end


