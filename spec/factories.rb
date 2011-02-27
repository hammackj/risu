
require 'factory_girl'

FactoryGirl.define do
  sequence :ip do |n|
    "10.#{n}.#{n}.#{n}"
  end
end

FactoryGirl.define do
	
	factory :host do
		name Factory.next(:ip)
	end
	
	factory :item do
		port 69
	end
end
		