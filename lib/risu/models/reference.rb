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
	module Models

		# Reference Model
		class Reference < ActiveRecord::Base
		  has_many :plugins

			class << self

				# Generates a formatted string of all reference types for report output
				#
				# Iterates over every known reference type (CVE, CPE, BID, etc.)
				# and builds a bold-labeled, newline-delimited string suitable for
				# inline rendering in PDF reports.
				#
				# @return [String] HTML-formatted reference string with bold type labels
				def reference_string
					reference_names = ["cve", "cpe", "bid", "see_also", "iava", "msft",
						"osvdb", "cert", "edbid", "rhsa", "secunia", "suse", "dsa",
						"owasp", "cwe", "iavb", "iavt", "cisco_sa", "ics_alert",
						"cisco_bug_id", "cisco_sr", "cert_vu", "vmsa", "cert_cc",
						"msvr", "apple_sa", "icsa"
					]

					ref_string = String.new

					reference_names.each do |type|
						ref = reference_string_by self.send(type)

						ref_string << "<b>#{type}</b>: #{ref}\n" unless ref.empty?
					end

					ref_string
				end

				# Generates a string of all the references of the specified type
				#
				# @param type Result of a [Reference] model reference accessors
				#
				# @return [String] containing all references of type comma separated
				def reference_string_by type
					rstring = []
					type.each do |ref|
						rstring << ref.value
					end

					rstring.join(", ")
				end

				# Queries all unique CVEs
				#
				# @return [ActiveRecord::Relation] distinct CVE reference values
				def cve
					where(:reference_name => "cve").select('DISTINCT value')
				end

				# Queries all unique CPE
				#
				# @return [ActiveRecord::Relation] distinct CPE reference values
				def cpe
					where(:reference_name => "cpe").select('DISTINCT value')
				end

				# Queries all unique BID
				#
				# @return [ActiveRecord::Relation] distinct BID reference values
				def bid
					where(:reference_name => "bid").select('DISTINCT value')
				end

				# Queries all unique see_also references
				#
				# @return [ActiveRecord::Relation] distinct see_also reference values
				def see_also
					where(:reference_name => "see_also").select('DISTINCT value')
				end

				# Queries all unique IAVA references
				#
				# @return [ActiveRecord::Relation] distinct IAVA reference values
				def iava
					where(:reference_name => "iava").select('DISTINCT value')
				end

				# Queries all unique MSFT references
				#
				# @return [ActiveRecord::Relation] distinct MSFT reference values
				def msft
					where(:reference_name => "msft").select('DISTINCT value')
				end

				# Queries all unique OSVDB references
				#
				# @return [ActiveRecord::Relation] distinct OSVDB reference values
				def osvdb
					where(:reference_name => "osvdb").select('DISTINCT value')
				end

				# Queries all unique CERT references
				#
				# @return [ActiveRecord::Relation] distinct CERT reference values
				def cert
					where(:reference_name => "cert").select('DISTINCT value')
				end

				# Queries all unique Exploit-DB ID references
				#
				# @return [ActiveRecord::Relation] distinct EDB-ID reference values
				def edbid
					where(:reference_name => "edb-id").select('DISTINCT value')
				end

				# Queries all unique Red Hat Security Advisory (RHSA) references
				#
				# @return [ActiveRecord::Relation] distinct RHSA reference values
				def rhsa
					where(:reference_name => "rhsa").select('DISTINCT value')
				end

				# Queries all unique Secunia references
				#
				# @return [ActiveRecord::Relation] distinct Secunia reference values
				def secunia
					where(:reference_name => "secunia").select('DISTINCT value')
				end

				# Queries all unique SUSE references
				#
				# @return [ActiveRecord::Relation] distinct SUSE reference values
				def suse
					where(:reference_name => "suse").select('DISTINCT value')
				end

				# Queries all unique Debian Security Advisory (DSA) references
				#
				# @return [ActiveRecord::Relation] distinct DSA reference values
				def dsa
					where(:reference_name => "dsa").select('DISTINCT value')
				end

				# Queries all unique OWASP references
				#
				# @return [ActiveRecord::Relation] distinct OWASP reference values
				def owasp
					where(:reference_name => "owasp").select('DISTINCT value')
				end

				# Queries all unique CWE references
				#
				# @return [ActiveRecord::Relation] distinct CWE reference values
				def cwe
					where(:reference_name => "cwe").select('DISTINCT value')
				end

				# Queries all unique IAVB references
				#
				# @return [ActiveRecord::Relation] distinct IAVB reference values
				def iavb
					where(:reference_name => "iavb").select('DISTINCT value')
				end

				# Queries all unique IAVT references
				#
				# @return [ActiveRecord::Relation] distinct IAVT reference values
				def iavt
					where(:reference_name => "iavt").select('DISTINCT value')
				end

				# Queries all unique Cisco Security Advisory references
				#
				# @return [ActiveRecord::Relation] distinct cisco-sa reference values
				def cisco_sa
					where(:reference_name => "cisco-sa").select('DISTINCT value')
				end

				# Queries all unique ICS-ALERT references
				#
				# @return [ActiveRecord::Relation] distinct ics-alert reference values
				def ics_alert
					where(:reference_name => "ics-alert").select('DISTINCT value')
				end

				# Queries all unique Cisco Bug ID references
				#
				# @return [ActiveRecord::Relation] distinct cisco-bug-id reference values
				def cisco_bug_id
					where(:reference_name => "cisco-bug-id").select('DISTINCT value')
				end

				# Queries all unique Cisco SR references
				#
				# @return [ActiveRecord::Relation] distinct cisco-sr reference values
				def cisco_sr
					where(:reference_name => "cisco-sr").select('DISTINCT value')
				end

				# Queries all unique CERT-VU references
				#
				# @return [ActiveRecord::Relation] distinct cert-vu reference values
				def cert_vu
					where(:reference_name => "cert-vu").select('DISTINCT value')
				end

				# Queries all unique VMware Security Advisory (VMSA) references
				#
				# @return [ActiveRecord::Relation] distinct VMSA reference values
				def vmsa
					where(:reference_name => "vmsa").select('DISTINCT value')
				end

				# Queries all unique CERT-CC references
				#
				# @return [ActiveRecord::Relation] distinct cert-cc reference values
				def cert_cc
					where(:reference_name => "cert-cc").select('DISTINCT value')
				end

				# Queries all unique Apple Security Advisory references
				#
				# @return [ActiveRecord::Relation] distinct apple-sa reference values
				def apple_sa
					where(:reference_name => "apple-sa").select('DISTINCT value')
				end

				# Queries all unique ICSA references
				#
				# @return [ActiveRecord::Relation] distinct ICSA reference values
				def icsa
					where(:reference_name => "icsa").select('DISTINCT value')
				end

				# Queries all unique Microsoft Vulnerability Research (MSVR) references
				#
				# @return [ActiveRecord::Relation] distinct MSVR reference values
				def msvr
					where(:reference_name => "msvr").select('DISTINCT value')
				end

				# Queries all unique Ubuntu Security Notice (USN) references
				#
				# @return [ActiveRecord::Relation] distinct USN reference values
				def usn
					where(:reference_name => "usn").select('DISTINCT value')
				end
			end
		end
	end
end
