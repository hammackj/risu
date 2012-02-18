require 'test_helper'

class AssetsTemplateTest < ActiveSupport::TestCase	
	
	def setup
		#@file_name = "/tmp/assets.pdf"
		#@template_manager = Risu::Base::TemplateManager.new "risu/templates"
		#@templater = Risu::Base::Templater.new("assets", Report, @file_name, @template_manager)
		
		#@report = Report
		#@report.title = "Function Test"
		#@report.author = "hammackj"
		#@report.company = "None"
		#@report.classification = "None"
		
		#@nilrenderer = Risu::Renderers::NilRenderer.new
		#@template = Risu::Templates::Assets.new
		
	end
	
	def teardown
		#File.delete(@file_name) if File.exist?(@file_name)
	end
	
	#test 'should create assets.pdf on template creation' do
	#	@templater.generate
	#	assert File.exist?(@file_name) == true
	#end
	
	test 'Template render should' do
		nilrenderer = Risu::Renderers::NilRenderer.new
		template = Risu::Templates::Assets.new
		template.render(nilrenderer)
		
		assert @template.render(nilrenderer) != nil, "GOT #{@template.render(nilrenderer)}"
	end
end
