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
	module Parsers
		module Nessus
			module PostProcess
				class MicrosoftWindowsPatches < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Windows Patch Rollup",
							:plugin_id => -99983,
							:plugin_name => "Missing the latest Windows Updates Patches",
							:item_name => "Update to the latest Windows Updates",
							:plugin_ids => [
								11110, #HIGH, MS02-045: Microsoft Windows SMB Protocol SMB_COM_TRANSACTION Packet Remote Overflow DoS (326830) (uncredentialed check)


								11808, #CRITICAL, MS03-026: Microsoft RPC Interface Buffer Overrun (823980) (uncredentialed check)
								11835, #CRITICAL, MS03-039: Microsoft RPC Interface Buffer Overrun (824146) (uncredentialed check)
								11890, #CRITICAL, MS03-043: Buffer Overrun in Messenger Service (828035) (uncredentialed check)
								12054, #CRITICAL, MS04-007: ASN.1 Vulnerability Could Allow Code Execution (828028) (uncredentialed check) (NTLM)
								12209, #CRITICAL, MS04-011: Security Update for Microsoft Windows (835732) (uncredentialed check)
								13852, #CRITICAL, MS04-022: Microsoft Windows Task Scheduler Remote Overflow (841873) (uncredentialed check)
								14724, #HIGH, MS04-028: Buffer Overrun in JPEG Processing (833987)
								18026, #HIGH, MS05-023: Vulnerability in Word May Lead to Code Execution (890169)
								18482, #HIGH, MS05-026: Vulnerability in HTML Help Could Allow Remote Code Execution (896358)
								18502, #CRITICAL, MS05-027: Vulnerability in SMB Could Allow Remote Code Execution (896422) (uncredentialed check)
								18681, #HIGH, MS05-036: Vulnerability in Microsoft Color Management Module Could Allow Remote Code Execution (901214)
								19402, #CRITICAL, MS05-039: Vulnerability in Plug and Play Could Allow Remote Code Execution and Elevation of Privilege (899588)
								19403, #HIGH, MS05-040: Vulnerability in Telephony Service Could Allow Remote Code Execution (893756)
								19405, #MEDIUM, MS05-042: Vulnerability in Kerberos Could Allow Denial of Service
								19407, #HIGH, MS05-043: Vulnerability in Printer Spooler Service Could Allow Remote Code Execution (896423) (uncredentialed check)
								19408, #CRITICAL, MS05-039: Vulnerability in Plug and Play Service Could Allow Remote Code Execution (899588) (uncredentialed check)
								19998, #MEDIUM, MS05-045: Vulnerability in Network Connection Manager Could Allow Denial of Service (905414)
								19999, #CRITICAL, MS05-046: Vulnerability in the Client Service for NetWare Could Allow Remote Code Execution (899589)
								20001, #HIGH, MS05-048: Vulnerability in the Microsoft Collaboration Data Objects Could Allow Remote Code Execution (907245)
								20003, #HIGH, MS05-050: Vulnerability in DirectShow Could Allow Remote Code Execution (904706)
								20004, #CRITICAL, MS05-051: Vulnerabilities in MSDTC and COM+ Could Allow Remote Code Execution (902400)
								20389, #HIGH, MS06-002: Vulnerability in Embedded Web Fonts Could Allow Remote Code Execution (908519)
								20390, #HIGH, MS06-003: Vulnerability in TNEF Decoding in Microsoft Outlook and Microsoft Exchange Could Allow Remote Code Execution (902412)
								20907, #MEDIUM, MS06-007: Vulnerability in TCP/IP Could Allow Denial of Service (913446)
								20908, #MEDIUM, MS06-008: Vulnerability in Web Client Service Could Allow Remote Code Execution (911927)
								21078, #HIGH, MS06-012: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (905413)
								21193, #CRITICAL, MS05-047: Plug and Play Remote Code Execution and Local Privilege Elevation (905749) (uncredentialed check)
								21211, #MEDIUM, MS06-014: Vulnerability in MDAC Could Allow Code Execution (911562)
								21655, #CRITICAL, MS04-012: Cumulative Update for Microsoft RPC/DCOM (828741) (uncredentialed check)
								21686, #MEDIUM, MS06-022: Vulnerability in ART Image Rendering Could Allow Remote Code Execution (918439)
								21687, #MEDIUM, MS06-023: Vulnerability in Microsoft JScript Could Allow Remote Code Execution (917344)
								21689, #HIGH, MS06-025: Vulnerability in Routing and Remote Access Could Allow Remote Code Execution (911280)
								21690, #HIGH, MS06-027: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (917336)
								21692, #CRITICAL, MS06-030: Vulnerability in Server Message Block Could Allow Elevation of Privilege (914389)
								21694, #HIGH, MS06-032: Vulnerability in TCP/IP Could Allow Remote Code Execution (917953)
								22028, #MEDIUM, MS06-034: Vulnerability in Microsoft IIS using ASP Could Allow Remote Code Execution (917537)
								22030, #HIGH, MS06-036: Vulnerability in DHCP Client Service Could Allow Remote Code Execution (914388)
								22034, #HIGH, MS06-035: Vulnerability in Server Service Could Allow Remote Code Execution (917159) (uncredentialed check)
								22183, #CRITICAL, MS06-041: Vulnerability in DNS Resolution Could Allow Remote Code Execution (920683)
								22188, #HIGH, MS06-046: Vulnerability in HTML Help Could Allow Remote Code Execution (922616)
								22189, #MEDIUM, MS06-047: Vulnerability in Microsoft Visual Basic for Applications Could Allow Remote Code Execution (921645)
								22190, #HIGH, MS06-048: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (922968)
								22192, #HIGH, MS06-050: Vulnerabilities in Microsoft Windows Hyperlink Object Library Could Allow Remote Code Execution (920670)
								22194, #CRITICAL, MS06-040: Vulnerability in Server Service Could Allow Remote Code Execution (921883) (uncredentialed check)
								22333, #MEDIUM, MS06-053: Vulnerability in Indexing Service Could Allow XSS (920685)
								22334, #MEDIUM, MS06-054: Vulnerability in Microsoft Publisher Could Allow Remote Code Execution (910729)
								22529, #MEDIUM, MS06-056: Vulnerabilities in ASP.NET could allow information disclosure (922770)
								22530, #HIGH, MS06-057: Vulnerability in Windows Explorer Could Allow Remote Execution (923191)
								22532, #HIGH, MS06-059: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (924164)
								22533, #MEDIUM, MS06-060: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (924554)
								22534, #HIGH, MS06-061: Vulnerabilities in Microsoft XML Core Services Could Allow Remote Code Execution (924191)
								22535, #MEDIUM, MS06-062: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (922581)
								22536, #HIGH, MS06-063: Vulnerability in Server Service Could Allow Denial of Service (923414)
								22537, #MEDIUM, MS06-064: Vulnerability in TCP/IP IPv6 Could Allow Denial of Service (922819)
								22538, #MEDIUM, MS06-065: Vulnerability in Windows Object Packager Could Allow Remote Execution (924496)
								23643, #HIGH, MS06-066: Vulnerability in the Client Service for NetWare Could Allow Remote Code Execution (923980)
								23644, #HIGH, MS06-067: Cumulative Security Update for Internet Explorer (922760)
								23645, #HIGH, MS06-068: Vulnerability in Microsoft Agent Could Remote Code Execution (920213)
								23833, #HIGH, MS06-072: Cumulative Security Update for Internet Explorer (925454)
								23837, #CRITICAL, MS06-074: Vulnerability in SNMP Could Allow Remote Code Execution (926247)
								23838, #HIGH, MS06-078: Vulnerability in Windows Media Format Could Allow Remote Code Execution (923689/925398)
								23998, #HIGH, MS07-002: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (927198)
								23999, #HIGH, MS07-003: Vulnerabilities in Microsoft Outlook Could Allow Remote Code Execution (925938)
								24330, #HIGH, MS07-006: Vulnerability in Windows Shell Could Allow Elevation of Privilege (928255)
								24332, #HIGH, MS07-008: Vulnerability in HTML Help ActiveX Control Could Allow Remote Code Execution (928843)
								24335, #HIGH, MS07-011: Vulnerability in Microsoft OLE Dialog Could Allow Remote Code Execution (926436)
								24337, #HIGH, MS07-013: Vulnerability in Microsoft RichEdit Could Allow Remote Code Execution (918118)
								24338, #HIGH, MS07-014: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (929434)
								24339, #HIGH, MS07-015: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (932554)
								24340, #CRITICAL, MS07-016: Cumulative Security Update for Internet Explorer (928090)
								24911, #HIGH, MS07-017: Vulnerabilities in GDI Could Allow Remote Code Execution (925902)
								25025, #HIGH, MS07-022: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (931784)
								25162, #HIGH, MS07-023: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (934233)
								25163, #HIGH, MS07-024: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (934232)
								25164, #HIGH, MS07-025: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (934873)
								25166, #HIGH, MS07-027: Cumulative Security Update for Internet Explorer (931768)
								25167, #HIGH, MS07-028: Vulnerability in CAPICOM Could Allow Remote Code Execution (931906) (deprecated)
								25484, #HIGH, MS07-031: Vulnerability in the Windows Schannel Security Package Could Allow Remote Code Execution (935840)
								25486, #HIGH, MS07-033: Cumulative Security Update for Internet Explorer (933566)
								25488, #HIGH, MS07-035: Vulnerability in Win 32 API Could Allow Remote Code Execution (935839)
								25687, #HIGH, MS07-036: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (936542)
								25688, #HIGH, MS07-037: Vulnerability in Microsoft Publisher Could Allow Remote Code Execution (936548)
								25691, #HIGH, MS07-040: Vulnerabilities in .NET Framework Could Allow Remote Code Execution (931212)
								25880, #HIGH, MS07-042: Vulnerability in Microsoft XML Core Services Could Allow Remote Code Execution (936227)
								25882, #HIGH, MS07-044: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (940965)
								25883, #HIGH, MS07-045: Cumulative Security Update for Internet Explorer (937143)
								25884, #HIGH, MS07-046: Vulnerability in GDI Could Allow Remote Code Execution (938829)
								25886, #HIGH, MS07-050: Vulnerability in Vector Markup Language Could Allow Remote Code Execution (938127)
								26962, #HIGH, MS07-056: Cumulative Security Update for Outlook Express and Windows Mail (941202)
								26963, #HIGH, MS07-057: Cumulative Security Update for Internet Explorer (939653)
								27525, #HIGH, Microsoft Office Service Pack Out of Date
								28183, #HIGH, MS07-061: Vulnerability in Windows URI Handling Could Allow Remote Code Execution (943460)
								28185, #MEDIUM, Macrovision SafeDisc secdrv.sys Crafted METHOD_NEITHER IOCTL Local Overflow
								29308, #HIGH, MS07-064: Vulnerabilities in DirectX Could Allow Remote Code Execution (941568)
								29311, #MEDIUM, MS07-067: Vulnerability in Macrovision Driver Could Allow Local Elevation of Privilege (944653)
								29312, #HIGH, MS07-068: Vulnerability in Windows Media File Format Could Allow Remote Code Execution (941569 / 944275)
								29313, #HIGH, MS07-069: Cumulative Security Update for Internet Explorer (942615)
								29893, #CRITICAL, MS08-001: Vulnerabilities in Windows TCP/IP Could Allow Remote Code Execution (941644)
								29894, #HIGH, MS08-002: Vulnerability in LSASS Could Allow Local Elevation of Privilege (943485)
								31039, #MEDIUM, MS08-005: Vulnerability in Internet Information Services Could Allow Elevation of Privilege (942831)
								31040, #MEDIUM, MS08-006: Vulnerability in Internet Information Services Could Allow Remote Code Execution (942830)
								31041, #HIGH, MS08-007: Vulnerability in WebDAV Mini-Redirector Could Allow Remote Code Execution (946026)
								31042, #HIGH, MS08-008: Vulnerability in OLE Automation Could Allow Remote Code Execution (947890)
								31044, #HIGH, MS08-010: Cumulative Security Update for Internet Explorer (944533)
								31793, #MEDIUM, MS08-020: Vulnerability in DNS Client Could Allow Spoofing (945553)
								31794, #HIGH, MS08-021: Vulnerabilities in GDI Could Allow Remote Code Execution (948590)
								31795, #MEDIUM, MS08-022: Vulnerability in VBScript and JScript Scripting Engines Could Allow Remote Code Execution (944338)
								31797, #HIGH, MS08-024: Cumulative Security Update for Internet Explorer (947864)
								31798, #HIGH, MS08-025: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (941693)
								32310, #HIGH, MS08-026: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (951207)
								32311, #HIGH, MS08-027: Vulnerability in Microsoft Publisher Could Allow Remote Code Execution (951208)
								32312, #HIGH, MS08-028: Vulnerability in Microsoft Jet Database Engine Could Allow Remote Code Execution (950749)
								33107, #HIGH, MS08-011: Vulnerabilities in Microsoft Works File Converter Could Allow Remote Code Execution (947081)
								33132, #HIGH, MS08-030: Vulnerability in Bluetooth Stack Could Allow Remote Code Execution (951376)
								33133, #HIGH, MS08-031: Cumulative Security Update for Internet Explorer (950759)
								33134, #MEDIUM, MS08-032: Cumulative Security Update of ActiveX Kill Bits (950760)
								33135, #HIGH, MS08-033: Vulnerabilities in DirectX Could Allow Remote Code Execution (951698)
								33137, #HIGH, MS08-036: Vulnerabilities in Pragmatic General Multicast (PGM) Could Allow Denial of Service (950762)
								33441, #MEDIUM, MS08-037: Vulnerabilities in DNS Could Allow Spoofing (953230)

								33870, #HIGH, MS08-041: Vulnerability in the ActiveX Control for the Snapshot Viewer for Microsoft Access Could Allow Remote Code Execution (955617)
								33871, #HIGH, MS08-042: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (955048)
								33872, #HIGH, MS08-043: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (954066)
								33873, #MEDIUM, MS08-044: Vulnerabilities in Microsoft Office Filters Could Allow Remote Code Execution (924090)
								33874, #HIGH, MS08-045: Cumulative Security Update for Internet Explorer (953838)
								33875, #HIGH, MS08-046: Vulnerability in Microsoft Windows Image Color Management System Could Allow Remote Code Execution (952954)
								33877, #HIGH, MS08-048: Security Update for Outlook Express and Windows Mail (951066)
								33878, #HIGH, MS08-049: Vulnerabilities in Event System Could Allow Remote Code Execution (950974)
								33879, #MEDIUM, MS08-050: Vulnerability in Windows Messenger Could Allow Information Disclosure (955702)
								33880, #HIGH, MS08-051: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (949785)
								33881, #MEDIUM, MS KB953839: Cumulative Security Update of ActiveX Kill Bits
								34120, #HIGH, MS08-052: Vulnerabilities in GDI+ Could Allow Remote Code Execution (954593)
								34121, #HIGH, MS08-053: Vulnerability in Windows Media Encoder 9 Could Allow Remote Code Execution (954156)
								34123, #HIGH, MS08-055: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (955047)

								34402, #HIGH, MS08-057: Microsoft Excel Multiple Method Remote Code Execution (956416)
								34403, #HIGH, MS08-058: Microsoft Internet Explorer Multiple Vulnerabilities (956390)
								34406, #HIGH, MS08-061: Microsoft Windows Kernel Multiple Privilege Elevation (954211)
								34408, #HIGH, MS08-063: Microsoft Windows SMB File Name Handling Remote Underflow (957095)
								34409, #HIGH, MS08-064: Microsoft Windows Virtual Address Descriptors (VAD) Local Privilege Escalation (956841)
								34411, #HIGH, MS08-066: Microsoft Windows Ancillary Function Driver (afd.sys) Local Privilege Escalation (956803)
								34414, #MEDIUM, MS KB956391: Cumulative Security Update of ActiveX Kill Bits
								34476, #CRITICAL, MS08-067: Microsoft Windows Server Service Crafted RPC Request Handling Unspecified Remote Code Execution (958644) (ECLIPSEDWING)
								34477, #CRITICAL, MS08-067: Microsoft Windows Server Service Crafted RPC Request Handling Remote Code Execution (958644) (ECLIPSEDWING) (uncredentialed check)
								34743, #HIGH, MS08-068: Vulnerability in SMB Could Allow Remote Code Execution (957097)
								34744, #HIGH, MS08-069: Vulnerabilities in Microsoft XML Core Services Could Allow Remote Code Execution (955218)
								35069, #HIGH, MS08-070: Vulnerabilities in Visual Basic 6.0 ActiveX Controls Could Allow Remote Code Execution (932349)
								35070, #HIGH, MS08-071: Vulnerabilities in GDI+ Could Allow Remote Code Execution (956802)
								35071, #HIGH, MS08-072: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (957173)
								35072, #HIGH, MS08-073: Microsoft Internet Explorer Multiple Vulnerabilities (958215)
								35073, #HIGH, MS08-074: Microsoft Excel Multiple Method Remote Code Execution (959070)
								35075, #HIGH, MS08-076: Vulnerabilities in Windows Media Components Could Allow Remote Code Execution (959807)
								35221, #HIGH, MS08-078: Microsoft Internet Explorer Security Update (960714)
								35361, #CRITICAL, MS09-001: Vulnerabilities in SMB Could Allow Remote Code Execution (958687)
								35630, #HIGH, MS09-002: Cumulative Security Update for Internet Explorer (961260)

								35634, #MEDIUM, MS KB960715: Cumulative Security Update of ActiveX Kill Bits

								35822, #HIGH, MS09-006: Vulnerabilities in Windows Kernel Could Allow Remote Code Execution (958690)
								35823, #HIGH, MS09-007: Vulnerability in SChannel Could Allow Spoofing (960225)
								36147, #HIGH, MS09-009: Vulnerabilities in Microsoft Office Excel Could Cause Remote Code Execution (968557)
								36148, #HIGH, MS09-010: Vulnerabilities in WordPad and Office Text Converters Could Allow Remote Code Execution (960477)
								36149, #HIGH, MS09-011: Vulnerability in Microsoft DirectShow Could Allow Remote Code Execution (961373)
								36150, #HIGH, MS09-012: Vulnerabilities in Windows Could Allow Elevation of Privilege (959454)
								36151, #HIGH, MS09-013: Vulnerabilities in Windows HTTP Services Could Allow Remote Code Execution (960803)
								36152, #HIGH, MS09-014: Cumulative Security Update for Internet Explorer (963027)
								36153, #HIGH, MS09-015: Blended Threat Vulnerability in SearchPath Could Allow Elevation of Privilege (959426)
								38742, #HIGH, MS09-017: Vulnerabilities in Microsoft Office PowerPoint Could Allow Remote Code Execution (967340)
								39341, #HIGH, MS09-019: Cumulative Security Update for Internet Explorer (969897)
								39342, #HIGH, MS09-020: Vulnerabilities in Internet Information Services (IIS) Could Allow Elevation of Privilege (970483)
								39343, #HIGH, MS09-021: Vulnerabilities in Microsoft Office Excel Could Allow Remote Code Execution (969462)
								39344, #CRITICAL, MS09-022: Vulnerabilities in Windows Print Spooler Could Allow Remote Code Execution (961501)
								39346, #HIGH, MS09-024: Vulnerability in Microsoft Works Converters Could Allow Remote Code Execution (957632)
								39347, #HIGH, MS09-025: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (968537)
								39348, #CRITICAL, MS09-026: Vulnerability in RPC Could Allow Elevation of Privilege (970238)
								39349, #HIGH, MS09-027: Vulnerabilities in Microsoft Office Word Could Allow Remote Code Execution (969514)
								39350, #MEDIUM, MS KB969898: Cumulative Security Update of ActiveX Kill Bits
								39622, #HIGH, MS09-032: Cumulative Security Update of ActiveX Kill Bits (973346)
								39783, #HIGH, MS09-043: Vulnerabilities in Microsoft Office Web Components Control Could Allow Remote Code Execution (973472)
								39791, #HIGH, MS09-028: Vulnerabilities in Microsoft DirectShow Could Allow Remote Code Execution (971633)
								39792, #HIGH, MS09-029: Vulnerabilities in the Embedded OpenType Font Engine Could Allow Remote Code Execution (961371)
								39793, #HIGH, MS09-030: Vulnerability in Microsoft Office Publisher Could Allow Remote Code Execution (969516)
								40407, #HIGH, MS09-034: Cumulative Security Update for Internet Explorer (972260)
								40435, #HIGH, MS09-035: Vulnerabilities in Visual Studio Active Template Library Could Allow Remote Code Execution (969706)
								40556, #CRITICAL, MS09-037: Vulnerabilities in Microsoft Active Template Library (ATL) Could Allow Remote Code Execution (973908)
								40557, #HIGH, MS09-038: Vulnerabilities in Windows Media File Processing Could Allow Remote Code Execution (971557)
								40559, #MEDIUM, MS09-040: Vulnerability in Message Queuing Could Allow Elevation of Privilege (971032)
								40560, #HIGH, MS09-041: Vulnerability in Workstation Service Could Allow Elevation of Privilege (971657)
								40561, #HIGH, MS09-042: Vulnerability in Telnet Could Allow Remote Code Execution (960859)
								40562, #HIGH, MS09-043: Vulnerabilities in Microsoft Office Web Components Could Allow Remote Code Execution (957638)
								40564, #CRITICAL, MS09-039: Vulnerabilities in WINS Could Allow Remote Code Execution (969883) (uncredentialed check)
								40565, #HIGH, MS09-044: Vulnerabilities in Remote Desktop Connection Could Allow Remote Code Execution (970927)
								40888, #HIGH, MS09-045: Vulnerability in JScript Scripting Engine Could Allow Remote Code Execution (971961)
								40889, #HIGH, MS09-046: Vulnerability in DHTML Editing Component ActiveX Control Could Allow Remote Code Execution (956844)
								40890, #HIGH, MS09-047: Vulnerabilities in Windows Media Format Could Allow Remote Code Execution (973812)
								40891, #HIGH, MS09-048: Vulnerabilities in Windows TCP/IP Could Allow Remote Code Execution (967723)
								42107, #HIGH, MS09-051: Vulnerabilities in Windows Media Runtime Could Allow Remote Code Execution (975682)
								42108, #HIGH, MS09-052: Vulnerability in Windows Media Player Could Allow Remote Code Execution (974112)
								42110, #HIGH, MS09-054: Cumulative Security Update for Internet Explorer (974455)
								42112, #MEDIUM, MS09-056: Vulnerabilities in Windows CryptoAPI Could Allow Spoofing (974571)
								42113, #HIGH, MS09-057: Vulnerability in Indexing Service Could Allow Remote Code Execution (969059)
								42114, #HIGH, MS09-058: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (971486)
								42115, #HIGH, MS09-059: Vulnerability in Local Security Authority Subsystem Service Could Allow Denial of Service (975467)
								42116, #HIGH, MS09-060: Vulnerabilities in Microsoft Active Template Library (ATL) ActiveX Controls for Microsoft Office Could Allow Remote Code Execution (973965)
								42117, #HIGH, MS09-061: Vulnerabilities in the Microsoft .NET Common Language Runtime Could Allow Remote Code Execution (974378)
								42118, #HIGH, MS09-062: Vulnerabilities in GDI+ Could Allow Remote Code Execution (957488)
								42439, #HIGH, MS09-065: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (969947)
								42441, #HIGH, MS09-067: Vulnerabilities in Microsoft Office Excel Could Allow Remote Code Execution (972652)
								42442, #HIGH, MS09-068: Vulnerability in Microsoft Office Word Could Allow Remote Code Execution (976307)
								43061, #MEDIUM, MS09-069: Vulnerability in Local Security Authority Subsystem Service Could Allow Denial of Service (974392)
								43063, #CRITICAL, MS09-071: Vulnerabilities in Internet Authentication Service Could Allow Remote Code Execution (974318)
								43064, #HIGH, MS09-072: Cumulative Security Update for Internet Explorer (976325)
								43065, #HIGH, MS09-073: Vulnerability in WordPad and Office Text Converters Could Allow Remote Code Execution (975539)
								43089, #HIGH, MS KB955759: Security Enhancements for the Indeo Codec
								43865, #HIGH, MS10-001: Vulnerability in the Embedded OpenType Font Engine Could Allow Remote Code Execution (972270)
								44045, #HIGH, MS KB979267: Flash 6 ActiveX Control On Windows XP Multiple Vulnerabilities
								44110, #HIGH, MS10-002: Cumulative Security Update for Internet Explorer (978207)
								44414, #HIGH, MS10-004: Vulnerabilities in Microsoft Office PowerPoint Could Allow Remote Code Execution (975416)
								44415, #HIGH, MS10-005: Vulnerability in Microsoft Paint Could Allow Remote Code Execution (978706)
								44416, #HIGH, MS10-006: Vulnerabilities in SMB Client Could Allow Remote Code Execution (978251)
								44417, #HIGH, MS10-007: Vulnerability in Windows Shell Handler Could Allow Remote Code Execution (975713)
								44418, #MEDIUM, MS10-008: Cumulative Security Update of ActiveX Kill Bits (978262)
								44421, #MEDIUM, MS10-011: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (978037)
								44422, #CRITICAL, MS10-012: Vulnerabilities in SMB Could Allow Remote Code Execution (971468)
								44423, #HIGH, MS10-013: Vulnerability in Microsoft DirectShow Could Allow Remote Code Execution (977935)
								44425, #HIGH, MS10-015: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (977165)
								45020, #HIGH, MS10-016: Vulnerability in Windows Movie Maker Could Allow Remote Code Execution (975561)
								45021, #HIGH, MS10-017: Vulnerabilities in Microsoft Office Excel Could Allow Remote Code Execution (980150)
								45378, #HIGH, MS10-018: Cumulative Security Update for Internet Explorer (980182)
								45506, #HIGH, MS10-019: Vulnerabilities in Windows Could Allow Remote Code Execution (981210)
								45507, #HIGH, MS10-020: Vulnerabilities in SMB Client Could Allow Remote Code Execution (980232)
								45508, #MEDIUM, MS10-021: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (979683)
								45509, #HIGH, MS10-022: Vulnerability in VBScript Scripting Engine Could Allow Remote Code Execution (981169)
								45510, #HIGH, MS10-023: Vulnerability in Microsoft Office Publisher Could Allow Remote Code Execution (981160)
								45513, #HIGH, MS10-026: Vulnerability in Microsoft MPEG Layer-3 Codecs Could Allow Remote Code Execution (977816)
								45514, #HIGH, MS10-027: Vulnerability in Windows Media Player Could Allow Remote Code Execution (979402)
								45516, #MEDIUM, MS10-029: Vulnerability in Windows ISATAP Component Could Allow Spoofing (978338)
								45517, #MEDIUM, MS10-024: Vulnerabilities in Microsoft Exchange and Windows SMTP Service Could Allow Denial of Service (981832) (uncredentialed check)
								46312, #HIGH, MS10-030: Vulnerability in Outlook Express and Windows Mail Could Allow Remote Code Execution (978542)
								46313, #HIGH, MS10-031: Vulnerability in Microsoft Visual Basic for Applications Could Allow Remote Code Execution (978213)
								46839, #HIGH, MS10-032: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (979559)
								46840, #HIGH, MS10-033: Vulnerabilities in Media Decompression Could Allow Remote Code Execution (979902)
								46841, #MEDIUM, MS10-034: Cumulative Security Update of ActiveX Kill Bits (980195)
								46842, #HIGH, MS10-035: Cumulative Security Update for Internet Explorer (982381)
								46843, #HIGH, MS10-036: Vulnerability in COM Validation in Microsoft Office Could Allow Remote Code Execution (983235)
								46844, #MEDIUM, MS10-037: Vulnerability in the OpenType Compact Font Format (CFF) Driver Could Allow Elevation of Privilege (980218)
								46845, #HIGH, MS10-038: Vulnerabilities in Microsoft Office Excel Could Allow Remote Code Execution (2027452)
								46847, #HIGH, MS10-040: Vulnerability in Internet Information Services Could Allow Remote Code Execution (982666)
								46848, #MEDIUM, MS10-041: Vulnerability in Microsoft .NET Framework Could Allow Tampering (981343)
								47045, #HIGH, MS KB2219475: Windows Help Center hcp:// Protocol Handler Arbitrary Code Execution
								47556, #CRITICAL, MS10-012: Vulnerabilities in SMB Could Allow Remote Code Execution (971468) (uncredentialed check)
								47710, #HIGH, MS10-042: Vulnerability in Help and Support Center Could Allow Remote Code Execution (2229593)
								47711, #HIGH, MS10-043: Vulnerability in Canonical Display Driver Could Allow Remote Code Execution (2032276)
								47712, #HIGH, MS10-044: Vulnerabilities in Microsoft Office Access ActiveX Controls Could Allow Remote Code Execution (982335)
								47713, #HIGH, MS10-045: Vulnerability in Microsoft Office Outlook Could Allow Remote Code Execution (978212)
								47750, #HIGH, MS KB2286198: Windows Shell Shortcut Icon Parsing Arbitrary Code Execution (EASYHOOKUP)
								48216, #HIGH, MS10-046: Vulnerability in Windows Shell Could Allow Remote Code Execution (2286198) (EASYHOOKUP)
								48284, #HIGH, MS10-047: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (981852)
								48285, #HIGH, MS10-048: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2160329)
								48286, #HIGH, MS10-049: Vulnerabilities in SChannel could allow Remote Code Execution (980436)
								48287, #HIGH, MS10-050: Vulnerability in Windows Movie Maker Could Allow Remote Code Execution (981997)
								48288, #HIGH, MS10-051: Vulnerability in Microsoft XML Core Services Could Allow Remote Code Execution (2079403)
								48289, #HIGH, MS10-052: Vulnerability in Microsoft MPEG Layer-3 Codecs Could Allow Remote Code Execution (2115168)
								48290, #HIGH, MS10-053: Cumulative Security Update for Internet Explorer (2183461)
								48291, #CRITICAL, MS10-054: Vulnerabilities in SMB Server Could Allow Remote Code Execution (982214)
								48292, #HIGH, MS10-055: Vulnerability in Cinepak Codec Could Allow Remote Code Execution (982665)
								48293, #HIGH, MS10-056: Vulnerability in Microsoft Office Word Could Allow Remote Code Execution (2269638)
								48294, #HIGH, MS10-057: Vulnerability in Microsoft Office Excel Could Allow Remote Code Execution (2269707)
								48295, #HIGH, MS10-058: Vulnerabilities in TCP/IP Could Allow Elevation of Privilege (978886)
								48296, #HIGH, MS10-059: Vulnerabilities in the Tracing Feature for Services Could Allow Elevation of Privilege (982799)
								48297, #HIGH, MS10-060: Vulnerabilities in the Microsoft .NET Common Language Runtime and in Microsoft Silverlight Could Allow Remote Code Execution (2265906)
								48405, #CRITICAL, MS10-054: Vulnerabilities in SMB Server Could Allow Remote Code Execution (982214) (remote check)
								48761, #MEDIUM, MS KB982316: Elevation of Privilege Using Windows Service Isolation Bypass
								48762, #HIGH, MS KB2269637: Insecure Library Loading Could Allow Remote Code Execution
								49219, #HIGH, MS10-061: Vulnerability in Print Spooler Service Could Allow Remote Code Execution (2347290) (EMERALDTHREAD)
								49220, #HIGH, MS10-062: Vulnerability in MPEG-4 Codec Could Allow Remote Code Execution (975558)
								49221, #HIGH, MS10-063: Vulnerability in Unicode Scripts Processor Could Allow Remote Code Execution (2320113)
								49222, #HIGH, MS10-064: Vulnerability in Microsoft Office Outlook Could Allow Remote Code Execution (978212)
								49223, #MEDIUM, MS10-065: Vulnerabilities in Microsoft Internet Information Services (IIS) Could Allow Remote Code Execution (2267960)
								49224, #HIGH, MS10-066: Vulnerability in Remote Procedure Call Could Allow Remote Code Execution (982802)
								49225, #HIGH, MS10-067: Vulnerability in WordPad Text Converters Could Allow Remote Code Execution (2259922)
								49227, #MEDIUM, MS10-069: Vulnerability in Windows Client/Server Runtime Subsystem Could Allow Elevation of Privilege (2121546)
								49274, #MEDIUM, MS KB2401593: Microsoft Outlook Web Access (OWA) CSRF
								49695, #MEDIUM, MS10-070: Vulnerability in ASP.NET Could Allow Information Disclosure (2418042)
								49948, #HIGH, MS10-071: Cumulative Security Update for Internet Explorer (2360131)
								49950, #HIGH, MS10-073: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (981957)
								49951, #HIGH, MS10-074: Vulnerability in Microsoft Foundation Classes Could Allow Remote Code Execution (2387149)
								49953, #HIGH, MS10-076: Vulnerability in the Embedded OpenType Font Engine Could Allow Remote Code Execution (982132)
								49954, #HIGH, MS10-077: Vulnerability in .NET Framework Could Allow Remote Code Execution (2160841)
								49955, #HIGH, MS10-078: Vulnerabilities in the OpenType Font (OTF) Format Driver Could Allow Elevation of Privilege (2279986)
								49956, #HIGH, MS10-079: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (2293194)
								49957, #HIGH, MS10-080: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2293211)
								49958, #HIGH, MS10-081: Vulnerability in Windows Common Control Library Could Allow Remote Code Execution (2296011)
								49959, #HIGH, MS10-082: Vulnerability in Windows Media Player Could Allow Remote Code Execution (2378111)
								49960, #HIGH, MS10-083: Vulnerability in COM Validation in Windows Shell and WordPad Could Allow Remote Code Execution (2405882)
								49961, #HIGH, MS10-084: Vulnerability in Windows Local Procedure Call Could Cause Elevation of Privilege (2360937)
								49962, #HIGH, MS10-085: Vulnerability in SChannel Could Allow Denial of Service (2207566)
								50528, #HIGH, MS10-087: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2423930)
								50529, #HIGH, MS10-088: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (2293386)
								51162, #HIGH, MS10-090: Cumulative Security Update for Internet Explorer (2416400)
								51163, #HIGH, MS10-091: Vulnerabilities in the OpenType Font (OTF) Driver Could Allow Remote Code Execution (2296199)
								51164, #HIGH, MS10-092: Vulnerability in Task Scheduler Could Allow Elevation of Privilege (2305420)
								51166, #HIGH, MS10-094: Vulnerability in Windows Media Encoder Could Allow Remote Code Execution (2447961)
								51167, #HIGH, MS10-095: Vulnerability in Microsoft Windows Could Allow Remote Code Execution (2385678)
								51168, #HIGH, MS10-096: Vulnerability in Windows Address Book Could Allow Remote Code Execution (2423089)
								51169, #HIGH, MS10-097: Insecure Library Loading in Internet Connection Signup Wizard Could Allow Remote Code Execution (2443105)
								51170, #HIGH, MS10-098: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2436673)
								51171, #HIGH, MS10-099: Vulnerability in Routing and Remote Access Could Allow Elevation of Privilege (2440591)
								51172, #HIGH, MS10-100: Vulnerability in Consent User Interface Could Allow Elevation of Privilege (2442962)
								51175, #HIGH, MS10-103: Vulnerabilities in Microsoft Publisher Could Allow Remote Code Execution (2292970)
								51177, #HIGH, MS10-105: Vulnerabilities in Microsoft Office Graphics Filters Could Allow for Remote Code Execution (968095)
								51455, #HIGH, MS11-002: Vulnerabilities in Microsoft Data Access Components Could Allow Remote Code Execution (2451910)
								51587, #HIGH, MS KB2488013: Internet Explorer CSS Import Rule Processing Arbitrary Code Execution
								51903, #HIGH, MS11-003: Cumulative Security Update for Internet Explorer (2482017)
								51904, #CRITICAL, MS11-004: Vulnerability in Internet Information Services (IIS) FTP Service Could Allow Remote Code Execution (2489256)
								51906, #HIGH, MS11-006: Vulnerability in Windows Shell Graphics Processing Could Allow Remote Code Execution (2483185)
								51907, #HIGH, MS11-007: Vulnerability in the OpenType Compact Font Format (CFF) Driver Could Allow Remote Code Execution (2485376)
								51909, #MEDIUM, MS11-009: Vulnerability in JScript and VBScript Scripting Engine Could Allow Information Disclosure (2475792)
								51910, #MEDIUM, MS11-010: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2476687)
								51911, #HIGH, MS11-011: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (2393802)
								51912, #HIGH, MS11-012: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2479628)
								51913, #HIGH, MS11-013: Vulnerabilities in Kerberos Could Allow Elevation of Privilege (2496930)
								51914, #HIGH, MS11-014: Vulnerability in Local Security Authority Subsystem Service Could Allow Local Elevation of Privilege (2478960)
								51956, #CRITICAL, MS11-004: Vulnerability in Internet Information Services (IIS) FTP Service Could Allow Remote Code Execution (2489256) (uncredentialed check)
								52456, #HIGH, MS KB2491888: Microsoft Malware Protection Engine (MMPE) Privilege Escalation
								52583, #HIGH, MS11-015: Vulnerabilities in Windows Media Could Allow Remote Code Execution (2510030)
								52585, #HIGH, MS11-017: Vulnerabilities in Remote Desktop Connection Could Allow Remote Code Execution (2508062)
								53375, #HIGH, MS11-018: Cumulative Security Update for Internet Explorer (2497640)
								53376, #HIGH, MS11-019: Vulnerabilities in SMB Client Could Allow Remote Code Execution (2511455)
								53377, #CRITICAL, MS11-020: Vulnerability in SMB Server Could Allow Remote Code Execution (2508429)
								53378, #HIGH, MS11-021: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2489279)
								53379, #HIGH, MS11-022: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (2489283)
								53381, #HIGH, MS11-024: Vulnerability in Windows Fax Cover Page Editor Could Allow Remote Code Execution (2527308)
								53382, #HIGH, MS11-025: Vulnerability in Microsoft Foundation Class (MFC) Library Could Allow Remote Code Execution (2500212)
								53383, #MEDIUM, MS11-026: Vulnerability in MHTML Could Allow Information Disclosure (2503658)
								53384, #MEDIUM, MS11-027: Cumulative Security Update of ActiveX Kill Bits (2508272)
								53385, #HIGH, MS11-028: Vulnerability in .NET Framework Could Allow Remote Code Execution (2484015)
								53386, #HIGH, MS11-029: Vulnerability in GDI+ Could Allow Remote Code Execution (2489979)
								53387, #HIGH, MS11-030: Vulnerability in DNS Resolution Could Allow Remote Code Execution (2509553)
								53388, #HIGH, MS11-031: Vulnerability in JScript and VBScript Scripting Engines Could Allow Remote Code Execution (2514666)
								53389, #HIGH, MS11-032: Vulnerability in the OpenType Compact Font Format (CFF) Driver Could Allow Remote Code Execution (2507618)
								53390, #HIGH, MS11-033: Vulnerability in WordPad Text Converters Could Allow Remote Code Execution (2485663)
								53391, #HIGH, MS11-034: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2506223)
								53503, #CRITICAL, MS11-020: Vulnerability in SMB Server Could Allow Remote Code Execution (2508429) (remote check)
								53514, #CRITICAL, MS11-030: Vulnerability in DNS Resolution Could Allow Remote Code Execution (2509553) (remote check)
								53830, #HIGH, MS KB2526954: Microsoft Silverlight 4.0 < 4.0.60310 Multiple Vulnerabilities
								53859, #HIGH, MS11-036: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (2545814)
								55116, #MEDIUM, Symantec Backup Exec Server Unauthorized Access (SYM11-006)
								55117, #MEDIUM, MS11-037: Vulnerability in MHTML Could Allow Information Disclosure (2544893)
								55118, #HIGH, MS11-038: Vulnerability in OLE Automation Could Allow Remote Code Execution (2476490)
								55119, #HIGH, MS11-039: Vulnerability in .NET Framework and Microsoft Silverlight Could Allow Remote Code Execution (2514842)
								55121, #HIGH, MS11-041: Vulnerability in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2525694)
								55122, #HIGH, MS11-042: Vulnerabilities in Distributed File System Could Allow Remote Code Execution (2535512)
								55123, #HIGH, MS11-043: Vulnerability in SMB Client Could Allow Remote Code Execution (2536276)
								55124, #HIGH, MS11-044: Vulnerability in .NET Framework Could Allow Remote Code Execution (2538814)
								55125, #HIGH, MS11-045: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2537146)
								55126, #HIGH, MS11-046: Vulnerability in Ancillary Function Driver Could Allow Elevation of Privilege (2503665)
								55128, #HIGH, MS11-048: Vulnerability in SMB Server Could Allow Denial of Service (2536275)
								55129, #MEDIUM, MS11-049: Vulnerability in the Microsoft XML Editor Could Allow Information Disclosure (2543893)
								55130, #HIGH, MS11-050: Cumulative Security Update for Internet Explorer (2530548)
								55132, #HIGH, MS11-052: Vulnerability in Vector Markup Language Could Allow Remote Code Execution (2544521)
								55569, #MEDIUM, MS11-053: Vulnerability in Bluetooth Stack Could Allow Remote Code Execution (2566220)
								55570, #HIGH, MS11-054: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2555917)
								55572, #MEDIUM, MS11-056: Vulnerabilities in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2507938)
								55787, #HIGH, MS11-057: Critical Cumulative Security Update for Internet Explorer (2559049)
								55792, #HIGH, MS11-062: Vulnerability in Remote Access Service NDISTAPI Driver Could Allow Elevation of Privilege (2566454)
								55793, #HIGH, MS11-063: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2567680)
								55794, #HIGH, MS11-064: Vulnerabilities in TCP/IP Stack Could Allow Denial of Service (2563894)
								55795, #HIGH, MS11-065: Vulnerability in Remote Desktop Protocol Could Allow Denial of Service (2570222)
								55796, #MEDIUM, MS11-066: Vulnerability in Microsoft Chart Control Could Allow Information Disclosure (2567943)
								55797, #MEDIUM, MS11-067: Vulnerability in Microsoft Report Viewer Could Allow Information Disclosure (2578230)
								55798, #HIGH, MS11-068: Vulnerability in Windows Kernel Could Allow Denial of Service (2556532)
								55799, #MEDIUM, MS11-069: Vulnerability in .NET Framework Could Allow Information Disclosure (2567951)
								55802, #MEDIUM, MS 2562937: Update Rollup for ActiveX Kill Bits (2562937)
								56174, #HIGH, MS11-071: Vulnerability in Windows Components Could Allow Remote Code Execution (2570947)
								56175, #HIGH, MS11-072: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2587505)
								56177, #MEDIUM, MS11-074: Vulnerabilities in Microsoft SharePoint Could Allow Elevation of Privilege (2451858)
								56449, #HIGH, MS11-075: Vulnerability in Microsoft Active Accessibility Could Allow Remote Code Execution (2623699)
								56450, #HIGH, MS11-076: Vulnerability in Windows Media Center Could Allow Remote Code Execution (2604926)
								56451, #HIGH, MS11-077: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2567053)
								56452, #HIGH, MS11-078: Vulnerability in .NET Framework and Microsoft Silverlight Could Allow Remote Code Execution (2604930)
								56454, #HIGH, MS11-080: Vulnerability in Ancillary Function Driver Could Allow Elevation of Privilege (2592799)
								56455, #HIGH, MS11-081: Critical Cumulative Security Update for Internet Explorer (2586448)
								56736, #CRITICAL, MS11-083: Vulnerability in TCP/IP Could Allow Remote Code Execution (2588516)
								56737, #HIGH, MS11-084: Vulnerability in Windows Kernel-Mode Drivers Could Allow Denial of Service (2617657)
								56738, #HIGH, MS11-085: Vulnerability in Windows Mail and Windows Meeting Space Could Allow Remote Code Execution (2620704)
								56824, #HIGH, MS KB2506014: Update for the Windows Operating System Loader
								57273, #HIGH, MS11-087: Vulnerability in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2639417)
								57275, #HIGH, MS11-089: Vulnerability in Microsoft Office Could Allow Remote Code Execution (2590602)
								57276, #HIGH, MS11-090: Cumulative Security Update of ActiveX Kill Bits (2618451)
								57277, #HIGH, MS11-091: Vulnerabilities in Microsoft Publisher Could Allow Remote Code Execution (2607702)
								57278, #HIGH, MS11-092: Vulnerability in Windows Media Could Allow Remote Code Execution (2648048)
								57279, #HIGH, MS11-093: Vulnerability in OLE Could Allow Remote Code Execution (2624667)
								57280, #HIGH, MS11-094: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (2639142)
								57282, #HIGH, MS11-096: Vulnerability in Microsoft Excel Could Allow Remote Code Execution (2640241)
								57283, #HIGH, MS11-097: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2620712)
								57284, #HIGH, MS11-098: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (2633171)
								57285, #HIGH, MS11-099: Cumulative Security Update for Internet Explorer (2618444)
								57414, #HIGH, MS11-100: Vulnerabilities in .NET Framework Could Allow Elevation of Privilege (2638420)
								57469, #HIGH, MS12-001: Vulnerability in Windows Kernel Could Allow Security Feature Bypass (2644615)
								57470, #HIGH, MS12-002: Vulnerability in Windows Object Packager Could Allow Remote Code Execution (2603381)
								57471, #MEDIUM, MS12-003: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2646524)
								57472, #HIGH, MS12-004: Vulnerabilities in Windows Media Could Allow Remote Code Execution (2636391)
								57473, #HIGH, MS12-005: Vulnerability in Microsoft Windows Could Allow Remote Code Execution (2584146)
								57474, #MEDIUM, MS12-006: Vulnerability in SSL/TLS Could Allow Information Disclosure (2643584)
								57942, #HIGH, MS12-008: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2660465)
								57943, #HIGH, MS12-009: Vulnerabilities in Ancillary Function Driver Could Allow Elevation of Privilege (2645640)
								57944, #HIGH, MS12-010: Cumulative Security Update for Internet Explorer (2647516)
								57946, #HIGH, MS12-012: Vulnerability in Color Control Panel Could Allow Remote Code Execution (2643719)
								57947, #HIGH, MS12-013: Vulnerability in C Run-Time Library Could Allow Remote Code Execution (2654428)
								57948, #HIGH, MS12-014: Vulnerability in Indeo Codec Could Allow Remote Code Execution (2661637)
								57949, #HIGH, MS12-015: Vulnerabilities in Microsoft Visio Viewer 2010 Could Allow Remote Code Execution (2663510)
								57950, #HIGH, MS12-016: Vulnerabilities in .NET Framework and Microsoft Silverlight Could Allow Remote Code Execution (2651026)
								58330, #MEDIUM, MS12-018: Vulnerability in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2641653)
								58331, #MEDIUM, MS12-019: Vulnerability in DirectWrite Could Allow Denial of Service (2665364)
								58332, #HIGH, MS12-020: Vulnerabilities in Remote Desktop Could Allow Remote Code Execution (2671387)
								58333, #MEDIUM, MS12-021: Vulnerability in Visual Studio Could Allow Elevation of Privilege (2651019)
								58335, #MEDIUM, MS 2647518: Update Rollup for ActiveX Kill Bits (2647518)
								58655, #HIGH, MS12-023: Cumulative Security Update for Internet Explorer (2675157)
								58656, #HIGH, MS12-024: Vulnerability in Windows Could Allow Remote Code Execution (2653956)
								58657, #HIGH, MS12-025: Vulnerability in .NET Framework Could Allow Remote Code Execution (2671605)
								58659, #HIGH, MS12-027: Vulnerability in Windows Common Controls Could Allow Remote Code Execution (2664258)
								59037, #HIGH, MS12-029: Vulnerability in Microsoft Word Could Allow Remote Code Execution (2680352)
								59038, #HIGH, MS12-030: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2663830)
								59039, #HIGH, MS12-031: Vulnerability in Microsoft Visio Viewer 2010 Could Allow Remote Code Execution (2597981)
								59040, #MEDIUM, MS12-032: Vulnerability in TCP/IP Could Allow Elevation of Privilege (2688338)
								59041, #MEDIUM, MS12-033: Vulnerability in Windows Partition Manager Could Allow Elevation of Privilege (2690533)
								59042, #HIGH, MS12-034: Combined Security Update for Microsoft Office
								59043, #HIGH, MS12-035: Vulnerabilities in .NET Framework Could Allow Remote Code Execution (2693777)
								59044, #HIGH, MS 2695962: Update Rollup for ActiveX Kill Bits (2695962)
								59454, #HIGH, MS12-036: Vulnerability in Remote Desktop Could Allow Remote Code Execution (2685939)
								59455, #HIGH, MS12-037: Cumulative Security Update for Internet Explorer (2699988)
								59456, #HIGH, MS12-038: Vulnerability in .NET Framework Could Allow Remote Code Execution (2706726)
								59459, #HIGH, MS12-041: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2709162)
								59460, #HIGH, MS12-042: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (2711167)
								59906, #HIGH, MS12-043: Vulnerability in Microsoft XML Core Services Could Allow Remote Code Execution (2722479)
								59907, #HIGH, MS12-044: Cumulative Security Update for Internet Explorer (2719177)
								59908, #HIGH, MS12-045: Vulnerability in Microsoft Data Access Components Could Allow Remote Code Execution (2698365)
								59909, #MEDIUM, MS12-046: Vulnerability in Visual Basic for Applications Could Allow Remote Code Execution (2707960)
								59910, #HIGH, MS12-047: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2718523)
								59911, #HIGH, MS12-048: Vulnerability in Windows Shell Could Allow Remote Code Execution (2691442)
								59912, #MEDIUM, MS12-049: Vulnerability in TLS Could Allow Information Disclosure (2655992)
								59915, #HIGH, MS KB2719662: Vulnerabilities in Gadgets Could Allow Remote Code Execution
								61527, #HIGH, MS12-052: Cumulative Security Update for Internet Explorer (2722913)
								61528, #HIGH, MS12-053: Vulnerability in Remote Desktop Could Allow Remote Code Execution (2723135)
								61529, #CRITICAL, MS12-054: Vulnerabilities in Windows Networking Components Could Allow Remote Code Execution (2733594)
								61530, #HIGH, MS12-055: Vulnerability in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2731847)
								61531, #HIGH, MS12-056: Vulnerability in JScript and VBScript Scripting Engines Could Allow Remote Code Execution (2706045)
								61532, #HIGH, MS12-057: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2731879)
								61534, #HIGH, MS12-059: Buffer Overflow in Microsoft Visio and Visio Viewer Could Allow Remote Code Execution (2733918)
								61535, #HIGH, MS12-060: Vulnerability in Windows Common Controls Could Allow Remote Code Execution (2720573)
								62045, #HIGH, MS 2736233: Update Rollup for ActiveX Kill Bits (2736233)
								62223, #HIGH, MS12-063: Cumulative Security Update for Internet Explorer (2744842)
								62459, #HIGH, MS12-064: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (2742319)
								62461, #MEDIUM, MS12-066: Vulnerability in HTML Sanitization Component Could Allow Elevation of Privilege (2741517)
								62463, #HIGH, MS12-068: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (2724197)
								62464, #MEDIUM, MS12-069: Vulnerability in Kerberos Could Allow Denial of Service (2743555)

								62466, #MEDIUM, MS KB2661254: Update For Minimum Certificate Key Length
								62903, #HIGH, MS12-071: Cumulative Security Update for Internet Explorer (2761451)
								62904, #HIGH, MS12-072: Vulnerabilities in Windows Shell Could Allow Remote Code Execution (2727528)
								62905, #MEDIUM, MS12-073: Vulnerabilities in Microsoft Internet Information Services (IIS) Could Allow Information Disclosure (2733829)
								62906, #HIGH, MS12-074: Vulnerabilities in .NET Framework Could Allow Remote Code Execution (2745030)
								62907, #CRITICAL, MS12-075: Vulnerability in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2761226)
								62908, #HIGH, MS12-076: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2720184)
								62940, #MEDIUM, MS12-073: Vulnerabilities in Microsoft IIS Could Allow Information Disclosure (2733829) (uncredentialed check)
								63224, #HIGH, MS12-077: Cumulative Security Update for Internet Explorer (2761465)
								63225, #CRITICAL, MS12-078: Vulnerability in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2783534)
								63226, #HIGH, MS12-079: Vulnerability in Microsoft Word Could Allow Remote Code Execution (2780642)
								63228, #HIGH, MS12-081: Vulnerability in Windows File Handling Component Could Allow Remote Code Execution (2758857)
								63229, #HIGH, MS12-082: Vulnerability in DirectPlay Could Allow Remote Code Execution (2770660)
								63230, #MEDIUM, MS12-083: Vulnerability in IP-HTTPS Component Could Allow Security Feature Bypass (2765809)
								63419, #CRITICAL, MS13-001: Vulnerabilities in Windows Print Spooler Components Could Allow Remote Code Execution (2769369)
								63420, #HIGH, MS13-002: Vulnerabilities in Microsoft XML Core Services Could Allow Remote Code Execution (2756145)
								63422, #HIGH, MS13-004: Vulnerabilities in .NET Framework Could Allow Elevation of Privilege (2769324)
								63423, #HIGH, MS13-005: Vulnerability in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2778930)
								63424, #MEDIUM, MS13-006: Vulnerability in Microsoft Windows Could Allow Security Feature Bypass (2785220)
								63425, #HIGH, MS13-007: Vulnerability in Open Data Protocol Could Allow Denial of Service (2769327)
								63522, #HIGH, MS13-008: Security Update for Internet Explorer (2799329)
								64570, #HIGH, MS13-009: Security Update for Internet Explorer (2792100)
								64571, #HIGH, MS13-010: Vulnerability in Vector Markup Language Could Allow Remote Code Execution (2797052)
								64572, #HIGH, MS13-011: Vulnerability in Media Decompression Could Allow Remote Code Execution (2780091)
								64576, #CRITICAL, MS13-015: Vulnerability in .NET Framework Could Allow Elevation of Privilege (2800277)
								64577, #MEDIUM, MS13-016: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2778344)
								64578, #HIGH, MS13-017: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (2799494)
								64579, #HIGH, MS13-018: Vulnerability in TCP/IP Could Allow Denial of Service (2790655)
								64580, #HIGH, MS13-019: Vulnerability in Windows Client/Server Run-time Subsystem (CSRSS) Could Allow Elevation of Privilege (2790113)
								64581, #HIGH, MS13-020: Vulnerability in OLE Automation Could Allow Remote Code Execution (2802968)
								65210, #HIGH, MS13-021: Security Update for Internet Explorer (2809289)
								65212, #HIGH, MS13-023: Vulnerability in Microsoft Visio Viewer 2010 Could Allow Remote Code Execution (2801261)
								65214, #MEDIUM, MS13-025: Vulnerability in Microsoft OneNote Could Allow Information Disclosure (2816264)
								65215, #HIGH, MS13-027: Vulnerabilities in Kernel-Mode Drivers Could Allow Elevation Of Privilege (2807986)
								65875, #HIGH, MS13-028: Security Update for Internet Explorer (2817183)
								65876, #HIGH, MS13-029: Vulnerability in Remote Desktop Client Could Allow Remote Code Execution (2828223)
								65878, #MEDIUM, MS13-031: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (2813170)
								65879, #MEDIUM, MS13-032: Vulnerability in Active Directory Could Lead to Denial of Service (2830914)
								65880, #HIGH, MS13-033: Vulnerability in Windows Client/Server Run-time Subsystem Could Allow Elevation of Privilege (2820917)
								65883, #MEDIUM, MS13-036: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2829996)
								66412, #HIGH, MS13-037: Cumulative Security Update for Internet Explorer (2829530)
								66413, #HIGH, MS13-038: Security Update for Internet Explorer (2847204)
								66415, #HIGH, MS13-040: Vulnerabilities in .NET Framework Could Allow Spoofing (2836440)
								66417, #CRITICAL, MS13-042: Vulnerabilities in Microsoft Publisher Could Allow Remote Code Execution (2830397)
								66418, #HIGH, MS13-043: Vulnerability in Microsoft Word Could Allow Remote Code Execution (2830399)
								66421, #MEDIUM, MS13-045: Vulnerability in Windows Essentials Could Allow Information Disclosure (2813707)
								66422, #HIGH, MS13-046: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2840221)
								66423, #MEDIUM, MS KB2820197: Update Rollup for ActiveX Kill Bits
								66425, #HIGH, MS Security Advisory 2846338: Vulnerability in Microsoft Malware Protection Engine Could Allow Remote Code Execution
								66863, #HIGH, MS13-047: Cumulative Security Update for Internet Explorer (2838727)
								66864, #MEDIUM, MS13-048: Vulnerability in Windows Kernel Could Allow Information Disclosure (2839229)
								66865, #HIGH, MS13-049: Vulnerability in Kernel-Mode Driver Could Allow Denial of Service (2845690)
								66866, #HIGH, MS13-050: Vulnerability in Windows Print Spooler Components Could Allow Elevation of Privilege (2839894)
								67209, #HIGH, MS13-052: Vulnerabilities in .NET Framework and Silverlight Could Allow Remote Code Execution (2861561)
								67210, #HIGH, MS13-053: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Remote Code Execution (2850851)
								67211, #HIGH, MS13-054: Vulnerability in GDI+ Could Allow Remote Code Execution (2848295)
								67212, #HIGH, MS13-055: Cumulative Security Update for Internet Explorer (2846071)
								67213, #HIGH, MS13-056: Vulnerability in Microsoft DirectShow Could Allow Remote Code Execution (2845187)
								67214, #HIGH, MS13-057: Vulnerability in Windows Media Format Runtime Could Allow Remote Code Execution (2847883)
								67215, #MEDIUM, MS13-058: Vulnerability in Windows Defender Could Allow Elevation of Privilege (2847927)
								69324, #HIGH, MS13-059: Cumulative Security Update for Internet Explorer (2862772)
								69325, #HIGH, MS13-060: Vulnerability in Unicode Scripts Processor Could Allow Remote Code Execution (2850869)
								69327, #CRITICAL, MS13-062: Vulnerability in Remote Procedure Call Could Allow Elevation of Privilege (2849470)
								69328, #HIGH, MS13-063: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (2859537)
								69330, #HIGH, MS13-065: Vulnerability in ICMPv6 Could Allow Denial of Service (2868623)
								69334, #MEDIUM, MS KB2862973: Update for Deprecation of MD5 Hashing Algorithm for Microsoft Root Certificate Program
								69828, #HIGH, MS13-068: Vulnerability in Microsoft Outlook Could Allow Remote Code Execution (2756473)
								69829, #HIGH, MS13-069: Cumulative Security Update for Internet Explorer (2870699)
								69830, #HIGH, MS13-070: Vulnerability in OLE Could Allow Remote Code Execution (2876217)
								69831, #HIGH, MS13-071: Vulnerability in Windows Theme File Could Allow Remote Code Execution (2864063)
								69832, #HIGH, MS13-072: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2845537)
								69833, #HIGH, MS13-073: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2858300))
								69834, #HIGH, MS13-074: Vulnerabilities in Microsoft Access Could Allow Remote Code Execution (2848637)
								69835, #HIGH, MS13-076: Vulnerabilities in Kernel-Mode Drivers Could Allow Elevation of Privilege (2876315)
								69836, #MEDIUM, MS13-077: Vulnerability in Windows Service Control Manager Could Allow Elevation of Privilege (2872339)
								69838, #MEDIUM, MS13-079: Vulnerability in Active Directory Could Allow Denial of Service (2853587)
								70332, #HIGH, MS13-080: Cumulative Security Update for Internet Explorer (2879017)
								70333, #HIGH, MS13-081: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Remote Code Execution (2870008)
								70334, #HIGH, MS13-082: Vulnerabilities in .NET Framework Could Allow Remote Code Execution (2878890)
								70335, #CRITICAL, MS13-083: Vulnerability in Windows Common Control Library Could Allow Remote Code Execution (2864058)
								70337, #HIGH, MS13-085: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (2885080)
								70338, #HIGH, MS13-086: Vulnerabilities in Microsoft Word Could Allow Remote Code Execution (2885084)
								70339, #MEDIUM, MS13-087: Vulnerability in Silverlight Could Allow Information Disclosure (2890788)
								70395, #LOW, MS KB2532445: AppLocker Rules Bypass
								70846, #HIGH, MS13-088: Cumulative Security Update for Internet Explorer (2888505)
								70847, #HIGH, MS13-089: Critical Vulnerability in Windows Graphics Device Interface Could Allow Remote Code Execution (2876331)
								70848, #HIGH, MS13-090: Cumulative Security Update of ActiveX Kill Bits (2900986)
								70849, #HIGH, MS13-091: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2885093)
								70851, #MEDIUM, MS13-093: Vulnerability in Windows Ancillary Function Driver Could Allow Information Disclosure (2875783)
								70852, #MEDIUM, MS13-094: Vulnerability in Microsoft Outlook Could Allow Information Disclosure (2894514)
								70853, #MEDIUM, MS13-095: Vulnerability in Digital Signatures Could Allow Denial of Service (2868626)
								70854, #MEDIUM, MS KB2868725: Update for Disabling RC4
								71311, #HIGH, MS13-096: Vulnerability in Microsoft Graphics Component Could Allow Remote Code Execution (2908005)
								71312, #HIGH, MS13-097: Cumulative Security Update for Internet Explorer (2898785)
								71313, #HIGH, MS13-098: Vulnerability in Windows Could Allow Remote Code Execution (2893294)
								71314, #HIGH, MS13-099: Vulnerability in Microsoft Scripting Runtime Object Library Could Allow Remote Code Execution (2909158)
								71316, #HIGH, MS13-101: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (2880430)
								71317, #MEDIUM, MS13-102: Vulnerability in LRPC Client Could Allow Elevation of Privilege (2898715)
								71321, #MEDIUM, MS13-106: Vulnerability in a Microsoft Office Shared Component Could Allow Security Feature Bypass (2905238)
								71323, #HIGH, MS KB2905247: Insecure ASP.NET Site Configuration Could Allow Elevation of Privilege
								71941, #HIGH, MS14-001: Vulnerabilities in Microsoft Word and Office Web Apps Could Allow Remote Code Execution (2916605)
								71942, #HIGH, MS14-002: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (2914368)
								71943, #HIGH, MS14-003: Vulnerability in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2913602)
								72428, #HIGH, MS14-005: Vulnerability in Microsoft XML Core Services Could Allow Information Disclosure (2916036)
								72430, #HIGH, MS14-007: Vulnerability in Direct2D Could Allow Remote Code Execution (2912390)
								72432, #HIGH, MS14-009: Vulnerabilities in .NET Framework Could Allow Privilege Escalation (2916607)
								72433, #HIGH, MS14-010: Cumulative Security Update for Internet Explorer (2909921)
								72434, #HIGH, MS14-011: Vulnerability in VBScript Scripting Engine Could Allow Remote Code Execution (2928390)
								72930, #HIGH, MS14-012: Cumulative Security Update for Internet Explorer (2925418)
								72931, #HIGH, MS14-013: Vulnerability in Microsoft DirectShow Could Allow Remote Code Execution (2929961)
								72932, #HIGH, MS14-014: Vulnerability in Silverlight Could Allow Security Feature Bypass (2932677)
								72934, #HIGH, MS14-015: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (2930275)
								72935, #MEDIUM, MS14-016: Vulnerability in Security Account Manager Remote (SAMR) Protocol Could Allow Security Feature Bypass (2934418)
								73413, #HIGH, MS14-017: Vulnerabilities in Microsoft Word and Office Web Apps Could Allow Remote Code Execution (2949660)
								73415, #HIGH, MS14-018: Cumulative Security Update for Internet Explorer (2950467)
								73416, #MEDIUM, MS14-019: Vulnerability in Windows File Handling Component Could Allow Remote Code Execution (2922229)
								73417, #HIGH, MS14-020: Vulnerability in Microsoft Publisher Could Allow Remote Code Execution (2950145)
								73805, #CRITICAL, MS14-021: Security Update for Internet Explorer (2965111)
								73982, #HIGH, MS14-023: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (2961037)
								73983, #MEDIUM, MS14-024: Vulnerability in a Microsoft Common Control Could Allow Security Feature Bypass (2961033)
								73984, #HIGH, MS14-025: Vulnerability in Group Policy Preferences Could Allow Elevation of Privilege (2962486)
								73985, #CRITICAL, MS14-026: Vulnerability in .NET Framework Could Allow Elevation of Privilege (2958732)
								73986, #HIGH, MS14-027: Vulnerability in Windows Shell Handler Could Allow Elevation of Privilege (2962488)
								73987, #MEDIUM, MS14-028: Vulnerabilities in iSCSI Could Allow Denial of Service (2962485)
								73988, #HIGH, MS14-029: Security Update for Internet Explorer (2962482)
								73990, #INFO, MS KB2871997: Update to Improve Credentials Protection and Management
								73992, #MEDIUM, MS KB2960358: Update for Disabling RC4 in .NET TLS
								74422, #MEDIUM, MS14-030: Vulnerability in Remote Desktop Could Allow Tampering (2969259)
								74423, #MEDIUM, MS14-031: Vulnerability in TCP Protocol Could Allow Denial of Service (2962478)
								74425, #MEDIUM, MS14-033: Vulnerability in Microsoft XML Core Services Could Allow Information Disclosure (2966061)
								74426, #HIGH, MS14-034: Vulnerability in Microsoft Word Could Allow Remote Code Execution (2969261)
								74427, #CRITICAL, MS14-035: Cumulative Security Update for Internet Explorer (2969262)
								74428, #HIGH, MS14-036: Vulnerabilities in Microsoft Graphics Component Could Allow Remote Code Execution (2967487)
								76123, #MEDIUM, MS Security Advisory 2974294: Vulnerability in Microsoft Malware Protection Engine Could Allow Denial of Service
								76406, #CRITICAL, MS14-037: Cumulative Security Update for Internet Explorer (2975687)
								76407, #HIGH, MS14-038: Vulnerability in Windows Journal Could Allow Remote Code Execution (2975689)
								76408, #HIGH, MS14-039: Vulnerability in On-Screen Keyboard Could Allow Elevation of Privilege (2975685)
								76409, #HIGH, MS14-040: Vulnerability in Ancillary Function Driver (AFD) Could Allow Elevation of Privilege (2975684)
								76410, #MEDIUM, MS14-041: Vulnerability in Microsoft DirectShow Could Allow Elevation of Privilege (2975681)
								77160, #MEDIUM, MS14-043: Vulnerability in Windows Media Center Could Allow Remote Code Execution (2978742)

								77163, #HIGH, MS14-045: Vulnerabilities in Kernel-Mode Drivers Could Allow Elevation of Privilege (2984615)
								77164, #MEDIUM, MS14-046: Vulnerability in .NET Framework Could Allow Security Feature Bypass (2984625)
								77165, #HIGH, MS14-047: Vulnerability in LRPC Could Allow Security Feature Bypass (2978668)
								77166, #HIGH, MS14-048: Vulnerability in OneNote Could Allow Remote Code Execution (2977201)
								77167, #HIGH, MS14-049: Vulnerability in Windows Installer Service Could Allow Elevation of Privilege (2962490)
								77169, #HIGH, MS14-051: Cumulative Security Update for Internet Explorer (2976627)
								77572, #HIGH, MS14-052: Cumulative Security Update for Internet Explorer (2977629)
								77573, #MEDIUM, MS14-053: Vulnerability in .NET Framework Could Allow Denial of Service (2990931)
								77574, #HIGH, MS14-054: Vulnerability in Windows Task Scheduler Could Allow Elevation of Privilege (2988948)
								78431, #HIGH, MS14-056: Cumulative Security Update for Internet Explorer (2987107)
								78432, #CRITICAL, MS14-057: Vulnerabilities in .NET Framework Could Allow Remote Code Execution (3000414)
								78433, #HIGH, MS14-058: Vulnerabilities in Kernel-Mode Driver Could Allow Remote Code Execution (3000061)
								78435, #HIGH, MS14-060: Vulnerability in Windows OLE Could Allow Remote Code Execution (3000869)
								78437, #HIGH, MS14-061: Vulnerability in Microsoft Word and Office Web Apps Could Allow Remote Code Execution (3000434)
								78438, #HIGH, MS14-062: Vulnerability in Message Queuing Service Could Allow Elevation of Privilege (2993254)
								78439, #HIGH, MS14-063: Vulnerability in FAT32 Disk Partition Driver Could Allow Elevation of Privilege (2998579)
								78446, #MEDIUM, MS KB2977292: Update for Microsoft EAP Implementation that Enables the Use of TLS
								78447, #MEDIUM, MS KB3009008: Vulnerability in SSL 3.0 Could Allow Information Disclosure (POODLE)
								79125, #HIGH, MS14-064: Vulnerabilities in Windows OLE Could Allow Remote Code Execution (3011443)
								79126, #HIGH, MS14-065: Cumulative Security Update for Internet Explorer (3003057)
								79127, #CRITICAL, MS14-066: Vulnerability in Schannel Could Allow Remote Code Execution (2992611)
								79128, #HIGH, MS14-067: Vulnerability in XML Core Services Could Allow Remote Code Execution (2993958)
								79129, #HIGH, MS14-069: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3009710)
								79130, #HIGH, MS14-070: Vulnerability in TCP/IP Could Allow Elevation of Privilege (2989935)
								79131, #MEDIUM, MS14-071: Vulnerability in Windows Audio Service Could Allow Elevation of Privilege (3005607)
								79132, #HIGH, MS14-072: Vulnerability in .NET Framework Could Allow Elevation of Privilege (3005210)
								79134, #MEDIUM, MS14-074: Vulnerability in Remote Desktop Protocol Could Allow Security Feature Bypass (3003743)
								79137, #HIGH, MS14-078: Vulnerability in IME (Japanese) Could Allow Elevation of Privilege (2992719)
								79138, #HIGH, MS14-079: Vulnerability in Kernel-Mode Driver Could Allow Denial of Service (3002885)
								79311, #HIGH, MS14-068: Vulnerability in Kerberos Could Allow Elevation of Privilege (3011780) (ESKIMOROLL)
								79828, #HIGH, MS14-080: Cumulative Security Update for Internet Explorer (3008923)
								79830, #HIGH, MS14-081: Vulnerabilities in Microsoft Word and Office Web Apps Could Allow Remote Code Execution (3017301)
								79831, #HIGH, MS14-082: Vulnerability in Microsoft Office Could Allow Remote Code Execution (3017349)
								79832, #HIGH, MS14-083: Vulnerabilities in Microsoft Excel Could Allow Remote Code Execution (3017347)
								79833, #HIGH, MS14-084: Vulnerability in VBScript Scripting Engine Could Allow Remote Code Execution (3016711)
								79834, #MEDIUM, MS14-085: Vulnerability in Microsoft Graphics Component Could Allow Information Disclosure (3013126)
								80490, #HIGH, MS15-001: Vulnerability in Windows Application Compatibility Cache Could Allow Elevation of Privilege (3023266)
								80491, #CRITICAL, MS15-002: Vulnerability in Windows Telnet Service Could Allow Remote Code Execution (3020393)
								80492, #HIGH, MS15-003: Vulnerability in Windows User Profile Service Could Allow Elevation of Privilege (3021674)
								80493, #HIGH, MS15-004: Vulnerability in Windows Components Could Allow Elevation of Privilege (3025421)
								80494, #MEDIUM, MS15-005: Vulnerability in Network Location Awareness Service Could Allow Security Feature Bypass (3022777)
								80496, #HIGH, MS15-007: Vulnerability in Network Policy Server RADIUS Implementation Could Cause Denial of Service (3014029)
								80497, #MEDIUM, MS15-008: Vulnerability in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (3019215)
								81262, #HIGH, MS15-009: Security Update for Internet Explorer (3034682)
								81263, #HIGH, MS15-010: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Remote Code Execution (3036220)
								81264, #HIGH, MS15-011: Vulnerability in Group Policy Could Allow Remote Code Execution (3000483)
								81265, #HIGH, MS15-012: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3032328)
								81266, #MEDIUM, MS15-013: Vulnerability in Microsoft Office Could Allow Security Feature Bypass (3033857)
								81267, #LOW, MS15-014: Vulnerability in Group Policy Could Allow Security Feature Bypass (3004361)
								81268, #HIGH, MS15-015: Vulnerability in Microsoft Windows Could Allow Elevation of Privilege (3031432)
								81269, #MEDIUM, MS15-016: Vulnerability in Microsoft Graphics Component Could Allow Information Disclosure (3029944)
								81731, #INFO, MS KB3033929: Availability of SHA-2 Code Signing Support for Windows 7 and Windows Server 2008 R2
								81733, #HIGH, MS15-018: Cumulative Security Update for Internet Explorer (3032359)
								81734, #HIGH, MS15-019: Vulnerability in VBScript Scripting Engine Could Allow Remote Code Execution (3040297)
								81735, #HIGH, MS15-020: Vulnerabilities in Microsoft Windows Could Allow Remote Code Execution (3041836) (EASYHOOKUP)
								81736, #HIGH, MS15-021: Vulnerabilities in Adobe Font Driver Could Allow Remote Code Execution (3032323)
								81737, #HIGH, MS15-023: Vulnerabilities in Kernel-Mode Driver Could Allow Elevation of Privilege (3034344)
								81738, #MEDIUM, MS15-024: Vulnerability in PNG Processing Could Allow Information Disclosure (3035132)
								81739, #HIGH, MS15-025: Vulnerabilities in Windows Kernel Could Allow Elevation of Privilege (3038680)
								81741, #MEDIUM, MS15-027: Vulnerability in NETLOGON Could Allow Spoofing (3002657)
								81742, #LOW, MS15-028: Vulnerability in Windows Task Scheduler Could Allow Security Feature Bypass (3030377)
								81743, #MEDIUM, MS15-029: Vulnerability in Windows Photo Decoder Component Could Allow Information Disclosure (3035126)
								81744, #HIGH, MS15-030: Vulnerability in Remote Desktop Protocol Could Allow Denial of Service (3039976)
								81745, #MEDIUM, MS15-031: Vulnerability in Schannel Could Allow Security Feature Bypass (3046049) (FREAK)
								81757, #HIGH, MS15-022: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3038999)
								82075, #MEDIUM, MS KB3050995: Improperly Issued Digital Certificates Could Allow Spoofing (deprecated)
								82769, #HIGH, MS15-033: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3048019)
								82770, #HIGH, MS15-032: Cumulative Security Update for Internet Explorer (3038314)
								82771, #CRITICAL, MS15-034: Vulnerability in HTTP.sys Could Allow Remote Code Execution (3042553)
								82772, #HIGH, MS15-035: Vulnerabilities in Microsoft Graphics Component Could Allow Remote Code Execution (3046306)
								82774, #HIGH, MS15-038: Vulnerabilities in Microsoft Windows Could Allow Elevation of Privilege (3049576)
								82775, #MEDIUM, MS15-039: Vulnerability in XML Core Services Could Allow Security Feature Bypass (3046482)
								82777, #LOW, MS15-041: Vulnerability in .NET Framework Could Allow Information Disclosure (3048010)
								82793, #HIGH, MS15-037: Vulnerability in Windows Task Scheduler Could Allow Elevation of Privilege (3046269)
								82828, #CRITICAL, MS15-034: Vulnerability in HTTP.sys Could Allow Remote Code Execution (3042553) (uncredentialed check)
								83354, #HIGH, MS15-049: Vulnerability in Silverlight Could Allow Elevation of Privilege (3058985)
								83355, #MEDIUM, MS15-050: Vulnerability in Service Control Manager Could Allow Elevation of Privilege (3055642)
								83356, #HIGH, MS15-048: Vulnerabilities in .NET Framework Could Allow Elevation of Privilege (3057134)
								83358, #HIGH, MS15-043: Cumulative Security Update for Internet Explorer (3049563)
								83360, #MEDIUM, MS15-055: Vulnerability in Schannel Could Allow Information Disclosure (3061518)
								83361, #MEDIUM, MS15-052: Vulnerability in Windows Kernel Could Allow Security Feature Bypass (3050514)
								83362, #HIGH, MS15-045: Vulnerability in Windows Journal Could Allow Remote Code Execution (3046002)
								83363, #LOW, MS15-054: Vulnerability in Microsoft Management Console File Format Could Allow Denial of Service (3051768)
								83364, #MEDIUM, MS15-053: Vulnerabilities in JScript and VBScript Scripting Engines Could Allow Security Feature Bypass (3057263)
								83370, #HIGH, MS15-051: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (3057191)
								83416, #HIGH, MS15-046: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3057181)
								83440, #HIGH, MS15-044: Vulnerabilities in Microsoft Font Drivers Could Allow Remote Code Execution (3057110)
								84053, #HIGH, MS15-056: Cumulative Security Update for Internet Explorer (3058515)
								84054, #HIGH, MS15-057: Vulnerability in Windows Media Player Could Allow Remote Code Execution (3033890)
								84055, #HIGH, MS15-059: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3064949)
								84056, #HIGH, MS15-060: Vulnerability in Microsoft Common Controls Could Allow Remote Code Execution (3059317)
								84057, #MEDIUM, MS15-063: Vulnerability in Windows Kernel Could Allow Elevation of Privilege (3063858)
								84059, #HIGH, MS15-061: Vulnerabilities in Windows Kernel-Mode Drivers Could Allow Elevation of Privilege (3057839)
								84734, #MEDIUM, MS15-069: Vulnerabilities in Windows Could Allow Remote Code Execution (3072631)
								84735, #LOW, MS15-071: Vulnerability in NETLOGON Could Allow Elevation of Privilege (3068457)
								84736, #HIGH, MS15-066: Vulnerability in VBScript Scripting Engine Could Allow Remote Code Execution (3072604)

								84739, #HIGH, MS15-070: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3072620)
								84741, #MEDIUM, MS15-075: Vulnerabilities in OLE Could Allow Elevation of Privilege (3072633)
								84742, #MEDIUM, MS KB3074162: Vulnerability in Microsoft Malicious Software Removal Tool Could Allow Elevation of Privilege
								84743, #CRITICAL, MS15-067: Vulnerability in RDP Could Allow Remote Code Execution (3073094)
								84744, #HIGH, MS15-072: Vulnerability in Windows Graphics Component Could Allow Elevation of Privilege (3069392)
								84745, #MEDIUM, MS15-074: Vulnerability in Windows Installer Service Could Allow Elevation of Privilege (3072630)
								84746, #HIGH, MS15-077: Vulnerability in ATM Font Driver Could Allow Elevation of Privilege (3077657)
								84747, #HIGH, MS15-073: Vulnerabilities in Windows Kernel-Mode Driver Could Allow Elevation of Privilege (3070102)
								84748, #HIGH, MS15-076: Vulnerability in Windows Remote Procedure Call Could Allow Elevation of Privilege (3067505)
								84761, #HIGH, MS15-065: Cumulative Security Update for Internet Explorer (3076321)
								84763, #MEDIUM, MS KB3057154: Update to harden use of DES encryption (3057154)
								84882, #HIGH, MS15-078: Vulnerability in Microsoft Font Driver Could Allow Remote Code Execution (3079904)
								85321, #HIGH, MS15-083: Vulnerability in Server Message Block Could Allow Remote Code Execution (3073921)
								85322, #HIGH, MS15-090: Vulnerabilities in Microsoft Windows Could Allow Elevation of Privilege (3060716)
								85323, #LOW, MS15-089: Vulnerability in WebDAV Could Allow Information Disclosure (3076949)
								85329, #CRITICAL, MS KB3087916: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								85330, #HIGH, MS15-085: Vulnerability in Mount Manager Could Allow Elevation of Privilege (3082487)
								85332, #HIGH, MS15-082: Vulnerability in RDP Could Allow Remote Code Execution (3080348)
								85333, #HIGH, MS15-079: Cumulative Security Update for Internet Explorer (3082442)
								85334, #MEDIUM, MS15-088: Unsafe Command Line Parameter Passing Could Allow Information Disclosure (3082458)
								85335, #MEDIUM, MS15-084: Vulnerabilities in XML Core Services Could Allow Information Disclosure (3080129)
								85348, #HIGH, MS15-080 : Vulnerabilities in Microsoft Graphics Component Could Allow Remote Code Execution (3078662)
								85350, #HIGH, MS15-081: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3080790)
								85540, #HIGH, MS15-093: Security Update for Internet Explorer (3088903)
								85844, #HIGH, MS15-102: Vulnerabilities in Windows Task Management Could Allow Elevation of Privilege (3089657)
								85845, #HIGH, MS15-094: Cumulative Security Update for Internet Explorer (3089548)
								85846, #MEDIUM, MS15-096: Vulnerability in Active Directory Service Could Allow Denial of Service (3072595)
								85847, #HIGH, MS15-101: Vulnerabilities in .NET Framework Could Allow Elevation of Privilege (3089662)
								85876, #HIGH, MS15-098: Vulnerabilities in Windows Journal Could Allow Remote Code Execution (3089669)
								85877, #HIGH, MS15-097: Vulnerabilities in Microsoft Graphics Component Could Allow Remote Code Execution (3089656)
								85879, #HIGH, MS15-099: Vulnerabilities in Microsoft Office Could Allow Remote Code Execution (3089664)
								85884, #HIGH, MS15-100: Vulnerability in Windows Media Center Could Allow Remote Code Execution (3087918)
								86065, #CRITICAL, MS KB3087040: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								86149, #MEDIUM, MS KB3097966: Inadvertently Disclosed Digital Certificates Could Allow Spoofing
								86366, #HIGH, MS15-109: Security Update for Windows Shell to Address Remote Code Execution (3096443)
								86367, #HIGH, MS15-106: Cumulative Security Update for Internet Explorer (3096441)
								86371, #CRITICAL, MS KB3099406: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								86373, #HIGH, MS15-111: Security Update for Windows Kernel to Address Elevation of Privilege (3096447)
								86374, #HIGH, MS15-110: Security Updates for Microsoft Office to Address Remote Code Execution (3089440)
								86469, #CRITICAL, MS KB3105216: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								86819, #HIGH, MS15-112: Cumulative Security Update for Internet Explorer (3104517)
								86820, #HIGH, MS15-113: Cumulative Security Update for Microsoft Edge (3104519)
								86821, #HIGH, MS15-114: Security Update for Windows Journal to Address Remote Code Execution (3100213)
								86822, #HIGH, MS15-115: Security Update for Microsoft Windows to Address Remote Code Execution (3105864)
								86823, #HIGH, MS15-116: Security Update for Microsoft Office to Address Remote Code Execution (3104540)
								86824, #HIGH, MS15-117: Security Update for NDIS to Address Elevation of Privilege (3101722)
								86825, #MEDIUM, MS15-118: Security Update for .NET Framework to Address Elevation of Privilege (3104507)
								86826, #HIGH, MS15-119: Security Update for Winsock to Address Elevation of Privilege (3104521)
								86827, #MEDIUM, MS15-121: Security Update for Schannel to Address Spoofing (3081320)
								86828, #MEDIUM, MS15-122: Security Update for Kerberos to Address Security Feature Bypass (3105256)
								86856, #CRITICAL, MS KB3103688: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								87249, #CRITICAL, MS KB3119147: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								87252, #MEDIUM, MS KB3123040: Improperly Issued Digital Certificates Could Allow Spoofing
								87253, #HIGH, MS15-124: Cumulative Security Update for Internet Explorer (3116180)
								87254, #HIGH, MS15-125: Cumulative Security Update for Microsoft Edge (3116184)
								87256, #HIGH, MS15-127: Security Update for Microsoft Windows DNS to Address Remote Code Execution (3100465)
								87257, #HIGH, MS15-128: Security Update for Microsoft Graphics Component to Address Remote Code Execution (3104503)
								87258, #HIGH, MS15-129: Security Update for Silverlight to Address Remote Code Execution (3106614)
								87259, #HIGH, MS15-130: Security Update for Microsoft Uniscribe to Address Remote Code Execution (3108670)
								87260, #HIGH, MS15-131: Security Update for Microsoft Office to Address Remote Code Execution (3116111)
								87261, #HIGH, MS15-132: Security Update for Microsoft Windows to Address Remote Code Execution (3116162)
								87262, #HIGH, MS15-133: Security Update for Windows PGM to Address Elevation of Privilege (3116130)
								87263, #HIGH, MS15-134: Security Update for Windows Media Center to Address Remote Code Execution (3108669)
								87264, #HIGH, MS15-135: Security Update for Windows Kernel-Mode Drivers to Address Elevation of Privilege (3119075)
								87313, #MEDIUM, MS KB3119884: Improperly Issued Digital Certificates Could Allow Spoofing
								87671, #CRITICAL, MS KB3132372: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer and Microsoft Edge
								87875, #MEDIUM, MS KB3123479: Deprecation of SHA-1 Hashing Algorithm for Microsoft Root Certificate Program
								87877, #HIGH, MS16-001: Cumulative Security Update for Internet Explorer (3124903)
								87878, #HIGH, MS16-002: Cumulative Security Update for Microsoft Edge (3124904)
								87880, #HIGH, MS16-006: Security Update for Silverlight to Address Remote Code Execution (3126036)
								87881, #MEDIUM, MS16-008: Security Update for Windows Kernel to Address Elevation of Privilege (3124605)
								87882, #HIGH, MS16-004: Security Update for Microsoft Office to Address Remote Code Execution (3124585)
								87890, #HIGH, MS16-007: Security Update for Microsoft Windows to Address Remote Code Execution (3124901)
								87892, #HIGH, MS16-005: Security Update for Windows Kernel-Mode Drivers to Address Remote Code Execution (3124584)
								87893, #HIGH, MS KB3118753: Update for ActiveX Kill Bits
								88642, #HIGH, MS16-009: Cumulative Security Update for Internet Explorer (3134220)
								88643, #HIGH, MS16-011: Cumulative Security Update for Microsoft Edge (3134225)
								88644, #HIGH, MS16-012: Security Update for Microsoft Windows PDF Library to Address Remote Code Execution (3138938)
								88645, #HIGH, MS16-013: Security Update for Windows Journal to Address Remote Code Execution (3134811)
								88646, #HIGH, MS16-014: Security Update for Microsoft Windows to Address Remote Code Execution (3134228)
								88647, #HIGH, MS16-015: Security Update for Microsoft Office to Address Remote Code Execution (3134226)
								88648, #HIGH, MS16-016: Security Update for WebDAV to Address Elevation of Privilege (3136041)
								88649, #HIGH, MS16-017: Security Update for Remote Desktop Display Driver to Address Elevation of Privilege (3134700)
								88650, #HIGH, MS16-018: Security Update for Windows Kernel-Mode Drivers to Address Elevation of Privilege (3136082)
								88651, #MEDIUM, MS16-019: Security Update for .NET Framework to Address Denial of Service (3137893)
								88653, #MEDIUM, MS16-021: Security Update for NPS RADIUS Server to Address Denial of Service (3133043)
								88654, #HIGH, MS16-022: Security Update for Adobe Flash Player (3135782)
								89746, #HIGH, MS16-023: Cumulative Security Update for Internet Explorer (3142015)
								89747, #HIGH, MS16-024: Cumulative Security Update for Microsoft Edge (3142019)
								89748, #HIGH, MS16-025: Security Update for Windows Library Loading to Address Remote Code Execution (3140709)
								89749, #HIGH, MS16-026: Security Update for Graphic Fonts to Address Remote Code Execution (3143148)
								89750, #HIGH, MS16-027: Security Update for Windows Media to Address Remote Code Execution (3143146)
								89751, #HIGH, MS16-028: Security Update for Microsoft Windows PDF Library to Address Remote Code Execution (3143081)
								89752, #HIGH, MS16-029: Security Update for Microsoft Office to Address Remote Code Execution (3141806)
								89753, #HIGH, MS16-030: Security Update for Windows OLE to Address Remote Code Execution (3143136)
								89754, #HIGH, MS16-031: Security Update for Microsoft Windows to Address Elevation of Privilege (3140410)
								89755, #HIGH, MS16-032: Security Update for Secondary Logon to Address Elevation of Privilege (3143141)
								89756, #HIGH, MS16-034: Security Update for Windows Kernel-Mode Drivers to Address Elevation of Privilege (3143145)
								89757, #CRITICAL, MS16-035: Security Update for .NET Framework to Address Security Feature Bypass (3141780)
								89779, #HIGH, MS16-033: Security Update for Windows USB Mass Storage Class Driver to Address Elevation of Privilege (3143142)
								89835, #HIGH, MS16-036: Security Update for Adobe Flash Player (3144756)
								90431, #HIGH, MS16-037: Cumulative Security Update for Internet Explorer (3148531)
								90432, #HIGH, MS16-038: Cumulative Security Update for Microsoft Edge (3148532)
								90433, #HIGH, MS16-039: Security Update for Microsoft Graphics Component (3148522)
								90434, #HIGH, MS16-040: Security Update for Microsoft XML Core Services (3148541)
								90436, #HIGH, MS16-042: Security Update for Microsoft Office (3148775)
								90437, #HIGH, MS16-044: Security Update for Windows OLE (3146706)
								90438, #HIGH, MS16-045: Security Update for Windows Hyper-V (3143118)
								90439, #HIGH, MS16-046: Security Update for Secondary Logon (3148538)
								90440, #MEDIUM, MS16-047: Security Update for SAM and LSAD Remote Protocols (3148527) (Badlock)
								90441, #HIGH, MS16-048: Security Update for CSRSS (3148528)
								90442, #HIGH, MS16-049: Security Update for HTTP.sys (3148795)
								90443, #CRITICAL, MS16-050: Security Update for Adobe Flash Player (3154132)
								90510, #MEDIUM, MS16-047: Security Update for SAM and LSAD Remote Protocols (3148527) (Badlock) (uncredentialed check)
								91001, #HIGH, MS16-051: Cumulative Security Update for Internet Explorer (3155533)
								91002, #HIGH, MS16-052: Cumulative Security Update for Microsoft Edge (3155538)
								91004, #HIGH, MS16-054: Security Update for Microsoft Office (3155544)
								91005, #HIGH, MS16-055: Security Update for Microsoft Graphics Component (3156754)
								91006, #HIGH, MS16-056: Security Update for Windows Journal (3156761)
								91007, #HIGH, MS16-057: Security Update for Windows Shell (3156987)
								91009, #HIGH, MS16-059: Security Update for Windows Media Center (3150220)
								91010, #HIGH, MS16-060: Security Update for Windows Kernel (3154846)
								91011, #HIGH, MS16-061: Security Update for Microsoft RPC (3155520)
								91012, #HIGH, MS16-062: Security Update for Windows Kernel-Mode Drivers (3158222)
								91013, #CRITICAL, MS16-064: Security Update for Adobe Flash Player (3163207)
								91014, #MEDIUM, MS16-065: Security Update for .NET Framework (3156757)
								91015, #LOW, MS16-066: Security Update for Virtual Secure Mode (3155451)
								91596, #HIGH, MS16-063: Cumulative Security Update for Internet Explorer (3163649)
								91600, #HIGH, MS16-072: Security Update for Group Policy (3163622)
								91601, #MEDIUM, MS16-073: Security Update for Windows Kernel-Mode Drivers (3164028)
								91602, #MEDIUM, MS16-074: Security Update for Microsoft Graphics Component (3164036)
								91603, #MEDIUM, MS16-075: Security Update for Windows SMB Server (3164038)
								91609, #LOW, MS16-082: Security Update for Microsoft Windows Search Component (3165270)
								92018, #HIGH, MS16-087: Security Update for Windows Print Spooler (3170005)
								92021, #HIGH, MS16-090: Security Update for Windows Kernel-Mode Drivers (3171481)
								92022, #MEDIUM, MS16-091: Security Update for .NET Framework (3170048)
								92821, #HIGH, MS16-098: Security Update for Windows Kernel-Mode Drivers (3178466)
								92823, #HIGH, MS16-101: Security Update for Windows Authentication Methods (3178465)
								92843, #HIGH, MS16-097: Security Update for Microsoft Graphics Component (3177393)
								91599, #CRITICAL, MS16-071: Security Update for Microsoft Windows DNS Server (3164065)
								93466, #HIGH, MS16-106: Security Update for Microsoft Graphics Component (3185848)
								93470, #MEDIUM, MS16-111: Security Update for Windows Kernel (3186973)
								93473, #HIGH, MS16-114: Security Update for Windows SMBv1 Server (3185879)
								93651, #HIGH, MS16-116: Security Update in OLE Automation for VBScript Scripting Engine (3188724)
								93464, #HIGH, MS16-104: Cumulative Security Update for Internet Explorer (3183038)
								93468, #HIGH, MS16-109: Security Update for Silverlight (3182373)
								92015, #HIGH, MS16-084: Cumulative Security Update for Internet Explorer (3169991)
								92819, #HIGH, MS16-095: Cumulative Security Update for Internet Explorer (3177356)
								91604, #HIGH, MS16-076: Security Update for Netlogon (3167691)
								90435, #HIGH, MS16-041: Security Update for .NET Framework (3148789)
								91607, #HIGH, MS16-080: Security Update for Microsoft Windows PDF (3164302)

								92023, #LOW, MS16-092: Security Update for Windows Kernel (3171910)
								92025, #LOW, MS16-094: Security Update for Secure Boot (3177404)
								92822, #MEDIUM, MS16-100: Security Update for Secure Boot (3179577)
								92824, #HIGH, MS16-102: Security Update for Microsoft Windows PDF Library (3182248)
								
								93469, #HIGH, MS16-110: Security Update for Microsoft Windows (3178467)
								93481, #HIGH, MS16-107: Security Update for Microsoft Office (3185852)
								91605, #CRITICAL, MS16-077: Security Update for WPAD (3165191)
								91672, #CRITICAL, MS16-083: Security Update for Adobe Flash Player (3167685)
								92024, #CRITICAL, MS16-093: Security Update for Adobe Flash Player (3174060)
								93475, #HIGH, MS16-117: Security Update for Adobe Flash Player (3188128)
								93471, #MEDIUM, MS16-112: Security Update for Windows Lock Screen (3178469)
								84762, #HIGH, MS15-068: Vulnerabilities in Windows Hyper-V Could Allow Remote Code Execution (3072000)
								85331, #HIGH, MS15-092: Vulnerabilities in .NET Framework Could Allow Elevation of Privilege (3086251)
								81732, #CRITICAL, MS KB3044132: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								82823, #CRITICAL, MS KB3049508: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								83369, #CRITICAL, MS KB3061904: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								84052, #CRITICAL, MS KB3065820: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								84367, #CRITICAL, MS KB3074219: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								84645, #CRITICAL, MS KB3065823: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								84809, #CRITICAL, MS KB3079777: Update for Vulnerabilities in Adobe Flash Player in Internet Explorer
								94012, #CRITICAL, MS16-123: Security Update for Windows Kernel-Mode Drivers (3192892)
								94017, #CRITICAL, MS16-120: Security Update for Microsoft Graphics Component (3192884)
								94011, #HIGH, MS16-118: Cumulative Security Update for Internet Explorer (3192887)
								94014, #HIGH, MS16-122: Security Update for Microsoft Video Control (3195360)
								94016, #HIGH, MS16-121: Security Update for Microsoft Office (3194063)
								49952, #HIGH, MS10-075: Vulnerability in Media Player Network Sharing Service Could Allow Remote Code Execution (2281679)
								94634, #HIGH, MS16-133: Security Update for Microsoft Office (3199168)
								55883, #CRITICAL, MS11-058: Vulnerabilities in DNS Server Could Allow Remote Code Execution (2562485) (remote check)
								72836, #CRITICAL, MS11-058: Vulnerabilities in DNS Server Could Allow Remote Code Execution (2562485) (uncredentialed check)
								95764, #HIGH, MS16-144: Cumulative Security Update for Internet Explorer (3204059)
								95765, #HIGH, MS16-146: Security Update for Microsoft Graphics Component (3204066)
								95766, #HIGH, MS16-147: Security Update for Microsoft Uniscribe (3204063)
								95768, #HIGH, MS16-151: Security Update for Windows Kernel-Mode Drivers (3205651)
								95811, #HIGH, MS16-148: Security Update for Microsoft Office (3204068)
								95813, #HIGH, MS16-149: Security Update for Microsoft Windows (3205655)
								96393, #HIGH, MS17-004: Security Update for Local Security Authority Subsystem Service (3216771)
								97833, #HIGH, MS17-010: Security Update for Microsoft Windows SMB Server (4013389) (ETERNALBLUE) (ETERNALCHAMPION) (ETERNALROMANCE) (ETERNALSYNERGY) (WannaCry) (EternalRocks) (Petya) (uncredentialed check)
								97737, #HIGH, MS17-010: Security Update for Microsoft Windows SMB Server (4013389) (ETERNALBLUE) (ETERNALCHAMPION) (ETERNALROMANCE) (ETERNALSYNERGY) (WannaCry) (EternalRocks) (Petya)
								97743, #HIGH, MS17-012: Security Update for Microsoft Windows (4013078)
								100051, #HIGH, MS Security Advisory 4022344: Security Update for Microsoft Malware Protection Engine
								100057, #HIGH, Windows 8.1 and Windows Server 2012 R2 May 2017 Security Updates
								94631, #HIGH, MS16-130: Security Update for Microsoft Windows (3199172)
								94633, #HIGH, MS16-132: Security Update for Microsoft Graphics Component (3199120)
								94635, #HIGH, MS16-134: Security Update for Common Log File System Driver (3193706)
								94636, #HIGH, MS16-135: Security Update for Windows Kernel-Mode Drivers (3199135)

								94638, #HIGH, MS16-137: Security Update for Windows Authentication Methods (3199173)
								94639, #LOW, MS16-138: Security Update for Microsoft Virtual Hard Disk Driver (3199647)
								94641, #MEDIUM, MS16-140: Security Update for Boot Manager (3193479)
								94643, #HIGH, MS16-142: Cumulative Security Update for Internet Explorer (3198467)
								97729, #HIGH, MS17-006: Cumulative Security Update for Internet Explorer (4013073)
								97731, #HIGH, MS17-009: Security Update for Microsoft Windows PDF Library (4010319)
								97732, #HIGH, MS17-011: Security Update for Microsoft Uniscribe (4013076)
								97733, #HIGH, MS17-017: Security Update for Windows Kernel (4013081)
								97738, #HIGH, MS17-018: Security Update for Windows Kernel-Mode Drivers (4013083)
								97794, #HIGH, MS17-013: Security Update for Microsoft Graphics Component (4013075)
								99312, #HIGH, Windows 8.1 and Windows Server 2012 R2 April 2017 Security Updates
								97740, #HIGH, MS17-014: Security Update for Microsoft Office (4013241)
								99314, #HIGH, Security Update for Microsoft Office Products (April 2017) (Petya)
								100103, #HIGH, Security Update for Microsoft Office Products (May 2017)
								100058, #HIGH, Windows 7 and Windows Server 2008 R2 May 2017 Security Updates
								97833, #HIGH, MS17-010: Security Update for Microsoft Windows SMB Server (4013389) (ETERNALBLUE) (ETERNALCHAMPION) (ETERNALROMANCE) (ETERNALSYNERGY) (WannaCry) (EternalRocks) (Petya) (uncredentialed check)
								100761, #CRITICAL, Windows 7 and Windows Server 2008 R2 June 2017 Security Updates
								101367, #CRITICAL, Windows 7 and Windows Server 2008 R2 July 2017 Security Updates
								100767, #HIGH, KB4023307: Security Update for the Windows Uniscribe Remote Code Execution Vulnerability for Microsoft Silverlight 5 (June 2017)
								101371, #HIGH, Security Update for Microsoft Office Products (July 2017)
								102267, #HIGH, Windows 7 and Windows Server 2008 R2 August 2017 Security Updates
								94632, #HIGH, MS16-131: Security Update for Microsoft Video Control (3199151)
								102035, #HIGH, Security Updates for Outlook (July 2017)
								99304, #HIGH, Windows 7 and Windows 2008 R2 April 2017 Security Updates (Petya)
								99365, #HIGH, Security and Quality Rollup for .NET Framework (April 2017)
								100551, #HIGH, Microsoft Malware Protection Engine < 1.1.13804 Multiple Vulnerabilities
								102270, #HIGH, Windows 8.1 and Windows Server 2012 R2 August 2017 Security Updates
								97734, #MEDIUM, MS17-020: Security Update for Windows DVD Maker (3208223)
								97736, #LOW, MS17-021: Security Update for Windows DirectShow (4010318)
								97741, #MEDIUM, MS17-016: Security Update for Windows IIS (4013074)
								97742, #MEDIUM, MS17-022: Security Update for Microsoft XML Core Services (4010321)
								55286, #HIGH, MS11-048: Vulnerability in SMB Server Could Allow Denial of Service (2536275) (remote check)
								58435, #HIGH, MS12-020: Vulnerabilities in Remote Desktop Could Allow Remote Code Execution (2671387) (uncredentialed check)
								79638, #CRITICAL, MS14-066: Vulnerability in Schannel Could Allow Remote Code Execution (2992611) (uncredentialed check)
								99286, #HIGH, KB4015217: Windows 10 1607 April 2017 Cumulative Update
								100059, #HIGH, KB4019472: Windows 10 Version 1607 and Windows Server 2016 May 2017 Cumulative Update
								100760, #CRITICAL, KB4022715: Windows 10 Version 1607 and Windows Server 2016 June 2017 Cumulative Update
								101366, #CRITICAL, KB4025339: Windows 10 Version 1607 and Windows Server 2016 July 2017 Cumulative Update
								97730, #HIGH, MS17-007: Cumulative Security Update for Microsoft Edge (4013071)
								94340, #HIGH, MS16-128: Security Update for Adobe Flash Player (3201860)
								94630, #HIGH, MS16-129: Cumulative Security Update for Microsoft Edge (3199057)
								94642, #HIGH, MS16-141: Security Update for Adobe Flash Player (3202790)
								95767, #MEDIUM, MS16-150: Security Update for Secure Kernel Mode (3205642)
								95771, #HIGH, MS16-154: Security Update for Adobe Flash Player (3209498)
								95809, #HIGH, MS16-145: Cumulative Security Update for Microsoft Edge (3204062)
								96392, #HIGH, MS17-003: Security Update for Adobe Flash Player (3214628)
								97325, #HIGH, MS17-005: Security Update for Adobe Flash Player (4010250)
								97735, #HIGH, MS17-023: Security Update for Adobe Flash Player (4014329)
								99290, #CRITICAL, KB4018483: Security update for Adobe Flash Player (April 2017)
								100062, #HIGH, KB4020821: Security update for Adobe Flash Player (May 2017)
								100766, #CRITICAL, KB4022730: Security update for Adobe Flash Player (June 2017)
								101370, #HIGH, KB4025376: Security update for Adobe Flash Player (July 2017)
								102266, #HIGH, KB4034662: Security update for Adobe Flash Player (August 2017)
								102683, #CRITICAL, Microsoft Windows Search Remote Code Execution Vulnerability (CVE-2017-8543)
								100054, #HIGH, Windows Server 2012 May 2017 Security Updates
								100762, #CRITICAL, Windows Server 2012 June 2017 Security Updates
								100764, #CRITICAL, Windows 8.1 and Windows Server 2012 R2 June 2017 Security Updates
								101365, #CRITICAL, Windows 8.1 and Windows Server 2012 R2 July 2017 Security Updates
								101375, #CRITICAL, Windows Server 2012 July 2017 Security Updates
								102264, #HIGH, KB4034658: Windows 10 Version 1607 and Windows Server 2016 August 2017 Cumulative Update
								97745, #HIGH, MS17-008: Security Update for Windows Hyper-V (4013082)
								102268, #HIGH, Windows Server 2012 August 2017 Security Updates
								101027, #HIGH, Microsoft Malware Protection Engine < 1.1.13903 RCE
								95772, #MEDIUM, MS16-155: Security Update for .NET Framework (3205640)
								96390, #MEDIUM, MS17-001: Security Update for Microsoft Edge (3214288)
								79638, #CRITICAL, MS14-066: Vulnerability in Schannel Could Allow Remote Code Execution (2992611) (uncredentialed check)
								35362, #CRITICAL, MS09-001: Microsoft Windows SMB Vulnerabilities Remote Code Execution (958687) (uncredentialed check)
								100763, #CRITICAL, KB4022725: Windows 10 Version 1703 June 2017 Cumulative Update
								103123, #HIGH, Security Updates for Microsoft Skype for Business and Microsoft Lync and Microsoft Live Meeting (September 2017)
								103138, #HIGH, Security Update for Microsoft Office Excel Products (September 2017)
								103131, #HIGH, Windows 8.1 and Windows Server 2012 R2 September 2017 Security Updates
								103127, #HIGH, Windows 7 and Windows Server 2008 R2 September 2017 Security Updates
								103746, #CRITICAL, Windows 7 and Windows Server 2008 R2 October 2017 Security Updates (KRACK)
								103220, #HIGH, KB4038806: Security update for Adobe Flash Player (September 2017)
								103750, #CRITICAL, Windows 8.1 and Windows Server 2012 R2 October 2017 Security Updates (KRACK)
								103924, #MEDIUM, KB4049179: Security update for Adobe Flash Player (October 2017)
								100768, #HIGH, Security Update for Live Meeting 2007 / Lync 2010 and 2013 / Skype for Business 2016 (June 2017)
								100782, #HIGH, Security Update for Microsoft Office Products (June 2017)
								103122, #HIGH, Security Updates for Microsoft Publisher Products (September 2017)
								103133, #HIGH, Security Updates for Microsoft Office Products (September 2017)
								103136, #HIGH, Security Updates for Microsoft Powerpoint Products (September 2017)
								103456, #HIGH, Security Updates for Outlook (September 2017)
								103745, #CRITICAL, KB4041676: Windows 10 Version 1703 October 2017 Cumulative Update (KRACK)
								103752, #MEDIUM, Security Updates for Outlook (October 2017)
								103784, #HIGH, Security Updates for Microsoft Office Products (October 2017)
103876, #MEDIUM, Microsoft Windows SMB Server (2017-10) Multiple Vulnerabilities (uncredentialed check)
103137, #HIGH, Security and Quality Rollup for .NET Framework (Sep 2017)
100464, #HIGH, Microsoft Windows SMBv1 Multiple Vulnerabilities
40887, #CRITICAL, MS09-050: Microsoft Windows SMB2 _Smb2ValidateProviderCallback() Vulnerability (975497) (EDUCATEDSCHOLAR) (uncredentialed check)
100791, #CRITICAL, Microsoft Security Advisory 4025685: Guidance for older platforms (XP / 2003) (EXPLODINGCAN)
104892, #HIGH, Security Updates for Internet Explorer (June 2017)
105552, #HIGH, KB4056897: Windows 7 and Windows Server 2008 R2 January 2018 Security Update (Meltdown)(Spectre)
105546, #HIGH, Security Updates for Internet Explorer (January 2018)
105731, #MEDIUM, Security and Quality Rollup for .NET Framework (January 2018)
104893, #HIGH, Security Updates for Internet Explorer (May 2017)
99523, #CRITICAL, Microsoft Windows Server 2003 IIS 6.0 WebDAV PROPFIND Request Handling RCE (EXPLODINGCAN)
105553, #HIGH, KB4056898: Windows 8.1 and Windows Server 2012 R2 January 2018 Security Update (Meltdown)(Spectre)
106800, #HIGH, KB4074597: Windows 8.1 and Windows Server 2012 R2 February 2018 Security Update
106804, #HIGH, Security Updates for Internet Explorer (February 2018)
108291, #HIGH, KB4088879: Windows 8.1 and Windows Server 2012 R2 March 2018 Security Update (Meltdown)(Spectre)
104554, #HIGH, Windows 8.1 and Windows Server 2012 R2 November 2017 Security Updates
104890, #HIGH, Security Updates for Internet Explorer (August 2017)
104891, #HIGH, Security Updates for Internet Explorer (July 2017)
104894, #HIGH, Security Updates for Internet Explorer (November 2017)
104895, #HIGH, Security Updates for Internet Explorer (October 2017)
104896, #HIGH, Security Updates for Internet Explorer (September 2017)
105185, #HIGH, Windows 8.1 and Windows Server 2012 R2 December 2017 Security Updates
105188, #HIGH, Security Updates for Internet Explorer (December 2017)
105109, #HIGH, Microsoft Malware Protection Engine < 1.1.14405.2 RCE
104553, #HIGH, Windows 7 and Windows Server 2008 R2 November 2017 Security Updates
105184, #HIGH, Windows 7 and Windows Server 2008 R2 December 2017 Security Updates
106802, #HIGH, KB4074587: Windows 7 and Windows Server 2008 R2 February 2018 Security Update
106804, #HIGH, Security Updates for Internet Explorer (February 2018)
108290, #HIGH, KB4088878: Windows 7 and Windows Server 2008 R2 March 2018 Security Update (Meltdown)(Spectre)
108295, #HIGH, Security Updates for Internet Explorer (March 2018)
108757, #HIGH, KB4100480: Windows Kernel Elevation of Privilege Vulnerability
108813, #HIGH, Microsoft Malware Protection Engine < 1.1.14700.5 RCE
108966, #HIGH, KB4093108: Windows 7 and Windows Server 2008 R2 April 2018 Security Update
108971, #HIGH, Security Updates for Internet Explorer (April 2018)
109652, #MEDIUM, Security Updates for Microsoft .NET Framework (May 2018)
109604, #HIGH, KB4103712: Windows 7 and Windows Server 2008 R2 May 2018 Security Update
109613, #HIGH, Security Updates for Internet Explorer (May 2018)
109605, #HIGH, KB4103721: Windows 10 Version 1803 and Windows Server Version 1803 May 2018 Security Update
110487, #HIGH, KB4284835: Windows 10 Version 1803 and Windows Server Version 1803 June 2018 Security Update
108964, #HIGH, KB4093112: Windows 10 Version 1709 and Windows Server Version 1709 April 2018 Security Update (Meltdown)(Spectre)
109608, #HIGH, KB4103727: Windows 10 Version 1709 and Windows Server Version 1709 May 2018 Security Update
108284, #HIGH, KB4088776: Windows 10 Version 1709 and Windows Server Version 1709 March 2018 Security Update
110485, #HIGH, KB4284819: Windows 10 Version 1709 and Windows Server Version 1709 June 2018 Security Update
104551, #HIGH, KB4048955: Windows 10 Version 1709 and Windows Server Version 1709 November 2017 Cumulative Update
105550, #HIGH, KB4056892: Windows 10 Version 1709 and Windows Server Version 1709 January 2018 Security Update (Meltdown)(Spectre)
106795, #HIGH, KB4074588: Windows 10 Version 1709 and Windows Server Version 1709 February 2018 Security Update
104889, #HIGH, Security Updates for Internet Explorer (April 2017)
110490, #HIGH, KB4284874: Windows 10 Version 1703 June 2018 Security Update
110494, #HIGH, Security Updates for Internet Explorer (June 2018)
105183, #HIGH, KB4054517: Windows 10 Version 1709 and Windows Server Version 1709 December 2017 Security Update
103128, #HIGH, KB4038782: Windows 10 Version 1607 and Windows Server 2016 September 2017 Cumulative Update
103134, #HIGH, Security Updates for Microsoft Office Compatibility Pack SP3 (September 2017)
103751, #HIGH, Security Updates for Microsoft Office Compatibility Pack SP3 (October 2017)
103754, #HIGH, Security Update for Microsoft Office Word Viewer (October 2017)
104558, #HIGH, Security Updates for Microsoft Office Compatibility SP3 (November 2017)
104559, #HIGH, Security Updates for Microsoft Office Viewer Products (November 2017)
110990, #HIGH, Security Updates for Microsoft .NET Framework (July 2018) (deprecated)
111689, #HIGH, KB4343899: Windows 7 and Windows Server 2008 R2 August 2018 Security Update (Foreshadow)
104556, #HIGH, Security Updates for Microsoft Excel Products (November 2017)
104562, #HIGH, Security Updates for Microsoft Word Products (November 2017)
52544, #CRITICAL, Microsoft Forefront Endpoint Protection / System Center Endpoint Protection / Anti-malware Client Detection and Status
109684, #CRITICAL, Security Updates for Exchange (May 2018)
111755, #CRITICAL, Security Updates for Exchange (August 2018)
110994, #MEDIUM, Security Updates for Microsoft Word Products (July 2018)
108969, #HIGH, Security Updates for Microsoft Excel Products (April 2018)
108972, #HIGH, Security Updates for Microsoft Office Products (April 2018)
109612, #HIGH, Security Updates for Microsoft Excel Products (May 2018)
109614, #HIGH, Security Updates for Microsoft Office Products (May 2018)
109617, #HIGH, Security Updates for Microsoft Word Products (May 2018)
110495, #HIGH, Security Updates for Microsoft Office Products (June 2018)
110499, #MEDIUM, Security Updates for Outlook (June 2018)
110500, #MEDIUM, Security Updates for Microsoft Publisher Products (June 2018)
104557, #HIGH, Security Updates for Microsoft Office Products (November 2017)
105189, #HIGH, Security Updates for Microsoft Office Products (December 2017)
105192, #HIGH, Security Updates for Microsoft Word Products (December 2017)
105694, #HIGH, Security Updates for Microsoft Excel Products (January 2018)
105699, #HIGH, Security Updates for Outlook (January 2018)
105700, #HIGH, Security Updates for Microsoft Word Products (January 2018)
105728, #HIGH, Security Updates for Microsoft Office Products (January 2018)
106805, #HIGH, Security Updates for Microsoft Office Products (February 2018)
106807, #HIGH, Security Updates for Outlook (February 2018)
108301, #HIGH, Security Updates for Microsoft Word Products (March 2018)
110982, #HIGH, KB4338823: Windows 7 and Windows Server 2008 R2 July 2018 Security Update
110991, #HIGH, Security Updates for Internet Explorer (July 2018)
111694, #HIGH, Security Updates for Microsoft Excel Products (August 2018)
111696, #MEDIUM, Security Updates for Microsoft Office Products (August 2018)
111787, #HIGH, Security Updates for Microsoft Powerpoint Products (August 2018)
111685, #HIGH, KB4343887: Windows 10 Version 1607 and Windows Server 2016 August 2018 Security Update (Foreshadow)
111690, #HIGH, KB4343896: Windows Server 2012 August 2018 Security Update (Foreshadow)
103135, #HIGH, Security Updates for Microsoft Office Viewers (September 2017)
103569, #HIGH, Windows Defender Antimalware/Antivirus Signature Definition Check
103749, #CRITICAL, KB4041691: Windows 10 Version 1607 and Windows Server 2016 October 2017 Cumulative Update (KRACK)
104549, #HIGH, KB4048953: Windows 10 Version 1607 and Windows Server 2016 November 2017 Cumulative Update
111695, #HIGH, Security Updates for Internet Explorer (August 2018)
110486, #HIGH, KB4284867: Windows 7 and Windows Server 2008 R2 June 2018 Security Update
111698, #HIGH, Security Updates for Microsoft Office Viewer Products / Office Compatibility Products (August 2018)
110491, #HIGH, KB4284880: Windows 10 Version 1607 and Windows Server 2016 June 2018 Security Update
110980, #HIGH, KB4338814: Windows 10 Version 1607 and Windows Server 2016 July 2018 Security Update
111008, #HIGH, Security Updates for Microsoft Office Viewer Products / Office Compatibility Products (July 2018)
108967, #HIGH, KB4093119: Windows 10 Version 1607 and Windows Server 2016 April 2018 Security Update
108970, #HIGH, Security Updates for Microsoft Office Viewer Products (April 2018)
108973, #HIGH, Security Updates for Microsoft Office Compatibility Products (April 2018)
109606, #HIGH, KB4103723: Windows 10 Version 1607 and Windows Server 2016 May 2018 Security Update
109615, #HIGH, Security Updates for Microsoft Office Compatibility Products (May 2018)
105695, #HIGH, Security Updates for Microsoft Office Compatibility SP3 (January 2018)
105697, #HIGH, Security Updates for Microsoft Office Viewer Products (January 2018)
106796, #HIGH, KB4074590: Windows 10 Version 1607 and Windows Server 2016 February 2018 Security Update (Meltdown)(Spectre)
106817, #HIGH, Security Updates for Microsoft Word Viewer (February 2018)
108289, #HIGH, KB4088787: Windows 10 Version 1607 and Windows Server 2016 March 2018 Security Update
108292, #HIGH, KB4088880: Windows Server 2012 March 2018 Security Update (Meltdown)(Spectre)
108297, #HIGH, Security Updates for Microsoft Office Compatibility Products (March 2018)
105548, #HIGH, KB4056890: Windows 10 Version 1607 and Windows Server 2016 January 2018 Security Update (Meltdown)(Spectre)
105180, #HIGH, KB4053579: Windows 10 Version 1607 and Windows Server 2016 December 2017 Security Update
100760, #CRITICAL, KB4022715: Windows 10 Version 1607 and Windows Server 2016 June 2017 Cumulative Update
101366, #CRITICAL, KB4025339: Windows 10 Version 1607 and Windows Server 2016 July 2017 Cumulative Update
111685, #HIGH, KB4343887: Windows 10 Version 1607 and Windows Server 2016 August 2018 Security Update (Foreshadow)
103132, #HIGH, Windows Server 2012 September 2017 Security Updates
117421, #MEDIUM, Security Updates for Microsoft Excel Products (September 2018)
117423, #HIGH, Security Updates for Internet Explorer (September 2018)
117418, #CRITICAL, KB4457145: Windows 7 and Windows Server 2008 R2 September 2018 Security Update
117426, #HIGH, Security Updates for Microsoft Word Products (September 2018)
117411, #CRITICAL, KB4457128: Windows 10 Version 1803 and Windows Server Version 1803 September 2018 Security Update
111691, #HIGH, KB4343902: Security update for Adobe Flash Player (August 2018)
110984, #HIGH, KB4338825: Windows 10 Version 1709 and Windows Server Version 1709 July 2018 Security Update
111687, #HIGH, KB4343897: Windows 10 Version 1709 And Windows Server Version 1709 August 2018 Security Update (Foreshadow)
117417, #CRITICAL, KB4457142: Windows 10 Version 1709 and Windows Server Version 1709 September 2018 Security Update
111688, #HIGH, KB4343888: Windows 8.1 and Windows Server 2012 R2 August 2018 Security Update (Foreshadow)
117412, #CRITICAL, KB4457143: Windows 8.1 and Windows Server 2012 R2 September 2018 Security Update
103748, #CRITICAL, Windows Server 2012 October 2017 Security Updates (KRACK)
104555, #HIGH, Windows Server 2012 November 2017 Security Updates
105186, #HIGH, Windows Server 2012 December 2017 Security Updates
105554, #HIGH, KB4056899: Windows Server 2012 January 2018 Security Update
106799, #HIGH, KB4074589: Windows Server 2012 February 2018 Security Update
108968, #HIGH, KB4093122: Windows Server 2012 April 2018 Security Update
109610, #HIGH, KB4103726: Windows Server 2012 May 2018 Security Update
110488, #HIGH, KB4284846: Windows Server 2012 June 2018 Security Update
110987, #HIGH, KB4338820: Windows Server 2012 July 2018 Security Update
117424, #MEDIUM, Security Updates for Microsoft Office Compatibility Products (September 2018)
117415, #CRITICAL, KB4457140: Windows Server 2012 September 2018 Security Update
117422, #MEDIUM, Security Updates for Microsoft Office Viewer Products (September 2018)
118001, #HIGH, KB4462915: Windows 7 and Windows Server 2008 R2 October 2018 Security Update
118007, #HIGH, Security Updates for Microsoft Excel Products (October 2018)
118009, #HIGH, Security Updates for Internet Explorer (October 2018)
118010, #HIGH, Security Updates for Microsoft Office Products (October 2018)
118014, #HIGH, Security Updates for Outlook (October 2018)
118015, #HIGH, Security Updates for Microsoft PowerPoint Products (October 2018)
118016, #HIGH, Security Updates for Microsoft Word Products (October 2018)
108962, #HIGH, KB4093110: Security update for Adobe Flash Player (April 2018)
101374, #CRITICAL, Windows 2008 July 2017 Multiple Security Updates
109609, #CRITICAL, KB4103729: Security update for Adobe Flash Player (May 2018)
110414, #CRITICAL, KB4287903: Security update for Adobe Flash Player (June 2018)
110988, #MEDIUM, KB4338832: Security update for Adobe Flash Player (July 2018)
111700, #HIGH, Security Updates for Windows Server 2008 (August 2018) (Foreshadow)
117998, #HIGH, KB4462918: Windows 10 Version 1709 and Windows Server Version 1709 October 2018 Security Update
119589, #CRITICAL, KB4471329: Windows 10 Version 1709 and Windows Server Version 1709 December 2018 Security Update
119771, #HIGH, KB4483232: Windows 10 Version 1709 and Windows Server Version 1709 December 2018 OOB Security Update
118915, #HIGH, KB4467686: Windows 10 Version 1709 and Windows Server Version 1709 November 2018 Security Update
119612, #CRITICAL, Security Updates for Microsoft .NET Framework (December 2018)
121020, #HIGH, KB4480978: Windows 10 Version 1709 and Windows Server Version 1709 January 2019 Security Update
121024, #HIGH, Security Updates for Microsoft Office Products (January 2019)
121028, #HIGH, Security Updates for Microsoft Word Products (January 2019)
117431, #CRITICAL, Security Updates for Microsoft .NET Framework (September 2018)
121021, #MEDIUM, Security Updates for Microsoft .NET Framework (January 2019)
121027, #MEDIUM, Security Updates for Outlook (January 2019)
121035, #LOW, Security Updates for Windows 10 / Windows Server 2016 (January 2019) (Spectre)
119609, #HIGH, Security Updates for Microsoft Office Viewer Products (December 2018)
119582, #CRITICAL, KB4471328: Windows 7 and Windows Server 2008 R2 December 2018 Security Update
122234, #HIGH, Security Updates for Microsoft .NET Framework (February 2019)
118913, #CRITICAL, KB4467106: Windows 7 and Windows Server 2008 R2 November 2018 Security Update
121017, #HIGH, KB4480960: Windows 7 and Windows Server 2008 R2 January 2019 Security Update
122118, #HIGH, KB4486564: Windows 7 and Windows Server 2008 R2 February 2019 Security Update
122782, #HIGH, KB4489885: Windows 7 and Windows Server 2008 R2 March 2019 Security Update
118922, #HIGH, Security Updates for Internet Explorer (November 2018)
119594, #HIGH, Security Updates for Internet Explorer (December 2018)
119774, #HIGH, Security Updates for Internet Explorer (December 2018 OOB)
121023, #HIGH, Security Updates for Internet Explorer (January 2019)
122131, #HIGH, Security Updates for Internet Explorer (February 2019)
122789, #HIGH, Security Updates for Internet Explorer (March 2019)
122317, #MEDIUM, Security Updates for Microsoft Office Viewers And Compatibility Products (February 2019)
111692, #HIGH, KB4343909: Windows 10 Version 1803 and Windows Server Version 1803 August 2018 Security Update (Foreshadow)
119463, #CRITICAL, KB4471331: Security update for Adobe Flash Player (December 2018)
119587, #CRITICAL, KB4471319: Windows Server 2008 December 2018 Security Update
119772, #HIGH, KB4483234: Windows 10 Version 1803 and Windows Server Version 1803 December 2018 OOB Security Update
119095, #CRITICAL, KB4477029: Security update for Adobe Flash Player (November 2018)
100785, #CRITICAL, Microsoft Security Advisory 4025685: Windows Vista (June 2017)
118920, #CRITICAL, KB4467700: Windows Server 2008 November 2018 Security Update
118921, #HIGH, Security Updates for Microsoft Excel Products (November 2018)
118923, #HIGH, Security Updates for Microsoft Office Products (November 2018)
118928, #HIGH, Security Updates for Outlook (November 2018)
118930, #HIGH, Security Updates for Microsoft Word Products (November 2018)
119592, #HIGH, Security Updates for Microsoft Excel Products (December 2018)
119595, #HIGH, Security Updates for Microsoft Office Products (December 2018)
119598, #HIGH, Security Updates for Outlook (December 2018)
119599, #HIGH, Security Updates for Microsoft PowerPoint Products (December 2018)
121015, #HIGH, KB4480966: Windows 10 Version 1803 and Windows Server Version 1803 January 2019 Security Update
121016, #HIGH, KB4480957: Windows Server 2008 January 2019 Security Update
122121, #HIGH, KB4487017: Windows 10 Version 1803 and Windows Server Version 1803 February 2019 Security Update
122123, #HIGH, KB4487019: Windows Server 2008 February 2019 Security Update
122132, #HIGH, Security Updates for Microsoft Office Products (February 2019)
122779, #HIGH, KB4489868: Windows 10 Version 1803 and Windows Server Version 1803 March 2019 Security Update
122783, #HIGH, KB4489876: Windows Server 2008 March 2019 Security Update
104045, #HIGH, KB4020535: Security Update for the Scripting Engine Memory Corruption Vulnerability (May 2017)
110989, #HIGH, Security Updates for Microsoft Access Products (July 2018)
117458, #HIGH, Security Updates for Microsoft Office Products (September 2018)
118005, #HIGH, KB4463104: Windows Server 2008 October 2018 Security Update
122974, #MEDIUM, Security Updates for Windows 10 / Windows Server 2019 (February 2019) (Spectre) (Meltdown) (Foreshadow)
122975, #MEDIUM, Security Updates for Windows 10 / Windows Server 2016 / Windows Server 2019 (March 2019) (Spectre) (Meltdown) (Foreshadow)
119583, #CRITICAL, KB4471322: Windows 8.1 and Windows Server 2012 R2 December 2018 Security Update
110484, #HIGH, KB4284878: Windows 8.1 and Windows Server 2012 R2 June 2018 Security Update
110981, #HIGH, KB4338824: Windows 8.1 and Windows Server 2012 R2 July 2018 Security Update
118002, #HIGH, KB4462941: Windows 8.1 and Windows Server 2012 R2 October 2018 Security Update
118918, #CRITICAL, KB4467703: Windows 8.1 and Windows Server 2012 R2 November 2018 Security Update
121014, #HIGH, KB4480964: Windows 8.1 and Windows Server 2012 R2 January 2019 Security Update
122120, #HIGH, KB4487028: Windows 8.1 and Windows Server 2012 R2 February 2019 Security Update
122784, #HIGH, KB4489883: Windows 8.1 and Windows Server 2012 R2 March 2019 Security Update
123942, #HIGH, KB4493464: Windows 10 Version 1803 and Windows Server Version 1803 April 2019 Security Update
123945, #HIGH, KB4493448: Windows 7 and Windows Server 2008 R2 April 2019 Security Update
123949, #HIGH, Security Updates for Microsoft Excel Products (April 2019)
123952, #HIGH, Security Updates for Microsoft Office Products (April 2019)
118012, #HIGH, Security Updates for Microsoft Office Viewer Products / Office Compatibility Products (October 2018)
121025, #HIGH, Security Updates for Microsoft Office Viewer Products (January 2019)
123940, #HIGH, KB4493467: Windows 8.1 and Windows Server 2012 R2 April 2019 Security Update
123950, #CRITICAL, KB4493478: Security update for Adobe Flash Player (April 2019)
123951, #HIGH, Security Updates for Internet Explorer (April 2019)
125313, #CRITICAL, Microsoft RDP RCE (CVE-2019-0708) (BlueKeep) (uncredentialed check)
119586, #CRITICAL, KB4471324: Windows 10 Version 1803 and Windows Server Version 1803 December 2018 Security Update
122819, #CRITICAL, KB4467702: Windows 10 Version 1803 and Windows Server Version 1803 November 2018 Security Update
124117, #CRITICAL, Microsoft Windows Version 1709 Unsupported Version Detection (deprecated)
125073, #CRITICAL, Microsoft Security Advisory 4500331: Guidance for older platforms (XP / 2003) (BlueKeep)
125822, #HIGH, KB4503286: Windows 10 Version 1803 June 2019 Security Update
125064, #HIGH, KB4499167: Windows 10 Version 1803 and Windows Server Version 1803 May 2019 Security Update (MDSUM/RIDL) (MFBDS/RIDL/ZombieLoad) (MLPDS/RIDL) (MSBDS/Fallout)
125820, #HIGH, KB4503284: Windows 10 Version 1709 June 2019 Security Update
117999, #HIGH, KB4462919: Windows 10 Version 1803 and Windows Server Version 1803 October 2018 Security Update
125818, #HIGH, KB4503290: Windows 8.1 and Windows Server 2012 R2 June 2019 Security Update
110983, #HIGH, KB4338819: Windows 10 Version 1803 and Windows Server Version 1803 July 2018 Security Update
122119, #HIGH, KB4486996: Windows 10 Version 1709 and Windows Server Version 1709 February 2019 Security Update
122786, #HIGH, KB4489886: Windows 10 Version 1709 and Windows Server Version 1709 March 2019 Security Update
123939, #HIGH, KB4493441: Windows 10 Version 1709 and Windows Server Version 1709 April 2019 Security Update
125828, #HIGH, Security Updates for Internet Explorer (June 2019)
125066, #HIGH, KB4499179: Windows 10 Version 1709 and Windows Server Version 1709 May 2019 Security Update (MDSUM/RIDL) (MFBDS/RIDL/ZombieLoad) (MLPDS/RIDL) (MSBDS/Fallout)
125069, #HIGH, Security Updates for Internet Explorer (May 2019)
125824, #HIGH, KB4503269: Windows 7 and Windows Server 2008 R2 June 2019 Security Update
125061, #HIGH, KB4499165: Windows 8.1 and Windows Server 2012 R2 May 2019 Security Update (MDSUM/RIDL) (MFBDS/RIDL/ZombieLoad) (MLPDS/RIDL) (MSBDS/Fallout)
109607, #HIGH, KB4103715: Windows 8.1 and Windows Server 2012 R2 May 2018 Security Update
125063, #CRITICAL, KB4499175: Windows 7 and Windows Server 2008 R2 May 2019 Security Update (MDSUM/RIDL) (MFBDS/RIDL/ZombieLoad) (MLPDS/RIDL) (MSBDS/Fallout) (BlueKeep)
125817, #HIGH, KB4503287: Windows Server 2008 June 2019 Security Update
125816, #HIGH, KB4503267: Windows 10 Version 1607 and Windows Server 2016 June 2019 Security Update
125058, #HIGH, KB4494440: Windows 10 Version 1607 and Windows Server 2016 May 2019 Security Update (MDSUM/RIDL) (MFBDS/RIDL/ZombieLoad) (MLPDS/RIDL) (MSBDS/Fallout)
112116, #MEDIUM, Security Updates for Windows 10 / Windows Server 2016 (August 2018) (Spectre) (Meltdown) (Foreshadow)
127843, #CRITICAL, KB4512489: Windows 8.1 and Windows Server 2012 R2 August 2019 Security Update
127846, #CRITICAL, KB4512486: Windows 7 and Windows Server 2008 R2 August 2019 Security Update
127850, #CRITICAL, KB4512517: Windows 10 Version 1607 and Windows Server 2016 August 2019 Security Update
126600, #MEDIUM, Security Updates for Microsoft .NET Framework (July 2019)
126570, #HIGH, KB4507457: Windows 8.1 and Windows Server 2012 R2 July 2019 Security Update (SWAPGS)
126571, #HIGH, KB4507456: Windows 7 and Windows Server 2008 R2 July 2019 Security Update (SWAPGS)
126582, #HIGH, Security Updates for Internet Explorer (July 2019)
108965, #HIGH, KB4093115: Windows 8.1 and Windows Server 2012 R2 April 2018 Security Update
122785, #HIGH, KB4489882: Windows 10 Version 1607 and Windows Server 2016 March 2019 Security Update
123943, #HIGH, KB4493470: Windows 10 Version 1607 and Windows Server 2016 April 2019 Security Update
126577, #HIGH, KB4507460: Windows 10 Version 1607 and Windows Server 2016 July 2019 Security Update (SWAPGS)
125074, #MEDIUM, Security Updates for Microsoft .NET Framework (May 2019)
86818, #MEDIUM, MS KB3108638: Update for Windows Hyper-V to Address CPU Weakness
86830, #MEDIUM, MS15-120: Security Update for IPSec to Address Denial of Service (3102939)
88652, #MEDIUM, MS16-020: Security Update for Active Directory Federation Services to Address Denial of Service (3134222)
91016, #LOW, MS16-067: Security Update for Volume Manager Driver (3155784)
91045, #MEDIUM, MS KB3155527: Update to Cipher Suites for FalseStart
93474, #MEDIUM, MS16-115: Security Update for Microsoft Windows PDF Library (3188733)
63643, #MEDIUM, MS13-006: Vulnerability in Microsoft Windows Could Allow Security Feature Bypass (2785220) (uncredentialed check)
99289, #MEDIUM, KB4017094: Security Update for the libjpeg Information Disclosure Vulnerability for Microsoft Silverlight 5 (April 2017)
127852, #HIGH, Security Updates for Internet Explorer (August 2019)
111693, #MEDIUM, Security Updates for Microsoft .NET Framework (August 2018)
80495, #LOW, MS15-006: Vulnerability in Windows Error Reporting Could Allow Security Feature Bypass (3004365)
82778, #LOW, MS15-042: Vulnerability in Windows Hyper-V Could Allow Denial of Service (3047234)
85848, #LOW, MS15-105: Vulnerability in Windows Hyper-V Could Allow Security Feature Bypass (3091287)
94013, #MEDIUM, MS16-124: Security Update for Windows Registry (3193227)
95770, #LOW, MS16-153: Security Update for Common Log File System Driver (3207328)
128647, #HIGH, Security Updates for Internet Explorer (September 2019)
127910, #MEDIUM, Microsoft Defender Elevation of Privilege Vulnerability (CVE-2019-1161)
128637, #HIGH, KB4516044: Windows 10 Version 1607 and Windows Server 2016 September 2019 Security Update
128640, #HIGH, KB4516033: Windows 7 and Windows Server 2008 R2 September 2019 Security Update
130909, #HIGH, KB4525250: Windows 8.1 and Windows Server 2012 R2 November 2019 Security Update
130912, #HIGH, Security Updates for Internet Explorer (November 2019)
130906, #HIGH, KB4525236: Windows 10 Version 1607 and Windows Server 2016 November 2019 Security Update
132862, #CRITICAL, KB4534293: Windows 10 Version 1803 January 2020 Security Update
132863, #CRITICAL, KB4534309: Windows 8.1 and Windows Server 2012 R2 January 2020 Security Update
127845, #CRITICAL, KB4512501: Windows 10 Version 1803 August 2019 Security Update
129166, #HIGH, Security Update for Internet Explorer (CVE-2019-1367)
129718, #HIGH, KB4520003: Windows 7 and Windows Server 2008 R2 October 2019 Security Update
129728, #HIGH, Security Updates for Internet Explorer (October 2019)
130905, #HIGH, KB4525233: Windows 7 and Windows Server 2008 R2 November 2019 Security Update
131934, #HIGH, KB4530692: Windows 7 and Windows Server 2008 R2 December 2019 Security Update
131936, #HIGH, Security Updates for Internet Explorer (December 2019)
132868, #HIGH, Security Updates for Internet Explorer (January 2020)
126569, #HIGH, KB4507435: Windows 10 Version 1803 July 2019 Security Update (SWAPGS)
128639, #HIGH, KB4516058: Windows 10 Version 1803 September 2019 Security Update
133619, #HIGH, Security Updates for Internet Explorer (February 2020)
130907, #HIGH, KB4525237: Windows 10 Version 1803 November 2019 Security Update
131930, #HIGH, KB4530730: Windows 8.1 and Windows Server 2012 R2 December 2019 Security Update
131933, #HIGH, KB4530717: Windows 10 Version 1803 December 2019 Security Update
133610, #HIGH, KB4537762: Windows 10 Version 1803 February 2020 Security Update
133615, #HIGH, KB4537803: Windows 8.1 and Windows Server 2012 R2 February 2020 Security Update
132866, #CRITICAL, KB4534314: Windows 7 and Windows Server 2008 R2 January 2020 Security Update
132999, #CRITICAL, Security Updates for Microsoft .NET Framework (January 2020)
129724, #HIGH, KB4520008: Windows 10 Version 1803 October 2019 Security Update
117413, #CRITICAL, KB4457131: Windows 10 Version 1607 and Windows Server 2016 September 2018 Security Update
118916, #CRITICAL, KB4467691: Windows 10 Version 1607 and Windows Server 2016 November 2018 Security Update
119584, #CRITICAL, KB4471321: Windows 10 Version 1607 and Windows Server 2016 December 2018 Security Update
132858, #CRITICAL, KB4534271: Windows 10 Version 1607 and Windows Server 2016 January 2020 Security Update
134369, #CRITICAL, KB4540670: Windows 10 Version 1607 and Windows Server 2016 March 2020 Security Update
122615, #CRITICAL, Microsoft Windows 7 / Server 2008 R2 Unsupported Version Detection (deprecated)
125060, #CRITICAL, KB4499180: Windows Server 2008 and Windows Vista SP2 May 2019 Security Update (BlueKeep)
132864, #CRITICAL, KB4534312: Windows Server 2008 January 2020 Security Update
117997, #HIGH, KB4462917: Windows 10 Version 1607 and Windows Server 2016 October 2018 Security Update
119769, #HIGH, KB4483229: Windows 10 Version 1607 and Windows Server 2016 December 2018 OOB Security Update
121012, #HIGH, KB4480961: Windows 10 Version 1607 and Windows Server 2016 January 2019 Security Update
122126, #HIGH, KB4487026: Windows 10 Version 1607 and Windows Server 2016 February 2019 Security Update
129719, #HIGH, KB4519998: Windows 10 Version 1607 and Windows Server 2016 October 2019 Security Update
131927, #HIGH, KB4530689: Windows 10 Version 1607 and Windows Server 2016 December 2019 Security Update
133611, #HIGH, KB4537764: Windows 10 Version 1607 and Windows Server 2016 February 2020 Security Update
123944, #HIGH, KB4493458: Windows Server 2008 April 2019 Security Update
126573, #HIGH, KB4507461: Windows Server 2008 July 2019 Security Update (SWAPGS)
127842, #HIGH, KB4512491: Windows Server 2008 August 2019 Security Update
128636, #HIGH, KB4516051: Windows Server 2008 September 2019 Security Update
129720, #HIGH, KB4520009: Windows Server 2008 October 2019 Security Update
130904, #HIGH, KB4525239: Windows Server 2008 November 2019 Security Update
131929, #HIGH, KB4530719: Windows Server 2008 December 2019 Security Update
137265, #CRITICAL, KB4561600: Security update for Adobe Flash Player (June 2020)
128646, #CRITICAL, KB4516115: Security update for Adobe Flash Player (September 2019)
134372, #CRITICAL, KB4540689: Windows 10 Version 1803 March 2020 Security Update
139498, #HIGH, Security Updates for Internet Explorer (August 2020)
138467, #HIGH, Security Updates for Internet Explorer (July 2020)
136512, #HIGH, Security Updates for Internet Explorer (May 2020)
137266, #HIGH, Security Updates for Internet Explorer (June 2020)
134864, #HIGH, KB4537813: Windows 7 and Windows Server 2008 R2 February 2020 Security Update
134865, #HIGH, KB4541500: Windows 7 and Windows Server 2008 R2 March 2020 Security Update
135472, #HIGH, KB4550965: Windows 7 and Windows Server 2008 R2 April 2020 Security Update
136507, #HIGH, KB4556843: Windows 7 and Windows Server 2008 R2 May 2020 Security Update
137260, #HIGH, KB4561669: Windows 7 and Windows Server 2008 R2 June 2020 Security Update
138460, #HIGH, KB4565539: Windows 7 and Windows Server 2008 R2 July 2020 Security Update
135466, #HIGH, KB4550922: Windows 10 Version 1803 April 2020 Security Update
136503, #HIGH, KB4556807: Windows 10 Version 1803 May 2020 Security Update
137259, #HIGH, KB4561621: Windows 10 Version 1803 June 2020 Security Update
138455, #HIGH, KB4565489: Windows 10 Version 1803 July 2020 Security Update
138463, #HIGH, KB4565540: Windows 8.1 and Windows Server 2012 R2 July 2020 Security Update
136509, #HIGH, KB4556853: Windows 8.1 and Windows Server 2012 R2 May 2020 Security Update
137255, #HIGH, KB4561602: Windows 10 Version 1709 June 2020 Security Update
137262, #HIGH, KB4561673: Windows 8.1 and Windows Server 2012 R2 June 2020 Security Update
138457, #HIGH, KB4565508: Windows 10 Version 1709 July 2020 Security Update
134863, #HIGH, KB4537822: Windows Server 2008 February 2020 Security Update
134866, #HIGH, KB4541504: Windows Server 2008 March 2020 Security Update
135470, #HIGH, KB4550957: Windows Server 2008 April 2020 Security Update
136510, #HIGH, KB4556854: Windows Server 2008 May 2020 Security Update
137263, #HIGH, KB4561645: Windows Server 2008 June 2020 Security Update
128642, #HIGH, KB4516064: Windows 8.1 and Windows Server 2012 R2 September 2019 Security Update
129722, #HIGH, KB4519990: Windows 8.1 and Windows Server 2012 R2 October 2019 Security Update
134374, #HIGH, KB4541505: Windows 8.1 and Windows Server 2012 R2 March 2020 Security Update
134377, #HIGH, Security Updates for Internet Explorer (March 2020)
135471, #HIGH, KB4550970: Windows 8.1 and Windows Server 2012 R2 April 2020 Security Update
138461, #HIGH, KB4565529: Windows Server 2008 July 2020 Security Update
133618, #HIGH, KB4537759: Security update for Adobe Flash Player (February 2020)
135475, #HIGH, Security Updates for Internet Explorer (April 2020)
139491, #HIGH, KB4571719: Windows 7 and Windows Server 2008 R2 August 2020 Security Update
140422, #HIGH, KB4577053: Windows 7 and Windows Server 2008 R2 September 2020 Security Update
134942, #CRITICAL, Microsoft Windows Type 1 Font Parsing Remote Code Execution Vulnerability (ADV200006)
138600, #CRITICAL, Windows DNS Server RCE (CVE-2020-1350)
134204, #MEDIUM, MS15-124: Cumulative Security Update for Internet Explorer (CVE-2015-6161) (3125869)
134368, #CRITICAL, KB4538461: Windows 10 Version 1809 and Windows Server 2019 March 2020 Security Update
132859, #CRITICAL, KB4534273: Windows 10 Version 1809 and Windows Server 2019 January 2020 Security Update
137256, #HIGH, KB4561608: Windows 10 Version 1809 and Windows Server 2019 June 2020 Security Update
138453, #HIGH, KB4558998: Windows 10 Version 1809 and Windows Server 2019 July 2020 Security Update
139484, #HIGH, KB4565349: Windows 10 Version 1809 and Windows Server 2019 August 2020 Security Update
140414, #HIGH, KB4570333: Windows 10 Version 1809 and Windows Server 2019 September 2020 Security Update
135463, #HIGH, KB4549949: Windows 10 Version 1809 and Windows Server 2019 April 2020 Security Update
136501, #HIGH, KB4551853: Windows 10 Version 1809 and Windows Server 2019 May 2020 Security Update
133608, #HIGH, KB4532691: Windows 10 Version 1809 and Windows Server 2019 February 2020 Security Update
129717, #HIGH, KB4519338: Windows 10 Version 1809 and Windows Server 2019 October 2019 Security Update
130901, #HIGH, KB4523205: Windows 10 Version 1809 and Windows Server 2019 November 2019 Security Update
131932, #HIGH, KB4530715: Windows 10 Version 1809 and Windows Server 2019 December 2019 Security Update
142690, #CRITICAL, KB4586830: Windows 10 Version 1607 and Windows Server 2016 November 2020 Security Update
142683, #CRITICAL, KB4586805: Windows 7 and Windows Server 2008 R2 November 2020 Security Update
142680, #CRITICAL, KB4586786: Windows 10 Version 1903 and Windows 10 Version 1909 November 2020 Security Update
141431, #HIGH, KB4580387: Windows 7 and Windows Server 2008 R2 October 2020 Security Update
141427, #HIGH, KB4577671: Windows 10 Version 1903 and Windows 10 Version 1909 October 2020 Security Update
141493, #HIGH, KB4580325: Security update for Adobe Flash Player (October 2020)
142691, #HIGH, Security Updates for Internet Explorer (November 2020)
147231, #CRITICAL, KB5000851: Windows 7 and Windows Server 2008 R2 March 2021 Security Update
148465, #MEDIUM, KB5001347: Windows 10 version 1607 / Windows Server 2016 Security Update (Apr 2021)
148466, #MEDIUM, KB5001335: Windows 7 and Windows Server 2008 R2 Security Update (Apr 2021)
147222, #CRITICAL, KB5000803: Windows Security Update (March 2021)
148482, #CRITICAL, KB5001633: Windows Server 2016 OOB Update (Mar 2021) (deprecated)
147229, #CRITICAL, KB5000853: Windows 8.1 and Windows Server 2012 R2 March 2021 Security Update
148477, #MEDIUM, KB5001382: Windows 8.1 and Windows Server 2012 R2 Security Update (Apr 2021)
143572, #HIGH, KB4592503: Windows 7 and Windows Server 2008 R2 December 2020 Security Update
144877, #HIGH, KB4598289: Windows 7 and Windows Server 2008 R2 January 2021 Security Update
146342, #HIGH, KB4601363: Windows 7 and Windows Server 2008 R2 February 2021 Security Update
146329, #HIGH, KB4601318: Windows 10 Version 1607 and Windows Server 2016 February 2021 Security Update
144882, #HIGH, KB4598243: Windows 10 Version 1607 and Windows Server 2016 January 2021 Security Update
148693, #MEDIUM, Microsoft Edge (Chromium) < 90.0.818.39 Multiple Vulnerabilities
150370, #HIGH, KB5003637: Windows 10 version 2004 / Windows 10 version 20H2 / Windows 10 version 21H1 Security Update (June 2021)
150369, #HIGH, KB5003635: Windows 10 version 1909 Security Update (June 2021)
142686, #CRITICAL, KB4586823: Windows 8.1 and Windows Server 2012 R2 November 2020 Security Update
150354, #HIGH, KB5003681: Windows 8.1 and Windows Server 2012 R2 Security Update (June 2021)
150368, #HIGH, KB5003694: Windows 7 and Windows Server 2008 R2 Security Update (June 2021)
139489, #HIGH, KB4571723: Windows 8.1 and Windows Server 2012 R2 August 2020 Security Update
140424, #HIGH, KB4577071: Windows 8.1 and Windows Server 2012 R2 September 2020 Security Update
141416, #HIGH, KB4580358: Windows 8.1 and Windows Server 2012 R2 October 2020 Security Update
143560, #HIGH, KB4592495: Windows 8.1 and Windows Server 2012 R2 December 2020 Security Update
144888, #HIGH, KB4598275: Windows 8.1 and Windows Server 2012 R2 January 2021 Security Update
146341, #HIGH, KB4601349: Windows 8.1 and Windows Server 2012 R2 February 2021 Security Update
148461, #HIGH, KB5001337: Windows 10 version 1909 / Windows Server 1909 Security Update (Apr 2021)
149392, #HIGH, KB5003233: Windows 7 and Windows Server 2008 R2 Security Update (May 2021)
150721, #MEDIUM, Microsoft Edge (Chromium) < 91.0.864.48 Multiple Vulnerabilities
149386, #HIGH, Security Updates for Internet Explorer (May 2021)
149383, #HIGH, KB5003169: Windows 10 version 1909 Security Update (May 2021)
146326, #HIGH, KB4601315: Windows 10 Version 1909 February 2021 Security Update
147220, #HIGH, KB5000808: Windows 10 Version 1909 March 2021 Security Update
149398, #HIGH, KB5003173: Windows 10 version 2004 / Windows 10 version 20H2 Security Update (May 2021)
136946, #MEDIUM, Windows 10 / Windows Server 2016 September 2017 Information Disclosure Vulnerability (CVE-2017-8529)
151474, #HIGH, KB5004948: Windows 10 1607 and Windows Server 2016 OOB Security Update RCE (July 2021)
151592, #HIGH, KB5004238: Windows 10 Version 1607 / Windows Server 2016 Security Update (July 2021)
152434, #HIGH, KB5005043: Windows 10 Version 1607 and Windows Server 2016 Security Update (August 2021)
150367, #HIGH, KB5003638: Windows 10 version 1607 / Windows Server 2016 Security Update (June 2021)
149394, #HIGH, KB5003209: Windows 8.1 and Windows Server 2012 R2 Security Update (May 2021)
151477, #HIGH, KB5004958: Windows Server 2012 R2 OOB Security Update RCE (July 2021)
151598, #HIGH, KB5004298: Windows 8.1 and Windows Server 2012 R2 Security Update (July 2021)
152433, #HIGH, KB5005106: Windows 8.1 and Windows Server 2012 R2 Security Update (August 2021)
151597, #HIGH, Security Updates for Internet Explorer (July 2021)
152587, #MEDIUM, Security Updates for Internet Explorer (June 2021)
151476, #HIGH, KB5004951: Windows 7 and Windows Server 2008 R2 OOB Security Update RCE (July 2021)
151611, #HIGH, KB5004307: Windows 7 and Windows Server 2008 R2 Security Update (July 2021)
152436, #HIGH, KB5005089: Windows 7 and Windows Server 2008 R2 Security Update (August 2021)
153379, #HIGH, KB5005615: Windows 7 and Windows Server 2008 R2 September 2021 Security Update
154035, #HIGH, KB5006728: Windows 7 and Windows Server 2008 R2 Security Update (October 2021)
144952, #CRITICAL, Microsoft Windows 10 Version 1903 Unsupported Version Detection (deprecated)
154956, #CRITICAL, Microsoft Windows Server Version 1809 Unsupported Version Detection
154986, #HIGH, KB5007186:  Windows 10 Version 2004 / Windows 10 Version 20H2 / Windows 10 Version 21H1 (November 2021) 
154993, #HIGH, KB5007206: Windows 10 Version 1809 and Windows Server 2019 Security Update (November 2021)
154990, #HIGH, KB5007192: Windows 10 Version 1607 and Windows Server 2016 Security Update (November 2021)
154996, #HIGH, KB5007255: Windows 8.1 and Windows Server 2012 R2 Security Update (November 2021)
152435, #HIGH, KB5005030: Windows 10 Version 1809 and Windows Server 2019 Security Update (August 2021)
153373, #HIGH, KB5005568: Windows 10 Version 1809 and Windows Server 2019 September 2021 Security Update
154026, #HIGH, KB5006672: Windows 10 Version 1809 and Windows Server 2019 Security Update (October 2021)
151588, #HIGH, KB5004244: Windows 10 version 1809 / Windows Server 2019 Security Update (July 2021)
137258, #HIGH, KB4561616: Windows 10 Version 1607 and Windows Server 2016 June 2020 Security Update
138458, #HIGH, KB4565511: Windows 10 Version 1607 and Windows Server 2016 July 2020 Security Update
139488, #HIGH, KB4571694: Windows 10 Version 1607 and Windows Server 2016 August 2020 Security Update
140417, #HIGH, KB4577015: Windows 10 Version 1607 and Windows Server 2016 September 2020 Security Update
141434, #HIGH, KB4580346: Windows 10 Version 1607 and Windows Server 2016 October 2020 Security Update
143569, #HIGH, KB4593226: Windows 10 Version 1607 and Windows Server 2016 December 2020 Security Update
149390, #HIGH, KB5003197: Windows 10 1607 / Windows Server 2016 Security Update (May 2021)
153377, #HIGH, KB5005573: Windows 10 Version 1607 and Windows Server 2016 September 2021 Security Update
154034, #HIGH, KB5006669: Windows 10 Version 1607 and Windows Server 2016 Security Update (October 2021)
154040, #HIGH, KB5006729: Windows 8.1 and Windows Server 2012 R2 Security Update (October 2021)
151473, #HIGH, KB5004947: Windows 10 1809 and Windows Server 2019 OOB Security Update RCE (July 2021)
154984, #HIGH, KB5007233: Windows 7 and Windows Server 2008 R2 Security Update (November 2021)
140428, #MEDIUM, Security Updates for Internet Explorer (September 2020)

151488, #HIGH, Windows PrintNightmare Registry Exposure CVE-2021-34527 OOB Security Update RCE (July 2021)
156063, #HIGH, KB5008207: Windows 10 Version 1607 and Windows Server 2016 Security Update (December 2021)
139490, #HIGH, KB4571709: Windows 10 Version 1803 August 2020 Security Update
140418, #HIGH, KB4577032: Windows 10 Version 1803 September 2020 Security Update
141422, #HIGH, KB4580330: Windows 10 Version 1803 October 2020 Security Update
142682, #HIGH, KB4586785: Windows 10 Version 1803 November 2020 Security Update
143571, #HIGH, KB4592446: Windows 10 Version 1803 December 2020 Security Update
144880, #HIGH, KB4598245: Windows 10 Version 1803 January 2021 Security Update
146339, #HIGH, KB4601354: Windows 10 Version 1803 February 2021 Security Update
147224, #HIGH, KB5000809: Windows 10 Version 1803 March 2021 Security Update
148468, #HIGH, KB5001339: Windows 10 version 1803 Security Update (April 2021)
149391, #HIGH, KB5003174: Windows 10 version 1803 Security Update (May 2021)

153382, #MEDIUM, Microsoft Windows MPEG-2 Video Extension RCE (September 2021)
158708, #MEDIUM, Microsoft Windows HEIF Image Extensions RCE (March 2022)
161921, #CRITICAL, Microsoft Windows 10 Version 20H2 Unsupported Version Detection (deprecated)
162196, #CRITICAL, KB5014702: Windows 10 Version 1607 and Windows Server 2016 Security Update (June 2022)
163052, #HIGH, KB5015808: Windows 10 Version 1607 and Windows Server 2016 Security Update (July 2022)
147223, #CRITICAL, KB5000822: Windows 10 Version 1809 and Windows Server 2019 March 2021 Security Update
156619, #CRITICAL, KB5009546: Windows 10 Version 1607 and Windows Server 2016 Security Update (January 2022)
156621, #CRITICAL, KB5009557: Windows 10 Version 1809 and Windows Server 2019 Security Update (January 2022)
159675, #CRITICAL, KB5012647: Windows 10 version 1809 / Windows Server 2019 Security Update (April 2022)
159677, #CRITICAL, KB5012596: Windows 10 version 1607 / Windows Server 2016 Security Update (April 2022)
162197, #CRITICAL, KB5014692: Windows 10 version 1809 / Windows Server 2019 Security Update (June 2022)
166025, #CRITICAL, KB5018419: Windows 10 version 1809 / Windows Server 2019 Security Update (October 2022)
166039, #CRITICAL, KB5018411: Windows 10 Version 1607 and Windows Server 2016 Security Update (October 2022)
143561, #HIGH, KB4592440: Windows 10 Version 1809 and Windows Server 2019 December 2020 Security Update
144887, #HIGH, KB4598230: Windows 10 Version 1809 and Windows Server 2019 January 2021 Security Update
146337, #HIGH, KB4601345: Windows 10 Version 1809 and Windows Server 2019 February 2021 Security Update
148473, #HIGH, KB5001342: Windows 10 version 1809 / Windows Server 2019 Security Update (Apr 2021)
149382, #HIGH, KB5003171: Windows 10 version 1809 / Windows Server 2019 Security Update (May 2021)
150374, #HIGH, KB5003646: Windows 10 version 1809 / Windows Server 2019 Security Update (June 2021)
156071, #HIGH, KB5008218: Windows 10 version 1809 / Windows Server 2019 Security Update (December 2021)
157432, #HIGH, KB5010351: Windows 10 version 1809 / Windows Server 2019 Security Update (February 2022)
157436, #HIGH, KB5010359: Windows 10 Version 1607 and Windows Server 2016 Security Update (February 2022)
158704, #HIGH, KB5011495: Windows 10 Version 1607 and Windows Server 2016 Security Update (March 2022)
158712, #HIGH, KB5011503: Windows 10 version 1809 / Windows Server 2019 Security Update (March 2022)
160928, #HIGH, KB5013941: Windows 10 version 1809 / Windows Server 2019 Security Update (May 2022)
160934, #HIGH, KB5013952: Windows 10 Version 1607 and Windows Server 2016 Security Update (May 2022)
163046, #HIGH, KB5015811: Windows 10 version 1809 / Windows Server 2019 Security Update (July 2022)
163940, #CRITICAL, KB5016622: Windows 10 Version 1607 and Windows Server 2016 Security Update (August 2022)
163946, #CRITICAL, KB5016623: Windows 10 version 1809 / Windows Server 2019 Security Update (August 2022)
164996, #CRITICAL, KB5017305: Windows 10 Version 1607 and Windows Server 2016 Security Update (September 2022)
164997, #CRITICAL, KB5017315: Windows 10 version 1809 / Windows Server 2019 Security Update (September 2022)
166034, #CRITICAL, KB5018410: Windows 10 Version 20H2 / 21H1 / 21H2 Security Update (October 2022)
153375, #HIGH, KB5005627: Windows 8.1 and Windows Server 2012 R2 September 2021 Security Update
166030, #CRITICAL, KB5018476: Windows 8.1 and Windows Server 2012 R2 Security Update (October 2022)
159682, #CRITICAL, KB5012670: Windows 8.1 and Windows Server 2012 R2 Security Update (April 2022)
167112, #CRITICAL, KB5019966: Windows 10 version 1809 / Windows Server 2019 Security Update (November 2022)
167115, #CRITICAL, KB5019959: Windows 10 Version 20H2 / 21H1 / 21H2 / 22H2 Security Update (November 2022)
167109, #CRITICAL, KB5020010: Windows 8.1 and Windows Server 2012 R2 Security Update (November 2022)
167111, #CRITICAL, KB5019964: Windows 10 Version 1607 and Windows Server 2016 Security Update (November 2022)
159672, #CRITICAL, KB5012649: Windows 7 and Windows Server 2008 R2 Security Update (April 2022)
163952, #CRITICAL, KB5016679: Windows 7 and Windows Server 2008 R2 Security Update (August 2022)
169779, #CRITICAL, KB5022289: Windows 10 Version 1607 and Windows Server 2016 Security Update (January 2023)
169781, #CRITICAL, KB5022339: Windows Server 2008 R2 Security Update (January 2023)
169788, #CRITICAL, KB5022286: Windows 10 version 1809 / Windows Server 2019 Security Update (January 2023)
156069, #HIGH, KB5008282: Windows 7 and Windows Server 2008 R2 Security Update (December 2021)
156627, #HIGH, KB5009621: Windows 7 and Windows Server 2008 R2 Security Update (January 2022)
157427, #HIGH, KB5010422: Windows 7 and Windows Server 2008 R2 Security Update (February 2022)
158718, #HIGH, KB5011529: Windows 7 and Windows Server 2008 R2 (March 2022) Security Update
160937, #HIGH, KB5013999: Windows 7 and Windows Server 2008 R2 Security Update (May 2022)
162191, #HIGH, KB5014742: Windows 7 and Windows Server 2008 R2 Security Update (June 2022)
163050, #HIGH, KB5015862: Windows 7 and Windows Server 2008 R2 Security Update (July 2022)
168693, #HIGH, KB5021237: Windows 10 version 1809 / Windows Server 2019 Security Update (December 2022)
147228, #MEDIUM, Security Updates for Internet Explorer (March 2021)
152432, #MEDIUM, Security Updates for Internet Explorer (August 2021)
153374, #MEDIUM, Security Updates for Internet Explorer (September 2021)
154032, #MEDIUM, Security Updates for Internet Explorer (October 2021)
171441, #CRITICAL, KB5022840: Windows 10 version 1809 / Windows Server 2019 Security Update (February 2023)
171448, #CRITICAL, KB5022838: Windows 10 Version 1607 and Windows Server 2016 Security Update (February 2023)
177247, #CRITICAL, KB5027222: Windows 10 version 1809 / Windows Server 2019 Security Update (June 2023)
177246, #CRITICAL, KB5027219: Windows 10 Version 1607 and Windows Server 2016 Security Update (June 2023)
178156, #CRITICAL, KB5028223: Windows Server 2012 R2 Security Update (July 2023)
178159, #CRITICAL, KB5028166: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (July 2023)
178150, #CRITICAL, KB5028168: Windows 10 version 1809 / Windows Server 2019 Security Update (July 2023)
176328, #HIGH, Windows Kerberos Elevation of Privilege Vulnerability (CVE-2022-37967) (November 2022)
182865, #CRITICAL, KB5031361: Windows 10 version 1809 / Windows Server 2019 Security Update (October 2023)
182854, #CRITICAL, KB5031356: Windows 10 Version 21H2 / Windows 10 Version 22H2 Security Update (October 2023)
144813, #MEDIUM, Microsoft Teams < 1.3.0.13000 Remote Code Execution
175373, #CRITICAL, Microsoft Message Queuing RCE (CVE-2023-21554
200349, #CRITICAL, KB5039217: Windows 10 version 1809 / Windows Server 2019 Security Update (June 2024)
200351, #CRITICAL, KB5039214: Windows 10 Version 1607 / Windows Server 2016 Security Update (June 2024)
206973, #HIGH, Microsoft Power Automate For Desktop Remote Code Execution (CVE-2024-43479)
161691, #HIGH, The Microsoft Windows Support Diagnostic Tool (MSDT) RCE Workaround Detection (CVE-2022-30190)
210860, #CRITICAL, KB5046615: Windows 10 version 1809 / Windows Server 2019 Security Update (November 2024)
210850, #CRITICAL, KB5046612: Windows 10 Version 1607 / Windows Server 2016 Security Update (November 2024)
169783, #MEDIUM, Security Updates for Windows Malicious Software Removal Tool (January 2023)
152102, #HIGH, Microsoft Windows EFSRPC NTLM Reflection Elevation of Privilege (PetitPotam) (Remote)
							]
						}
					end
				end
			end
		end
	end
end
