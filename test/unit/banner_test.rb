require 'test_helper'
 
class PolicyTest < ActiveSupport::TestCase	
	test "should return a random banner" do				
		assert Risu::CLI::Banner.to_s.length != 0
	end
end
