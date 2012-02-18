module Risu
	module Renderers
		class NilRenderer
			
			#
			#			
			def text text, *args
				true
			end
			
			#
			#
			def font_size x
				true
			end

			#
			#
			def start_new_page
				true
			end
			
		end
	end
end
