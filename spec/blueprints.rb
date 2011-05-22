
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

svc_options = Array.new
svc_options << "www"
svc_options << "cifs"
svc_options << "dns"
svc_options << "ftp"
svc_options << "mdns"

risks = Array.new
risks << "Critical"
risks << "High"
risks << "Medium"
risks << "Low"
risks << "None"

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
	svc { svc_options[rand(svc_options.size)] }
	risk_factor {risks[rand(risks.size)] }
end

Plugin.blueprint do
	id { rand(50000) + 1 }
	plugin_name { Faker::Lorem.words(1) }
	description { Faker::Lorem.paragraphs }
	risk_factor { 0 }
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
	svc_name { Sham.svc }
	severity { 0 }
	plugin { Plugin.make }
end

Report.blueprint do
	name { Faker::Lorem.sentence }
	policy { Policy.make }
end

Policy.blueprint do
	name { Faker::Lorem.words(1) }
	comments {Faker::Lorem.words(10) }
end

def make_report_with_hosts(attributes ={})
	Report.make(attributes) do
		5.times do 
			report.hosts.make
		end
	end
end
