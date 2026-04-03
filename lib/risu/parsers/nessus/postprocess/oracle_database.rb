# Copyright (c) 2010-2026 Jacob Hammack.
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
				class OracleDatabase < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Oracle Database Patch Rollup",
							:plugin_id => -99993,
							:plugin_name => "Missing the latest Oracle Database Patches",
							:item_name => "Update to the latest Oracle Database",
							:plugin_ids => [
								45625, #CRITICAL, Oracle Database Multiple Vulnerabilities (January 2010 CPU)
								56051, #CRITICAL, Oracle Database Multiple Vulnerabilities (January 2006 CPU)
								56052, #CRITICAL, Oracle Database Multiple Vulnerabilities (April 2006 CPU)
								56053, #CRITICAL, Oracle Database Multiple Vulnerabilities (July 2006 CPU)
								56056, #CRITICAL, Oracle Database Multiple Vulnerabilities (April 2007 CPU)
								56066, #CRITICAL, Oracle Database Multiple Vulnerabilities (October 2009 CPU)
								50652, #HIGH, Oracle Database Multiple Vulnerabilities (October 2010 CPU)
								47718, #HIGH, Oracle Database Multiple Vulnerabilities (July 2010 CPU)
								45626, #HIGH, Oracle Database Multiple Vulnerabilities (April 2010 CPU)
								51573, #HIGH, Oracle Database Multiple Vulnerabilities (January 2011 CPU)
								53897, #HIGH, Oracle Database Multiple Vulnerabilities (April 2011 CPU)
								56054, #HIGH, Oracle Database Multiple Vulnerabilities (October 2006 CPU)
								56055, #HIGH, Oracle Database Multiple Vulnerabilities (January 2007 CPU)
								56057, #HIGH, Oracle Database Multiple Vulnerabilities (July 2007 CPU)
								56058, #HIGH, Oracle Database Multiple Vulnerabilities (October 2007 CPU)
								56060, #HIGH, Oracle Database Multiple Vulnerabilities (April 2008 CPU)
								56064, #HIGH, Oracle Database Multiple Vulnerabilities (April 2009 CPU)
								56065, #HIGH, Oracle Database Multiple Vulnerabilities (July 2009 CPU)
								56059, #MEDIUM, Oracle Database Multiple Vulnerabilities (January 2008 CPU)
								56061, #MEDIUM, Oracle Database Multiple Vulnerabilities (July 2008 CPU)
								56062, #MEDIUM, Oracle Database Multiple Vulnerabilities (October 2008 CPU)
								56063, #MEDIUM, Oracle Database Multiple Vulnerabilities (January 2009 CPU)
								56653, #HIGH, Oracle Database Multiple Vulnerabilities (October 2011 CPU)
								57589, #MEDIUM, Oracle Database Multiple Vulnerabilities (January 2012 CPU)
								55632, #HIGH, Oracle Database Multiple Vulnerabilities (July 2011 CPU)
								11227, #HIGH, Oracle 9iAS Default SOAP Configuration Unauthorized Application Deployment
								10848, #MEDIUM, Oracle 9iAS DMS / JPM Pages Anonymous Access
								10851, #MEDIUM, Oracle 9iAS Java Process Manager /oprocmgr-status Anonymous Process Manipulation
								11223, #MEDIUM, Oracle 9iAS soapdocs Directory Remote Information Disclosure
								11224, #MEDIUM, Oracle 9iAS XSQLServlet soapConfig.xml Authentication Credentials Disclosure
								11226, #MEDIUM, Oracle 9iAS Nonexistent .jsp File Request Error Message Path Disclosure
								10852, #MEDIUM, Oracle 9iAS _pages Directory Compiled JSP Source Disclosure
								55786, #CRITICAL, Oracle Database Unsupported Version Detection
								84822, #HIGH, Oracle Database Multiple Vulnerabilities (July 2015 CPU)
								82903, #HIGH, Oracle Database Multiple Vulnerabilities (April 2015 CPU)
								80906, #HIGH, Oracle Database Multiple Vulnerabilities (January 2015 CPU)
								78540, #HIGH, Oracle Database Multiple Vulnerabilities (October 2014 CPU)
								72982, #CRITICAL, Oracle RDBMS Patchset Out of Date (credentialed check)



							]
						}
					end
				end
			end
		end
	end
end
