require 'test_helper'
 
class FindingsSummaryPluginIDTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/findings_summary_pluginid.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
		
		@templater = Risu::Base::Templater.new("findings_summary_with_pluginid", @report, @file_name, @template_manager)
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test "should create #{@file_name} on template creation" do
		@templater.generate
		assert File.exist?(@file_name) == true
	end
end
