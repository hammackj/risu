module Risu
	module Base

  	# Base template class, all report templates must be a subclass of this.
		#
		class TemplateBase			
	    @possible_templates = []
	
	    class << self
	      attr_reader :possible_templates
	    end
    	
			# Accessor for template metadata
			#
			# @return [Hash] Containing template metadata
			attr_accessor :template_info
			
			#  Adds any class that inherits from [TemplateBase] into an [Array] of
			# possible templates for further validation.
			#			
	    def self.inherited(child)
	      possible_templates << child
	    end
	  end
	end
end
