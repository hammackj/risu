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
	module Models

		# Reference Model
		class Reference < ActiveRecord::Base
		  has_many :plugins

			class << self

				#Generates a full string of all the references
				# @TODO automate references to parser references to see if all are covered
				#
				# @returns [String] of all the references with in-line formatting for
				# direct output to the report
				def reference_string
					reference_names = ["cve", "cpe", "bid", "see_also", "iava", "msft",
						"osvdb", "cert", "edbid", "rhsa", "secunia", "suse", "dsa",
						"owasp", "cwe", "iavb", "iavt", "cisco_sa", "ics_alert",
						"cisco_bug_id", "cisco_sr", "cert_vu", "vmsa", "cert_cc",
						"msvr", "apple_sa", "icsa"
					]

					ref_string = ""

					reference_names.each do |type|
						ref = reference_string_by self.send(type)

						ref_string << "<b>#{type}</b>: #{ref}\n" if ref.length != 0
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
				def cve
					where(:reference_name => "cve").select('DISTINCT value')
				end

				# Queries all unique CPE
				#
				def cpe
					where(:reference_name => "cpe").select('DISTINCT value')
				end

				# Queries all unique BID
				#
				def bid
					where(:reference_name => "bid").select('DISTINCT value')
				end

				# Queries all unique see_also
				#
				def see_also
					where(:reference_name => "see_also").select('DISTINCT value')
				end

				# Queries all unique IAVA
				#
				def iava
					where(:reference_name => "iava").select('DISTINCT value')
				end

				# Queries all unique MSFT
				#
				def msft
					where(:reference_name => "msft").select('DISTINCT value')
				end

				# Queries all unique OSvdb
				#
				def osvdb
					where(:reference_name => "osvdb").select('DISTINCT value')
				end

				# Queries all unique cert refs
				#
				def cert
					where(:reference_name => "cert").select('DISTINCT value')
				end

				# Queries all unique edbid refs
				#
				def edbid
					where(:reference_name => "edb-id").select('DISTINCT value')
				end

				# Queries all unique rhsa refs
				#
				def rhsa
					where(:reference_name => "rhsa").select('DISTINCT value')
				end

				# Queries all unique secunia refs
				#
				def secunia
					where(:reference_name => "secunia").select('DISTINCT value')
				end

				# Queries all unique suse refs
				#
				def suse
					where(:reference_name => "suse").select('DISTINCT value')
				end

				# Queries all unique dsa refs
				#
				def dsa
					where(:reference_name => "dsa").select('DISTINCT value')
				end

				# Queries all unique owasp refs
				#
				def owasp
					where(:reference_name => "owasp").select('DISTINCT value')
				end

				# Queries all unique cwe refs
				#
				def cwe
					where(:reference_name => "cwe").select('DISTINCT value')
				end

				#
				#
				def iavb
					where(:reference_name => "iavb").select('DISTINCT value')
				end

				#
				#
				def iavt
					where(:reference_name => "iavt").select('DISTINCT value')
				end

				#
				#
				def cisco_sa
					where(:reference_name => "cisco-sa").select('DISTINCT value')
				end

				#
				#
				def ics_alert
					where(:reference_name => "ics-alert").select('DISTINCT value')
				end

				#
				#
				def cisco_bug_id
					where(:reference_name => "cisco-bug-id").select('DISTINCT value')
				end

				#
				#
				def cisco_sr
					where(:reference_name => "cisco-sr").select('DISTINCT value')
				end

				#
				#
				def cert_vu
					where(:reference_name => "cert-vu").select('DISTINCT value')
				end

				#
				#
				def vmsa
					where(:reference_name => "vmsa").select('DISTINCT value')
				end

				#
				#
				def cert_cc
					where(:reference_name => "cert-cc").select('DISTINCT value')
				end

				#
				#
				def apple_sa
					where(:reference_name => "apple-sa").select('DISTINCT value')
				end

				#
				#
				def icsa
					where(:reference_name => "icsa").select('DISTINCT value')
				end

				#
				#
				def msvr
					where(:reference_name => "msvr").select('DISTINCT value')
				end

				#
				#
				def usn
					where(:reference_name => "usn").select('DISTINCT value')
				end
			end
		end
	end
end
