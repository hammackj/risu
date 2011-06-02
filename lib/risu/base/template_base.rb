module Risu
	module Base
  	#
		#
		class TemplateBase			
	    @possible_templates = []
	
	    class << self
	      attr_reader :possible_templates
	    end
    	
			#
			#
			attr_accessor :template_info
			
			#
			#
	    def self.inherited(child)
	      possible_templates << child
	    end
	  end
	end
end
