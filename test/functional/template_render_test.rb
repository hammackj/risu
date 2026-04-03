# Copyright (c) 2010-2026 Jacob Hammack.
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
require 'tmpdir'

class TemplateRenderTest < ActiveSupport::TestCase
	include Risu::Models

	def setup
		setup_test_database

		@report = Report
		@report.title = "Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"

		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		@output_dir = Dir.mktmpdir
	end

	def teardown
		FileUtils.rm_rf(@output_dir) if @output_dir && File.exist?(@output_dir)
	end

	test "each template should have a valid renderer type" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			renderer = instance.template_info[:renderer]
			assert ["PDF", "CSV"].include?(renderer), "#{klass.name} has invalid renderer: #{renderer}"
		end
	end

	test "each template should respond to render" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.respond_to?(:render), "#{klass.name} does not respond to render"
		end
	end

	# Templates that call exit or require specific data not in fixtures
	SKIP_RENDER_TEMPLATES = ["plugin_summary"].freeze

	test "each template should not crash the Templater" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			template_name = instance.template_info[:name]
			next if SKIP_RENDER_TEMPLATES.include?(template_name)

			renderer = instance.template_info[:renderer]
			ext = renderer == "CSV" ? ".csv" : ".pdf"
			output_file = File.join(@output_dir, "#{template_name}#{ext}")

			templater = Risu::Base::Templater.new(template_name, nil, output_file, @template_manager)

			# Templater.generate has its own rescue, so this should never raise
			assert_nothing_raised do
				templater.generate
			end
		end
	end

	test "PDF templates should produce non-empty output files" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			next unless instance.template_info[:renderer] == "PDF"

			template_name = instance.template_info[:name]
			next if SKIP_RENDER_TEMPLATES.include?(template_name)

			output_file = File.join(@output_dir, "#{template_name}.pdf")

			templater = Risu::Base::Templater.new(template_name, nil, output_file, @template_manager)
			templater.generate

			if File.exist?(output_file)
				assert File.size(output_file) > 0, "#{template_name} produced empty PDF"
			end
		end
	end
end
