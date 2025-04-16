# Copyright (c) 2010-2025 Jacob Hammack.
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
	module Parsers
		module Nessus
			module PostProcess
				class RootCauses < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Root Cause Mapper",
							:plugin_id => 0
						}

						@plugins_to_cause = {
							22194 => "Vendor Patch",
							34477 => "Vendor Patch",
							35362 => "Vendor Patch",
							40887 => "Vendor Patch",
							53514 => "Vendor Patch",
							58435 => "Vendor Patch",
							22034 => "Vendor Patch",
							63643 => "Vendor Patch",
							25905 => "Vendor Patch",
							28227 => "Vendor Patch",
							33128 => "Vendor Patch",
							29924 => "Vendor Patch",
							32194 => "Vendor Patch",
							51840 => "Vendor Patch",
							70612 => "Vendor Patch",
							45415 => "Vendor Patch",
							45418 => "Vendor Patch",
							45419 => "Vendor Patch",
							73917 => "Vendor Patch",
							73412 => "Vendor Patch",
							74326 => "Vendor Patch",
							34475 => "Vendor Patch",
							24699 => "Vendor Patch",
							36132 => "Vendor Patch",
							45416 => "Vendor Patch",
							45417 => "Vendor Patch",
							60098 => "Vendor Patch",
							74470 => "Vendor Patch",
							71774 => "Vendor Patch",
							76457 => "Vendor Patch",
							34501 => "Vendor Patch",
							36216 => "Vendor Patch",
							38978 => "Vendor Patch",
							42044 => "Vendor Patch",
							44588 => "Vendor Patch",
							45429 => "Vendor Patch",
							46173 => "Vendor Patch",
							49690 => "Vendor Patch",
							59644 => "Vendor Patch",
							70216 => "Vendor Patch",
							-99999 => "Vendor Patch",
							-99998 => "Vendor Patch",
							-99995 => "Vendor Patch",
							24712 => "Vendor Patch",
							25371 => "Vendor Patch",
							-99997 => "Vendor Patch",
							-99994 => "Vendor Patch",
							-99992 => "Vendor Patch",
							-99991 => "Vendor Patch",
							-99989 => "Vendor Patch",
							55976 => "Vendor Patch",
							58597 => "Vendor Patch",
							58848 => "Vendor Patch",
							73984 => "Vendor Patch",
							10043 => "Vendor Patch",
							58659 => "Vendor Patch",
							76123 => "Vendor Patch",
							27599 => "Vendor Patch",
							51894 => "Vendor Patch",
							51895 => "Vendor Patch",
							46738 => "Vendor Patch",
							32313 => "Vendor Patch",
							44073 => "Vendor Patch",
							49274 => "Vendor Patch",
							51178 => "Vendor Patch",
							62465 => "Vendor Patch",
							69327 => "Vendor Patch",
							61529 => "Vendor Patch",
							51352 => "Vendor Patch",
							53377 => "Vendor Patch",
							53503 => "Vendor Patch",
							12209 => "Vendor Patch",
							18502 => "Vendor Patch",
							19407 => "Vendor Patch",
							44422 => "Vendor Patch",
							76281 => "Vendor Patch",
							58119 => "Vendor Patch",
							15555 => "Vendor Patch",
							12106 => "Vendor Patch",
							10951 => "Vendor Patch",
							10380 => "Vendor Patch",
							71994 => "Vendor Patch",
							71993 => "Vendor Patch",
							72542 => "Vendor Patch",
							70335 => "Vendor Patch",
							63419 => "Vendor Patch",
							57796 => "Vendor Patch",
							55819 => "Vendor Patch",
							21655 => "Vendor Patch",
							21193 => "Vendor Patch",
							19408 => "Vendor Patch",
							13852 => "Vendor Patch",
							-99988 => "Vendor Patch",
							-99993 => "Vendor Patch",
							48405 => "Vendor Patch",
							48291 => "Vendor Patch",
							47556 => "Vendor Patch",
							53382 => "Vendor Patch",
							63420 => "Vendor Patch",
							59906 => "Vendor Patch",
							46843 => "Vendor Patch",
							61535 => "Vendor Patch",
							73805 => "Vendor Patch",
							73415 => "Vendor Patch",
							73416 => "Vendor Patch",
							48297 => "Vendor Patch",
							59043 => "Vendor Patch",
							59909 => "Vendor Patch",
							70846 => "Vendor Patch",
							70847 => "Vendor Patch",
							70848 => "Vendor Patch",
							71312 => "Vendor Patch",
							71313 => "Vendor Patch",
							71314 => "Vendor Patch",
							71316 => "Vendor Patch",
							72433 => "Vendor Patch",
							72434 => "Vendor Patch",
							72930 => "Vendor Patch",
							74428 => "Vendor Patch",
							59042 => "Vendor Patch",
							59044 => "Vendor Patch",
							59455 => "Vendor Patch",
							59459 => "Vendor Patch",
							59460 => "Vendor Patch",
							59908 => "Vendor Patch",
							59910 => "Vendor Patch",
							59911 => "Vendor Patch",
							61527 => "Vendor Patch",
							61530 => "Vendor Patch",
							62045 => "Vendor Patch",
							62223 => "Vendor Patch",
							62463 => "Vendor Patch",
							62907 => "Vendor Patch",
							63224 => "Vendor Patch",
							63225 => "Vendor Patch",
							63228 => "Vendor Patch",
							63229 => "Vendor Patch",
							63522 => "Vendor Patch",
							64570 => "Vendor Patch",
							64571 => "Vendor Patch",
							64577 => "Vendor Patch",
							64578 => "Vendor Patch",
							65210 => "Vendor Patch",
							65875 => "Vendor Patch",
							65878 => "Vendor Patch",
							65883 => "Vendor Patch",
							66412 => "Vendor Patch",
							66422 => "Vendor Patch",
							66423 => "Vendor Patch",
							66863 => "Vendor Patch",
							67209 => "Vendor Patch",
							67210 => "Vendor Patch",
							67211 => "Vendor Patch",
							67212 => "Vendor Patch",
							69324 => "Vendor Patch",
							69328 => "Vendor Patch",
							69829 => "Vendor Patch",
							69835 => "Vendor Patch",
							70332 => "Vendor Patch",
							70333 => "Vendor Patch",
							71942 => "Vendor Patch",
							72931 => "Vendor Patch",
							25167 => "Vendor Patch",
							27525 => "Vendor Patch",
							73417 => "Vendor Patch",
							53532 => "Vendor Patch",
							58811 => "Vendor Patch",
							25492 => "Vendor Patch",
							31419 => "Vendor Patch",
							58327 => "Vendor Patch",
							68931 => "Vendor Patch",
							59851 => "Vendor Patch",
							66541 => "Vendor Patch",
							70118 => "Vendor Patch",
							69020 => "Vendor Patch",
							76345 => "Vendor Patch",
							49272 => "Vendor Patch",
							11030 => "Vendor Patch",
							11137 => "Vendor Patch",
							11793 => "Vendor Patch",
							11915 => "Vendor Patch",
							31654 => "Vendor Patch",
							35635 => "Vendor Patch",
							11227 => "Vendor Patch",
							12255 => "Vendor Patch",
							13651 => "Vendor Patch",
							44967 => "Vendor Patch",
							71174 => "Vendor Patch",
							72959 => "Vendor Patch",
							10882 => "Vendor Patch",
							51892 => "Vendor Patch",
							51893 => "Vendor Patch",
							44136 => "Vendor Patch",
							49067 => "Vendor Patch",
							62565 => "Vendor Patch",
							10815 => "Vendor Patch",
							12280 => "Vendor Patch",
							17696 => "Vendor Patch",
							22254 => "Vendor Patch",
							76203 => "Vendor Patch",
							11267 => "Vendor Patch",
							12110 => "Vendor Patch",
							39466 => "Vendor Patch",
							65952 => "Vendor Patch",
							70545 => "Vendor Patch",
							-99985 => "Vendor Patch",
							-99986 => "Vendor Patch",
							25926 => "Vendor Patch",
							11138 => "Vendor Patch",
							47715 => "Vendor Patch",
							63476 => "Vendor Patch",
							39468 => "Vendor Patch",
							-99983 => "Vendor Patch",
							-99984 => "Vendor Patch",
							48264 => "Vendor Patch",
							51956 => "Vendor Patch",
							24015 => "Vendor Patch",
							55992 => "Vendor Patch",
							40564 => "Vendor Patch",
							38664 => "Vendor Patch",
							34393 => "Vendor Patch",
							32398 => "Vendor Patch",
							26970 => "Vendor Patch",
							25086 => "Vendor Patch",
							24816 => "Vendor Patch",
							-99982 => "Vendor Patch",
							34725 => "Vendor Patch",
							42424 => "Vendor Patch",
							77200 => "Vendor Patch",
							-99979 => "Vendor Patch",
							80101 => "Vendor Patch",
							-99978 => "Vendor Patch",
							-99977 => "Vendor Patch",
							62311 => "Vendor Patch",
							73595 => "Vendor Patch",
							47152 => "Vendor Patch",
							-99976 => "Vendor Patch",
							-99971 => "Vendor Patch",
							80518 => "Vendor Patch",
							85181 => "Vendor Patch",
							80442 => "Vendor Patch",
							73018 => "Vendor Patch",
							-99981 => "Vendor Patch",
							-99967 => "Vendor Patch",
							70124 => "Vendor Patch",
							-99966 => "Vendor Patch",
							82828 => "Vendor Patch",
							79638 => "Vendor Patch",
							77728 => "Vendor Patch",
							79865 => "Vendor Patch",
							83186 => "Vendor Patch",
							86255 => "Vendor Patch",
							90510 => "Vendor Patch",
							87311 => "Vendor Patch",
							-99980 => "Vendor Patch",
							86994 => "Vendor Patch",
							91230 => "Vendor Patch",
							-99990 => "Vendor Patch",
							-99975 => "Vendor Patch",
							-99961 => "Vendor Patch",
							88577 => "Vendor Patch",
							100464 => "Vendor Patch",
							71807 => "Vendor Patch",
							-99952 => "Vendor Patch",
							-99973 => "Vendor Patch",
							-99962 => "Vendor Patch",
							101367 => "Vendor Patch",
							100761 => "Vendor Patch",
							97997 => "Vendor Patch",
							89104 => "Vendor Patch",
							100756 => "Vendor Patch",
							101362 => "Vendor Patch",
							61731 => "Vendor Patch",
							69185 => "Vendor Patch",
							-99963 => "Vendor Patch",
							91821 => "Vendor Patch",
							100671 => "Vendor Patch",
							100767 => "Vendor Patch",
							101371 => "Vendor Patch",
							99523 => "Vendor Patch",
							175373 => "Vendor Patch", # Microsoft Message Queuing RCE (CVE-2023-21554, QueueJumper) - 
							-99946 => "Vendor Patch", # Missing the latest Microsoft Office Patches 
							-99929 => "Vendor Patch", # NextGen Mirth
							-99947 => "Vendor Patch", # Missing the latest Dell iDRAC Patches
							-99935 => "Vendor Patch", # Missing the latest Zoom Client for Meetings
							-99938 => "Vendor Patch", # Missing the latest PuTTY
							-99928 => "Vendor Patch", # Missing the latest Microsoft SQL Server
							-99927 => "Vendor Patch", # Missing the latest Notepad++



							33850 => "Vendor Support",
							34460 => "Vendor Support",
							73182 => "Vendor Support",
							47709 => "Vendor Support",
							56710 => "Vendor Support",
							48762 => "Vendor Support",
							62758 => "Vendor Support",
							72704 => "Vendor Support",
							48761 => "Vendor Support",
							26928 => "Vendor Support",
							12217 => "Vendor Support",
							35291 => "Vendor Support",
							42873 => "Vendor Support",
							42880 => "Vendor Support",
							62974 => "Vendor Support",
							20007 => "Vendor Support",
							22313 => "Vendor Support",
							56210 => "Vendor Support",
							56211 => "Vendor Support",
							58134 => "Vendor Support",
							64784 => "Vendor Support",
							55786 => "Vendor Support",
							65642 => "Vendor Support",
							19699 => "Vendor Support",
							57859 => "Vendor Support",
							56998 => "Vendor Support",
							73598 => "Vendor Support",
							84729 => "Vendor Support",
							58991 => "Vendor Support",
							69552 => "Vendor Support",
							56212 => "Vendor Support",
							11057 => "Vendor Support",
							21725 => "Vendor Support",
							97994 => "Vendor Support",
							78555 => "Vendor Support", # OpenSSL Unsupported - 
							56997 => "Vendor Support", # VMware ESX / ESXi Unsupported Version Detection - 
							108797 => "Vendor Support", # Unsupported Windows OS (remote)
							73756 => "Vendor Support", # Microsoft SQL Server Unsupported Version Detection
							172179 => "Vendor Support", # Microsoft .NET Core SEoL - 

109321 => "Vendor Patch", #JBoss Enterprise Application Platform doFilter() Method Insecure Deserialization RCE
137702 => "Vendor Patch", #Treck TCP/IP stack multiple vulnerabilities. (Ripple20)
-99965 => "Vendor Patch", #Missing the latest Cisco IOS Patches
171347 => "Vendor Support", #Apache HTTP Server SEoL (<= 1.3.x)
121007 => "Configuration", #SSH Known Hard Coded Private Keys
11358 => "Vendor Patch", #NFS portmapper localhost Mount Request Restricted Host Access
104743 => "Vendor Patch", #TLS Version 1.0 Protocol Detection
157288 => "Vendor Support", #TLS Version 1.1 Deprecated Protocol
136929 => "Vendor Patch", #JQuery 1.2 < 3.5.0 Multiple XSS
97861 => "Vendor Patch", #Network Time Protocol (NTP) Mode 6 Scanner
142960 => "Vendor Patch", #HSTS Missing From HTTPS Server (RFC 6797)
89058 => "Vendor Patch", #SSL DROWN Attack Vulnerability (Decrypting RSA with Obsolete and Weakened eNcryption)
10061 => "Configuration", #Echo Service Detection
33869 => "Vendor Patch", #JBoss Enterprise Application Platform (EAP) Status Servlet Request Remote Information Disclosure
46181 => "Vendor Patch", #JBoss Enterprise Application Platform '/web-console' Authentication Bypass
60108 => "Configuration", #SSL Certificate Chain Contains Weak RSA Keys
187315 => "Vendor Patch", #SSH Terrapin Prefix Truncation Weakness (CVE-2023-48795)
201125 => "Vendor Patch", #VMware ESXi 7.0 / 8.0 Out-of-Bounds read (CVE-2024-37086)
10068 => "Configuration", #Finger Service Remote Information Disclosure
10072 => "Configuration", #Finger .@host Unused Account Disclosure
10891 => "Configuration", #X Display Manager Control Protocol (XDMCP) Detection
11058 => "Configuration", #RPC rusers Remote Information Disclosure
62694 => "Configuration", #Internet Key Exchange (IKE) Aggressive Mode with Pre-Shared Key
78655 => "Configuration", #OpenSSH SSHFP Record Verification Weakness
87733 => "Configuration", #AMQP Cleartext Authentication
88098 => "Configuration", #Apache Server ETag Header Information Disclosure		
153953 => "Configuration", #SSH Weak Key Exchange Algorithms Enabled
10407 => "Configuration", #X Server Detection				
-99921 => "Vendor Patch", #Missing the latest Ubuntu Linux	

							49071 => "Configuration",
							19948 => "Configuration",
							41028 => "Configuration",
							57582 => "Configuration",
							45411 => "Configuration",
							57608 => "Configuration",
							18405 => "Configuration",
							57690 => "Configuration",
							58453 => "Configuration",
							15901 => "Configuration",
							26920 => "Configuration",
							26919 => "Configuration",
							51368 => "Configuration",
							63155 => "Configuration",
							65057 => "Configuration",
							51192 => "Configuration",
							63478 => "Configuration",
							10079 => "Configuration",
							42411 => "Configuration",
							26925 => "Configuration",
							66174 => "Configuration",
							10862 => "Configuration",
							10264 => "Configuration",
							10297 => "Configuration",
							57640 => "Configuration",
							71783 => "Configuration",
							11213 => "Configuration",
							57792 => "Configuration",
							74442 => "Configuration",
							11457 => "Configuration",
							65821 => "Configuration",
							30218 => "Configuration",
							26194 => "Configuration",
							70658 => "Configuration",
							71049 => "Configuration",
							10547 => "Configuration",
							31705 => "Configuration",
							34324 => "Configuration",
							54582 => "Configuration",
							69551 => "Configuration",
							50504 => "Configuration",
							10205 => "Configuration",
							32315 => "Configuration",
							43160 => "Configuration",
							65950 => "Configuration",
							42263 => "Configuration",
							34850 => "Configuration",
							50686 => "Configuration",
							66848 => "Configuration",
							47831 => "Configuration",
							12085 => "Configuration",
							25289 => "Configuration",
							10056 => "Configuration",
							10188 => "Configuration",
							10660 => "Configuration",
							11411 => "Configuration",
							10722 => "Configuration",
							10595 => "Configuration",
							11714 => "Configuration",
							10203 => "Configuration",
							29224 => "Configuration",
							24745 => "Configuration",
							11245 => "Configuration",
							76073 => "Configuration",
							10907 => "Configuration",
							73920 => "Configuration",
							10081 => "Configuration",
							10412 => "Configuration",
							78479 => "Configuration",
							81606 => "Configuration",
							70395 => "Configuration",
							51369 => "Configuration",
							51418 => "Configuration",
							10166 => "Configuration",
							11454 => "Configuration",
							10305 => "Configuration",
							39364 => "Configuration",
							83738 => "Configuration",
							83875 => "Configuration",
							42256 => "Configuration",
							15984 => "Configuration",
							66349 => "Configuration",
							10483 => "Configuration",
							59275 => "Configuration",
							35453 => "Configuration",
							90317 => "Configuration",
							121008 => "Configuration", #SSL / TLS Certificate Known Hard Coded Private Keys - 

						}
					end

					#
					def run
						@plugins_to_cause.each do |k, v|
							plugin = Plugin.where(:id => k).first

							if plugin == nil
								next
							end

							plugin.root_cause = v
							plugin.save
						end
					end
				end
			end
		end
	end
end
