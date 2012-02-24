require 'test_helper'
 
class TechnicalFindingsTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/tech_find.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"

		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
		
		@templater = Risu::Base::Templater.new("technical_findings", Report, @file_name, @template_manager)
		@templater.generate
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test "should create #{@filename} on template creation" do
		assert File.exist?(@file_name) == true
	end
	
	test "should have an MD5 of 39743ac03e9085e9e0242803e9b3fae0 after creation" do
		require 'digest/md5'
		assert Digest::MD5.hexdigest(File.read(@file_name)) == "39743ac03e9085e9e0242803e9b3fae0", "GOT #{Digest::MD5.hexdigest(File.read(@file_name))}"
	end
end
