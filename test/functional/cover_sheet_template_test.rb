require 'test_helper'
 
class CoverSheetTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/coversheet.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		@templater = Risu::Base::Templater.new("cover_sheet", Report, @file_name, @template_manager)
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test 'should create coversheet.pdf on template creation' do
		@templater.generate
		assert File.exist?(@file_name) == true
	end
	
	test "should have an MD5 of 2aadff33f0bcfbecb56275e94c2f70c1 after creation" do
		@templater.generate if !File.exist?(@file_name)
		require 'digest/md5'
		assert Digest::MD5.hexdigest(File.read(@file_name)) == "2aadff33f0bcfbecb56275e94c2f70c1", "GOT #{Digest::MD5.hexdigest(File.read(@file_name))}"
	end
end
