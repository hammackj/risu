# Copyright (c) 2010-2019 Jacob Hammack.
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
				class BlackBerryEnterpriseServerRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Black Berry Enterprise Server Patch Rollup",
							:plugin_id => -99968,
							:plugin_name => "Missing the latest Black Berry Enterprise Server Patches",
							:item_name => "Update to the latest Black Berry Enterprise Server",
							:plugin_ids => [
								50071, #BlackBerry Enterprise Server / Attachment Service PDF Distiller Buffer Overflow (KB24547)
								51191, #BlackBerry Enterprise Server / Attachment Service PDF Distiller Buffer Overflow (KB24761)
								51527, #BlackBerry Enterprise Server / Attachment Service PDF Distiller Buffer Overflow (KB25382)
								55819, #BlackBerry Enterprise Server PNG and TIFF Image Processing Vulnerabilities (KB27244)
								55670, #BlackBerry Enterprise Server Administration API Unspecified Remote Vulnerability (KB27258)
								53829, #BlackBerry Enterprise Server Web Desktop Manager XSS (KB26296)
								72583, #BlackBerry Enterprise Server / Enterprise Service / Enterprise Server Express Information Disclosure (KB35647)
								77327, #BlackBerry Enterprise Server / Enterprise Service / Enterprise Server Express Information Disclosure (KB36175)
							]
						}
					end
				end
			end
		end
	end
end
