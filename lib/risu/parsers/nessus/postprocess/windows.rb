# Copyright (c) 2010-2016 Arxopia LLC.
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
				class WindowsPatches < Risu::Base::PostProcessBase

					#
					def initialize
						@info =
						{
							:description => "Microsoft Windows Patch Rollup",
							:plugin_id => -99983,
							:plugin_name => "Update to the latest Windows Updates",
							:item_name => "Update to the latest Windows Updates",
							:plugin_ids => [
								34477,
								35362,
								22194,
								58435,
								35635,
								22034,
								51956,
								40564,
								45517,
								62940,
								53514,
								79638,
								11214,
								11808,
								11835,
								11890,
								12209,
								13852,
								18502,
								19407,
								19408,
								21193,
								21655,
								11110,
								66421,
								55129,
								72935,
								48762,
								81264,
								44045,
								58659,
								78447,
								76123,
								62465,
								80494,
								78432,
								69327,
								70335,
								73985,
								79127,
								82771,
								82828,
								83356,
								59906,
								69832,
								69833,
								70337,
								70338,
								71941,
								73413,
								74426,
								78437,
								79129,
								79830,
								79832,
								81265,
								81757,
								83355,
								39343,
								39346,
								39793,
								42116,
								45021,
								45510,
								46843,
								46845,
								47712,
								47713,
								49222,
								49956,
								49957,
								50529,
								51175,
								51177,
								53378,
								53379,
								56175,
								57277,
								57280,
								59037,
								59038,
								61535,
								62459,
								62908,
								63420,
								67209,
								67210,
								67211,
								67212,
								67213,
								67214,
								69324,
								69328,
								69330,
								69828,
								69829,
								69834,
								69835,
								69836,
								70332,
								70333,
								70334,
								70846,
								70847,
								70848,
								70849,
								71312,
								71313,
								71314,
								71316,
								71943,
								72428,
								72432,
								72433,
								72930,
								79132,
								82769,
								72931,
								72934,
								52456,
								73416,
								73415,
								73417,
								73805,
								73986,
								73988,
								74427,
								74428,
								76406,
								76407,
								76408,
								80490,
								80492,
								81262,
								81263,
								81268,
								81733,
								81735,
								81736,
								81739,
								81742,
								82770,
								82772,
								82774,
								83354,
								83358,
								83362,
								83370,
								83416,
								83440,
								59915,
								76409,
								77163,
								77167,
								77169,
								77572,
								78431,
								78433,
								78435,
								79125,
								79126,
								79128,
								79137,
								79138,
								79311,
								79828,
								79831,
								77573,
								82777,
								62461,
								67215,
								69334,
								70851,
								70852,
								70853,
								70854,
								71321,
								73983,
								74423,
								74425,
								76410,
								77164,
								77165,
								78446,
								79131,
								79134,
								79834,
								80493,
								80496,
								80497,
								81266,
								81269,
								81737,
								81738,
								81743,
								81745,
								82775,
								82793,
								83360,
								83363,
								81267,
								70395,
								81731,
								49274,
								73990,
								73992,
								72430,
								80491,
								71942,
								72434,
								63226,
								64570,
								64571,
								64577,
								65210,
								65875,
								65883,
								66412,
								66422,
								66863,
								69830,
								69831,
								25162,
								25687,
								31413,
								31414,
								33872,
								35071,
								39349,
								40435,
								40888,
								42442,
								45509,
								46313,
								53382,
								53388,
								59909,
								63422,
								63522,
								64572,
								64578,
								65215,
								65878,
								65880,
								66418,
								69325,
								71311,
								25164,
								25688,
								25691,
								32311,
								33444,
								33880,
								34120,
								34123,
								35632,
								36147,
								39783,
								40562,
								52585,
								64572,
								64578,
								65215,
								65878,
								65880,
								66418,
								69325,
								71311,
								79833,
								53859,
								55124,
								55132,
								57275,
								65879,
								81741,
								61532,
								62045,
								62463,
								62904,
								62906,
								62907,
								63224,
								63225,
								63228,
								63229,
								63425,
								64576,
								64581,
								65876,
								66413,
								66417,
								78438,
								78439,
								79130,
								66415,
								66864,
								46848,
								82075,
								66423,
								62466,
								35361,
								43063,
								23837,
								29893,
								34476,
								84743,
								19402,
								19999,
								39344,
								39348,
								20004,
								22183,
								24340,
								84742,
								84744,
								84746,
								84747,
								84748,
								84059,
								84761,
								84053,
								84056,
								84057,
								57276,
								57414,
								59454,
								56452,
								57273,
								57283,
								57473,
								57942,
								58332,
								58655,
								58656,
								58657,
								57279,
								57285,
								57472,
								57944,
								84054,
								55119,
								57284,
								57470,
								57950,
								59456,
								84734,
								57469,
								55123,
								55792,
								55793,
								55795,
								56174,
								56449,
								56451,
								57943,
								55570,
								55787,
								56454,
								56455,
								47750,
								48216,
								53376,
								53381,
								53385,
								53387,
								53389,
								53390,
								53391,
								55122,
								48285,
								48289,
								49219,
								49220,
								49225,
								49950,
								49951,
								49953,
								49955,
								51163,
								51170,
								51171,
								51455,
								51906,
								51907,
								51912,
								53375,
								53386,
								55118,
								55126,
								55130,
								45507,
								45513,
								46312,
								46839,
								46840,
								48286,
								48288,
								48290,
								49224,
								49948,
								49958,
								49959,
								49960,
								49961,
								51162,
								51168,
								51169,
								51587,
								51903,
								51911,
								51913,
								51914,
								42117,
								45378,
								45506,
								46842,
								47045,
								47710,
								34744,
								44110,
								44415,
								44416,
								44417,
								44423,
								81734,
								84736,
								36152,
								43865,
								35822,
								35823,
								36149,
								36150,
								36153,
								40889,
								40890,
								42107,
								42108,
								42110,
								42113,
								42114,
								42118,
								42439,
								43064,
								43065,
								29313,
								31044,
								31797,
								33133,
								33874,
								34403,
								35072,
								35221,
								24332,
								24335,
								24337,
								29308,
								29894,
								31794,
								31798,
								32312,
								33135,
								33137,
								33875,
								33877,
								33878,
								34406,
								34408,
								34409,
								34411,
								34743,
								35070,
								35075,
								36148,
								39342,
								39622,
								40565,
								40891,
								61529,
								53503,
								48405,
								47556,
								53377,
								48291,
								44422,
								21692,
								63419,
								59042,
								59043,
								59459,
								59908,
								59910,
								59911,
								61530,
								59455,
								59460,
								61527,
								62223,
								71323,
								84738,
								19403,
								20001,
								21689,
								22188,
								22530,
								23643,
								59455,
								59460,
								61527,
								22530,
								23645,
								25880,
								29312,
								31041,
								31042,
								39341,
								39347,
								39347,
								39791,
								39792,
								40407,
								40556,
								40557,
								40560,
								40561,
								42115,
								45020,
								45514,
								48284,
								48287,
								48292,
								52583,
								57278,
								57948,
								61528,
								66425,
								25166,
								25167,
								25486,
								25883,
								26963,
								27525,
								28183,
								34121,
								36151,
								84739,
								48297,
								22536,
								23838,
								46847,
								51166,
								61534,
								62903,
								63423,
								64579,
								64580,
								65212,
								65214,
								66865,
								66866,
								84055,
								18482,
								18681,
								20003,
								20389,
								21694,
								22030,
								22192,
								22534,
								23644,
								23833,
								24330,
								24911,
								25025,
								25484,
								25488,
								25884,
								25886,
								26962,
								34311,
								35630,
								38742,
								49954,
								57946,
								57947,
								59907,
								61531,
								73984,
								77574,
								84741,
								84745,
								57474,
								58330,
								59912,
								71317,
								57471,
								46841,
								55117,
								44418,
								49695,
								55799,
								53384,
								55572,
								53383,
								49227,
								51910,
								46844,
								45508,
								45516,
								44421,
								44425,
								83364,
								39350,
								35634,
								33441,
								42112,
								43061,
								49223,
								33134,
								33881,
								34414,
								53830,
								84763,
								48761,
								55802,
								31039,
								31040,
								31795,
								55796,
								62905,
								81744,
								83361,
								19405,
								19998,
								20908,
								22333,
								28185,
								29311,
								31793,
								58333,
								21211,
								21687,
								22537,
								55116,
								77162,
								63230,
								20907,
								21686,
								22028,
								22529,
								22538,
								74422,
								40559,
								59040,
								59041,
								62464,
								63424,
								63643,
								22190,
								24339,
								31047,
								21078,
								21690,
								22532,
								18026,
								23999,
								31415,
								23998,
								25882,
								33871,
								34402,
								20390,
								24338,
								25163,
								32310,
								33107,
								33870,
								84882,
								59044,
								77166,
								58335,
								22032,
								22535,
								22031,
								22533,
								22189,
								11322,
								22033,
								11804,
								33873,
								70339,
								72932,
								77160,
								85330,
								85333,
								85348,
								85540,
								85321,
								56736,
								85322,
								85332,
								85334,
								85335,
								84735,
								56738,
								58331,
								69838,
								87256,
								85844,
								85845,
								85847,
								85877,
								86366,
								86367,
								86373,
								86819,
								86822,
								86824,
								86826,
								86828,
								87253,
								87257,
								87259,
								87261,
								87262,
								87264,
								85350,
								85879,
								86823,
								87260,
								85876,
								85884,
								86374,
								86821,
								87258,
								87263,
								86825,
								86827,
								85846,
								55797,
								73982,
								12054,
								87880,
								87882,
								55286,
								51904,
								49962,
								51164,
								51167,
								51172,
								55121,
								55128,
								55794,
								55798,
								56737,
								87877,
								87881,
								87890,
								87892,
								88642,
								88646,
								88650,
								88651,
								47711,
								48295,
								48296,
								56824,
								88644,
								90438,
								89749,
								89753,
								89755,
								89756,
								89779,
								90433,
								90434,
								90437,
								88647,
								88649,
								89746,
								89748,
								89751,
								89752,
								89754,
								90431,
								90436,
								90441,
								89750,
								31046,
								88645,
								88648,
								14724,
								35073,
								42441,
								44414,
								48293,
								48294,
								49221,
								50528,
								55125,
								56450,
								57282,
								57949,
								59039,
								88654,
								89835,
								90443,
								85329,
								86065,
								86371,
								86469,
								86820,
								90442,
								90439,
								90432,
								88643,
								87878,
								87254,
								87249,
								55569,
								56177,
								22334,
								87875,
								89757,
								89747,
								87671,
								86856,
								87893,
								90440,
								90510,
								91015,
								91001,
								91005,
								91006,
								91010,
								91011,
								91012,
								91002,
								91007,
								91009,
								91004,
								91013,
								91014,
								85323,
								86149,
								88653,
								73987,
								91605,
								91600,
								91602,
								92823,
								33132,
								91601,
								91603,
								92021,
								92821,
								35069,
								91596,
								43089,
								92018,
								92843,
								51909,
								91609,
								33879,
								92022,
								87313,
								87252,
							]
						}
					end
				end
			end
		end
	end
end
