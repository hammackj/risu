# encoding: utf-8

module NessusDB
	module Models
		# Host Model
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Host < ActiveRecord::Base
			belongs_to :report
			has_many :items
			
			class << self
				
				#
				#
				#
				def hosts_with_blacklist blacklist_hosts_id
					if blacklist_host_id == nil
						where("id != ?", blacklist_host_id).count
					else
						count
					end
				end
				
				
				#
				# @todo test for nil ip
				# 
				#
				def sorted
					hosts = Host.where("ip is not NULL").order("ip").all
					
					#The name is usally the ip also so if the ip is nil just use the name
					hosts.each do |host|
						if host.ip == nil
							host.ip = host.name
						end
					end

					#Sort the ips in natural order.
					hosts.sort! { |a, b|
						a.ip.gsub(".", "").to_i <=> b.ip.gsub(".", "").to_i
					}

					return hosts
				end
				
				#
				#@windows_operating_systems = Host.find(:all, :conditions => ["os like '%%Windows%%' AND id != #{@blacklist_host_id}"], :group => :os).map(&:os)
				#
				def os_windows
					where("os like '%Windows%'").group(:os)
				end
				
				def os_windows_2k
					where("os like '%Windows 2000%'")
				end
				
				def os_windows_xp
					where("os like '%Windows XP%'")
				end
				
				def os_windows_2k3
					where("os like '%Windows Server 2003%'")
				end
				
				def os_windows_vista
					where("os like '%Windows Vista%'")
				end
				
				def os_windows_2k8
					where("os like '%Windows Server 2008%'")
				end
				
				def os_windows_7
					where("os like '%Windows 7%'")
				end
				
				def os_windows_other
					where("os NOT LIKE '%Windows 2000%'").where("os NOT LIKE '%Windows XP%'").where("os NOT LIKE '%Windows Server 2003%'").where("os NOT LIKE '%Windows 7%'")
				end
				
				#
				# @other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%' AND id != #{@blacklist_host_id}"], :group => :os).map(&:os)
				#
				def os_linux
					where("os like '%Linux%'")
				end
				
				def os_freebsd
					where("os like '%FreeBSD%'")
				end
				
				def os_netbsd
					where("os like '%NetBsd%'")
				end
				
				def os_cisco
					where("os like '%CISCO%'")
				end
				
				def os_vxworks
					where("os like '%VxWorks%'")
				end
				
				def os_other
					where("os NOT LIKE '%Linux%'").where("os NOT LIKE '%NetBsd%'").where("os NOT LIKE '%FreeBSD%'").where("os NOT LIKE '%Linux%'").where("os NOT LIKE '%Windows%'").where("os not like '%CISCO%'").where("os NOT LIKE '%VxWorks%'")
				end
				
				#
				#
				def top_vuln_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d Critical/High Finding Count Per Host ", Item.risks_by_host(limit).count
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_host(limit).each do |item|
						ip = Host.find_by_id(item.host_id).name
						count = Item.where(:host_id => item.host_id).where("severity IN (?)", [2,3]).count
						
						g.data(ip, count)
					end

					StringIO.new(g.to_blob)
				end
				
				#
				#
				def other_os_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = "Other Operating Systems Percentage"
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}
				
					linux = Host.os_linux.count
					freebsd = Host.os_freebsd.count
					netbsd = Host.os_netbsd.count
					cisco = Host.os_cisco.count
					vxworks = Host.os_vxworks.count
					
					g.data("Linux", linux) unless Host.os_linux.count == nil
					g.data("FreeBSD", freebsd) unless Host.os_freebsd.count == nil
					g.data("NetBSD", netbsd) unless Host.os_netbsd.count == nil
					g.data("Cisco ISO", cisco) unless Host.os_cisco.count == nil
					g.data("VxWorks", vxworks) unless Host.os_vxworks.count == nil
					
					
					Host.os_other.each do |host|
						g.data(host.os, Host.where(:os => host.os).count) unless host.os == nil
					end

					StringIO.new(g.to_blob)
				end
				
				#
				#
				def windows_os_graph
				  g = Gruff::Pie.new(GRAPH_WIDTH)
				  g.title = "Windows Operating Systems By Percentage"
				  g.sort = false
				  g.theme = {
				    :colors => %w(red green blue orange yellow purple black grey brown pink),
				    :background_colors => %w(white white)
				  }
				
					w2k = Host.os_windows_2k.count
					xp = Host.os_windows_xp.count
					w2k3 = Host.os_windows_2k3.count
					vista = Host.os_windows_vista.count
					w2k8 = Host.os_windows_2k8.count
					w7 = Host.os_windows_7.count
					
					g.data("2000", w2k) unless Host.os_windows_2k.count == nil
					g.data("XP", xp) unless Host.os_windows_xp.count == nil
					g.data("Server 2003", w2k3) unless Host.os_windows_2k3.count == nil
					g.data("Vista", w2k3) unless Host.os_windows_vista.count == nil
					g.data("Server 2008", w2k3) unless Host.os_windows_2k8.count == nil
					g.data("7", w2k3) unless Host.os_windows_7.count == nil
					
					StringIO.new(g.to_blob)
				end
			end
		end
	end
end
