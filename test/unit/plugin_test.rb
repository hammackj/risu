# Copyright (c) 2010-2015 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

require 'test_helper'

class PluginTest < ActiveSupport::TestCase
	test "returns 12 risks for Plugin.risks.count" do
		assert Plugin.risks.count == 12, "GOT #{Plugin.risks.count}"
	end

	test "returns 8 risks for Plugin.critical_risks.count" do
		assert Plugin.critical_risks.to_a.count == 8, "GOT #{Plugin.critical_risks.to_a.count}"
	end

	test "returns 1 risks for Plugin.high_risks.count" do
		assert Plugin.high_risks.to_a.count == 1
	end

	test "returns 1 for Plugin.medium_risks.count" do
		assert Plugin.medium_risks.to_a.count == 1
	end

	test "returns 1 for Plugin.low_risks.count" do
		assert Plugin.low_risks.to_a.count == 1
	end

	test "returns 1 risks for Plugin.info_risks.count" do
		assert Plugin.none_risks.to_a.count == 1
	end

	test "returns a graph Plugin.top_by_count_graph" do
		assert Plugin.top_by_count_graph.class == StringIO
	end

	test "returns 1 risk for Plugin.where(:exploit_framework_d2_elliot =>true).count" do
		assert Plugin.where(:exploit_framework_d2_elliot => true).count == 1, "GOT #{Plugin.where(:exploit_framework_d2_elliot => true).count}"
	end

	test "returns 1 risk for Plugin.where(:d2_elliot_name => 'Sample Exploit Name').count" do
		assert Plugin.where(:d2_elliot_name => "Sample Exploit Name").count == 1, "GOT #{Plugin.where(:d2_elliot_name => "Sample Exploit Name").count}"
	end

	test "return 2 risk for Plugin.where(:exploited_by_malware => 'true').count" do
		assert Plugin.where(:exploited_by_malware => "true").count == 2, "GOT #{Plugin.where(:exploited_by_malware => 'true').count}"
	end
end
