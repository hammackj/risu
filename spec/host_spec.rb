# encoding: utf-8

require "spec_helper"

module Risu
	module Models
		describe Host do
			before(:all) do
				@host = Host.make(:ip => "10.0.0.1", :os => "Microsoft Windows XP Processional Service Pack 3")
				@host1 = Host.make(:ip => "10.0.0.2", :os => "Linux Ubuntu 10.10")
				
				@item1 = Item.make(:severity => 3, :plugin => Plugin.make())
				@item2 = Item.make(:severity => 3, :plugin => Plugin.make())
				@item3 = Item.make(:severity => 3, :plugin => Plugin.make())
						
				#printf "\n%s\n\n%s\n\n", @host.inspect, @host1.inspect
			end
			
			after(:all) do
				Report.delete_all
				Host.delete_all
				Plugin.delete_all
				Item.delete_all
				FamilySelection.delete_all
				IndividualPluginSelection.delete_all
				PluginsPreference.delete_all
				Policy.delete_all
				Reference.delete_all
				ServerPreference.delete_all
				Version.delete_all
			end
			
			it "returns 10.0.0.1 for Host.ip" do
				@host.ip.should == "10.0.0.1"
			end
			
			it "returns sorted ips for Host.sorted" do
				Host.sorted.first.ip.should == "10.0.0.1" and Host.sorted[1].ip.should == "10.0.0.2"
			end
			
			it "returns 1 for Host.os_windows" do
				Host.os_windows.all.count.should == 1
			end
			
			it "returns 1 for Host.os_windows_xp" do
				Host.os_windows_xp.all.count.should == 1
			end
			
			it "returns 0 for Host.os_other" do
				Host.os_other.all.count.should == 0
			end
			
			it "returns 1 for Host.os_linux" do
				Host.os_linux.all.count.should == 1
			end
			
			it "returns a graph Host.top_vuln_graph" do
				Host.top_vuln_graph.class.should == StringIO
			end
			
			it "returns a graph Host.other_os_graph" do
				Host.other_os_graph.class.should == StringIO
			end
			
			it "returns a graph Host.windows_os_graph" do
				Host.windows_os_graph.class.should == StringIO
			end
			
			
			
		end
	end
end
