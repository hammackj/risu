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
				class MicrosoftSQLServer < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft SQL Server Patch Rollup",
							:plugin_id => -99928,
							:plugin_name => "Missing the latest Microsoft SQL Server",
							:item_name => "Update to the latest Microsoft SQL Server",
							:plugin_ids => [
193160, #CRITICAL, Security Updates for Microsoft SQL Server ODBC Driver (April 2024)
193161, #CRITICAL, Security Updates for Microsoft SQL Server OLE DB Driver (April 2024)
205300, #CRITICAL, Security Updates for Microsoft SQL Server OLE DB Driver (July 2024)
11214, #MS02-061: Microsoft SQL Server Multiple Vulnerabilities (uncredentialed check)
11322, #MS02-035: MS SQL Installation may leave passwords on system (263968)
11804, #MS03-031: Cumulative Patch for MS SQL Server (815495)
33444, #MS08-040: Vulnerabilities in Microsoft SQL Server Could Allow Elevation of Privilege (941203)
34311, #MS08-040: Microsoft SQL Server Multiple Privilege Escalation (941203) (uncredentialed check)
35632, #MS09-004: Vulnerability in Microsoft SQL Server Could Allow Remote Code Execution (959420)
35635, #MS09-004: Vulnerability in Microsoft SQL Server Could Allow Remote Code Execution (959420) (uncredentialed check)
62465, #MS12-070: Vulnerability in SQL Server Could Allow Elevation of Privilege (2754849)
77162, #MS14-044: Vulnerability in SQL Server Could Allow Elevation of Privilege (2984340)
84738, #MS15-058: Vulnerabilities in SQL Server Could Allow Remote Code Execution (3065718)
94637, #MS16-136: Security Update for SQL Server (3199641)
145033, #Security Updates for Microsoft SQL Server (January 2021)
126631, #Security Updates for Microsoft SQL Server (July 2019)
133719, #Security Updates for Microsoft SQL Server (February 2020)
111786, #Security Updates for Microsoft SQL Server 2016 and 2017 x64 (August 2018)
171604, #Security Updates for Microsoft SQL Server (February 2023)
180007, #Security Updates for Microsoft SQL Server ODBC Driver (August 2023)
175440, #Security Updates for Microsoft SQL Server OLE DB Driver (April 2023)
178851, #Security Updates for Microsoft SQL Server ODBC Driver (June 2023)
183036, #Security Updates for Microsoft SQL Server ODBC Driver (October 2023)
175450, #Security Updates for Microsoft SQL Server (April 2023)
175441, #Security Updates for Microsoft SQL Server ODBC Driver (April 2023)
178852, #Security Updates for Microsoft SQL Server OLE DB Driver (June 2023)
182968, #Security Updates for Microsoft SQL Server OLE DB Driver (October 2023)
							]
						}
					end
				end
			end
		end
	end
end


