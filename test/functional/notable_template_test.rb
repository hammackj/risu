require 'test_helper'
 
class NotableTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/notable.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		@templater = Risu::Base::Templater.new("notable", Report, @file_name, @template_manager)
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test "should create #{@filename} on template creation" do
		@templater.generate
		assert File.exist?(@file_name) == true
	end
end
