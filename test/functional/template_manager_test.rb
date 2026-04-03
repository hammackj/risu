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

class TemplateManagerTest < ActiveSupport::TestCase
	def setup
		setup_test_database

		@report = Report
		@report.title = "Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"

		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
	end

	test "should create a TemplateManager" do
		assert @template_manager != nil
	end

	test "should have TemplateBase available" do
		assert Risu::Base::TemplateBase != nil
	end

	test "should have possible_templates" do
		assert Risu::Base::TemplateBase.possible_templates.size > 0, "GOT #{Risu::Base::TemplateBase.possible_templates.size}"
	end

	test "each template should have template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info != nil, "#{klass.name} has nil template_info"
		end
	end

	test "each template should have a name in template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info[:name] != nil, "#{klass.name} has nil name"
		end
	end

	test "each template should have an author in template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info[:author] != nil, "#{klass.name} has nil author"
		end
	end

	test "each template should have a version in template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info[:version] != nil, "#{klass.name} has nil version"
		end
	end

	test "each template should have a renderer in template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info[:renderer] != nil, "#{klass.name} has nil renderer"
		end
	end

	test "each template should have a description in template_info" do
		Risu::Base::TemplateBase.possible_templates.each do |klass|
			instance = klass.new
			assert instance.template_info[:description] != nil, "#{klass.name} has nil description"
		end
	end

	test "should find a template by name" do
		template = @template_manager.find_template_by_name("notable")
		assert template != nil, "Could not find 'notable' template"
	end

	test "should return nil for unknown template name" do
		template = @template_manager.find_template_by_name("nonexistent_template_xyz")
		assert template == nil, "GOT #{template}"
	end
end
