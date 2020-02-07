# Copyright (c) 2010-2020 Jacob Hammack.
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
				class CABrightstorArcServe < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "CA BrightStor ARCserve Backup Patch Rollup",
							:plugin_id => -99982,
							:plugin_name => "Missing the latest CA BrightStor ARCserve Backup Patches",
							:item_name => "Update to the latest CA BrightStor ARCserve Backup",
							:plugin_ids => [
								24015, #CA BrightStor ARCserve Backup Multiple Vulnerabilities (QO84983)
								24816, #CA BrightStor ARCserve Backup Tape Engine and Portmapper Multiple Vulnerabilities (QO86255)
								25086, #CA BrightStor ARCserve Backup Multiple Vulnerabilities (QO87569)
								26970, #CA BrightStor ARCserve Backup Multiple Remote Vulnerabilities (QO91094)
								32398, #CA BrightStor ARCserve Backup Multiple Vulnerabilities (QO92996)
								34393, #CA BrightStor ARCserve Backup RPC Interface (asdbapi.dll) Traversal Arbitrary Command Execution
								22510, #CA BrightStor ARCserve Backup for Windows Multiple Remote Buffer Overflows (QO81201)
								23841, #CA BrightStor ARCserve Backup Discovery Service Overflow
							]
						}
					end
				end
			end
		end
	end
end
