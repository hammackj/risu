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
					where("os like '%%Windows%%'")
				end
				
				#
				# @other_operating_systems = Host.find(:all, :conditions => ["os not like '%%Windows%%' AND id != #{@blacklist_host_id}"], :group => :os).map(&:os)
				#
				def os_other
					where("os not like '%%Windows%%'")
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

				  Item.risks_by_host(limit).each { |item|
				    ip = Host.find_by_id(item.host_id).name
						count = Item.where(:host_id => item.host_id).where(:severity => 3).where(:severity => 2).count
						
						puts "#{ip} - count = #{count}"

				    #g.data(ip, Item.find(:all, :conditions => ["host_id = ? AND plugin_id != 1 AND plugin_id NOT IN (#{findings.blacklist_plugins}) AND severity in (3,2)", host]).count)
						g.data(ip, count)
				  }

				  StringIO.new(g.to_blob)
				end
			end
		end
	end
end
