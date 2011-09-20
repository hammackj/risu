module Risu
	module Models
		# Host Model
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Host < ActiveRecord::Base
			belongs_to :report
			has_many :items
			has_many :patches

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

				# Queries for hosts with a Windows NT based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_nt
					where("os LIKE '%Windows NT%'")
				end

				# Negation query for all hosts with a Windows NT based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_nt
					where("os NOT LIKE '%Windows NT%'")
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
					not_os_windows_7.not_os_windows_2k8.not_os_windows_vista.not_os_windows_2k3.not_os_windows_xp.not_os_windows_2k.not_os_windows_nt
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

				def os_aix
					where("os LIKE '%AIX%'")
				end

				def not_os_aix
					where("os NOT LIKE '%AIX%'")
				end

				# Queries for all hosts with a Unknown Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_other
					not_os_osx.not_os_linux.not_os_netbsd.not_os_freebsd.not_os_cisco.not_os_vxworks.not_os_vmware_esx.not_os_windows.not_os_aix
				end

				# Generates a graph of the high and medium findings count per host
				#
				# @return [StringIO] Binary image object of the results
				def top_vuln_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top %d High/Medium Finding Count Per Host ", Item.risks_by_host(limit).all.count
					g.sort = false
					g.theme = {
						:colors => %w(red orange yellow blue green purple black grey brown pink),
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
						:colors => %w(red orange yellow blue green purple black grey brown pink),
						:background_colors => %w(white white)
					}

					linux = Host.os_linux.all.count
					osx = Host.os_osx.all.count
					freebsd = Host.os_freebsd.all.count
					netbsd = Host.os_netbsd.all.count
					cisco = Host.os_cisco.all.count
					vxworks = Host.os_vxworks.all.count
					esx = Host.os_vmware_esx.all.count
					aix = Host.os_aix.all.count
					other = Host.os_other.all.count

					g.data("Linux", linux) unless linux == 0
					g.data("OSX", osx) unless osx == 0
					g.data("FreeBSD", freebsd) unless freebsd == 0
					g.data("NetBSD", netbsd) unless netbsd == 0
					g.data("Cisco ISO", cisco) unless cisco == 0
					g.data("VxWorks", vxworks) unless vxworks == 0
					g.data("VMware", esx) unless esx == 0
					g.data("AIX", aix) unless aix == 0
					g.data("Other", other) unless other == 0

					#Creates very odd graphs
					#Host.os_other.each do |host|
					# g.data(host.os, Host.where(:os => host.os).count) unless host.os == nil
					#end

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
						:colors => %w(red orange yellow blue green purple black grey brown pink),
						:background_colors => %w(white white)
					}

					nt = Host.os_windows_nt.all.count
					w2k = Host.os_windows_2k.all.count
					xp = Host.os_windows_xp.all.count
					w2k3 = Host.os_windows_2k3.all.count
					vista = Host.os_windows_vista.all.count
					w2k8 = Host.os_windows_2k8.all.count
					w7 = Host.os_windows_7.all.count
					other = (Host.os_windows.os_windows_other).all.count

					g.data("NT", nt) if nt >= 1
					g.data("2000", w2k) if w2k >= 1
					g.data("XP", xp) if xp >= 1
					g.data("Server 2003", w2k3) if w2k3 >= 1
					g.data("Vista", vista) if vista >= 1
					g.data("Server 2008", w2k8) if w2k8 >= 1
					g.data("7", w7) if w7 >= 1
					g.data("Other Windows", other) if other >= 1
					
					StringIO.new(g.to_blob)
				end
				
				#
				#
				def windows_os_graph_text
					nt = Host.os_windows_nt.all.count
					w2k = Host.os_windows_2k.all.count
					xp = Host.os_windows_xp.all.count
					w2k3 = Host.os_windows_2k3.all.count
					vista = Host.os_windows_vista.all.count
					w2k8 = Host.os_windows_2k8.all.count
					w7 = Host.os_windows_7.all.count
					other = (Host.os_windows.os_windows_other).all.count
					
					windows_os_count = nt + w2k + xp + w2k3 + vista + w7 + w2k8
					
					nt_percent = (nt.to_f / windows_os_count.to_f) * 100
					w2k_percent = (w2k.to_f / windows_os_count.to_f) * 100
					xp_percent = (xp.to_f / windows_os_count.to_f) * 100
					w2k3_percent = (w2k3.to_f / windows_os_count.to_f) * 100
					vista_percent = (vista.to_f / windows_os_count.to_f) * 100
					
					w2k8_percent = (w2k8.to_f / windows_os_count.to_f) * 100
					w7_percent = (w7.to_f / windows_os_count.to_f) * 100
					
					text = "This graph shows the percentage of the different Microsoft Windows based operating systems " +
					"found on the #{Report.title} network.\n\n"
					
					text << "#{nt_percent.round.to_i}% of the network is Windows NT. " if nt_percent >= 1
					text << "#{w2k_percent.round.to_i}% of the network is Windows 2000. " if w2k_percent >= 1
					text << "#{xp_percent.round.to_i}% of the network is Windows XP. " if xp_percent >= 1
					text << "#{w2k3_percent.round.to_i}% of the network is Windows Server 2003. " if w2k3_percent >= 1
					text << "#{vista_percent.round.to_i}% of the network is Windows Vista. " if vista_percent >= 1
					text << "#{w2k8_percent.round.to_i}% of the network is Windows Server 2008. " if w2k8_percent >= 1
					text << "#{w7_percent.round.to_i}% of the network is Windows 7. " if w7_percent >= 1
					
					text << "\n\n" << unsupported_os_windows if nt > 0 or w2k > 0
					
					return text					
				end

				# @todo add plural check
				#
				def unsupported_os_text
					aix_text = unsupported_os_aix
					win_text = unsupported_os_windows
					freebsd_text = unsupported_os_freebsd

					unsupported_os_text = "Several unsupported operating systems were discovered on the network. " +
					"These operating systems are no longer updated by the specific vendor. These operating systems should be " +
					"updated and replaced as soon as possible.\n\n"

					unsupported_os_text << "#{win_text}" if win_text != ""
					unsupported_os_text << "#{aix_text}" if aix_text != ""
					unsupported_os_text << "#{freebsd_text}" if freebsd_text != ""
					
					return unsupported_os_text
				end

				def unsupported_os_windows
					win_nt_text = ""
					win_2000_text = ""
					win_nt = Host.os_windows_nt
					win_2000 = Host.os_windows_2k

					#Host.os_windows.not_os_windows_7.not_os_windows_2008.not_os_windows_vista.not_os_windows_2003.not_os_windows_xp

					win_nt_text = "Windows NT is an unsupported sperating system; Microsoft has stopped support as of June 2004. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_nt.count >= 1

					win_2000_text = "Windows 2000 is an unsupported operating system; Microsoft has stopped support as of June 2004. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_2000.count >= 1

					return "#{win_nt_text}#{win_2000_text}"

				end

				#
				#
				def unsupported_os_aix
					text = ""
					aix = Host.os_aix.where("OS LIKE 'AIX 5.%'")

					text = "AIX 5.x is an unsupported operating system since IBM has stopped support as of April 2011. " +
					"Please see http://www-03.ibm.com/systems/power/software/aix/ for more information " +
					"about obtaining a newer supported version.\n\n" if aix.count >= 1

					return text
				end
				
				#
				#
				def unsupported_os_freebsd
					text = ""
					freebsd = Host.os_freebsd.where("OS LIKE 'FreeBSD 5.%'")
					
					text = "FreeBSD 5 support ended on 2008-05-31. Upgrade to FreeBSD 8.2 or 7.4. For more information, " + 
					"see : http://www.freebsd.org/security/\n\n" if freebsd.count >= 1
					
					return text
				end

				#turn the os counts into blocks
				def other_os_graph_text
					text = "This graph shows the percentage of the different Non-Windows based operating systems " +
					"found on the #{Report.title} network.\n\n"

					linux = Host.os_linux.all.count
					osx = Host.os_osx.all.count
					freebsd = Host.os_freebsd.all.count
					netbsd = Host.os_netbsd.all.count
					cisco = Host.os_cisco.all.count
					vxworks = Host.os_vxworks.all.count
					esx = Host.os_vmware_esx.all.count
					aix = Host.os_aix.all.count
					other = Host.os_other.all.count

					other_os_count = linux + osx + freebsd + netbsd + cisco + vxworks + esx + aix + other

					linux_percent = (linux.to_f / other_os_count.to_f) * 100
					aix_percent = (aix.to_f / other_os_count.to_f) * 100
					freebsd_percent = (freebsd.to_f / other_os_count.to_f) * 100
					vmware_percent = (esx.to_f / other_os_count.to_f) * 100 
					
					#todo add other os's here
					

					text << "#{linux_percent.to_i}% of the network is running an Linux based operating system. " if linux_percent >= 1
					text << "#{aix_percent.to_i}% of the network is running an AIX based operating system. " if aix_percent >= 1
					text << "#{freebsd_percent.to_i}% of the network is running an FreeBSD based operating system. " if freebsd_percent >= 1
					text << "#{vmware_percent.to_i}% of the network is running an VMware based operating system. " if vmware_percent >= 1
					
					text << "\n\n"<< unsupported_os_aix if aix > 0
					text << "\n\n" << unsupported_os_freebsd if freebsd > 0
					

					return text
				end
			end
		end
	end
end
