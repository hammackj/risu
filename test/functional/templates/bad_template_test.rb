# Copyright (c) 2010-2019 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


require 'test_helper'

module Risu
	module Templates
		class BadTemplate < Risu::Base::TemplateBase

			# Initializes the template loading meta data
			#
			def initialize
				@template_info =
				{
					:name => "bad_template",
					:author => "hammackj",
					:version => "0.0.1",
					:renderer => "PDF",
					:description => "template"
				}
			end

			# Called during the rendering process
			#
			def render output
				output.text "Template"
				output.start_new_page

				output.method_doesnt_exist()
			end
		end
	end
end

class BadTemplateTest < ActiveSupport::TestCase

	def setup
		setup_test_database
		
		@file_name = "/tmp/bad_tempalte.pdf"
		@template = Risu::Templates::BadTemplate.new
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		@template_manager.registered_templates << @template

		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end

	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end

	test 'should fail to create bad_tempalte.pdf on template creation' do
		assert_raise NoMethodError do
			@templater = Risu::Base::Templater.new("bad_template", Report, @file_name, @template_manager)
			@templater.generate
		end

		assert File.exist?(@file_name) == false
	end

	test 'should raise an exception' do
		assert_raise NoMethodError do
			@templater = Risu::Base::Templater.new("bad_template", Report, @file_name, @template_manager)
			@templater.generate
		end
	end

	test 'should raise NoMethodError' do
		assert_raise NoMethodError do
			nilrenderer = Risu::Renderers::NilRenderer.new
			template = Risu::Templates::BadTemplate.new
			data = template.render(nilrenderer)
		end
	end
end
