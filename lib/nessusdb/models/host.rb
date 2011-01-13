# encoding: utf-8

module NessusDB
	module Modules
		# Host Model
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Host < ActiveRecord::Base
			belongs_to :Reports
			has_many :Items
			
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
					where("os not like '%%Windows%%''")
				end		
			end
		end
	end
end
