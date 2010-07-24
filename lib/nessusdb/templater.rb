module NessusDB

	# Templater class for generating a report from a erb template
	#
	# @author Jacob Hammack
	class Templater
		attr_accessor :template, :erb, :findings
		
		# Setups of the Templater class initalizing all of the variables
		#
		# @author Jacob Hammack
		def initialize(template, findings)
			@template = template
			@findings = findings
			@erb = ERB.new(@template)
		end
		
		# Generates a report based on the erb template
		#
		# @ returns [String] html output of the erb template
		# 
		# @author Jacob Hammack
		def generate
			html = @erb.run(@findings.get_binding)
			
			return html
		end
	end
end