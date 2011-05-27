# encoding: utf-8

require 'spec_helper'

module Risu
	module CLI		
		describe Banner do
			before(:all) do
			end
			
			it "should return a random banner" do				
				Banner.to_s.length.should_not == 0
			end
		end
	end
end
