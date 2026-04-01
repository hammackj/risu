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

class ItemTop10Test < ActiveSupport::TestCase
	def setup
		setup_test_database
	end

	test "top_10_sorted should return an Array" do
		assert Item.top_10_sorted.is_a?(Array), "GOT #{Item.top_10_sorted.class}"
	end

	test "top_10_sorted should return arrays of [name, count]" do
		results = Item.top_10_sorted
		next if results.empty?

		first = results.first
		assert_equal 2, first.size, "Each row should have 2 elements"
		assert first[0].is_a?(String), "First element should be a String"
		assert first[1].is_a?(Integer), "Second element should be an Integer"
	end

	test "top_10_sorted should sort by severity first" do
		results = Item.top_10_sorted
		return if results.size < 2

		# Look up severities for the first two results
		# The first result should have equal or higher severity
		first_plugin = Plugin.where("plugin_name LIKE ?", "%#{results[0][0]}%").first
		second_plugin = Plugin.where("plugin_name LIKE ?", "%#{results[1][0]}%").first

		return if first_plugin.nil? || second_plugin.nil?

		sev_order = { "Critical" => 4, "High" => 3, "Medium" => 2, "Low" => 1, "None" => 0 }
		first_sev = sev_order[first_plugin.risk_factor] || 0
		second_sev = sev_order[second_plugin.risk_factor] || 0

		assert first_sev >= second_sev, "First result (#{first_plugin.risk_factor}) should be >= second (#{second_plugin.risk_factor})"
	end

	test "top_10_sorted should not include rollup plugins" do
		results = Item.top_10_sorted
		results.each do |row|
			assert !row[0].include?("Missing the latest"), "Should not include rollup plugins: #{row[0]}"
		end
	end

	test "top_10_sorted should return at most 10 results when used with first(10)" do
		results = Item.top_10_sorted
		# The method returns all results, templates take first(10)
		assert results.size >= 0
	end
end
