require './lib/data_handling/formatted_data'
require './lib/data_handling/timeline'


describe Timeline do

	let (:response)			{ [{"date" => "20140902", "summary" => [{"activity" => "walking", "group" => "walking", "duration" => 4990.0, "distance" => 5626.0, "steps" => 8426}, {"activity" => "transport", "group" => "transport", "duration" => 2012.0, "distance" => 17798.0}], "segments" => [{"type" => "place", "startTime" => "20140902T074027+0100", "endTime" => "20140902T083008+0100", "place" => {"id" => 152423309, "type" => "unknown", "location" => {"lat" => 51.4960936203, "lon" => 0.0129008829}}, "activities" => [{"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T080244+0100", "endTime" => "20140902T080326+0100", "duration" => 42.0, "distance" => 21.0, "steps" => 40, "trackPoints" => []}], "lastUpdate" => "20140902T085409Z"}, {"type" => "move", "startTime" => "20140902T083008+0100", "endTime" => "20140902T091320+0100", "activities" => [{"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T083008+0100", "endTime" => "20140902T084311+0100", "duration" => 783.0, "distance" => 1139.0, "steps" => 1375, "trackPoints" => [{"lat" => 51.4960936203, "lon" => 0.0129008829, "time" => "20140902T083008+0100"}, {"lat" => 51.4958643302, "lon" => 0.0126906463, "time" => "20140902T083058+0100"}, {"lat" => 51.4957469585, "lon" => 0.0125437965, "time" => "20140902T083140+0100"}, {"lat" => 51.4955315121, "lon" => 0.0122723257, "time" => "20140902T083220+0100"}, {"lat" => 51.4955920494, "lon" => 0.0117988624, "time" => "20140902T083241+0100"}, {"lat" => 51.4956338814, "lon" => 0.0113553066, "time" => "20140902T083304+0100"}, {"lat" => 51.4960540526, "lon" => 0.0106273785, "time" => "20140902T083338+0100"}, {"lat" => 51.4964852508, "lon" => 0.010320832, "time" => "20140902T083406+0100"}, {"lat" => 51.4967923493, "lon" => 0.0101075537, "time" => "20140902T083426+0100"}, {"lat" => 51.4976599673, "lon" => 0.009529091, "time" => "20140902T083508+0100"}, {"lat" => 51.4977892859, "lon" => 0.0093964175, "time" => "20140902T083525+0100"}, {"lat" => 51.4978253288, "lon" => 0.0091568121, "time" => "20140902T083546+0100"}, {"lat" => 51.4979115476, "lon" => 0.0088712708, "time" => "20140902T083602+0100"}, {"lat" => 51.4981933138, "lon" => 0.0086041968, "time" => "20140902T083624+0100"}, {"lat" => 51.4984083424, "lon" => 0.0083023435, "time" => "20140902T083642+0100"}, {"lat" => 51.4991696702, "lon" => 0.0076830719, "time" => "20140902T083718+0100"}, {"lat" => 51.5000931577, "lon" => 0.0069603177, "time" => "20140902T083807+0100"}, {"lat" => 51.5002952111, "lon" => 0.006701468, "time" => "20140902T083823+0100"}, {"lat" => 51.5005811771, "lon" => 0.006076539, "time" => "20140902T083847+0100"}, {"lat" => 51.5008272228, "lon" => 0.0055546008, "time" => "20140902T083912+0100"}, {"lat" => 51.5009240314, "lon" => 0.0052631161, "time" => "20140902T083935+0100"}, {"lat" => 51.5007384072, "lon" => 0.00538294, "time" => "20140902T083953+0100"}, {"lat" => 51.5008611187, "lon" => 0.0051679139, "time" => "20140902T084013+0100"}, {"lat" => 51.5007010622, "lon" => 0.00480254, "time" => "20140902T084032+0100"}, {"lat" => 51.500558647, "lon" => 0.0044950877, "time" => "20140902T084048+0100"}, {"lat" => 51.5005612955, "lon" => 0.0042046131, "time" => "20140902T084112+0100"}, {"lat" => 51.5004195035, "lon" => 0.0039627324, "time" => "20140902T084131+0100"}, {"lat" => 51.500273369, "lon" => 0.0036780803, "time" => "20140902T084157+0100"}, {"lat" => 51.5002425813, "lon" => 0.0035884843, "time" => "20140902T084220+0100"}, {"lat" => 51.5002438185, "lon" => 0.0035499456, "time" => "20140902T084243+0100"}, {"lat" => 51.5002546757, "lon" => 0.0035053646, "time" => "20140902T084311+0100"}]}, {"activity" => "transport", "group" => "transport", "manual" => false, "startTime" => "20140902T084311+0100", "endTime" => "20140902T085912+0100", "duration" => 961.0, "distance" => 8264.0, "trackPoints" => [{"lat" => 51.5002546757, "lon" => 0.0035053646, "time" => "20140902T084311+0100"}, {"lat" => 51.5002841968, "lon" => 0.0034016618, "time" => "20140902T084340+0100"}, {"lat" => 51.4980582826, "lon" => -0.0497296219, "time" => "20140902T084814+0100"}, {"lat" => 51.4983513271, "lon" => -0.0499599156, "time" => "20140902T084834+0100"}, {"lat" => 51.4983954224, "lon" => -0.0499916467, "time" => "20140902T084901+0100"}, {"lat" => 51.4984321504, "lon" => -0.050019166, "time" => "20140902T084918+0100"}, {"lat" => 51.4984948812, "lon" => -0.0500662383, "time" => "20140902T085000+0100"}, {"lat" => 51.5006348507, "lon" => -0.0516537448, "time" => "20140902T085141+0100"}, {"lat" => 51.5229604907, "lon" => -0.0702623141, "time" => "20140902T085811+0100"}, {"lat" => 51.5233479141, "lon" => -0.0752896951, "time" => "20140902T085834+0100"}, {"lat" => 51.523504279, "lon" => -0.0756042129, "time" => "20140902T085852+0100"}, {"lat" => 51.5235157478, "lon" => -0.0756160806, "time" => "20140902T085912+0100"}]}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T085912+0100", "endTime" => "20140902T091320+0100", "duration" => 848.0, "distance" => 924.0, "steps" => 1546, "trackPoints" => [{"lat" => 51.5235157478, "lon" => -0.0756160806, "time" => "20140902T085912+0100"}, {"lat" => 51.5235218943, "lon" => -0.0756220562, "time" => "20140902T085936+0100"}, {"lat" => 51.5235292071, "lon" => -0.075624097, "time" => "20140902T085957+0100"}, {"lat" => 51.5235298243, "lon" => -0.0756230535, "time" => "20140902T085959+0100"}, {"lat" => 51.5235298274, "lon" => -0.0756230484, "time" => "20140902T090000+0100"}, {"lat" => 51.5235354517, "lon" => -0.0756135392, "time" => "20140902T090018+0100"}, {"lat" => 51.5235421282, "lon" => -0.0755867605, "time" => "20140902T090039+0100"}, {"lat" => 51.5235706419, "lon" => -0.0755593656, "time" => "20140902T090117+0100"}, {"lat" => 51.5236053866, "lon" => -0.0757580847, "time" => "20140902T090132+0100"}, {"lat" => 51.5236559429, "lon" => -0.0761830994, "time" => "20140902T090151+0100"}, {"lat" => 51.5236470379, "lon" => -0.076514932, "time" => "20140902T090207+0100"}, {"lat" => 51.5236808313, "lon" => -0.076914856, "time" => "20140902T090222+0100"}, {"lat" => 51.5237464775, "lon" => -0.0771586024, "time" => "20140902T090238+0100"}, {"lat" => 51.5238309965, "lon" => -0.0771646728, "time" => "20140902T090255+0100"}, {"lat" => 51.5238089859, "lon" => -0.0774856876, "time" => "20140902T090310+0100"}, {"lat" => 51.5238026177, "lon" => -0.0779151089, "time" => "20140902T090326+0100"}, {"lat" => 51.5237798722, "lon" => -0.0784368629, "time" => "20140902T090348+0100"}, {"lat" => 51.5237791481, "lon" => -0.0789134274, "time" => "20140902T090411+0100"}, {"lat" => 51.5237842552, "lon" => -0.0792098397, "time" => "20140902T090448+0100"}, {"lat" => 51.5238385442, "lon" => -0.0794959951, "time" => "20140902T090511+0100"}, {"lat" => 51.5238440985, "lon" => -0.079855998, "time" => "20140902T090534+0100"}, {"lat" => 51.5237159522, "lon" => -0.0801619281, "time" => "20140902T090557+0100"}, {"lat" => 51.5235434995, "lon" => -0.0803945122, "time" => "20140902T090615+0100"}, {"lat" => 51.5235245879, "lon" => -0.0809667218, "time" => "20140902T090635+0100"}, {"lat" => 51.5233159513, "lon" => -0.0816403387, "time" => "20140902T090702+0100"}, {"lat" => 51.5232911256, "lon" => -0.0822995446, "time" => "20140902T090723+0100"}, {"lat" => 51.5233074676, "lon" => -0.0831010519, "time" => "20140902T090746+0100"}, {"lat" => 51.5233375386, "lon" => -0.0839156366, "time" => "20140902T090821+0100"}, {"lat" => 51.5233545427, "lon" => -0.0841554928, "time" => "20140902T090838+0100"}, {"lat" => 51.5233741918, "lon" => -0.0845433966, "time" => "20140902T090858+0100"}, {"lat" => 51.5233852591, "lon" => -0.0847967969, "time" => "20140902T090921+0100"}, {"lat" => 51.5233986566, "lon" => -0.0849970732, "time" => "20140902T090937+0100"}, {"lat" => 51.5233985732, "lon" => -0.0853189254, "time" => "20140902T090958+0100"}, {"lat" => 51.5234133864, "lon" => -0.0856155243, "time" => "20140902T091018+0100"}, {"lat" => 51.5234931482, "lon" => -0.0860372142, "time" => "20140902T091038+0100"}, {"lat" => 51.5233237338, "lon" => -0.0862481631, "time" => "20140902T091053+0100"}, {"lat" => 51.5232838178, "lon" => -0.0867871391, "time" => "20140902T091115+0100"}, {"lat" => 51.5231698822, "lon" => -0.086980553, "time" => "20140902T091131+0100"}, {"lat" => 51.5230967158, "lon" => -0.0870227664, "time" => "20140902T091148+0100"}, {"lat" => 51.5231294412, "lon" => -0.0869860472, "time" => "20140902T091211+0100"}, {"lat" => 51.5231507047, "lon" => -0.0869999344, "time" => "20140902T091234+0100"}, {"lat" => 51.5231412816, "lon" => -0.0869939907, "time" => "20140902T091257+0100"}, {"lat" => 51.5230885975, "lon" => -0.0870480194, "time" => "20140902T091320+0100"}]}], "lastUpdate" => "20140902T085409Z"}, {"type" => "place", "startTime" => "20140902T091320+0100", "endTime" => "20140902T190214+0100", "place" => {"id" => 152321929, "type" => "unknown", "location" => {"lat" => 51.5230885975, "lon" => -0.0870480194}}, "activities" => [{"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T091413+0100", "endTime" => "20140902T091613+0100", "duration" => 120.0, "distance" => 101.0, "steps" => 203, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T100025+0100", "endTime" => "20140902T100407+0100", "duration" => 222.0, "distance" => 243.0, "steps" => 324, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T110617+0100", "endTime" => "20140902T110723+0100", "duration" => 66.0, "distance" => 65.0, "steps" => 130, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T123401+0100", "endTime" => "20140902T123601+0100", "duration" => 120.0, "distance" => 106.0, "steps" => 213, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T130244+0100", "endTime" => "20140902T131516+0100", "duration" => 752.0, "distance" => 755.0, "steps" => 1007, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T140400+0100", "endTime" => "20140902T140600+0100", "duration" => 120.0, "distance" => 117.0, "steps" => 233, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T164359+0100", "endTime" => "20140902T164429+0100", "duration" => 30.0, "distance" => 25.0, "steps" => 51, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T173059+0100", "endTime" => "20140902T173159+0100", "duration" => 60.0, "distance" => 56.0, "steps" => 112, "trackPoints" => []}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T183415+0100", "endTime" => "20140902T183645+0100", "duration" => 150.0, "distance" => 175.0, "steps" => 234, "trackPoints" => []}], "lastUpdate" => "20140903T064045Z"}, {"type" => "move", "startTime" => "20140902T190214+0100", "endTime" => "20140902T194712+0100", "activities" => [{"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T190214+0100", "endTime" => "20140902T191246+0100", "duration" => 632.0, "distance" => 537.0, "steps" => 1068, "trackPoints" => [{"lat" => 51.5230885975, "lon" => -0.0870480194, "time" => "20140902T190214+0100"}, {"lat" => 51.5229238665, "lon" => -0.0869811082, "time" => "20140902T190237+0100"}, {"lat" => 51.5228969389, "lon" => -0.0869912607, "time" => "20140902T190258+0100"}, {"lat" => 51.5228685624, "lon" => -0.0870092678, "time" => "20140902T190316+0100"}, {"lat" => 51.5228675239, "lon" => -0.0868736151, "time" => "20140902T190338+0100"}, {"lat" => 51.5228248218, "lon" => -0.0868535008, "time" => "20140902T190400+0100"}, {"lat" => 51.5228175979, "lon" => -0.0867820977, "time" => "20140902T190416+0100"}, {"lat" => 51.5228274713, "lon" => -0.0867530527, "time" => "20140902T190439+0100"}, {"lat" => 51.5229440193, "lon" => -0.0870542317, "time" => "20140902T190543+0100"}, {"lat" => 51.5232238941, "lon" => -0.0872144103, "time" => "20140902T190607+0100"}, {"lat" => 51.5235191074, "lon" => -0.0873456539, "time" => "20140902T190626+0100"}, {"lat" => 51.523706089, "lon" => -0.0874368311, "time" => "20140902T190646+0100"}, {"lat" => 51.5238039377, "lon" => -0.0874764294, "time" => "20140902T190712+0100"}, {"lat" => 51.5239248783, "lon" => -0.0874338171, "time" => "20140902T190728+0100"}, {"lat" => 51.5240525519, "lon" => -0.0874534807, "time" => "20140902T190743+0100"}, {"lat" => 51.5243925377, "lon" => -0.0875065945, "time" => "20140902T190806+0100"}, {"lat" => 51.5247090549, "lon" => -0.0875596064, "time" => "20140902T190823+0100"}, {"lat" => 51.5251231624, "lon" => -0.0875952778, "time" => "20140902T190855+0100"}, {"lat" => 51.5252543612, "lon" => -0.0875653324, "time" => "20140902T190912+0100"}, {"lat" => 51.5253577823, "lon" => -0.0875016715, "time" => "20140902T190929+0100"}, {"lat" => 51.5255622525, "lon" => -0.0874410887, "time" => "20140902T191007+0100"}, {"lat" => 51.5256191501, "lon" => -0.0874432058, "time" => "20140902T191038+0100"}, {"lat" => 51.5256393686, "lon" => -0.0874685395, "time" => "20140902T191058+0100"}, {"lat" => 51.5255986592, "lon" => -0.0874835599, "time" => "20140902T191118+0100"}, {"lat" => 51.5254624924, "lon" => -0.0874956757, "time" => "20140902T191136+0100"}, {"lat" => 51.5245131972, "lon" => -0.0875783916, "time" => "20140902T191246+0100"}]}, {"activity" => "transport", "group" => "transport", "manual" => false, "startTime" => "20140902T191246+0100", "endTime" => "20140902T191946+0100", "duration" => 420.0, "distance" => 2041.0, "trackPoints" => [{"lat" => 51.5245131972, "lon" => -0.0875783916, "time" => "20140902T191246+0100"}, {"lat" => 51.5087240623, "lon" => -0.0837828322, "time" => "20140902T191947+0100"}]}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T191947+0100", "endTime" => "20140902T192217+0100", "duration" => 150.0, "distance" => 172.0, "steps" => 345, "trackPoints" => [{"lat" => 51.5087240623, "lon" => -0.0837828322, "time" => "20140902T191947+0100"}, {"lat" => 51.5078796535, "lon" => -0.0823992171, "time" => "20140902T192217+0100"}]}, {"activity" => "transport", "group" => "transport", "manual" => false, "startTime" => "20140902T192217+0100", "endTime" => "20140902T193248+0100", "duration" => 631.0, "distance" => 7493.0, "trackPoints" => [{"lat" => 51.5078796535, "lon" => -0.0823992171, "time" => "20140902T192217+0100"}, {"lat" => 51.4978080323, "lon" => -0.0638632059, "time" => "20140902T192607+0100"}, {"lat" => 51.4977760125, "lon" => -0.06366461, "time" => "20140902T192628+0100"}, {"lat" => 51.4977927052, "lon" => -0.0635710082, "time" => "20140902T192655+0100"}, {"lat" => 51.4980649108, "lon" => -0.0496374807, "time" => "20140902T192807+0100"}, {"lat" => 51.4980938388, "lon" => -0.0495352877, "time" => "20140902T192827+0100"}, {"lat" => 51.5036418113, "lon" => -0.0188016221, "time" => "20140902T193034+0100"}, {"lat" => 51.5035389331, "lon" => -0.0181490595, "time" => "20140902T193112+0100"}, {"lat" => 51.5002909954, "lon" => 0.0037406114, "time" => "20140902T193247+0100"}]}, {"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T193247+0100", "endTime" => "20140902T194712+0100", "duration" => 865.0, "distance" => 1170.0, "steps" => 1504, "trackPoints" => [{"lat" => 51.5002909954, "lon" => 0.0037406114, "time" => "20140902T193247+0100"}, {"lat" => 51.5002532947, "lon" => 0.0035764812, "time" => "20140902T193316+0100"}, {"lat" => 51.5002350444, "lon" => 0.0035705833, "time" => "20140902T193336+0100"}, {"lat" => 51.5002332076, "lon" => 0.0036062719, "time" => "20140902T193355+0100"}, {"lat" => 51.5002673729, "lon" => 0.0037176917, "time" => "20140902T193422+0100"}, {"lat" => 51.5003612292, "lon" => 0.0038959186, "time" => "20140902T193502+0100"}, {"lat" => 51.5004254524, "lon" => 0.0040167264, "time" => "20140902T193521+0100"}, {"lat" => 51.5005678858, "lon" => 0.0043333055, "time" => "20140902T193552+0100"}, {"lat" => 51.5004864652, "lon" => 0.0043643037, "time" => "20140902T193613+0100"}, {"lat" => 51.5006074015, "lon" => 0.0047606668, "time" => "20140902T193631+0100"}, {"lat" => 51.5007214912, "lon" => 0.0050355951, "time" => "20140902T193648+0100"}, {"lat" => 51.5008079304, "lon" => 0.0052948207, "time" => "20140902T193704+0100"}, {"lat" => 51.5007657032, "lon" => 0.005521534, "time" => "20140902T193726+0100"}, {"lat" => 51.5006845429, "lon" => 0.0058158465, "time" => "20140902T193743+0100"}, {"lat" => 51.5004014453, "lon" => 0.0065478953, "time" => "20140902T193807+0100"}, {"lat" => 51.5001639293, "lon" => 0.0071587931, "time" => "20140902T193826+0100"}, {"lat" => 51.4999667498, "lon" => 0.0075451508, "time" => "20140902T193853+0100"}, {"lat" => 51.4997468256, "lon" => 0.0076712474, "time" => "20140902T193918+0100"}, {"lat" => 51.498859081, "lon" => 0.0075386645, "time" => "20140902T194015+0100"}, {"lat" => 51.4986909708, "lon" => 0.0077325536, "time" => "20140902T194031+0100"}, {"lat" => 51.49852674, "lon" => 0.0079636607, "time" => "20140902T194047+0100"}, {"lat" => 51.4983694472, "lon" => 0.0081597973, "time" => "20140902T194102+0100"}, {"lat" => 51.4980888345, "lon" => 0.0089041629, "time" => "20140902T194126+0100"}, {"lat" => 51.497939922, "lon" => 0.0092798467, "time" => "20140902T194150+0100"}, {"lat" => 51.4978575196, "lon" => 0.0094215158, "time" => "20140902T194213+0100"}, {"lat" => 51.4976349375, "lon" => 0.0096127185, "time" => "20140902T194248+0100"}, {"lat" => 51.4973014143, "lon" => 0.0098600785, "time" => "20140902T194312+0100"}, {"lat" => 51.496493008, "lon" => 0.0104955811, "time" => "20140902T194342+0100"}, {"lat" => 51.4964201432, "lon" => 0.0108043191, "time" => "20140902T194412+0100"}, {"lat" => 51.4962537919, "lon" => 0.0109820534, "time" => "20140902T194434+0100"}, {"lat" => 51.4959190038, "lon" => 0.0113182599, "time" => "20140902T194503+0100"}, {"lat" => 51.4952758521, "lon" => 0.0121871164, "time" => "20140902T194539+0100"}, {"lat" => 51.4952081854, "lon" => 0.012375058, "time" => "20140902T194606+0100"}, {"lat" => 51.4955750407, "lon" => 0.0125379532, "time" => "20140902T194632+0100"}, {"lat" => 51.4960936203, "lon" => 0.0129008829, "time" => "20140902T194712+0100"}]}], "lastUpdate" => "20140903T064045Z"}, {"type" => "place", "startTime" => "20140902T194712+0100", "endTime" => "20140902T202542+0100", "place" => {"id" => 152423309, "type" => "unknown", "location" => {"lat" => 51.4960936203, "lon" => 0.0129008829}}, "activities" => [{"activity" => "walking", "group" => "walking", "manual" => false, "startTime" => "20140902T200119+0100", "endTime" => "20140902T200149+0100", "duration" => 30.0, "distance" => 20.0, "steps" => 41, "trackPoints" => []}], "lastUpdate" => "20140903T082514Z"}], "lastUpdate" => "20140903T082514Z"}] }
	let (:zoe_data)			{ FormattedData.new(response) 				}
	let (:timeline)			{ Timeline.new(zoe_data, current_datetime) 					}
	let (:current_datetime) { Time.new(2014, 9, 02, 0, 0, 0, '+01:00')  } # for this data anyway...

	it 'should initialize with steps' do
		expect(timeline.steps).to be_an_instance_of Array
	end

	it 'should initialize with places' do
		expect(timeline.places).to be_an_instance_of Array
	end

	context 'timelines are initialized with timeslots which' do

		it 'divide the day into 288 5 minute sections' do
			timeslots_in_a_date = (12 * 24) # 12 timeslots in an hour, 5 x 12 = 60 minutes, times by hours in a day
			expect(timeline.timeslots.length).to eq timeslots_in_a_date
		end

		it 'are hashes' do
			timeline.make_timeslots_for(current_datetime)
			expect(timeline.timeslots[0].class) == Hash
		end

		it 'have a locations array for each timeslot' do
			timeline.make_timeslots_for(current_datetime)
			expect(timeline.timeslots[0]['locations']).to eq []
		end

		it 'know the next day' do
			next_date = Time.new(2014, 9, 03, 0, 0, 0, '+01:00')
			expect(timeline.day_after(current_datetime)).to eq next_date
		end

		it 'know what the next timeslot is' do
			next_timeslot = Time.new(2014, 9, 02, 0, 05, 0, '+01:00')
			expect(timeline.next_timeslot(current_datetime)).to eq next_timeslot
		end

	end

	context "matching steps to timeslots" do

		it 'does not consider a step part of the timeslot if it not is in the same time range' do
			current_datetime = Time.new(2014, 9, 02, 0, 05, 0, '+01:00')
			step_time		 = Time.new(2014, 9, 02, 0, 10, 33, '+01:00')

			expect(timeline.step_belongs_to_timeslot?(step_time, current_datetime)).to be false
		end

		it 'considers a step part of the timeslot if it is in the same time range' do
			current_datetime = Time.new(2014, 9, 02, 0, 05, 0, '+01:00')
			step_time		 = Time.new(2014, 9, 02, 0, 05, 33, '+01:00')

			expect(timeline.step_belongs_to_timeslot?(step_time, current_datetime)).to be true
		end

	end

	context "filling timeslots with steps" do

		before do
			timeline.make_timeslots_for(current_datetime)
			@time_slot_at_8_30 = timeline.timeslots[102]
		end

		it 'should match a step with the correct timeslot' do
			timeline.get_steps

			step_at_8_30 = Time.new(2014, 9, 02, 8, 30, 8, '+01:00')

			expect(@time_slot_at_8_30['locations'][0]['time']).to eq step_at_8_30
		end

		it 'should contain steps with latitude' do
			timeline.get_steps

			first_slot = @time_slot_at_8_30['locations'][0]
			expect(first_slot.keys.include? 'lat').to be true
		end

		it 'should contain steps with longitude' do
			timeline.get_steps

			first_slot = @time_slot_at_8_30['locations'][0]
			expect(first_slot.keys.include? 'lon').to be true
		end

		it 'should contain steps with a time value' do
			timeline.get_steps

			first_slot = @time_slot_at_8_30['locations'][0]
			expect(first_slot.keys.include? 'time').to be true
		end

	end

	context 'When matching places a place is invalid if...' do

		it 'the start and end time are less than the the timeslot start' do
			current_datetime = Time.new(2014, 9, 02, 12, 00, 0, '+01:00')
			place_startTime	 = Time.new(2014, 9, 02, 10, 0, 0, '+01:00')
			place_endTime	 = Time.new(2014, 9, 02, 11, 0, 0, '+01:00')

			expect(timeline.place_belongs_to_timeslot?(place_startTime, place_endTime, current_datetime)).to be false
		end

		it 'the start and end time are greater than the the timeslot end' do
			current_datetime = Time.new(2014, 9, 02, 0, 05, 0, '+01:00')
			place_startTime	 = Time.new(2014, 9, 02, 10, 0, 0, '+01:00')
			place_endTime	 = Time.new(2014, 9, 02, 11, 0, 0, '+01:00')

			expect(timeline.place_belongs_to_timeslot?(place_startTime, place_endTime, current_datetime)).to be false
		end

	end

	context 'When matching places a place is valid if...' do

		it 'has a startTime that is greater than the timeslot start time and a startTime less than a timeslot end time' do
			current_datetime = Time.new(2014, 9, 02, 12, 0, 0, '+01:00')
			place_startTime	 = Time.new(2014, 9, 02, 12, 02, 0, '+01:00')
			place_endTime	 = Time.new(2014, 9, 02, 12, 15, 0, '+01:00')

			expect(timeline.place_belongs_to_timeslot?(place_startTime, place_endTime, current_datetime)).to be true
		end

		it 'has a startTime that is equal to the timeslot start time and a startTime less than a timeslot end time' do
			current_datetime = Time.new(2014, 9, 02, 12, 0, 0, '+01:00')
			place_startTime	 = Time.new(2014, 9, 02, 12, 00, 0, '+01:00')
			place_endTime	 = Time.new(2014, 9, 02, 12, 15, 0, '+01:00')

			expect(timeline.place_belongs_to_timeslot?(place_startTime, place_endTime, current_datetime)).to be true
		end

		it 'has a startTime less than the timeslot start time and a endTime greater than a timeslot start time' do
			current_datetime = Time.new(2014, 9, 02, 12, 0, 0, '+01:00')
			place_startTime	 = Time.new(2014, 9, 02, 11, 00, 0, '+01:00')
			place_endTime	 = Time.new(2014, 9, 02, 12, 15, 0, '+01:00')

			expect(timeline.place_belongs_to_timeslot?(place_startTime, place_endTime, current_datetime)).to be true
		end

	end


	context "filling timeslots with places" do

		before do
			timeline.make_timeslots_for(current_datetime)
		end

		it 'should contain places with a startTime value' do
			timeline.get_places

			slot_time = timeline.timeslots[101]['locations'][0]['startTime']
			expect(slot_time).not_to be nil
		end

	end

	context "print our stuff - helper set up" do

		before do
			timeline.make_timeslots_for(current_datetime)
			timeline.get_steps
			timeline.get_places
		end

		xit 'prints' do
			timeline.print_all
		end

	end

end
