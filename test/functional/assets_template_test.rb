require 'test_helper'

class AssetsTemplateTest < ActiveSupport::TestCase	
	
	def setup
		@file_name = "/tmp/assets.pdf"
		@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		
		@report = Report
		@report.title = "Function Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
		
		@templater = Risu::Base::Templater.new("assets", Report, @file_name, @template_manager)
		
		@nilrenderer = Risu::Renderers::NilRenderer.new
		@template = Risu::Templates::Assets.new
		@templater.generate
	end
	
	def teardown
		File.delete(@file_name) if File.exist?(@file_name)
	end
	
	test 'should create assets.pdf on template creation' do
		assert File.exist?(@file_name) == true
	end
	
	test 'Template render should' do
		nilrenderer = Risu::Renderers::NilRenderer.new
		template = Risu::Templates::Assets.new
		data = template.render(nilrenderer)
		assert template.render(nilrenderer) != nil, "GOT #{template.render(nilrenderer)}"
	end
	
	test "should have an MD5 of 457ea68139a70675970040c147b7837d after creation" do
		require 'digest/md5'
		assert Digest::MD5.hexdigest(File.read(@file_name)) == "457ea68139a70675970040c147b7837d", "GOT #{Digest::MD5.hexdigest(File.read(@file_name))}"
	end
end
