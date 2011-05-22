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
				#def hosts_with_blacklist blacklist_hosts_id
				# if blacklist_host_id == nil
				#		where("id != ?", blacklist_host_id).count
				# else
			 #		count
				# end
				#end

				# Sorts all of the hosts where the ip address is not null
				#
				# @return [Array] With all the Ip's in sorted order
				def sorted
					hosts = Host.where("ip is not NULL").order("ip").all

					#Sort the ips in natural order.
					hosts.sort! do |a,b|
						ip1 = IPAddr.new a.ip
						ip2 = IPAddr.new b.ip

						ip1 <=> ip2
					end

					return hosts
				end

				# Queries for hosts with a Windows based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows
					where("os LIKE '%Windows%'")#.group(:os)
				end
				
				# Negation query for all hosts with a Windows based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows
					where("os NOT LIKE '%Windows%'")
				end

				# Queries for hosts with a Windows 2000 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_2k
					where("os LIKE '%Windows 2000%'")
				end
				
				# Negation query for all hosts with a Windows 2000 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_2k
					where("os NOT LIKE '%Windows 2000%'")
				end

				# Queries for hosts with a Windows XP based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_xp
					where("os LIKE '%Windows XP%'")
				end
				
				# Negation query for all hosts with a Windows XP based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_xp
					where("os NOT LIKE '%Windows XP%'")
				end

				# Queries for hosts with a Windows Server 2003 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_2k3
					where("os LIKE '%Windows Server 2003%'")
				end
				
				# Negation query for all hosts with a Windows Server 2003 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_2k3
					where("os NOT LIKE '%Windows Server 2003%'")
				end

				# Queries for hosts with a Windows Vista based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_vista
					where("os LIKE '%Windows Vista%'")
				end
				
				# Negation query for all hosts with a Windows Vista based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_vista
					where("os NOT LIKE '%Windows Vista%'")
				end

				# Queries for hosts with a Windows Server 2008 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_2k8
					where("os LIKE '%Windows Server 2008%'")
				end
				
				def not_os_windows_2k8
					where("os NOT LIKE '%Windows Server 2008%'")
				end

				# Queries for hosts with a Windows 7 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_7
					where("os LIKE '%Windows 7%'")
				end
				
				# Negation query for all hosts with a Windows 7 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_7
					where("os NOT LIKE '%Windows 7%'")
				end

				# Queries for hosts with a Windows Operating System that are not 2000,
				# XP, 2003, Vista, 2008 or 7
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_other
					not_os_windows_7.not_os_windows_2k8.not_os_windows_vista.not_os_windows_2k3.not_os_windows_xp.not_os_windows_2k
				end
				
				# Queries for all hosts with a Linux based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_linux
					where("os LIKE '%Linux%'")
				end
				
				# Negation query for all hosts with a Linux based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_linux
					where("os NOT LIKE '%Linux%'")
				end

				# Queries for all hosts with a FreeBSD based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_freebsd
					where("os LIKE '%FreeBSD%'")
				end
				
				# Negation query for all hosts with a FreeBSD based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_freebsd
					where("os NOT LIKE '%FreeBSD%'")
				end

				# Queries for all hosts with a NetBSD based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_netbsd
					where("os LIKE '%NetBsd%'")
				end
				
				# Negation query for all hosts with a NETbsd based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_netbsd
					where("os NOT LIKE '%NetBsd%'")
				end

				# Queries for all hosts with a Cisco IOS based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_cisco
					where("os LIKE '%CISCO%'")
				end
				
				# Negation query for all hosts with a Cisco based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_cisco
					where("os NOT LIKE '%CISCO%'")
				end

				# Queries for all hosts with a VXWorks based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_vxworks
					where("os LIKE '%VxWorks%'")
				end
				
				# Negation query for all hosts with a VXWorks based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_vxworks
					where("os NOT LIKE '%VxWorks%'")
				end

				# Queries for all hosts with a VMware ESX based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_vmware_esx
					where("os LIKE '%VMware ESX%'")
				end
				
				# Negation query for all hosts with a VMware ESX based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_vmware_esx
					where("os NOT LIKE '%VMware ESX%'")
				end
				
				# Queries for all hosts with a Mac OSX based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_osx
					where("os LIKE '%Mac OS X%'")
				end
				
				# Negation query for all hosts with a Mac OSX based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_osx
					where("os NOT LIKE '%Mac OS X%'")
				end

				#
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_other
					not_os_osx.not_os_linux.not_os_netbsd.not_os_freebsd.not_os_cisco.not_os_vxworks.not_os_vmware_esx.not_os_windows
				end

				# Generates a graph of the high and medium findings count per host
				#
				# @return [StringIO] Binary image object of the results
				def top_vuln_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d High/Medium Finding Count Per Host ", Item.risks_by_host(limit).all.count
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					Item.risks_by_host(limit).all.each do |item|
						ip = Host.find_by_id(item.host_id).name
						count = Item.where(:host_id => item.host_id).where("severity IN (?)", [2,3]).count

						g.data(ip, count)
					end

					StringIO.new(g.to_blob)
				end

				# Graphs the percentage of other "non Windows" Operating Systems
				#
				# @return [StringIO] Binary image object of the results
				def other_os_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = "Other Operating Systems Percentage"
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					linux = Host.os_linux.all.count
					osx = Host.os_osx.all.count
					freebsd = Host.os_freebsd.all.count
					netbsd = Host.os_netbsd.all.count
					cisco = Host.os_cisco.all.count
					vxworks = Host.os_vxworks.all.count
					esx = Host.os_vmware_esx.all.count

					g.data("Linux", linux) unless linux == nil
					g.data("OSX", osx) unless osx == nil
					g.data("FreeBSD", freebsd) unless freebsd == nil
					g.data("NetBSD", netbsd) unless netbsd == nil
					g.data("Cisco ISO", cisco) unless cisco == nil
					g.data("VxWorks", vxworks) unless vxworks == nil
					g.data("VMware", esx) unless esx == nil

					Host.os_other.each do |host|
						g.data(host.os, Host.where(:os => host.os).count) unless host.os == nil
					end

					StringIO.new(g.to_blob)
				end

				# Graphs the percentage of Windows Operating Systems
				#
				# @return [StringIO] Binary image object of the results
				def windows_os_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = "Windows Operating Systems By Percentage"
					g.sort = false
					g.theme = {
						:colors => %w(red green blue orange yellow purple black grey brown pink),
						:background_colors => %w(white white)
					}

					w2k = Host.os_windows_2k.all.count
					xp = Host.os_windows_xp.all.count
					w2k3 = Host.os_windows_2k3.all.count
					vista = Host.os_windows_vista.all.count
					w2k8 = Host.os_windows_2k8.all.count
					w7 = Host.os_windows_7.all.count
					other = Host.os_windows.all.count

					g.data("2000", w2k) unless w2k == nil
					g.data("XP", xp) unless xp == nil
					g.data("Server 2003", w2k3) unless w2k3 == nil
					g.data("Vista", vista) unless vista == nil
					g.data("Server 2008", w2k8) unless w2k8 == nil
					g.data("7", w7) unless w7 == nil
					g.data("Other Windows", other) unless other == nil

					StringIO.new(g.to_blob)
				end
			end
		end
	end
end
