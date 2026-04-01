# Copyright (c) 2010-2026 Jacob Hammack.
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
	module Templates
		module HostTemplateHelper

			# Renders a PDF table of hosts affected by an unsupported OS, looked up by plugin name.
			#
			# @param title [String] the heading title for the section
			# @param plugin_name [String] the Nessus plugin name used to find affected hosts
			#
			# @return [void]
			def unsupported_os title, plugin_name
				if item_count_by_plugin_name(plugin_name) <= 0
					STDERR.puts "No Items for #{plugin_name}, unsupported_os"
					return
				end

				heading2 title

				headers = ["Host"]
				data = Array.new

				findings =  Item.where(:plugin_id => Plugin.where(:plugin_name => plugin_name).first.id)

				findings.each do |finding|
					host = Host.find_by(:id => finding.host_id)

					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if !host.fqdn.nil?

					row = Array.new
					row.push host_string

					data << row
				end

				@output.table([headers] + data, :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

				text "\n"

			end

			# Renders a PDF table of hosts affected by an unsupported OS, looked up by plugin ID.
			#
			# @param title [String] the heading title for the section
			# @param plugin_id [Integer] the Nessus plugin ID used to find affected hosts
			#
			# @return [void]
			def unsupported_os_by_plugin_id title, plugin_id
				plugin = Plugin.find_by(:id => plugin_id)
				return if plugin.nil?

				items = Item.where(:plugin_id => plugin_id)
				return if items.count == 0

				heading2 title

				headers = ["Host"]
				data = Array.new

				items.each do |finding|
					host = Host.find_by(:id => finding.host_id)
					next if host.nil?

					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if !host.fqdn.nil?

					row = Array.new
					row.push host_string

					data << row
				end

				@output.table([headers] + data, :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

				text "\n"
			end

			# Renders a PDF table of hosts running an unsupported OS by combining results
			# from an ActiveRecord OS scope, plugin names, and plugin IDs.
			#
			# @param title [String] the heading title for the section
			# @param os_scope [ActiveRecord::Relation, nil] optional Host scope filtered by OS string
			# @param plugin_names [Array<String>] Nessus plugin names whose findings contribute hosts
			# @param plugin_ids [Array<Integer>] Nessus plugin IDs whose findings contribute hosts
			#
			# @return [void]
			def unsupported_os_merged(title, os_scope: nil, plugin_names: [], plugin_ids: [])
				host_ids = []

				# OS string scope
				if os_scope
					host_ids += os_scope.pluck(:id)
				end

				# Plugin name lookups
				plugin_names.each do |name|
					plugin = Plugin.where(:plugin_name => name).first
					next if plugin.nil?
					host_ids += Item.where(:plugin_id => plugin.id).pluck(:host_id)
				end

				# Plugin ID lookups
				plugin_ids.each do |pid|
					host_ids += Item.where(:plugin_id => pid).pluck(:host_id)
				end

				host_ids.uniq!
				return if host_ids.empty?

				hosts = Host.where(:id => host_ids)
				return if hosts.empty?

				heading2 title

				headers = ["Host"]
				data = []

				hosts.each do |host|
					host_string = "#{host.name}"
					host_string << " (#{host.fqdn})" if !host.fqdn.nil?
					data << [host_string]
				end

				@output.table([headers] + data, :header => true, :width => output.bounds.width) do
					row(0).style(:font_style => :bold, :background_color => 'cccccc')
					cells.borders = [:top, :bottom, :left, :right]
				end

				text "\n"
			end

			# Renders the full appendix section covering all known unsupported OS categories
			# (Windows NT through Server 2012, AIX, FreeBSD, Debian, Ubuntu, etc.).
			#
			# @return [void]
			def unsupported_os_appendix_section
				unsupported_os_merged("Unsupported Windows NT Installations",
					os_scope: Host.os_windows_nt,
					plugin_names: ["Microsoft Windows NT 4.0 Unsupported Installation Detection"])

				unsupported_os_merged("Unsupported Windows 2000 Installations",
					os_scope: Host.os_windows_2k,
					plugin_names: ["Microsoft Windows 2000 Unsupported Installation Detection"])

				unsupported_os_merged("Unsupported Windows XP Installations",
					os_scope: Host.os_windows_xp,
					plugin_names: ["Microsoft Windows XP Unsupported Installation Detection"])

				unsupported_os_merged("Unsupported Windows Server 2003 Installations",
					os_scope: Host.os_windows_2k3,
					plugin_names: ["Microsoft Windows Server 2003 Unsupported Installation Detection"])

				unsupported_os_merged("Unsupported Windows Vista Installations",
					os_scope: Host.os_windows_vista)

				unsupported_os_merged("Unsupported Windows 7 Installations",
					os_scope: Host.os_windows_7)

				unsupported_os_merged("Unsupported Windows 8 Installations",
					plugin_names: ["Microsoft Windows 8 Unsupported Installation Detection"])

				unsupported_os_merged("Unsupported Windows Server 2008 Installations",
					os_scope: Host.os_windows_2k8,
					plugin_names: ["Microsoft Windows Server 2008 Unsupported Version Detection"],
					plugin_ids: [192782])

				unsupported_os_merged("Unsupported Windows Server 2012 Installations",
					os_scope: Host.os_windows_2k12,
					plugin_ids: [192813])

				unsupported_os_merged("Unsupported AIX 5.x Installations",
					os_scope: Host.os_aix.where("OS LIKE 'AIX 5.%'"))

				unsupported_os_merged("Unsupported FreeBSD 5.x Installations",
					os_scope: Host.os_freebsd.where("OS LIKE 'FreeBSD 5.%'"))

				unsupported_os_merged("Unsupported Debian 8 (Jessie) Installations",
					plugin_ids: [201420])

				unsupported_os_merged("Unsupported Ubuntu 14.04 Installations",
					plugin_ids: [201408])

				unsupported_os_merged("Unsupported Ubuntu 18.04 Installations",
					plugin_ids: [201456])

				text "\n"
			end
		end
	end
end
