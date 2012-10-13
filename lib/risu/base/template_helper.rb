# Copyright (c) 2012 Arxopia LLC.
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
	module Templates
		module TemplateHelper

			#
			def report_classification classification=Report.classification.upcase, newline=true
				@output.font_size(12) do
					@output.text classification, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_title title, newline=false
				@output.font_size(24) do
					@output.text title, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_subtitle title, newline=false
				@output.font_size(18) do
					@output.text title, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def report_author author, newline=false
				@output.font_size(14) do
					@output.text author, :align => :center
					@output.text "\n" if newline
				end
			end

			#
			def heading1 title
				@output.font_size(24) do
					@output.text title, :style => :bold
				end
			end

			#
			def heading2 title
				@output.font_size(18) do
					@output.text title, :style => :bold
				end
			end

			#
			def heading3 title
				@output.font_size(14) do
					@output.text title, :style => :bold
				end
			end

			#
			def heading4 title
				@output.font_size(12) do
					@output.text title, :style => :bold
				end
			end

			#
			def heading5 title
				@output.font_size(10) do
					@output.text title, :style => :bold
				end
			end

			#
			def heading6 title
				@output.font_size(8) do
					@output.text title, :style => :bold
				end
			end
		end
	end
end
