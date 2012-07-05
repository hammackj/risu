module Risu
	module Models

		# Reference Model
		#
		# @author Jacob Hammack
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

				# Queries all unqiue cert refs
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
			end
		end
	end
end
