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

class PostProcessTest < ActiveSupport::TestCase
	def setup
		setup_test_database

		@report = Report
		@report.title = "Test"
		@report.author = "hammackj"
		@report.company = "None"
		@report.classification = "None"
	end

	test "should have PostProcessBase available" do
		assert Risu::Base::PostProcessBase != nil
	end

	test "should have PostProcessManager available" do
		assert Risu::Base::PostProcessManager != nil
	end

	test "should load postprocessors from PostProcessBase.possible_postprocesses" do
		assert Risu::Base::PostProcessBase.possible_postprocesses.size > 0, "GOT #{Risu::Base::PostProcessBase.possible_postprocesses.size}"
	end

	test "each postprocessor should have an @info hash" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			assert instance.info != nil, "#{klass.name} has nil @info"
		end
	end

	test "each postprocessor @info should have a description" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			assert instance.info[:description] != nil, "#{klass.name} has nil description"
		end
	end

	test "each postprocessor @info should have a plugin_id" do
		Risu::Base::PostProcessBase.possible_postprocesses.each do |klass|
			instance = klass.new
			next if instance.info[:plugin_id] == nil
			assert instance.info[:plugin_id].class == Integer, "#{klass.name} plugin_id is not Integer: #{instance.info[:plugin_id].class}"
		end
	end

	test "PostProcessManager should create a new instance" do
		manager = Risu::Base::PostProcessManager.new "risu/parsers/nessus/postprocess"
		assert manager != nil
	end
end
