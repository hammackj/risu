require 'test_helper'
 
class NotableDetailedTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/notable_detailed.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
		
		@templater = Risu::Base::Templater.new("notable_detailed", Report, @file_name, @template_manager)		
		@templater.generate
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test "should create #{@filename} on template creation" do
		assert File.exist?(@file_name) == true
	end

	test "should have an MD5 of 1ab82956bcc06748817e67cd548d27b5 after creation" do
		require 'digest/md5'
		assert Digest::MD5.hexdigest(File.read(@file_name)) == "28889e1175f526017431e83392c438ec", "GOT #{Digest::MD5.hexdigest(File.read(@file_name))}"
	end	
end
