# Copyright (c) 2010-2012 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Risu
	module Models

		# Reference Model
		#
		class Reference < ActiveRecord::Base
		  has_many :plugins

			class << self

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

				#
				#
				def edbid
					where(:reference_name => "edb-id").select('DISTINCT value')
				end

				#
				#
				def rhsa
					where(:reference_name => "rhsa").select('DISTINCT value')
				end

				#
				#
				def secunia
					where(:reference_name => "secunia").select('DISTINCT value')
				end

				#
				#
				def suse
					where(:reference_name => "suse").select('DISTINCT value')
				end

				#
				#
				def dsa
					where(:reference_name => "dsa").select('DISTINCT value')
				end

				#
				#
				def owasp
					where(:reference_name => "owasp").select('DISTINCT value')
				end

				#
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
			end
		end
	end
end
