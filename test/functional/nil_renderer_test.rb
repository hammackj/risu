# Copyright (c) 2010-2015 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

require 'test_helper'


module Risu
	module Templates
		class NilRendererTemplateTest < Risu::Base::TemplateBase

			# Initializes the template loading meta data
			#
			def initialize ()
				@template_info =
				{
					:name => "nil_renderer_template",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "template"
				}
			end

			# Called during the rendering process
			#
			def render(output)
				output.font_size 10
				output.text "Template"
				output.start_new_page

				output.method_doesnt_exist()
			end
		end
	end
end

class NilRendererTest < ActiveSupport::TestCase

	def setup
		@file_name = "/tmp/nilrenderer_tempalte.pdf"
		@template = Risu::Templates::NilRendererTemplateTest.new
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		@template_manager.registered_templates << @template

		@report = Report
		@report.title = "NilRenderer Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end

	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end

	test 'should fail to create nilrenderer_tempalte.pdf on template creation' do
		assert_raise NoMethodError do
			@templater = Risu::Base::Templater.new("nil_renderer_template", Report, @file_name, @template_manager)
			@templater.generate
		end

		assert File.exist?(@file_name) == false
	end

	test 'should raise an exception' do
		assert_raise NoMethodError do
			@templater = Risu::Base::Templater.new("nil_renderer_template", Report, @file_name, @template_manager)
			@templater.generate
		end
	end

	test 'should raise NoMethodError' do
		assert_raise NoMethodError do
			nilrenderer = Risu::Renderers::NilRenderer.new
			template = Risu::Templates::NilRendererTemplateTest.new
			data = template.render(nilrenderer)
		end
	end
end
