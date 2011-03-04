
require "spec_helper"

module NessusDB
	module Models
		
		describe Host do
			before(:all) do
				@host = Host.make(:ip => "10.0.0.1", :os => "Microsoft Windows XP Processional Service Pack 3")
			end
			
			it "returns 10.0.0.1 for Host.ip" do
				@host.ip.should == "10.0.0.1"
			end
			
			it "returns 1 for Host.os_windows" do
				Host.os_windows.all.should include(@host)
			end
		end
	end
end
