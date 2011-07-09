module Risu
	module Base
	end
end

#Remove this by 1.5 as it doesn't seem to be needed
#if ActiveRecord::Base.connected? == true
#	require 'risu/base/schema'
#end

require 'risu/base/template_base'
require 'risu/base/template_manager'
require 'risu/base/prawn_templater'
require 'risu/base/templater'
