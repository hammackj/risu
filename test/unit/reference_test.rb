# Copyright (c) 2010-2018 Jacob Hammack.
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


require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase
	def setup
		setup_test_database
	end
	
	test "should return a cve for Reference.cve" do
		assert Reference.cve != nil, "GOT #{Reference.cve}"
	end

	test "should return a cpe for Reference.cpe" do
		assert Reference.cpe != nil, "GOT #{Reference.cpe}"
	end

	test "should return a bid for Reference.bid" do
		assert Reference.bid != nil, "GOT #{Reference.bid}"
	end

	test "should return a see_also for Reference.see_also" do
		assert Reference.see_also != nil, "GOT #{Reference.see_also}"
	end

	test "should return a iava for Reference.iava" do
		assert Reference.iava != nil, "GOT #{Reference.iava}"
	end

	test "should return a msft for Reference.msft" do
		assert Reference.msft != nil, "GOT #{Reference.msft}"
	end

	test "should return a osvdb for Reference.osvdb" do
		assert Reference.osvdb != nil, "GOT #{Reference.osvdb}"
	end

	test "should return a cert for Reference.cert" do
		assert Reference.cert != nil, "GOT #{Reference.cert}"
	end

	test "should return a edbid for Reference.edbid" do
		assert Reference.edbid != nil, "GOT #{Reference.edbid}"
	end

	test "should return a rhsa for Reference.rhsa" do
		assert Reference.rhsa != nil, "GOT #{Reference.rhsa}"
	end

	test "should return a secunia for Reference.secunia" do
		assert Reference.secunia != nil, "GOT #{Reference.secunia}"
	end

	test "should return a suse for Reference.suse" do
		assert Reference.suse != nil, "GOT #{Reference.suse}"
	end

	test "should return a dsa for Reference.dsa" do
		assert Reference.dsa != nil, "GOT #{Reference.dsa}"
	end

	test "should return a owasp for Reference.owasp" do
		assert Reference.owasp != nil, "GOT #{Reference.owasp}"
	end

	test "should return a cwe for Reference.cwe" do
		assert Reference.cwe != nil, "GOT #{Reference.cwe}"
	end

	test "should return a iavb for Reference.iavb" do
		assert Reference.iavb != nil, "GOT #{Reference.iavb}"
	end

	test "should return a iavt for Reference.iavt" do
		assert Reference.iavt != nil, "GOT #{Reference.iavt}"
	end

	test "should return a cisco_sa for Reference.cisco_sa" do
		assert Reference.cisco_sa != nil, "GOT #{Reference.cisco_sa}"
	end

	test "should return a ics_alert for Reference.ics_alert" do
		assert Reference.ics_alert != nil, "GOT #{Reference.ics_alert}"
	end

	test "should return a cisco_bug_id for Reference.cisco_bug_id" do
		assert Reference.cisco_bug_id != nil, "GOT #{Reference.cisco_bug_id}"
	end

	test "should return a cisco_sr for Reference.cisco_sr" do
		assert Reference.cisco_sr != nil, "GOT #{Reference.cisco_sr}"
	end

	test "should return a cert_vu for Reference.cert_vu" do
		assert Reference.cert_vu != nil, "GOT #{Reference.cert_vu}"
	end

	test "should return a vmsa for Reference.vmsa" do
		assert Reference.vmsa != nil, "GOT #{Reference.vmsa}"
	end

	test "should return a cert_cc for Reference.cert_cc" do
		assert Reference.cert_cc != nil, "GOT #{Reference.cert_cc}"
	end

	test "should return a apple_sa for Reference.apple_sa" do
		assert Reference.apple_sa != nil, "GOT #{Reference.apple_sa}"
	end

	test "should return a icsa for Reference.icsa" do
		assert Reference.icsa != nil, "GOT #{Reference.icsa}"
	end

	test "should return a msvr for Reference.msvr" do
		assert Reference.msvr != nil, "GOT #{Reference.msvr}"
	end

	test "should return a usn for Reference.usn" do
		assert Reference.usn != nil, "GOT #{Reference.usn}"
	end

end
