
require 'machinist/active_record'
require 'sham'
require 'faker'

os_options = Array.new
os_options << "Windows 2000 Professional"
os_options << "Windows XP Professional"
os_options << "Windows 7 Professional"
os_options << "Linux Ubuntu 10.10"
os_options << "Windows Vista"
os_options << "FreeBSD 7.0"
os_options << "OpenBSD 1.0"

Sham.define do
	ip { "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}" }
	port { "#{rand(65000)}" }
	mac { 
		chars = (0..9).to_a + ('A'..'F').to_a 
		md = Array.new
		16.times do 
			md << chars[rand(chars.size)]
		end
		md.to_a.each_slice(2).map(&:join).join(":")
	}
	os { os_options[rand(os_options.size)]}
end

Host.blueprint do
	name { Sham.ip }
	ip { name }
	mac { Sham.mac }
	os { Sham.os }
end
		
Item.blueprint do
	port { Sham.port }
	host { Host.make }
	severity { 0 }
end

Item.blueprint(:critical) do
	port { true }
	host { true }
	severity { 3 }
end

Item.blueprint(:high) do
	port { true }
	host { true }
	severity { 2 }
end

Item.blueprint(:medium) do
	port { true }
	host { true }
	severity { 1 }
end

Item.blueprint(:low) do
	port { true }
	host { true }
	severity { 0 }
end

Report.blueprint do
	name { Faker::Lorem.words }
	policy { Policy.make }
end

Policy.blueprint do
	name { Faker::Lorem.words }
	comments {Faker::Lorem.words(10) }
end

def make_report_with_hosts(attributes ={})
	Report.make(attributes) do
		5.times do 
			report.hosts.make
		end
	end
end