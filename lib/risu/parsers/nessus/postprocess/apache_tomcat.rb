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
	module Parsers
		module Nessus
			module PostProcess
				class ApacheTomcatRollups < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Apache Tomcat Patch Rollup",
							:plugin_id => -99966,
							:plugin_name => "Missing the latest Apache Tomcat Patches",
							:item_name => "Update to the latest Apache Tomcat",
							:plugin_ids => [
								81649, #Apache Tomcat 6.0.x < 6.0.43 Multiple Vulnerabilities (POODLE)
								12085, #Apache Tomcat Servlet / JSP Container Default Files
								35806, #Tomcat Sample App cal2.jsp 'time' Parameter XSS
								81650, #Apache Tomcat 7.0.x < 7.0.57 Multiple Vulnerabilities (POODLE)
								83526, #Apache Tomcat 7.0.x < 7.0.60 Multiple Vulnerabilities (FREAK)
							]
						}
					end
				end
			end
		end
	end
end
