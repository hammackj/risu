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
					where(:reference_name => "cve").uniq
				end
				
				# Queries all unique CPE
				#
				def cpe
					where(:reference_name => "cpe").uniq
				end
				
				# Queries all unique BID
				#
				def bid
					where(:reference_name => "bid").uniq
				end
				
				# Queries all unique see_also
				#
				def see_also
					where(:reference_name => "see_also").uniq
				end
				
				def iava
					where(:reference_name => "iava").uniq
				end
				
				def msft
					where(:reference_name => "msft").uniq
				end
				
				def osvdb
					where(:reference_name => "osvdb").uniq
				end
				
				def cert
					where(:reference_name => "cert").uniq
				end
				
				def edbid
					where(:reference_name => "edb-id").uniq
				end
				
				def rhsa
					where(:reference_name => "rhsa").uniq
				end
				
				def secunia
					where(:reference_name => "secunia").uniq
				end
				
				def suse
					where(:reference_name => "suse").uniq
				end
				
				def dsa
					where(:reference_name => "dsa").uniq
				end
				
				def owasp
					where(:reference_name => "owasp").uniq
				end
				
				def cwe
					where(:reference_name => "cwe").uniq
				end					
			end
		end
	end
end
