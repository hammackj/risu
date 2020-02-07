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
				class OpenSSHRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "OpenSSH Patch Rollup",
							:plugin_id => -99995,
							:plugin_name => "Missing the latest OpenSSH Patches",
							:item_name => "Update to the latest OpenSSH",
							:plugin_ids => [
								11837,
								17702,
								44077,
								44078,
								44065,
								31737,
								44074,
								44076,
								44079,
								19592,
								44075,
								53841,
								44080,
								44077,
								44078,
								85382,
								86122,
								10883,
								11031,
								10771,
								10823,
								10954,
								11712,
								44072,
								10802,





							]
						}
					end
				end
			end
		end
	end
end
