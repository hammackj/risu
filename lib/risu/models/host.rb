# Copyright (c) 2010-2017 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


module Risu
	module Models

		# Host Model
		class Host < ActiveRecord::Base
			belongs_to :report
			has_many :items
			has_many :patches
			has_many :host_properties

			class << self

				# Sorts all of the hosts where the ip address is not null
				#
				# @return [Array] With all the Ip's in sorted order
				def sorted
					hosts = Host.where("ip is not NULL").order("ip").to_a

					#Sort the ips in natural order.
					hosts.sort! do |a,b|
						ip1 = IPAddr.new a.ip
						ip2 = IPAddr.new b.ip

						ip1 <=> ip2
					end

					return hosts
				end

				# Generates a list of hosts from the database
				#
				# @return [String] of hosts \n delimited
				def ip_list
					ips = Array.new
					hosts = Host.where("ip is not NULL").order("ip").to_a

					hosts.each do |host|
						ips << host.ip if host.ip != nil
					end

					ips.join("\n")
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

				# Queries for hosts with a Windows 98 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_98
					where("os LIKE '%Windows 98%'")
				end

				# Negation query for all hosts with a Windows 98 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_98
					where("os NOT LIKE '%Windows 98%'")
				end

				# Queries for hosts with a Windows 98 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_me
					where("os LIKE '%Windows 98%'")
				end

				# Negation query for all hosts with a Windows 98 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_me
					where("os NOT LIKE '%Windows Millennium%'")
				end

				# Queries for hosts with a Windows 95 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_95
					where("os LIKE '%Windows 95%'")
				end

				# Negation query for all hosts with a Windows 95 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_95
					where("os NOT LIKE '%Windows 95%'")
				end

				# Queries for hosts with a Windows 2000 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_2k
					where("os LIKE '%Windows 2000%'")
				end

				# Negation query for all hosts with a Windows 2000 based Operating system
				#
				#
				# @TODO update to use rails not syntax
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
				#
				# @TODO update to use rails not syntax
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
				#
				# @TODO update to use rails not syntax
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
				#
				# @TODO update to use rails not syntax
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

				# Negation query for all hosts with a Windows Server 2008 based Operating system
				#
				#
				# @TODO update to use rails not syntax
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_2k8
					where("os NOT LIKE '%Windows Server 2008%'")
				end

				# Queries for hosts with a Windows Server 2012 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_2k12
					where("os LIKE '%Windows Server 2012%'")
				end

				# Negation query for all hosts with a Windows Server 2012 based Operating system
				#
				#
				# @TODO update to use rails not syntax
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_2k12
					where("os NOT LIKE '%Windows Server 2012%'")
				end

				# Queries for hosts with a Windows 7 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_7
					where("os LIKE '%Windows 7%'")
				end

				# Negation query for all hosts with a Windows 7 based Operating system
				#
				#
				# @TODO update to use rails not syntax
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_7
					where("os NOT LIKE '%Windows 7%'")
				end

				# Queries for hosts with a Windows 8 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_8
					where("os LIKE '%Windows 8%'")
				end

				# Negation query for all hosts with a Windows 8 based Operating system
				#
				# @TODO update to use rails not syntax
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_8
					where("os NOT LIKE '%Windows 8%'")
				end

				# Queries for hosts with a Windows 10 based Operating System
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_10
					where("os LIKE '%Windows 10%'")
				end

				# Negation query for all hosts with a Windows 10 based Operating system
				#
				# @return [ActiveRecord::Relation] with the query results
				def not_os_windows_10
					where("os NOT LIKE '%Windows 10%'")
				end

				# Queries for hosts with a Windows Operating System that are not 2000,
				# XP, 2003, Vista, 2008 or 7
				#
				# @return [ActiveRecord::Relation] with the query results
				def os_windows_other
					not_os_windows_2k12.not_os_windows_8.not_os_windows_7.not_os_windows_2k8.not_os_windows_vista.not_os_windows_2k3.not_os_windows_xp.not_os_windows_2k.not_os_windows_nt
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

				#@TODO comment
				def os_aix
					where("os LIKE '%AIX%'")
				end

				#@TODO comment
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
				# @deprecated
				#
				# @return [StringIO] Binary image object of the results
				def top_vuln_graph(limit=10)
					g = Gruff::Bar.new(GRAPH_WIDTH)
					g.title = sprintf "Top 10 Hosts with Notable Findings Count"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					Item.risks_by_host(limit).to_a.each do |item|
						ip = Host.find_by_id(item.host_id).name
						count = Item.where(:host_id => item.host_id).where(:severity => 4).size

						if count > 0
							g.data(ip, count)
						end
					end

					StringIO.new(g.to_blob)
				end

				# @deprecated
				# @TODO comments
				#
				def windows_os_graph_has_data?
					nt = Host.os_windows_nt.to_a.size
					w2k = Host.os_windows_2k.to_a.size
					xp = Host.os_windows_xp.to_a.size
					w2k3 = Host.os_windows_2k3.to_a.size
					vista = Host.os_windows_vista.to_a.size
					w2k8 = Host.os_windows_2k8.to_a.size
					w2k12 = Host.os_windows_2k12.to_a.size
					w7 = Host.os_windows_7.to_a.size
					w8 = Host.os_windows_8.to_a.size
					other = (Host.os_windows.os_windows_other).to_a.size

					if nt == 0 && w2k == 0 && xp == 0 && w2k3 == 0 && vista == 0 && w2k8 == 0 && w2k12 == 0 && w7 == 0 && w8 == 0 && other == 0
						return false
					else
						return true
					end
				end

				#
				# @deprecated
				# @TODO comments
				#
				def other_os_graph_has_data?
					linux = Host.os_linux.to_a.size
					osx = Host.os_osx.to_a.size
					freebsd = Host.os_freebsd.to_a.size
					netbsd = Host.os_netbsd.to_a.size
					cisco = Host.os_cisco.to_a.size
					vxworks = Host.os_vxworks.to_a.size
					esx = Host.os_vmware_esx.to_a.size
					aix = Host.os_aix.to_a.size
					other = Host.os_other.to_a.size

					if linux == 0 &&
						osx == 0 &&
						freebsd == 0 &&
						netbsd == 0 &&
						cisco == 0 &&
						vxworks == 0 &&
						esx == 0 &&
						aix == 0 &&
						other == 0
						return false
					else
						return true
					end
				end

				# Graphs the percentage of other "non Windows" Operating Systems
				#
				# @deprecated
				# @return [StringIO] Binary image object of the results
				def other_os_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = "Other Operating Systems Percentage"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					linux = Host.os_linux.to_a.size
					osx = Host.os_osx.to_a.size
					freebsd = Host.os_freebsd.to_a.size
					netbsd = Host.os_netbsd.to_a.size
					cisco = Host.os_cisco.to_a.size
					vxworks = Host.os_vxworks.to_a.size
					esx = Host.os_vmware_esx.to_a.size
					aix = Host.os_aix.to_a.size
					other = Host.os_other.to_a.size

					g.data("Linux", linux) unless linux == 0
					g.data("OSX", osx) unless osx == 0
					g.data("FreeBSD", freebsd) unless freebsd == 0
					g.data("NetBSD", netbsd) unless netbsd == 0
					g.data("Cisco IOS", cisco) unless cisco == 0
					g.data("VxWorks", vxworks) unless vxworks == 0
					g.data("VMware", esx) unless esx == 0
					g.data("AIX", aix) unless aix == 0
					g.data("Other", other) unless other == 0

					#Creates very odd graphs
					#Host.os_other.each do |host|
					# g.data(host.os, Host.where(:os => host.os).size) unless host.os == nil
					#end

					StringIO.new(g.to_blob)
				end

				# Graphs the percentage of Windows Operating Systems
				# @deprecated
				#
				# @return [StringIO] Binary image object of the results
				def windows_os_graph
					g = Gruff::Pie.new(GRAPH_WIDTH)
					g.title = "Windows Operating Systems By Percentage"
					g.sort = false
					g.marker_count = 1
					g.theme = {
						:colors => Risu::GRAPH_COLORS,
						:background_colors => %w(white white)
					}

					nt = Host.os_windows_nt.to_a.size
					w2k = Host.os_windows_2k.to_a.size
					xp = Host.os_windows_xp.to_a.size
					w2k3 = Host.os_windows_2k3.to_a.size
					vista = Host.os_windows_vista.to_a.size
					w2k8 = Host.os_windows_2k8.to_a.size
					w2k12 = Host.os_windows_2k12.to_a.size
					w7 = Host.os_windows_7.to_a.size
					w8 = Host.os_windows_8.to_a.size
					w10 = Host.os_windows_10.to_a.size
					other = (Host.os_windows.os_windows_other).to_a.size

					g.data("NT", nt) if nt >= 1
					g.data("2000", w2k) if w2k >= 1
					g.data("XP", xp) if xp >= 1
					g.data("Server 2003", w2k3) if w2k3 >= 1
					g.data("Vista", vista) if vista >= 1
					g.data("Server 2008", w2k8) if w2k8 >= 1
					g.data("Server 2012", w2k12) if w2k12 >= 1
					g.data("7", w7) if w7 >= 1
					g.data("8", w8) if w8 >= 1
					g.data("10", w10) if w10 >= 1
					g.data("Other Windows", other) if other >= 1

					StringIO.new(g.to_blob)
				end

				# @deprecated
				#@TODO comment
				#
				def windows_os_graph_text
					nt = Host.os_windows_nt.to_a.size
					w2k = Host.os_windows_2k.to_a.size
					xp = Host.os_windows_xp.to_a.size
					w2k3 = Host.os_windows_2k3.to_a.size
					vista = Host.os_windows_vista.to_a.size
					w2k8 = Host.os_windows_2k8.to_a.size
					w2k12 = Host.os_windows_2k12.to_a.size
					w7 = Host.os_windows_7.to_a.size
					w8 = Host.os_windows_8.to_a.size
					w10 = Host.os_windows_10.to_a.size
					other = (Host.os_windows.os_windows_other).to_a.size

					windows_os_count = nt + w2k + xp + w2k3 + vista + w7 + w8 + w2k8 + w2k12 + other

					nt_percent = (nt.to_f / windows_os_count.to_f) * 100
					w2k_percent = (w2k.to_f / windows_os_count.to_f) * 100
					xp_percent = (xp.to_f / windows_os_count.to_f) * 100
					w2k3_percent = (w2k3.to_f / windows_os_count.to_f) * 100
					vista_percent = (vista.to_f / windows_os_count.to_f) * 100

					w2k8_percent = (w2k8.to_f / windows_os_count.to_f) * 100
					w7_percent = (w7.to_f / windows_os_count.to_f) * 100
					w8_percent = (w8.to_f / windows_os_count.to_f) * 100
					w10_percent = (w10.to_f / windows_os_count.to_f) * 100
					w2k12_percent = (w2k12.to_f / windows_os_count.to_f) * 100

					text = "This graph shows the percentage of the different Microsoft Windows based operating systems " +
					"found on the #{Report.title} network.\n\n"

					# @TODO this should be a table sorted by %
					text << "#{nt_percent.round.to_i}% (#{nt}) of the network is Windows NT.\n" if nt_percent >= 1
					text << "#{w2k_percent.round.to_i}% (#{w2k}) of the network is Windows 2000.\n" if w2k_percent >= 1
					text << "#{xp_percent.round.to_i}% (#{xp}) of the network is Windows XP.\n" if xp_percent >= 1
					text << "#{w2k3_percent.round.to_i}% (#{w2k3}) of the network is Windows Server 2003.\n" if w2k3_percent >= 1
					text << "#{vista_percent.round.to_i}% (#{vista}) of the network is Windows Vista.\n" if vista_percent >= 1
					text << "#{w2k8_percent.round.to_i}% (#{w2k8}) of the network is Windows Server 2008.\n" if w2k8_percent >= 1
					text << "#{w7_percent.round.to_i}% (#{w7}) of the network is Windows 7.\n" if w7_percent >= 1
					text << "#{w8_percent.round.to_i}% (#{w8}) of the network is Windows 8.\n" if w8_percent >= 1
					text << "#{w10_percent.round.to_i}% (#{w10}) of the network is Windows 10.\n" if w10_percent >= 1
					text << "#{w2k12_percent.round.to_i}% (#{w2k12}) of the network is Windows Server 20012.\n" if w2k12_percent >= 1

					text << "\n\n" << unsupported_os_windows if nt > 0 or w2k > 0 or xp > 0

					return text
				end

				#
				# @TODO comments
				#
				def unsupported_os?
					aix_text = unsupported_os_aix
					win_text = unsupported_os_windows
					freebsd_text = unsupported_os_freebsd

					#If all the text is nil just return nil
					if aix_text == "" && win_text == "" && freebsd_text == ""
						return false
					end

					return true
				end

				# @TODO add plural check
				# @deprecated
				#
				def unsupported_os_text
					if !unsupported_os?
						return nil
					end

					aix_text = unsupported_os_aix
					win_text = unsupported_os_windows
					freebsd_text = unsupported_os_freebsd

					unsupported_os_text = "Several unsupported operating systems were discovered on the network. " +
					"These operating systems are no longer updated by the specific vendor. These operating systems should be " +
					"updated and replaced as soon as possible. If possible, disconnected from the network until updated.\n\n"

					unsupported_os_text << "#{win_text}" if win_text != ""
					unsupported_os_text << "#{aix_text}" if aix_text != ""
					unsupported_os_text << "#{freebsd_text}" if freebsd_text != ""

					return unsupported_os_text
				end

				# @TODO comments
				# @deprecated
				def unsupported_os_windows
					win_95_text = ""
					win_98_text = ""
					win_me_text = ""
					win_nt_text = ""
					win_2000_text = ""
					win_xp_text = ""
					win_2003_text = ""

					win_95 = Host.os_windows_95
					win_98 = Host.os_windows_98
					win_me = Host.os_windows_me
					win_nt = Plugin.where(:plugin_name => "Microsoft Windows NT 4.0 Unsupported Installation Detection")
					win_2000 = Plugin.where(:plugin_name => "Microsoft Windows 2000 Unsupported Installation Detection")
					win_xp = Plugin.where(:plugin_name => "Microsoft Windows XP Unsupported Installation Detection")
					win_2003 = Plugin.where(:plugin_name => "Microsoft Windows Server 2003 Unsupported Installation Detection")

					#Host.os_windows.not_os_windows_7.not_os_windows_2008.not_os_windows_vista.not_os_windows_2003.not_os_windows_xp

					win_95_text = "Windows 95 is an unsupported operating system; Microsoft has stopped support as of December 2001. " +
					"Please see http://en.wikipedia.org/wiki/Windows_95 for more information.\n\n" if win_95.size >= 1

					win_98_text = "Windows 98 is an unsupported operating system; Microsoft has stopped support as of July 2006. " +
					"Please see http://support.microsoft.com/gp/lifean18 for more information.\n\n" if win_98.size >= 1

					win_me_text = "Windows Millennium is an unsupported operating system; Microsoft has stopped support as of July 2006. " +
					"Please see http://support.microsoft.com/gp/lifean18 for more information.\n\n" if win_me.size >= 1

					win_nt_text = "Windows NT is an unsupported operating system; Microsoft has stopped support as of December 2004. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_nt.size >= 1

					win_2000_text = "Windows 2000 is an unsupported operating system; Microsoft has stopped support as of July 2010. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_2000.size >= 1

					win_xp_text = "Windows XP is an unsupported operating system; Microsoft has stopped support as of April 2014. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_xp.size >= 1

					win_2003_text = "Windows 2003 is an unsupported operating system; Microsoft has stopped support as of July 2015. " +
					"Please see http://windows.microsoft.com/en-us/windows/products/lifecycle for more information.\n\n" if win_2003.size >= 1

					return "#{win_95_text}#{win_98_text}#{win_me_text}#{win_nt_text}#{win_2000_text}#{win_xp_text}#{win_2003_text}"
				end

				# @TODO comments
				# @deprecated
				def unsupported_os_aix
					text = ""
					aix = Host.os_aix.where("OS LIKE 'AIX 5.%'")

					text = "AIX 5.x is an unsupported operating system since IBM has stopped support as of April 2011. " +
					"Please see http://www-03.ibm.com/systems/power/software/aix/ for more information " +
					"about obtaining a newer supported version.\n\n" if aix.size >= 1

					return text
				end

				# @TODO comments
				# @deprecated
				def unsupported_os_freebsd
					text = ""
					freebsd = Host.os_freebsd.where("OS LIKE 'FreeBSD 5.%'")

					text = "FreeBSD 5 support ended on 2008-05-31. Upgrade to FreeBSD 8.2 or 7.4. For more information, " +
					"see : http://www.freebsd.org/security/\n\n" if freebsd.size >= 1

					return text
				end

				# @TODO comments
				#turn the os counts into blocks
				# @deprecated
				def other_os_graph_text
					text = "This graph shows the percentage of the different Non-Windows based operating systems " +
					"found on the #{Report.title} network.\n\n"

					linux = Host.os_linux.to_a.size
					osx = Host.os_osx.to_a.size
					freebsd = Host.os_freebsd.to_a.size
					netbsd = Host.os_netbsd.to_a.size
					cisco = Host.os_cisco.to_a.size
					vxworks = Host.os_vxworks.to_a.size
					esx = Host.os_vmware_esx.to_a.size
					aix = Host.os_aix.to_a.size
					other = Host.os_other.to_a.size

					other_os_count = linux + osx + freebsd + netbsd + cisco + vxworks + esx + aix + other

					linux_percent = (linux.to_f / other_os_count.to_f) * 100
					aix_percent = (aix.to_f / other_os_count.to_f) * 100
					freebsd_percent = (freebsd.to_f / other_os_count.to_f) * 100
					vmware_percent = (esx.to_f / other_os_count.to_f) * 100

					#todo add other os's here

					text << "#{linux_percent.to_i}% of the non-windows network are running an Linux based operating system. " if linux_percent >= 1
					text << "#{aix_percent.to_i}% of the non-windows network are running an AIX based operating system. " if aix_percent >= 1
					text << "#{freebsd_percent.to_i}% of the non-windows network are running an FreeBSD based operating system. " if freebsd_percent >= 1
					text << "#{vmware_percent.to_i}% of the non-windows network are running an VMware based operating system. " if vmware_percent >= 1

					text << "\n\n"<< unsupported_os_aix if aix > 0
					text << "\n\n" << unsupported_os_freebsd if freebsd > 0

					return text
				end

				#
				# @TODO comments
				#
				def top_n_vulnerable(n)
					hosts = Item.risks_by_host(Host.count).size
					hosts = hosts.sort_by {|k, v| v}
					hosts.reverse!

					i = 0
					hosts[0...n].each do |host_id, count|
						hosts[i] = Host.where(:id => host_id)
						i = i + 1
					end

					hosts[0...n]
				end

				#
				# @TODO comments
				#
				def unique_hosts_with_critical
					hosts = Item.critical_risks_by_host(Host.all.size).size
					hosts = hosts.sort_by {| _k, v | v}
					hosts.reverse!
				end

				#
				# @TODO comments
				#
				def unique_hosts_with_high
					hosts = Item.high_risks_by_host(Host.all.size).size
					hosts = hosts.sort_by {| _k, v | v}
					hosts.reverse!
				end

				# @TODO
				def unique_hosts_with_critical_and_high_count
					hosts = Array.new
					crit = Item.critical_risks_by_host(Host.all.size)

					crit.each do |item|
						hosts.push(item.host_id)
					end

					high = Item.high_risks_by_host(Host.all.size)

					high.each do |item|
						hosts.push(item.host_id)
					end

					hosts.uniq.size
				end
			end
		end
	end
end
