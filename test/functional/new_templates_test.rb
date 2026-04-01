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

class NewTemplatesTest < ActiveSupport::TestCase
	include Risu::Models

	# Templates that call exit or require specific data not in fixtures
	SKIP_RENDER_TEMPLATES = ["plugin_summary"].freeze

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

	def render_template(name)
		output_file = File.join(@output_dir, "#{name}.pdf")
		templater = Risu::Base::Templater.new(name, nil, output_file, @template_manager)
		templater.generate
		output_file
	end

	# New public templates should be discoverable
	test "should find unsupported_os template" do
		assert @template_manager.find_template_by_name("unsupported_os") != nil
	end

	test "should find unsupported_software template" do
		assert @template_manager.find_template_by_name("unsupported_software") != nil
	end

	test "should find insecure_windows_service_permissions template" do
		assert @template_manager.find_template_by_name("insecure_windows_service_permissions") != nil
	end

	test "should find winverifytrust template" do
		assert @template_manager.find_template_by_name("winverifytrust") != nil
	end

	test "should find default_credentials template" do
		assert @template_manager.find_template_by_name("default_credentials") != nil
	end

	test "should find actively_exploited template" do
		assert @template_manager.find_template_by_name("actively_exploited") != nil
	end

	test "should find in_the_news template" do
		assert @template_manager.find_template_by_name("in_the_news") != nil
	end

	test "should find patch_age_priority template" do
		assert @template_manager.find_template_by_name("patch_age_priority") != nil
	end

	test "should find host_inventory template" do
		assert @template_manager.find_template_by_name("host_inventory") != nil
	end

	test "should find unmitigated_findings template" do
		assert @template_manager.find_template_by_name("unmitigated_findings") != nil
	end

	# All new templates should render without crashing
	test "unsupported_os should render" do
		out = render_template("unsupported_os")
		assert File.exist?(out), "unsupported_os did not produce output"
		assert File.size(out) > 0, "unsupported_os produced empty output"
	end

	test "unsupported_software should render" do
		out = render_template("unsupported_software")
		assert File.exist?(out), "unsupported_software did not produce output"
		assert File.size(out) > 0, "unsupported_software produced empty output"
	end

	test "insecure_windows_service_permissions should render" do
		out = render_template("insecure_windows_service_permissions")
		assert File.exist?(out), "insecure_windows_service_permissions did not produce output"
		assert File.size(out) > 0, "insecure_windows_service_permissions produced empty output"
	end

	test "winverifytrust should render" do
		out = render_template("winverifytrust")
		assert File.exist?(out), "winverifytrust did not produce output"
		assert File.size(out) > 0, "winverifytrust produced empty output"
	end

	test "default_credentials should render" do
		out = render_template("default_credentials")
		assert File.exist?(out), "default_credentials did not produce output"
		assert File.size(out) > 0, "default_credentials produced empty output"
	end

	test "actively_exploited should render" do
		out = render_template("actively_exploited")
		assert File.exist?(out), "actively_exploited did not produce output"
		assert File.size(out) > 0, "actively_exploited produced empty output"
	end

	test "in_the_news should render" do
		out = render_template("in_the_news")
		assert File.exist?(out), "in_the_news did not produce output"
		assert File.size(out) > 0, "in_the_news produced empty output"
	end

	test "patch_age_priority should render" do
		out = render_template("patch_age_priority")
		assert File.exist?(out), "patch_age_priority did not produce output"
		assert File.size(out) > 0, "patch_age_priority produced empty output"
	end

	test "host_inventory should render" do
		out = render_template("host_inventory")
		assert File.exist?(out), "host_inventory did not produce output"
		assert File.size(out) > 0, "host_inventory produced empty output"
	end

	test "unmitigated_findings should render" do
		out = render_template("unmitigated_findings")
		assert File.exist?(out), "unmitigated_findings did not produce output"
		assert File.size(out) > 0, "unmitigated_findings produced empty output"
	end

	# Template metadata validation
	test "all new templates should have required metadata" do
		new_templates = [
			"unsupported_os", "unsupported_software", "insecure_windows_service_permissions",
			"winverifytrust", "default_credentials", "actively_exploited", "in_the_news",
			"patch_age_priority", "host_inventory", "unmitigated_findings"
		]

		new_templates.each do |name|
			t = @template_manager.find_template_by_name(name)
			assert t != nil, "#{name} not found"

			instance = t.class.new
			info = instance.template_info

			assert info[:name] != nil, "#{name} missing :name"
			assert info[:author] != nil, "#{name} missing :author"
			assert info[:version] != nil, "#{name} missing :version"
			assert info[:renderer] != nil, "#{name} missing :renderer"
			assert info[:description] != nil, "#{name} missing :description"
			assert ["PDF", "CSV"].include?(info[:renderer]), "#{name} has invalid renderer: #{info[:renderer]}"
		end
	end
end
