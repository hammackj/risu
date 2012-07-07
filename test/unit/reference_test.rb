require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase
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

end
