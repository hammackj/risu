require 'test_helper'
 
class ReferenceTest < ActiveSupport::TestCase	
	test "should return a cve for References.cve" do				
		assert Reference.cve != nil, "GOT #{Reference.cve}"
	end
end
