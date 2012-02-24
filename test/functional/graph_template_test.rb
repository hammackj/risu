require 'test_helper'
 
class GraphTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/graphs.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
		@templater = Risu::Base::Templater.new("graphs", Report, @file_name, @template_manager)
		@templater.generate
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test 'should create graphs.pdf on template creation' do
		assert File.exist?(@file_name) == true
	end
end
