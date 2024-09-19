//Maya ASCII 2023 scene
//Name: generic_skeleton.ma
//Last modified: Wed, Jun 19, 2024 01:22:18 PM
//Codeset: 1252
requires maya "2023";
requires -nodeType "HIKSkeletonGeneratorNode" -dataType "HIKCharacter" -dataType "HIKCharacterState"
		 -dataType "HIKEffectorState" -dataType "HIKPropertySetState" "mayaHIK" "1.0_HIK_2018.11";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.1.0";
requires "stereoCamera" "10.0";
requires "Mayatomr" "2013.0 - 3.10.1.11 ";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202202161415-df43006fd3";
fileInfo "osv" "Windows 10 Pro for Workstations v2009 (Build: 19045)";
fileInfo "UUID" "EA1555A9-4FD4-E56D-261F-FE87D4AB5C54";
createNode transform -s -n "persp";
	rename -uid "603DFA5B-49EF-2596-D533-F98D7B63CAFF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -9.0410736073290607 151.05858280243089 162.27934448652996 ;
	setAttr ".r" -type "double3" -368.59974970696391 1080.2527303203785 9.3181219432066122e-18 ;
	setAttr ".rpt" -type "double3" 1.8026926840399155e-14 -5.7197212691068099e-14 1.2641076062960954e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C7A0EF94-4DAC-DA51-AFA8-E08B7C5F8FF5";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 183.12666052965025;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -15.740982037816835 59.81111294920089 1.7992959325716262 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "622B5F94-46D8-7D6E-43FA-4DA649204C57";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "6B7AF34B-42F7-A49A-548E-B09E2E20AB3E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "E289E94A-4253-1068-BA2A-54B874B7A2A2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.44908395292349268 145.45363876675179 1054.8672762069211 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "D8775B3E-4669-25DA-8BCE-CE870A5FACD3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1057.9350801271084;
	setAttr ".ow" 106.19629977972045;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -0.37964937357450879 143.21389514354956 -3.0678039201872345 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "7C5D6819-44A7-D9DB-ADE7-098148AAB6EC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1099.1167958163335 149.49704495765766 4.9656657384891147 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "CE1BBFA8-4914-8F71-35B0-36A489E62B60";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1099.1167958163328;
	setAttr ".ow" 126.89535954722288;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 6.1284310959308641e-13 158.24264959179365 0.76104812592374627 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode joint -n "root";
	rename -uid "88C23334-4FC3-2430-8BB9-A2831096BF47";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "jointTRSData" -ln "jointTRSData" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".jo" -type "double3" -90 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".radi" 3;
	setAttr -k on ".jointTRSData" -type "string" (
		"(dp0&lf;Vupperarm_bicep_l&lf;p1&lf;(dp2&lf;S'rotation'&lf;p3&lf;(F-2.112087093159394e-16&lf;F1.6101558074909054e-14&lf;F-1.948089742396404e-14&lf;tp4&lf;sS'translate'&lf;p5&lf;(F0.4296336514963315&lf;F-3.0014054840172104&lf;F-0.33568228722386095&lf;tp6&lf;sS'scale'&lf;p7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp8&lf;ssVthigh_fwd_r&lf;p9&lf;(dp10&lf;g3&lf;(F-3.2351075555054503e-09&lf;F-3.554814002738346e-09&lf;F4.6893499014910565e-09&lf;tp11&lf;sg5&lf;(F-5.8879919004175605&lf;F7.159845239867742&lf;F-0.8596299999494192&lf;tp12&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp13&lf;ssVupperarm_twist_02_r&lf;p14&lf;(dp15&lf;g3&lf;(F-5.715515410477199e-05&lf;F0.239297380467856&lf;F-0.013684890989370199&lf;tp16&lf;sg5&lf;(F-16.831266561863387&lf;F1.8815802156346706e-05&lf;F-0.00023473533977380612&lf;tp17&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp18&lf;ssVthigh_fwd_l&lf;p19&lf;(dp20&lf;g3&lf;(F-3.0625942677403114e-09&lf;F3.73169190518625e-08&lf;F5.2113571248109e-09&lf;tp21&lf;sg5&lf;(F5.892345071609&lf;F-7.144273484161924&lf;F0.8632194689173218&lf;tp22&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp23&lf;ssVupperarm_twist_02_l&lf;p24&lf;(dp25&lf;g3&lf;(F-5.715515410371704e-05&lf;F0.2392973804688322&lf;F-0.013684890989424315&lf;tp26&lf;sg5&lf;(F16.83153379318587&lf;F1.7763568394002505e-15&lf;F0.0&lf;tp27&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp28&lf;ssVspine_02&lf;p29&lf;(dp30&lf;g3&lf;(F-1.2132853246549658e-20&lf;F-5.763105292111093e-19&lf;F-2.3854160140597598e-15&lf;tp31&lf;sg5&lf;(F4.64819543873827&lf;F0.0&lf;F9.247810850432359e-15&lf;tp32&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp33&lf;ssVspine_03&lf;p34&lf;(dp35&lf;g3&lf;(F3.8839555994523184e-42&lf;F9.390828412829445e-18&lf;F4.739395799433465e-23&lf;tp36&lf;sg5&lf;(F7.10706776307444&lf;F7.105427357601002e-15&lf;F-1.6302063865492045e-14&lf;tp37&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp38&lf;ssVspine_04&lf;p39&lf;(dp40&lf;g3&lf;(F-5.823769558343841e-19&lf;F4.246498636292384e-20&lf;F1.590277269640821e-15&lf;tp41&lf;sg5&lf;(F8.248942899748158&lf;F3.552713678800501e-15&lf;F-2.1010970741031088e-14&lf;tp42&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp43&lf;ssVspine_05&lf;p44&lf;(dp45&lf;g3&lf;(F-1.4559423895859602e-19&lf;F4.659679162086993e-18&lf;F1.4908847995874568e-16&lf;tp46&lf;sg5&lf;(F16.308254953927232&lf;F-7.105427357601002e-15&lf;F2.3062281251373662e-14&lf;tp47&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp48&lf;ssVindex_metacarpal_r&lf;p49&lf;(dp50&lf;g3&lf;(F-4.808104147368675e-15&lf;F2.4351121779955047e-15&lf;F2.2363275104040347e-15&lf;tp51&lf;sg5&lf;(F-3.457892340165678&lf;F-0.010593711576447618&lf;F1.529324513338704&lf;tp52&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp53&lf;ssVupperarm_bicep_r&lf;p54&lf;(dp55&lf;g3&lf;(F3.1557065980145833e-14&lf;F5.367186024969683e-15&lf;F6.361109362927035e-15&lf;tp56&lf;sg5&lf;(F-0.570192043047129&lf;F3.0080906171650774&lf;F0.15133974465763345&lf;tp57&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp58&lf;ssVlowerarm_in_r&lf;p59&lf;(dp60&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp61&lf;sg5&lf;(F-1.5514355804486115&lf;F-0.21415705989632272&lf;F2.2829596952656743&lf;tp62&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp63&lf;ssVwrist_inner_l&lf;p64&lf;(dp65&lf;g3&lf;(F-5.1497652947915144e-14&lf;F-9.541664044390552e-15&lf;F-4.174478019420861e-15&lf;tp66&lf;sg5&lf;(F-0.08634634823715714&lf;F1.6269678363065907&lf;F-0.47525639176425827&lf;tp67&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp68&lf;ssVthigh_out_r&lf;p69&lf;(dp70&lf;g3&lf;(F-1.122660004060381e-09&lf;F7.74599041022121e-09&lf;F1.0052238419628676e-08&lf;tp71&lf;sg5&lf;(F-5.490222724311039&lf;F-1.2357139686785958&lf;F4.529304741894016&lf;tp72&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp73&lf;ssVclavicle_l&lf;p74&lf;(dp75&lf;g3&lf;(F-2.7034714792439897e-14&lf;F6.659286364314223e-15&lf;F359.99999999999994&lf;tp76&lf;sg5&lf;(F5.434344857110261&lf;F0.9364505906511198&lf;F-0.866799571158099&lf;tp77&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp78&lf;ssVupperarm_twist_01_r&lf;p79&lf;(dp80&lf;g3&lf;(F-6.1858806299137406e-15&lf;F-2.4343783062529425e-15&lf;F-9.660793900053754e-15&lf;tp81&lf;sg5&lf;(F-8.639670830686583&lf;F0.09629670980522409&lf;F0.16541554783053414&lf;tp82&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp83&lf;ssVball_r&lf;p84&lf;(dp85&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp86&lf;sg5&lf;(F5.70729832865123&lf;F11.471707953183119&lf;F0.00175755891641316&lf;tp87&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp88&lf;ssVthigh_twistCor_01_r&lf;p89&lf;(dp90&lf;g3&lf;(F-7.966473664013811e-13&lf;F7.136261186895984e-18&lf;F-1.5803581998339445e-10&lf;tp91&lf;sg5&lf;(F-6.110667527536862e-13&lf;F-2.0383694732117874e-13&lf;F7.105427357601002e-15&lf;tp92&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp93&lf;ssVthigh_twistCor_01_l&lf;p94&lf;(dp95&lf;g3&lf;(F-7.679131785889907e-13&lf;F-6.227958139655539e-18&lf;F-1.5803582267887843e-10&lf;tp96&lf;sg5&lf;(F6.252776074688882e-13&lf;F2.0294876890147862e-13&lf;F-1.0658141036401503e-14&lf;tp97&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp98&lf;ssVindex_03_l&lf;p99&lf;(dp100&lf;g3&lf;(F-5.308123295365481e-21&lf;F2.1581542102166356e-40&lf;F4.6590149061444796e-18&lf;tp101&lf;sg5&lf;(F2.3173075307279305&lf;F2.842170943040401e-14&lf;F9.769962616701378e-15&lf;tp102&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp103&lf;ssVball_l&lf;p104&lf;(dp105&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp106&lf;sg5&lf;(F-5.707299374390027&lf;F-11.471697092323957&lf;F-0.0017138404028358423&lf;tp107&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp108&lf;ssVupperarm_twist_01_l&lf;p109&lf;(dp110&lf;g3&lf;(F2.5988450325576927e-15&lf;F1.4877974460841166e-16&lf;F3.2046487033437818e-15&lf;tp111&lf;sg5&lf;(F8.63996069843948&lf;F-0.09628023891043291&lf;F-0.16557725147991675&lf;tp112&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp113&lf;ssVclavicle_r&lf;p114&lf;(dp115&lf;g3&lf;(F180.0&lf;F180.0&lf;F-180.0&lf;tp116&lf;sg5&lf;(F5.433600703058573&lf;F0.9365499957792274&lf;F0.8688515061571342&lf;tp117&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp118&lf;ssVwrist_inner_r&lf;p119&lf;(dp120&lf;g3&lf;(F-1.2709794684129601e-14&lf;F3.1805546814635168e-15&lf;F-3.578124016646457e-15&lf;tp121&lf;sg5&lf;(F0.05073241165543152&lf;F-1.456593948087047&lf;F0.4146242448130657&lf;tp122&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp123&lf;ssVthigh_out_l&lf;p124&lf;(dp125&lf;g3&lf;(F-7.841617927850014e-09&lf;F-1.611360794686607e-08&lf;F-6.402664334885883e-09&lf;tp126&lf;sg5&lf;(F5.488080642544915&lf;F1.2215333393427994&lf;F-4.541695609589556&lf;tp127&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp128&lf;ssVclavicle_out_l&lf;p129&lf;(dp130&lf;g3&lf;(F2.1369351765716433e-15&lf;F-3.0719030044415276e-10&lf;F1.3674210922985612e-14&lf;tp131&lf;sg5&lf;(F10.05977550712825&lf;F0.047623277898917404&lf;F5.124009981794558&lf;tp132&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp133&lf;ssVthigh_l&lf;p134&lf;(dp135&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp136&lf;sg5&lf;(F-3.011926735188311&lf;F-0.06340308345171675&lf;F-10.395847431675032&lf;tp137&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp138&lf;ssVcalf_correctiveRoot_l&lf;p139&lf;(dp140&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp141&lf;sg5&lf;(F7.105427357601002e-15&lf;F-4.440892098500626e-16&lf;F-8.881784197001252e-15&lf;tp142&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp143&lf;ssVclavicle_out_r&lf;p144&lf;(dp145&lf;g3&lf;(F1.5853077242196556e-14&lf;F-1.733539619516481e-08&lf;F-1.1745378447666112e-14&lf;tp146&lf;sg5&lf;(F-10.296855532639404&lf;F0.1711587055647632&lf;F-5.132314944700084&lf;tp147&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp148&lf;ssVfoot_l&lf;p149&lf;(dp150&lf;g3&lf;(F3.1060104311167183e-18&lf;F-3.975696764194372e-15&lf;F-7.450785178706153e-17&lf;tp151&lf;sg5&lf;(F-38.868305766260185&lf;F-1.8835664532534935e-06&lf;F-6.242941395839807e-06&lf;tp152&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp153&lf;ssVthigh_correctiveRoot_l&lf;p154&lf;(dp155&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp156&lf;sg5&lf;(F1.4210854715202004e-14&lf;F2.6645352591003757e-15&lf;F3.552713678800501e-15&lf;tp157&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp158&lf;ssVspine_01&lf;p159&lf;(dp160&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp161&lf;sg5&lf;(F2.303684184416582&lf;F3.552713678800501e-15&lf;F8.632417697329586e-16&lf;tp162&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp163&lf;ssVupperarm_out_r&lf;p164&lf;(dp165&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp166&lf;sg5&lf;(F-0.0015998720624850193&lf;F-0.26206737267851477&lf;F-5.478375142778077&lf;tp167&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp168&lf;ssVmiddle_03_l&lf;p169&lf;(dp170&lf;g3&lf;(F-6.212020862233431e-18&lf;F-7.442292181433567e-17&lf;F3.975754016095629e-16&lf;tp171&lf;sg5&lf;(F2.7046150315646855&lf;F-7.105427357601002e-15&lf;F-7.105427357601002e-15&lf;tp172&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp173&lf;ssVring_02_r&lf;p174&lf;(dp175&lf;g3&lf;(F3.7272125173400593e-17&lf;F-9.93923337957349e-17&lf;F-9.541615512977564e-15&lf;tp176&lf;sg5&lf;(F-3.9621715292690425&lf;F1.5004568538756757e-05&lf;F-4.923994394800957e-05&lf;tp177&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp178&lf;ssVthumb_01_r&lf;p179&lf;(dp180&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp181&lf;sg5&lf;(F-2.4749759005593006&lf;F-1.2059805117236948&lf;F2.2430633666914694&lf;tp182&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp183&lf;ssVthumb_01_l&lf;p184&lf;(dp185&lf;g3&lf;(F-1.3517357396219944e-14&lf;F-7.951386703658789e-15&lf;F3.1805546814635168e-15&lf;tp186&lf;sg5&lf;(F2.4749410357123125&lf;F1.2059493890390485&lf;F-2.242953361528688&lf;tp187&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp188&lf;ssVring_02_l&lf;p189&lf;(dp190&lf;g3&lf;(F2.4848083448933737e-17&lf;F-1.4287647983136886e-16&lf;F-1.272226725726705e-14&lf;tp191&lf;sg5&lf;(F3.962151505953962&lf;F-1.4210854715202004e-14&lf;F-3.907985046680551e-14&lf;tp192&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp193&lf;ssVupperarm_out_l&lf;p194&lf;(dp195&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp196&lf;sg5&lf;(F-0.13826645305934449&lf;F0.26872367525577534&lf;F5.293475235855169&lf;tp197&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp198&lf;ssVmiddle_03_r&lf;p199&lf;(dp200&lf;g3&lf;(F-1.5530052155583591e-18&lf;F-7.454425034680117e-17&lf;F1.5902788573384142e-15&lf;tp201&lf;sg5&lf;(F-2.7046326736289075&lf;F1.1443238847164139e-05&lf;F2.466278816015688e-05&lf;tp202&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp203&lf;ssVankle_fwd_r&lf;p204&lf;(dp205&lf;g3&lf;(F3.602972100095387e-16&lf;F-2.882377680076312e-15&lf;F1.1927080055488187e-14&lf;tp206&lf;sg5&lf;(F-1.6349691499013561&lf;F4.197070299797255&lf;F-0.4635870315139865&lf;tp207&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp208&lf;ssVthigh_correctiveRoot_r&lf;p209&lf;(dp210&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp211&lf;sg5&lf;(F0.0&lf;F-1.7763568394002505e-15&lf;F-5.329070518200751e-15&lf;tp212&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp213&lf;ssVcalf_correctiveRoot_r&lf;p214&lf;(dp215&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp216&lf;sg5&lf;(F7.105427357601002e-15&lf;F-8.881784197001252e-16&lf;F-1.7763568394002505e-15&lf;tp217&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp218&lf;ssVthigh_bck_lwr_l&lf;p219&lf;(dp220&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp221&lf;sg5&lf;(F-5.597656441629496&lf;F9.947071814613224&lf;F1.4709560480788824&lf;tp222&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp223&lf;ssVupperarm_twistCor_01_r&lf;p224&lf;(dp225&lf;g3&lf;(F-5.715515408476811e-05&lf;F0.2392973804678571&lf;F-0.013684890989359285&lf;tp226&lf;sg5&lf;(F0.22332124117612295&lf;F-0.09634080925396127&lf;F-0.16646707192127508&lf;tp227&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp228&lf;ssVhand_r&lf;p229&lf;(dp230&lf;g3&lf;(F-1.9878466759146967e-16&lf;F-4.770832022195275e-15&lf;F-3.1805546814635168e-15&lf;tp231&lf;sg5&lf;(F-24.320337470574643&lf;F-0.0002950651889577216&lf;F0.0003046297929785169&lf;tp232&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp233&lf;ssVthumb_03_l&lf;p234&lf;(dp235&lf;g3&lf;(F-3.416611474228386e-17&lf;F-4.7366659074529904e-17&lf;F-4.246498636292382e-20&lf;tp236&lf;sg5&lf;(F2.5261795391662645&lf;F3.552713678800501e-14&lf;F-4.263256414560601e-14&lf;tp237&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp238&lf;ssVhand_l&lf;p239&lf;(dp240&lf;g3&lf;(F-6.6592863643142385e-15&lf;F-3.1805546814635168e-15&lf;F-3.1805546814635164e-15&lf;tp241&lf;sg5&lf;(F24.32004358863988&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp242&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp243&lf;ssVthumb_03_r&lf;p244&lf;(dp245&lf;g3&lf;(F-2.174207301781701e-17&lf;F-2.348920388532016e-17&lf;F-4.770874487181638e-15&lf;tp246&lf;sg5&lf;(F-2.526164976356057&lf;F-4.6664516247574284e-05&lf;F7.370655225713563e-06&lf;tp247&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp248&lf;ssVupperarm_twistCor_01_l&lf;p249&lf;(dp250&lf;g3&lf;(F-5.7155154111593384e-05&lf;F0.23929738046885052&lf;F-0.013684890989412526&lf;tp251&lf;sg5&lf;(F-0.22347730841758562&lf;F0.09633378358038591&lf;F0.16651206011033537&lf;tp252&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp253&lf;ssVthigh_bck_lwr_r&lf;p254&lf;(dp255&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp256&lf;sg5&lf;(F5.844458568800249&lf;F-10.021941949068122&lf;F-1.8531909603709966&lf;tp257&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp258&lf;ssVupperarm_in_r&lf;p259&lf;(dp260&lf;g3&lf;(F-4.0183257565534246e-10&lf;F-4.683048712998474e-10&lf;F-3.3057467384465757e-10&lf;tp261&lf;sg5&lf;(F-5.2225564187980495&lf;F1.2711843167447734&lf;F3.8834782317378966&lf;tp262&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp263&lf;ssVlowerarm_fwd_r&lf;p264&lf;(dp265&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp266&lf;sg5&lf;(F-1.3920519520020491&lf;F2.2598182327670386&lf;F-0.5667739685873983&lf;tp267&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp268&lf;ssVlowerarm_out_r&lf;p269&lf;(dp270&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp271&lf;sg5&lf;(F-0.6170078789895399&lf;F-1.280766963895374&lf;F-2.1175791102128443&lf;tp272&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp273&lf;ssVankle_bck_r&lf;p274&lf;(dp275&lf;g3&lf;(F-1.8803787149980595e-14&lf;F3.9756933518293936e-15&lf;F-1.1877383888590321e-14&lf;tp276&lf;sg5&lf;(F-0.6507357602611608&lf;F-3.799005098240129&lf;F0.5425226013393445&lf;tp277&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp278&lf;ssVupperarm_bck_r&lf;p279&lf;(dp280&lf;g3&lf;(F-1.631032968523696e-08&lf;F-1.793436243543718e-08&lf;F6.623600521598822e-09&lf;tp281&lf;sg5&lf;(F-1.613973273688245&lf;F-5.899539327146831&lf;F-0.6838130492740362&lf;tp282&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp283&lf;ssVupperarm_bck_l&lf;p284&lf;(dp285&lf;g3&lf;(F-1.631031696301823e-08&lf;F-1.7934362477562443e-08&lf;F6.623600333685193e-09&lf;tp286&lf;sg5&lf;(F1.453320472410553&lf;F5.922331709928633&lf;F0.5193119630590957&lf;tp287&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp288&lf;ssVankle_bck_l&lf;p289&lf;(dp290&lf;g3&lf;(F4.821925894076175e-14&lf;F4.709965190659037e-08&lf;F7.032007635867419e-15&lf;tp291&lf;sg5&lf;(F0.7196897359995171&lf;F3.149843256350702&lf;F-0.1865279959374142&lf;tp292&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp293&lf;ssVlowerarm_fwd_l&lf;p294&lf;(dp295&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp296&lf;sg5&lf;(F1.3286701233338505&lf;F-2.523348037160204&lf;F0.4477197471650243&lf;tp297&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp298&lf;ssVmiddle_01_r&lf;p299&lf;(dp300&lf;g3&lf;(F-2.3854160110976384e-15&lf;F5.665363026356887e-15&lf;F-1.8884543421189624e-14&lf;tp301&lf;sg5&lf;(F-5.182307875635303&lf;F1.2473883217012371e-05&lf;F4.441538994015559e-05&lf;tp302&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp303&lf;ssVcalf_twist_02_l&lf;p304&lf;(dp305&lf;g3&lf;(F-1.2813263656616176e-15&lf;F1.2695893467522358e-18&lf;F-7.368169808403853e-17&lf;tp306&lf;sg5&lf;(F-12.958133997348298&lf;F-0.13437907398599447&lf;F0.11553495636094979&lf;tp307&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp308&lf;ssVlowerarm_twist_01_r&lf;p309&lf;(dp310&lf;g3&lf;(F-1.6743337480238544e-18&lf;F-1.428764306601375e-15&lf;F-1.2424050610833987e-17&lf;tp311&lf;sg5&lf;(F-15.709295982891412&lf;F0.0653041102279559&lf;F0.03263931215387572&lf;tp312&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp313&lf;ssVspine_04_latissimus_r&lf;p314&lf;(dp315&lf;g3&lf;(F-2.1200329155989934e-09&lf;F-2.0738501467058974e-08&lf;F9.430233311509153e-09&lf;tp316&lf;sg5&lf;(F-7.8201672809249345&lf;F3.0343685369015496&lf;F11.943057680552283&lf;tp317&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp318&lf;ssVspine_04_latissimus_l&lf;p319&lf;(dp320&lf;g3&lf;(F5.5057566312661764e-09&lf;F1.6766699921248585e-08&lf;F7.858422271679882e-09&lf;tp321&lf;sg5&lf;(F-7.810114020338162&lf;F3.0346754472192004&lf;F-11.935268925526474&lf;tp322&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp323&lf;ssVlowerarm_twist_01_l&lf;p324&lf;(dp325&lf;g3&lf;(F2.0627063804459095e-16&lf;F1.0062276329226985e-15&lf;F-1.2320628108123222e-17&lf;tp326&lf;sg5&lf;(F15.709011726426546&lf;F-0.06554904986637666&lf;F-0.03229837036940353&lf;tp327&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp328&lf;ssVcalf_twist_02_r&lf;p329&lf;(dp330&lf;g3&lf;(F-1.0969433948738022e-15&lf;F-1.1337156085782787e-17&lf;F-7.38058228600257e-17&lf;tp331&lf;sg5&lf;(F12.958172261711361&lf;F0.13438813926951898&lf;F-0.11546192380812315&lf;tp332&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp333&lf;ssVmiddle_01_l&lf;p334&lf;(dp335&lf;g3&lf;(F-1.5902773407317584e-15&lf;F-2.087239009710433e-15&lf;F2.8966260080954173e-32&lf;tp336&lf;sg5&lf;(F5.182243307643894&lf;F4.263256414560601e-14&lf;F-2.4868995751603507e-14&lf;tp337&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp338&lf;ssVcalf_knee_r&lf;p339&lf;(dp340&lf;g3&lf;(F-9.373939481779854e-15&lf;F-6.433371167720549e-09&lf;F1.1927080056014457e-14&lf;tp341&lf;sg5&lf;(F-0.04499406685729923&lf;F4.304237479045141&lf;F-0.11863616250326992&lf;tp342&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp343&lf;ssVclavicle_scap_r&lf;p344&lf;(dp345&lf;g3&lf;(F-7.2333774824279544e-12&lf;F-5.447464020267169e-09&lf;F2.099599539267737e-08&lf;tp346&lf;sg5&lf;(F-8.497017971073436&lf;F-5.6879741751418536&lf;F2.203234247844506&lf;tp347&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp348&lf;ssVclavicle_pec_l&lf;p349&lf;(dp350&lf;g3&lf;(F5.934906090541604e-09&lf;F-4.328964219255888e-09&lf;F-6.3721458878959175e-09&lf;tp351&lf;sg5&lf;(F-7.859747892191649&lf;F-9.235935633950017&lf;F-9.161680251024567&lf;tp352&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp353&lf;ssVcalf_knee_l&lf;p354&lf;(dp355&lf;g3&lf;(F1.1771779534322956e-14&lf;F-6.4333697762278764e-09&lf;F-6.9574633663623315e-15&lf;tp356&lf;sg5&lf;(F0.04207871964077725&lf;F-4.30754958067433&lf;F0.1160674853346002&lf;tp357&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp358&lf;ssVclavicle_scap_l&lf;p359&lf;(dp360&lf;g3&lf;(F-2.0063835062731552e-11&lf;F-8.936741229731349e-09&lf;F2.0529569357960723e-08&lf;tp361&lf;sg5&lf;(F8.269065264677947&lf;F5.697957688764333&lf;F-2.2342434592936797&lf;tp362&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp363&lf;ssVfoot_r&lf;p364&lf;(dp365&lf;g3&lf;(F3.4942617350063054e-18&lf;F2.2716118211881422e-36&lf;F-7.449571893381498e-17&lf;tp366&lf;sg5&lf;(F38.8683479675059&lf;F4.218847493575595e-15&lf;F-1.7763568394002505e-15&lf;tp367&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp368&lf;ssVupperarm_in_l&lf;p369&lf;(dp370&lf;g3&lf;(F-4.0185802536309686e-10&lf;F-4.683430379560251e-10&lf;F-3.305746816879782e-10&lf;tp371&lf;sg5&lf;(F5.574552996471354&lf;F-1.4832878115397845&lf;F-4.299906325106548&lf;tp372&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp373&lf;ssVlowerarm_out_l&lf;p374&lf;(dp375&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp376&lf;sg5&lf;(F0.5829331297469622&lf;F0.9090844050165288&lf;F1.8502389625441538&lf;tp377&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp378&lf;ssVthumb_02_l&lf;p379&lf;(dp380&lf;g3&lf;(F6.0918383961604464e-33&lf;F7.299124513124281e-17&lf;F9.563794368712256e-15&lf;tp381&lf;sg5&lf;(F4.316671956003702&lf;F0.0&lf;F3.552713678800501e-14&lf;tp382&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp383&lf;ssVankle_fwd_l&lf;p384&lf;(dp385&lf;g3&lf;(F2.4532823392578864e-14&lf;F-3.8486528438178006e-08&lf;F-7.156248041532465e-15&lf;tp386&lf;sg5&lf;(F1.2908153718236504&lf;F-3.768957865912955&lf;F-0.07680916272578031&lf;tp387&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp388&lf;ssVthumb_02_r&lf;p389&lf;(dp390&lf;g3&lf;(F3.975693351829394e-16&lf;F-1.584065319869525e-15&lf;F1.2723383479765737e-14&lf;tp391&lf;sg5&lf;(F-4.316661343859899&lf;F-2.3635732418370026e-05&lf;F-4.3211523554020914e-05&lf;tp392&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp393&lf;ssVindex_metacarpal_l&lf;p394&lf;(dp395&lf;g3&lf;(F-4.708711813572941e-15&lf;F9.939233379573501e-17&lf;F2.4848083448933726e-15&lf;tp396&lf;sg5&lf;(F3.4579468886887668&lf;F0.010562601629231949&lf;F-1.5292670130053594&lf;tp397&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp398&lf;ssVlowerarm_in_l&lf;p399&lf;(dp400&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp401&lf;sg5&lf;(F1.3306420256329048&lf;F0.24547389055802427&lf;F-2.7035021548269356&lf;tp402&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp403&lf;ssVlowerarm_twist_02_r&lf;p404&lf;(dp405&lf;g3&lf;(F-6.721600698588516e-18&lf;F-5.715057220481254e-15&lf;F-3.2583346120769835e-23&lf;tp406&lf;sg5&lf;(F-7.8497274814736855&lf;F0.10257835424635431&lf;F0.03918630802392897&lf;tp407&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp408&lf;ssVcalf_twist_01_l&lf;p409&lf;(dp410&lf;g3&lf;(F-8.492997272584769e-20&lf;F-1.1848489498583718e-23&lf;F-7.454422664982217e-17&lf;tp411&lf;sg5&lf;(F-25.92498684096225&lf;F-0.08807316453161773&lf;F0.10071990957672128&lf;tp412&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp413&lf;ssVupperarm_r&lf;p414&lf;(dp415&lf;g3&lf;(F-1.0933156717530838e-15&lf;F1.2424041724466842e-17&lf;F-1.987846675914698e-15&lf;tp416&lf;sg5&lf;(F-14.246069020159924&lf;F-3.984049673277923e-06&lf;F-0.00038072217765261485&lf;tp417&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp418&lf;ssVcalf_twistCor_02_r&lf;p419&lf;(dp420&lf;g3&lf;(F7.504981906187296e-13&lf;F5.256448295143624e-18&lf;F5.706716964926347e-10&lf;tp421&lf;sg5&lf;(F-1.2789769243681803e-12&lf;F2.353672812205332e-14&lf;F0.0&lf;tp422&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp423&lf;ssVthigh_bck_l&lf;p424&lf;(dp425&lf;g3&lf;(F-3.3281960298549105e-10&lf;F7.492530405354367e-09&lf;F-1.1907707579416888e-10&lf;tp426&lf;sg5&lf;(F3.5690050994295888&lf;F10.405499415408876&lf;F2.1497621859770657&lf;tp427&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp428&lf;ssVindex_02_l&lf;p429&lf;(dp430&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.8825130388958945e-18&lf;F-7.279711947929802e-20&lf;tp431&lf;sg5&lf;(F4.25400585260217&lf;F-2.842170943040401e-14&lf;F-7.105427357601002e-15&lf;tp432&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp433&lf;ssVthigh_bck_r&lf;p434&lf;(dp435&lf;g3&lf;(F4.547938750138404e-10&lf;F1.2473182494297477e-09&lf;F1.8459230383879978e-10&lf;tp436&lf;sg5&lf;(F-3.570662230365997&lf;F-10.412042020771928&lf;F-2.17580140441963&lf;tp437&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp438&lf;ssVindex_02_r&lf;p439&lf;(dp440&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.1060104311167156e-18&lf;F-8.492997272584769e-20&lf;tp441&lf;sg5&lf;(F-4.254001839627506&lf;F2.1309285713755344e-05&lf;F8.939731338131196e-05&lf;tp442&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp443&lf;ssVneck_02&lf;p444&lf;(dp445&lf;g3&lf;(F-2.426570649309934e-19&lf;F-3.727212517340059e-17&lf;F2.84363747966008e-22&lf;tp446&lf;sg5&lf;(F5.450919182046334&lf;F1.4210854715202004e-14&lf;F1.3086753902769033e-14&lf;tp447&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp448&lf;ssVneck_01&lf;p449&lf;(dp450&lf;g3&lf;(F3.1060104311167156e-18&lf;F-1.941256519447947e-18&lf;F-9.541663760026802e-15&lf;tp451&lf;sg5&lf;(F11.10442132885018&lf;F1.4210854715202004e-14&lf;F1.2705114738054135e-14&lf;tp452&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp453&lf;ssVcalf_twist_01_r&lf;p454&lf;(dp455&lf;g3&lf;(F-6.066426623274834e-20&lf;F-1.2424077269935359e-17&lf;F-7.454424442255643e-17&lf;tp456&lf;sg5&lf;(F25.925076009789063&lf;F0.08808086210734589&lf;F-0.10067777201496497&lf;tp457&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp458&lf;ssVupperarm_l&lf;p459&lf;(dp460&lf;g3&lf;(F-3.578124016646457e-15&lf;F-7.454425034680119e-17&lf;F-3.975693351829396e-16&lf;tp461&lf;sg5&lf;(F14.246126391528867&lf;F3.9968028886505635e-15&lf;F-2.842170943040401e-14&lf;tp462&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp463&lf;ssVlowerarm_twist_02_l&lf;p464&lf;(dp465&lf;g3&lf;(F8.251007514582334e-16&lf;F4.01248648404208e-15&lf;F-4.9282568712817974e-17&lf;tp466&lf;sg5&lf;(F7.849649281922929&lf;F-0.10263520133286619&lf;F-0.039097261663499694&lf;tp467&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp468&lf;ssVhead&lf;p469&lf;(dp470&lf;g3&lf;(F-4.6590156466750695e-18&lf;F5.056973233161904e-17&lf;F1.113193759360567e-14&lf;tp471&lf;sg5&lf;(F5.366716115241388&lf;F-7.105427357601002e-15&lf;F3.309852392163748e-14&lf;tp472&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp473&lf;ssVthigh_twist_02_l&lf;p474&lf;(dp475&lf;g3&lf;(F-9.220968467377749e-16&lf;F-4.926728712348722e-17&lf;F2.279365015779531e-18&lf;tp476&lf;sg5&lf;(F-28.47903032534198&lf;F0.17386366818659837&lf;F0.0056687508871462455&lf;tp477&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp478&lf;ssVthigh_fwd_lwr_r&lf;p479&lf;(dp480&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp481&lf;sg5&lf;(F-0.4782982245318834&lf;F6.809431755534755&lf;F-0.7662289287193396&lf;tp482&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp483&lf;ssVring_metacarpal_r&lf;p484&lf;(dp485&lf;g3&lf;(F-6.957463365701443e-16&lf;F4.969616689786745e-16&lf;F-3.1805546814635168e-15&lf;tp486&lf;sg5&lf;(F-2.804780390195006&lf;F-0.22716314349776212&lf;F-1.059677422149715&lf;tp487&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp488&lf;ssVpinky_03_l&lf;p489&lf;(dp490&lf;g3&lf;(F-1.1647539116687691e-18&lf;F3.7344922292879887e-17&lf;F-2.385414873642646e-15&lf;tp491&lf;sg5&lf;(F1.6696361810729314&lf;F-4.973799150320701e-14&lf;F7.105427357601002e-15&lf;tp492&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp493&lf;ssVlowerarm_r&lf;p494&lf;(dp495&lf;g3&lf;(F-1.1181637552020177e-16&lf;F1.2734642767578534e-16&lf;F1.2132853246549658e-19&lf;tp496&lf;sg5&lf;(F-25.246899842795102&lf;F2.8223703232299613e-05&lf;F-0.0003521030096464983&lf;tp497&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp498&lf;ssVpinky_01_r&lf;p499&lf;(dp500&lf;g3&lf;(F1.7393658414253607e-16&lf;F-1.8636062586700284e-17&lf;F-6.359944609015365e-15&lf;tp501&lf;sg5&lf;(F-4.397007478658836&lf;F-4.320010107505823e-05&lf;F-2.742241442632576e-05&lf;tp502&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp503&lf;ssVthigh_twist_01_r&lf;p504&lf;(dp505&lf;g3&lf;(F-2.4265706493099345e-18&lf;F-4.9695017594386094e-17&lf;F1.2430155545048131e-17&lf;tp506&lf;sg5&lf;(F14.287114027195173&lf;F-0.2111677104455696&lf;F-0.0656104539200193&lf;tp507&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp508&lf;ssVclavicle_pec_r&lf;p509&lf;(dp510&lf;g3&lf;(F9.293300890747829e-09&lf;F-5.707670764203161e-09&lf;F-6.492766834151767e-09&lf;tp511&lf;sg5&lf;(F-7.865587754738414&lf;F-9.462906268526464&lf;F9.48653599414189&lf;tp512&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp513&lf;ssVpinky_01_l&lf;p514&lf;(dp515&lf;g3&lf;(F2.4848083448933823e-17&lf;F-1.0094533901129326e-15&lf;F-1.113038837990675e-14&lf;tp516&lf;sg5&lf;(F4.3969685310509234&lf;F-1.4210854715202004e-14&lf;F-6.039613253960852e-14&lf;tp517&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp518&lf;ssVthigh_twist_01_l&lf;p519&lf;(dp520&lf;g3&lf;(F-2.4209895368165213e-16&lf;F-4.9583558853672917e-17&lf;F6.810511763785889e-18&lf;tp521&lf;sg5&lf;(F-14.287183632223432&lf;F0.21116362092060248&lf;F0.06561795810833893&lf;tp522&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp523&lf;ssVlowerarm_l&lf;p524&lf;(dp525&lf;g3&lf;(F-7.454425034680117e-17&lf;F8.386228164015132e-17&lf;F7.279711947929797e-20&lf;tp526&lf;sg5&lf;(F25.247300689778797&lf;F-5.329070518200751e-15&lf;F-4.263256414560601e-14&lf;tp527&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp528&lf;ssVpinky_03_r&lf;p529&lf;(dp530&lf;g3&lf;(F3.8825130388958945e-19&lf;F1.2436174577713411e-17&lf;F3.791516639546773e-22&lf;tp531&lf;sg5&lf;(F-1.669605250518572&lf;F-8.182164268788483e-05&lf;F-2.731165606206787e-05&lf;tp532&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp533&lf;ssVthigh_fwd_lwr_l&lf;p534&lf;(dp535&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp536&lf;sg5&lf;(F0.39812935021383566&lf;F-7.309934383244445&lf;F0.6883540989376549&lf;tp537&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp538&lf;ssVring_metacarpal_l&lf;p539&lf;(dp540&lf;g3&lf;(F1.2827915178708273e-31&lf;F-6.1623246953355635e-15&lf;F-2.3854160110976376e-15&lf;tp541&lf;sg5&lf;(F2.8047746330326007&lf;F0.22714913893837263&lf;F1.0596930230372124&lf;tp542&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp543&lf;ssVlowerarm_bck_r&lf;p544&lf;(dp545&lf;g3&lf;(F2.5444437451708134e-14&lf;F1.821991149690184e-07&lf;F7.600179899673703e-23&lf;tp546&lf;sg5&lf;(F-1.5862762297890214&lf;F-3.40166381371057&lf;F0.8892462340683522&lf;tp547&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp548&lf;ssVlowerarm_correctiveRoot_l&lf;p549&lf;(dp550&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp551&lf;sg5&lf;(F-3.552713678800501e-14&lf;F0.0&lf;F-5.684341886080802e-14&lf;tp552&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp553&lf;ssVpinky_02_l&lf;p554&lf;(dp555&lf;g3&lf;(F1.8636062586700294e-17&lf;F-7.76502607779179e-18&lf;F1.2722218725854067e-14&lf;tp556&lf;sg5&lf;(F2.6964561558300915&lf;F2.842170943040401e-14&lf;F3.552713678800501e-15&lf;tp557&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp558&lf;ssVcalf_twistCor_02_l&lf;p559&lf;(dp560&lf;g3&lf;(F7.786203609148045e-13&lf;F2.2381283947562397e-18&lf;F5.706716775610707e-10&lf;tp561&lf;sg5&lf;(F1.2931877790833823e-12&lf;F-2.3092638912203256e-14&lf;F-5.329070518200751e-15&lf;tp562&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp563&lf;ssVlowerarm_correctiveRoot_r&lf;p564&lf;(dp565&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp566&lf;sg5&lf;(F3.552713678800501e-14&lf;F0.0&lf;F-1.4210854715202004e-14&lf;tp567&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp568&lf;ssVpelvis&lf;p569&lf;(dp570&lf;g3&lf;(F-8.746525374024675e-15&lf;F1.9369081048443843e-14&lf;F-8.348956038841735e-15&lf;tp571&lf;sg5&lf;(F0.00010491341864091094&lf;F-2.2175793100900107&lf;F91.97877241348029&lf;tp572&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp573&lf;ssVlowerarm_bck_l&lf;p574&lf;(dp575&lf;g3&lf;(F0.0&lf;F1.821991149690184e-07&lf;F0.0&lf;tp576&lf;sg5&lf;(F1.3859786452671514&lf;F3.3413824665105096&lf;F-1.1761296577728615&lf;tp577&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp578&lf;ssVthigh_in_r&lf;p579&lf;(dp580&lf;g3&lf;(F-1.799777415242335e-11&lf;F1.7811260677643742e-08&lf;F-1.1301263803149778e-08&lf;tp581&lf;sg5&lf;(F9.68590753589298&lf;F0.7278592457790922&lf;F-8.591039347640994&lf;tp582&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp583&lf;ssVindex_01_l&lf;p584&lf;(dp585&lf;g3&lf;(F5.367186024969684e-15&lf;F-1.5902773407317588e-15&lf;F9.442271710594815e-15&lf;tp586&lf;sg5&lf;(F5.011096571254832&lf;F-4.263256414560601e-14&lf;F-3.552713678800501e-14&lf;tp587&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp588&lf;ssVupperarm_tricep_r&lf;p589&lf;(dp590&lf;g3&lf;(F3.7924387363587275e-14&lf;F6.075963094069785e-09&lf;F-6.5598940285076466e-15&lf;tp591&lf;sg5&lf;(F-0.2668024100145914&lf;F-4.4614700865646535&lf;F-0.06149644816963473&lf;tp592&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp593&lf;ssVthigh_twistCor_02_l&lf;p594&lf;(dp595&lf;g3&lf;(F-9.700266400628902e-13&lf;F4.420414151584964e-17&lf;F-1.9859764446290498e-10&lf;tp596&lf;sg5&lf;(F6.039613253960852e-13&lf;F1.8474111129762605e-13&lf;F-7.105427357601002e-15&lf;tp597&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp598&lf;ssVindex_03_r&lf;p599&lf;(dp600&lf;g3&lf;(F-4.549819967456126e-21&lf;F1.849846171874749e-40&lf;F4.659014165613886e-18&lf;tp601&lf;sg5&lf;(F-2.317379606058509&lf;F-3.482151544176304e-05&lf;F-1.4542190249322573e-05&lf;tp602&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp603&lf;ssVwrist_outer_r&lf;p604&lf;(dp605&lf;g3&lf;(F-2.5456861493432594e-14&lf;F-3.379339349054985e-15&lf;F3.1805546814635168e-15&lf;tp606&lf;sg5&lf;(F-0.03274741621405042&lf;F1.6563393407212317&lf;F0.025852490706835596&lf;tp607&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp608&lf;ssVwrist_outer_l&lf;p609&lf;(dp610&lf;g3&lf;(F-5.783391422739323e-14&lf;F9.34287937679908e-15&lf;F4.373262687012329e-15&lf;tp611&lf;sg5&lf;(F-0.03377910590610611&lf;F-1.4964501513575073&lf;F-0.18007976338952147&lf;tp612&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp613&lf;ssVpinky_metacarpal_r&lf;p614&lf;(dp615&lf;g3&lf;(F1.3914926731402885e-14&lf;F-1.5902773407317588e-15&lf;F1.5902773407317582e-15&lf;tp616&lf;sg5&lf;(F-2.558789946909897&lf;F-0.5003207482651391&lf;F-2.0640128067549632&lf;tp617&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp618&lf;ssVupperarm_tricep_l&lf;p619&lf;(dp620&lf;g3&lf;(F1.2424042072290844e-17&lf;F6.0759658770551315e-09&lf;F6.5598940305191614e-15&lf;tp621&lf;sg5&lf;(F0.11027252258691078&lf;F4.4684969383725015&lf;F-0.13297608266564964&lf;tp622&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp623&lf;ssVthigh_twistCor_02_r&lf;p624&lf;(dp625&lf;g3&lf;(F-9.971666437558038e-13&lf;F7.130715464304176e-18&lf;F-1.9859764570803904e-10&lf;tp626&lf;sg5&lf;(F-6.252776074688882e-13&lf;F-1.829647544582258e-13&lf;F7.105427357601002e-15&lf;tp627&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp628&lf;ssVindex_01_r&lf;p629&lf;(dp630&lf;g3&lf;(F-1.987846675914698e-16&lf;F-1.7241821476758432e-34&lf;F-9.93923337957349e-17&lf;tp631&lf;sg5&lf;(F-5.011125795495047&lf;F1.255617310391699e-05&lf;F-3.957483904848402e-05&lf;tp632&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp633&lf;ssVthigh_in_l&lf;p634&lf;(dp635&lf;g3&lf;(F7.81972953015046e-10&lf;F1.783717115280913e-08&lf;F2.898665566940874e-09&lf;tp636&lf;sg5&lf;(F-9.624813217005851&lf;F-0.7872489589315337&lf;F8.569114048741081&lf;tp637&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp638&lf;ssVmiddle_metacarpal_l&lf;p639&lf;(dp640&lf;g3&lf;(F5.168401357378214e-15&lf;F4.721135855297406e-15&lf;F6.162324695335562e-15&lf;tp641&lf;sg5&lf;(F2.9473948030703525&lf;F-1.4210854715202004e-14&lf;F2.4868995751603507e-14&lf;tp642&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp643&lf;ssVring_01_r&lf;p644&lf;(dp645&lf;g3&lf;(F3.7272125173400585e-16&lf;F-9.939233379573484e-17&lf;F-1.90833280887811e-14&lf;tp646&lf;sg5&lf;(F-4.653074699202811&lf;F-2.4532645610975123e-05&lf;F5.51067713736586e-05&lf;tp647&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp648&lf;ssVupperarm_correctiveRoot_r&lf;p649&lf;(dp650&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp651&lf;sg5&lf;(F1.4210854715202004e-14&lf;F-4.440892098500626e-15&lf;F2.842170943040401e-14&lf;tp652&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp653&lf;ssVcalf_kneeBack_l&lf;p654&lf;(dp655&lf;g3&lf;(F8.63470899849898e-15&lf;F-9.039156283186074e-11&lf;F6.957463365694632e-15&lf;tp656&lf;sg5&lf;(F0.2417278422375233&lf;F4.878562416091983&lf;F0.29022114718005376&lf;tp657&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp658&lf;ssVcalf_kneeBack_r&lf;p659&lf;(dp660&lf;g3&lf;(F-2.35124989635446e-14&lf;F-9.039096647785796e-11&lf;F-1.1330726052695231e-14&lf;tp661&lf;sg5&lf;(F-0.2449349235955367&lf;F-4.883272954147831&lf;F-0.3136576664737962&lf;tp662&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp663&lf;ssVring_01_l&lf;p664&lf;(dp665&lf;g3&lf;(F3.354491265606054e-16&lf;F-3.975693351829396e-16&lf;F-1.9084881093996662e-14&lf;tp666&lf;sg5&lf;(F4.653086398712624&lf;F4.263256414560601e-14&lf;F-1.0658141036401503e-14&lf;tp667&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp668&lf;ssVupperarm_correctiveRoot_l&lf;p669&lf;(dp670&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp671&lf;sg5&lf;(F2.842170943040401e-14&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp672&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp673&lf;ssVmiddle_metacarpal_r&lf;p674&lf;(dp675&lf;g3&lf;(F2.5842006786891076e-15&lf;F3.0811623476677818e-15&lf;F4.721135855297408e-15&lf;tp676&lf;sg5&lf;(F-2.9473407769463975&lf;F-3.6594834583070224e-05&lf;F5.6656297143575785e-05&lf;tp677&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp678&lf;ssVthigh_twist_02_r&lf;p679&lf;(dp680&lf;g3&lf;(F7.939739164542105e-16&lf;F-5.006542507309081e-17&lf;F1.0461552711837454e-17&lf;tp681&lf;sg5&lf;(F28.47895122626658&lf;F-0.17387919837305565&lf;F-0.005720635786287787&lf;tp682&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp683&lf;ssVring_03_r&lf;p684&lf;(dp685&lf;g3&lf;(F-3.1060104311167156e-18&lf;F-1.9897879324341458e-16&lf;F-4.2464986362923846e-20&lf;tp686&lf;sg5&lf;(F-3.0146802324974686&lf;F-4.5867904766794254e-05&lf;F6.070594956142372e-05&lf;tp687&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp688&lf;ssVupperarm_fwd_r&lf;p689&lf;(dp690&lf;g3&lf;(F2.5414619751459016e-11&lf;F-1.8553765734468644e-11&lf;F6.818250487293744e-10&lf;tp691&lf;sg5&lf;(F-3.1383986238786576&lf;F6.085192473500279&lf;F0.3701752564989107&lf;tp692&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp693&lf;ssVcalf_r&lf;p694&lf;(dp695&lf;g3&lf;(F7.765026077791785e-19&lf;F-7.453211749355463e-17&lf;F5.963577942910489e-16&lf;tp696&lf;sg5&lf;(F42.6392716823317&lf;F-1.7763568394002505e-15&lf;F1.2434497875801753e-14&lf;tp697&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp698&lf;ssVupperarm_twistCor_02_r&lf;p699&lf;(dp700&lf;g3&lf;(F-5.7155154104789345e-05&lf;F0.2392973804678591&lf;F-0.01368489098937418&lf;tp701&lf;sg5&lf;(F-4.263256414560601e-14&lf;F7.105427357601002e-15&lf;F5.684341886080802e-14&lf;tp702&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp703&lf;ssVmiddle_02_r&lf;p704&lf;(dp705&lf;g3&lf;(F-7.45442503468011e-17&lf;F4.080521203879585e-16&lf;F2.2263640113179687e-14&lf;tp706&lf;sg5&lf;(F-4.584910207198277&lf;F-3.1438676543871225e-05&lf;F-3.066261484363508e-05&lf;tp707&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp708&lf;ssVpinky_metacarpal_l&lf;p709&lf;(dp710&lf;g3&lf;(F-3.180554681463515e-15&lf;F1.3318572728628474e-14&lf;F3.180554681463515e-15&lf;tp711&lf;sg5&lf;(F2.558828022670248&lf;F0.5003618244700903&lf;F2.064049345253842&lf;tp712&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp713&lf;ssVthigh_r&lf;p714&lf;(dp715&lf;g3&lf;(F-3.620782510119271e-33&lf;F-2.3854160110976376e-15&lf;F1.7393658414253607e-16&lf;tp716&lf;sg5&lf;(F-3.012337184531063&lf;F-0.06336612202783964&lf;F10.395765560224552&lf;tp717&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp718&lf;ssVmiddle_02_l&lf;p719&lf;(dp720&lf;g3&lf;(F-8.696829207126799e-17&lf;F4.158171464657503e-16&lf;F1.9082854907504484e-14&lf;tp721&lf;sg5&lf;(F4.58496782082122&lf;F-1.4210854715202004e-14&lf;F-2.842170943040401e-14&lf;tp722&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp723&lf;ssVpinky_02_r&lf;p724&lf;(dp725&lf;g3&lf;(F1.2424041724466862e-17&lf;F-7.765026077791789e-17&lf;F-9.706282597239736e-20&lf;tp726&lf;sg5&lf;(F-2.696477533033118&lf;F3.068206100920179e-05&lf;F5.3911045487353704e-05&lf;tp727&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp728&lf;ssVupperarm_twistCor_02_l&lf;p729&lf;(dp730&lf;g3&lf;(F-5.715515410377221e-05&lf;F0.23929738046881302&lf;F-0.013684890989438625&lf;tp731&lf;sg5&lf;(F8.526512829121202e-14&lf;F7.105427357601002e-15&lf;F-4.263256414560601e-14&lf;tp732&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp733&lf;ssVcalf_l&lf;p734&lf;(dp735&lf;g3&lf;(F2.717759127227125e-18&lf;F-7.451998464030805e-17&lf;F5.963555193810652e-16&lf;tp736&lf;sg5&lf;(F-42.63936190162267&lf;F-7.829074149423576e-06&lf;F-4.4586872256502375e-05&lf;tp737&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp738&lf;ssVring_03_l&lf;p739&lf;(dp740&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp741&lf;sg5&lf;(F3.0147511882823608&lf;F-4.973799150320701e-14&lf;F-1.0658141036401503e-14&lf;tp742&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp743&lf;ssVupperarm_fwd_l&lf;p744&lf;(dp745&lf;g3&lf;(F2.5408755603765092e-11&lf;F-1.8548994902446404e-11&lf;F6.818210730360224e-10&lf;tp746&lf;sg5&lf;(F2.998532437400442&lf;F-6.078429423751953&lf;F-0.5550002675375794&lf;tp747&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp748&lf;ss.");
	setAttr ".fbxID" 2;
createNode joint -n "pelvis" -p "root";
	rename -uid "6F2EB037-4A2C-8937-22D4-11AAA7D35CA7";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 2.9500488819890415e-15 -1.2126020492035607 106.91807643174158 ;
	setAttr ".r" -type "double3" -90 -86.366893033762679 90 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -90 -86.366893033762693 90 ;
	setAttr ".bps" -type "matrix" -6.1629758220391547e-33 0.99799027985102462 -0.063367194374323074 0
		 3.8518598887744717e-34 -0.063367194374323241 -0.99799027985102462 0 -1 0 0 0 2.9500488819890411e-15 106.91807643174155 1.2126020492035534 1;
	setAttr ".radi" 16.1;
	setAttr ".fbxID" 5;
createNode joint -n "spine_01" -p "pelvis";
	rename -uid "B477AE98-42E6-DEA0-3395-2DAA7852B55F";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 6.1017875939995605 -0.15395801327480996 3.6258441666402254e-15 ;
	setAttr ".r" -type "double3" 0 0 -3.6331069662373134 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -5.11446313490159e-18 2.6785676085956377e-16 -3.6331069662372117 ;
	setAttr ".bps" -type "matrix" 0 0.99999999999999978 -1.3877787807814457e-17 0 0 -1.3877787807814457e-17 -0.99999999999999978 0
		 -1 0 0 0 -6.7579528465118387e-16 113.01735702762139 0.97959748945719227 1;
	setAttr ".radi" 7.5;
	setAttr ".fbxID" 5;
createNode joint -n "spine_02" -p "spine_01";
	rename -uid "F2AB8F89-4FF5-A914-18BA-2D9FA5FAFE08";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 7.1064128537484663 1.7208456881689926e-14 2.1839356133292227e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 1 -1.3877787807814457e-17 0 0 -1.387778780781446e-17 -1 0
		 -1 0 0 0 -2.8597308979804067e-15 120.12376988136985 0.97959748945717418 1;
	setAttr ".radi" 8;
	setAttr ".fbxID" 5;
createNode joint -n "spine_03" -p "spine_02";
	rename -uid "51F0FA32-4174-27B4-B1B3-7A8896DFDB4E";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 7.1064128537483242 -1.787459069646502e-14 2.1212619842216188e-15 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -6.1629758220391547e-33 1.0000000000000002 -7.8062556418956319e-18 0
		 6.8422776578360209e-49 -1.3877787807814463e-17 -1.0000000000000002 0 -1 0 0 0 -4.9809928822020255e-15 127.23018273511818 0.97959748945719283 1;
	setAttr ".radi" 7;
	setAttr ".fbxID" 5;
createNode joint -n "spine_04" -p "spine_03";
	rename -uid "D2071622-4B37-509D-D56B-ECBD965DD358";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 7.1064128537484521 -4.3076653355456074e-14 -2.7678297188432797e-15 ;
	setAttr ".r" -type "double3" 0.00044952872063832081 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0.0004495287206352986 0 0 ;
	setAttr ".bps" -type "matrix" -2.6469779604778374e-23 1.0000000000000002 -1.3877787807814457e-17 0
		 -7.8457562573359904e-06 -1.3877787807387335e-17 -0.9999999999692224 0 -0.99999999996922351 1.0888174053114146e-22 7.8457562573359938e-06 0
		 -2.2131655343496217e-15 134.33659558886663 0.97959748945723579 1;
	setAttr ".radi" 6.7;
	setAttr ".fbxID" 5;
createNode joint -n "spine_05" -p "spine_04";
	rename -uid "4373B447-40AB-9747-8FFF-74B0CD94CA2F";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 7.312948481804284 -1.7817312603085611e-07 8.0897561802076128e-13 ;
	setAttr ".r" -type "double3" -0.00044949784304784332 5.3458970050150924e-06 0.68139039711082428 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -0.00044949784306500727 5.3458969565744386e-06 0.6813903971109333 ;
	setAttr ".bps" -type "matrix" 7.3301872589872996e-16 0.99992928498490574 -0.011892225593855044 1.7347234759768071e-18
		 1.5897264914175083e-11 -0.011892225593855067 -0.99992928498490585 1.3552527156068805e-20
		 -1 -1.8832089380684578e-13 -1.5896149454792788e-11 1.9721522630525295e-31 5.8671413636738365e-13 141.64954407067091 0.9795976676303606 0.99999999999999967;
	setAttr ".radi" 13.400000000000002;
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_r" -p "spine_05";
	rename -uid "40DF0B42-4FAA-C60D-7D26-8380F419E592";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 4.3323280789503542 0.049366482935349509 1.905946418756832 ;
	setAttr ".r" -type "double3" 163.2635851045556 80.83122589010857 -17.422298381375768 ;
	setAttr ".jo" -type "double3" -4.2448485682508546e-15 -6.5459230760914505e-16 -3.7769086842379268e-15 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 163.26358510455566 80.83122589010857 -17.422298381375725 ;
	setAttr ".bps" -type "matrix" 0.98722325285176937 0.15258975100903038 0.045897896637834619 0
		 -0.045885930531751475 -0.0036017891527181825 0.99894019265126055 0 0.15259334981579856 -0.98828305409022354 0.0034459527112244573 0
		 -1.9059464187554682 145.98097871162366 0.87871365275482949 1;
	setAttr ".radi" 3;
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_r" -p "clavicle_r";
	rename -uid "833DF723-4E2D-41D3-0160-898221F68EC2";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -10.245099123158054 -1.3422635037096371 -4.543666804661882 ;
	setAttr ".r" -type "double3" -5.9285401695442088 38.307071622633075 2.4880274942962624 ;
	setAttr ".jo" -type "double3" 1.3467661229322084e-14 3.3513852551749361e-15 -3.975693351829396e-16 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -5.9285400690010865 38.307071635849979 2.4880276564950274 ;
	setAttr ".bps" -type "matrix" 0.67779167307678623 0.73211442511890967 0.067874269355806954 -8.6736173798840355e-19
		 -0.1636125347794978 0.060182237351532969 0.98468727866789874 -5.4210108624275222e-20
		 0.71681893555541576 -0.6785179193213533 0.1605741161863399 8.6736173798840355e-19
		 -12.65188882919203 144.38312290130327 -0.94801307177313876 0.99999999999999989;
	setAttr ".radi" 6.4999999999999991;
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_r" -p "upperarm_r";
	rename -uid "B27C3B08-4082-778B-7D9A-DAA086146EAF";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -24.985365366661767 -7.1054273576010019e-15 -2.5096966282944777e-08 ;
	setAttr ".r" -type "double3" -4.0915758420175485e-07 -2.674607591988697e-15 -18.075153072333308 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 2.2692638655707856e-14 -3.8378413299554278e-09 -18.075153807225202 ;
	setAttr ".bps" -type "matrix" 0.69510601713505227 0.67731245574360688 -0.24098851059170739 0
		 0.054756173824007826 0.28436116200070011 0.95715228201878422 0 0.71681893555541576 -0.67851791932135108 0.16057411618634004 0
		 -29.586761441486502 126.09097651653258 -2.6438764946531021 1;
	setAttr ".radi" 8.3;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_02_r" -p "lowerarm_r";
	rename -uid "AA95C54C-4E21-A1CF-5F5C-E199B18831C3";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -9.0836620330810263 9.5923269327613525e-14 -4.9788170031206391e-08 ;
	setAttr ".r" -type "double3" 1.2856771001042597 -1.7275331319018923 1.9858280738917116 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2856771001042713 -1.7275331319019243 1.9858280738917142 ;
	setAttr ".bps" -type "matrix" 0.71787901194537207 0.66599231968131367 -0.20274110173774754 0
		 0.046233629773318671 0.24497251172795709 0.96842703389345708 0 0.69463096366799004 -0.7045868992702029 0.1450693823330223 0
		 -35.900869613991439 119.93849911154371 -0.45481831857706001 1;
	setAttr ".radi" 9.5;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_r" -p "lowerarm_r";
	rename -uid "CB91045C-438D-7849-A46B-FD8CF07F4D5D";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -18.167304992675696 8.8817841970012523e-14 -9.9576382694976928e-08 ;
	setAttr ".r" -type "double3" 1.2856771234272952 -1.7275255552831137 1.9858281585699871 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2856771234272997 -1.7275255552831468 1.9858281585699809 ;
	setAttr ".bps" -type "matrix" 0.7178789200206942 0.66599241248856966 -0.20274112236439082 0
		 0.046233631156798211 0.24497251240220427 0.96842703365685123 0 0.69463105857712559 -0.70458681131213874 0.14506935508582813 0
		 -42.214964528401374 113.78603462526465 1.7342352610077956 1;
	setAttr ".radi" 7.2;
	setAttr ".fbxID" 5;
createNode joint -n "hand_r" -p "lowerarm_r";
	rename -uid "7940FD34-4AA8-870F-50C3-B9B58E07B483";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -27.251010894775362 4.6185277824406512e-14 2.6822306153917452e-08 ;
	setAttr ".r" -type "double3" -80.518423862920073 1.3823065841855855 -0.79371355688128564 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -80.518423861804166 1.3823065842010229 -0.79371355685436928 ;
	setAttr ".bps" -type "matrix" 0.67678661503287874 0.68948062150301725 -0.2580239335490967 0
		 -0.71273477411195696 0.70141706061181441 0.0048217065714997211 0 0.18430686228112847 0.18063936352438706 0.96612649319930688 0
		 -48.529103068231102 107.63352738769706 3.9233040373042609 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_metacarpal_r" -p "hand_r";
	rename -uid "D865EF58-4582-C29E-1184-C1BB1E5F1B78";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -3.3146772399041353 0.30593533141113483 -2.391286850746928 ;
	setAttr ".r" -type "double3" -27.769049137300872 -19.527703081530461 11.850627662525106 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -27.76904913737469 -19.52770308209233 11.850627659178704 ;
	setAttr ".bps" -type "matrix" 0.54792083769858846 0.83211082661588875 0.085873906655628746 0
		 -0.74076070201262489 0.53032371248947952 -0.41234735639402276 0 -0.38865966856549461 0.16232169355942133 0.90697041287495272 0
		 -51.431213582953745 105.13074939041849 2.4697596482421376 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_r" -p "pinky_metacarpal_r";
	rename -uid "0DBE6E9F-44F3-50E2-7687-66B00554FCC2";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -3.8750499018763378 -0.35138326677189013 0.064411754382085462 ;
	setAttr ".r" -type "double3" 12.449650524624051 8.1419583732569603 -7.495282562605694 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 12.449650505089073 8.1419577848517477 -7.4952827129175565 ;
	setAttr ".bps" -type "matrix" 0.68846205257286242 0.72521555507253355 0.0090774912832868315 0
		 -0.71077602272477181 0.67713848102938579 -0.19047551818743214 0 -0.14428252730914939 0.12468310306554585 0.98164997637815454 0
		 -53.319177507054093 101.73038695990559 2.3403054912828933 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_r" -p "pinky_01_r";
	rename -uid "89878C9A-41E3-55EE-73A0-1EBA01785EBB";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -3.345622698080696 3.03660256264493e-05 3.2629206600631733e-05 ;
	setAttr ".r" -type "double3" 1.1796615102634179e-15 -6.2176298082817214e-16 2.4545443385392729 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2210902234567542e-14 -2.4003660218695943e-14 2.4545443385392689 ;
	setAttr ".bps" -type "matrix" 0.65739015052080074 0.75354983828738387 0.00091171009484856957 0
		 -0.73960850611084983 0.6454585695666345 -0.19068951901316439 0 -0.14428252730914934 0.12468310306554667 0.98164997637815432 0
		 -55.622538068176382 99.304113968168991 2.3099618768793029 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_r" -p "pinky_02_r";
	rename -uid "F25C9645-402F-B93D-5E33-2A832602DBA9";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -1.9787311726573478 -1.7523876721270426e-05 -3.1002964579585068e-05 ;
	setAttr ".r" -type "double3" 1.7074217099476524e-06 -2.3703923396862446e-16 6.429712020674045 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.7074217060342507e-06 -2.7373565703274962e-14 6.4297120206740797 ;
	setAttr ".bps" -type "matrix" 0.57043064409331334 0.82109119432453204 -0.020448248873665729 0
		 -0.80857370693445074 0.55701290698861206 -0.18959214620436657 3.4694469519536142e-18
		 -0.14428250321354746 0.12468308646648921 0.98164998202802656 2.1684043449710089e-19
		 -56.923319017615462 97.813026236516521 2.3081307552544112 0.99999999999999978;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "ring_metacarpal_r" -p "hand_r";
	rename -uid "F5EBC5DF-4AF9-F2C8-4AC5-24B6EF14EA8A";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -3.3742079734802459 0.54299175739282646 -1.0917816162109872 ;
	setAttr ".r" -type "double3" -13.299834889366362 -11.809318654920929 -1.5945633604277851 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -13.299834889366398 -11.809318654920911 -1.5945633604277225 ;
	setAttr ".bps" -type "matrix" 0.71933799829637435 0.69248954177435051 -0.054873297150026007 0
		 -0.68373968065412516 0.69186534984082992 -0.23199652322528688 0 -0.12269023313189883 0.20440296529839402 0.97116761399423968 0
		 -51.400953812549758 105.49072132320831 3.7417494539498373 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_r" -p "ring_metacarpal_r";
	rename -uid "09047EB1-4688-0BF2-5208-B5BA0944B552";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -4.1776169446007003 -0.51780591948947574 0.14500821420176635 ;
	setAttr ".r" -type "double3" 10.91580714538143 3.2551461209517027 4.613196856697515 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 10.915807118427876 3.2551455163759124 4.6131968089078956 ;
	setAttr ".bps" -type "matrix" 0.66791399412771846 0.73308189319300077 -0.12838159650402989 0
		 -0.74207941164644742 0.66912302716166772 -0.039906407160614471 0 0.056648417972790036 0.12192338739787519 0.99092161362370512 0
		 -54.069819060701789 102.26915341487128 4.2319455243528017 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_r" -p "ring_01_r";
	rename -uid "9BC2342A-47A1-4333-36BE-54B4629FC882";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -3.9758372396752435 -2.0846833564291956e-05 -2.3612021326613331e-05 ;
	setAttr ".r" -type "double3" 7.7847557526590567e-16 8.1145966562538007e-16 -2.3769246363109739 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -1.236974769535641e-14 -1.7122145119756626e-14 -2.3769246363109189 ;
	setAttr ".bps" -type "matrix" 0.69811578462239599 0.70470044489998518 -0.12661608988915721 0
		 -0.71374036455999623 0.69895062097632576 -0.045196475908782396 0 0.056648417972790063 0.12192338739787524 0.99092161362370557 0
		 -56.725322259032623 99.354522296228851 4.742347290882452 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_r" -p "ring_02_r";
	rename -uid "0012DDBC-449A-E6EA-0975-2EA1F3246163";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.3413558190788173 5.0017570217164575e-05 -1.122148838028636e-05 ;
	setAttr ".r" -type "double3" 3.4421377323164772e-17 3.9607643840675604e-16 9.9337235588726767 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -4.6317016388325741e-14 -1.8657148421806758e-14 9.9337235588726411 ;
	setAttr ".bps" -type "matrix" 0.56452304475794113 0.81471074581573588 -0.13251465047152391 0
		 -0.82347112194563521 0.56690483174673623 -0.022676487025157049 0 0.056648417972790056 0.12192338739787523 0.99092161362370546 0
		 -58.359896048987473 97.704601400504728 5.038787229500155 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "middle_metacarpal_r" -p "hand_r";
	rename -uid "9174650D-48D4-6C21-0369-36A9D6F29E0A";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -3.3758001327514648 0.7540039420127016 0.18280552327627575 ;
	setAttr ".r" -type "double3" -4.2725003027381527 -0.13075114456697606 -2.3183915821069832 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999933 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -4.2725003027381421 -0.1307511445669825 -2.3183915821069596 ;
	setAttr ".bps" -type "matrix" 0.70548331984802271 0.66095266915715378 -0.2558023740121379 0
		 -0.69648163947271235 0.71336369083942031 -0.077624548110516112 0 0.13117397338502093 0.23292448073569544 0.96360758350087372 0
		 -51.317511929990658 105.86787171616714 4.9745901113348481 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_r" -p "middle_metacarpal_r";
	rename -uid "DFF44BA5-44A5-6FAB-6DE8-E7BDE50B9C2B";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -4.4404035511891102 -0.47697989864840906 0.53759891364656198 ;
	setAttr ".r" -type "double3" 9.6604625131611712 1.0290200904220737 1.5828162789426097 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 9.6604625063251319 1.0290194857228918 1.5828163304738119 ;
	setAttr ".bps" -type "matrix" 0.6835096734435685 0.67611211759553658 -0.27511257831939412 0
		 -0.68147768431941269 0.72611272948401817 0.091369961452981679 0 0.26153908328147879 0.12503083028496498 0.95706039485214123 0
		 -54.047415841351857 102.71793494372298 6.6655156204629948 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_r" -p "middle_01_r";
	rename -uid "C9E8308A-4220-178B-E902-A7935BF7E96A";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -3.9831755708971848 -7.7438591645773158e-05 -3.705282881139027e-05 ;
	setAttr ".r" -type "double3" -1.1225879950132517e-16 -1.1162177270457428e-15 2.195775797722145 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -1.9103237532971665e-14 -8.5605184412184254e-16 2.1957757977222272 ;
	setAttr ".bps" -type "matrix" 0.656897572866038 0.7034360607963448 -0.27140981399726055 0
		 -0.70716538849055022 0.6996749244110243 0.10184357354019197 0 0.26153908328147879 0.12503083028496498 0.95706039485214123 0
		 -56.769911793174948 100.02480081183569 7.7612947843152469 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_r" -p "middle_02_r";
	rename -uid "E15E3855-4231-4314-E5CA-6B932492857C";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.782915984605804 4.5777305800243084e-05 3.4382665350385366e-05 ;
	setAttr ".r" -type "double3" 9.2795734617800982e-16 1.5166155377122963e-15 9.7915430264775836 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -1.3462801374081494e-14 -8.102149618782096e-15 9.7915430264775978 ;
	setAttr ".bps" -type "matrix" 0.52706514380669856 0.8121786661502155 -0.25013625973552756 0
		 -0.80857877915531973 0.56985358271112818 0.14651707126128602 0 0.26153908328147885 0.12503083028496501 0.95706039485214145 0
		 -58.598025928668029 98.067233682223588 8.5166430624787886 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "index_metacarpal_r" -p "hand_r";
	rename -uid "71F588A1-45ED-76B6-269B-E585C4BFB5E9";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -2.6599845153329866 -0.4159588290877565 1.9767106018318614 ;
	setAttr ".r" -type "double3" 2.8589134972822929 10.949657534541346 -4.8681894004995243 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999967 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 2.8589134972822849 10.949657534541382 -4.8681894004995163 ;
	setAttr ".bps" -type "matrix" 0.68644407301824217 0.58173328566754456 -0.43632661959198482 0
		 -0.63592959937283522 0.77124623364528644 0.027799131811360935 0 0.35268694228682596 0.25839046312587288 0.89935882121985478 0
		 -49.668555333651888 105.86483073662932 6.5173905555281664 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "index_01_r" -p "index_metacarpal_r";
	rename -uid "63B1BEDD-4F98-0628-B71D-35B05EF9B31F";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -4.988095809480626 -0.11433259102436466 -0.035673193551023274 ;
	setAttr ".r" -type "double3" 7.7095352302054057 2.2085942583385165 3.1616993306019334 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 7.7095352147893017 2.2085936659980003 3.1616994614283067 ;
	setAttr ".bps" -type "matrix" 0.63625026771310822 0.61296430997845186 -0.46846595556949344 0
		 -0.6160997953676417 0.76917702121868814 0.16966953815313068 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -53.032478128466728 102.86569317894235 8.658568190210385 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "index_02_r" -p "index_01_r";
	rename -uid "1FD8A345-4E0A-1A6F-2399-7CBD82F910CB";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -3.8498719637272778 5.0402060054466347e-06 3.2097038927370036e-05 ;
	setAttr ".r" -type "double3" 1.9410449634517606e-16 -7.6464185044580551e-16 3.7578394589543045 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2491269331077331e-14 -7.2486669780488591e-15 3.7578394589543347 ;
	setAttr ".bps" -type "matrix" 0.59450333633130881 0.6620580158324737 -0.45633865359282294 0
		 -0.65647478558433181 0.72734979133164102 0.20000784220081153 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -55.481948397552941 100.50586874295713 10.46213082298447 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "index_03_r" -p "index_02_r";
	rename -uid "19DDC0E6-41D2-8465-15AB-93A22A56C59F";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.6011178677174414 3.9602186006959528e-05 -3.5662756940890716e-06 ;
	setAttr ".r" -type "double3" -7.904002373761755e-16 8.6677389594424594e-17 12.516400997546942 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 8.5625511962899714e-15 1.9726926078464731e-14 12.516400997546949 ;
	setAttr ".bps" -type "matrix" 0.43810377078590867 0.80395412349158568 -0.40214780037200681 0
		 -0.76971322389589969 0.56658300592154154 0.29415174716579817 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -57.028349301883779 98.783805968834287 11.649126277232277 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_r" -p "hand_r";
	rename -uid "24A3065C-4A0A-C8EC-6B0C-128418BAB63E";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.91760942893500896 -1.1014244062153153 1.7308490315452705 ;
	setAttr ".r" -type "double3" 110.15515592090108 52.745224191819936 38.906255542872799 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 110.15515528066339 52.745223734836749 38.906255129853179 ;
	setAttr ".bps" -type "matrix" -0.098859837651763482 0.4476931238833054 -0.88870557516371662 1.7347234759768071e-18
		 0.50135337936013902 0.79385822750321677 0.34414227236656025 0 0.85957636164778106 -0.41153369418925956 -0.30293315606467724 -5.2041704279304213e-18
		 -48.046098018110449 106.54095506625927 5.8269775914265249 0.99999999999999978;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_r" -p "thumb_01_r";
	rename -uid "C5EC04D1-43A4-EA11-3A83-779D10F1113C";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -3.700862493968323 0.00042712956198442953 -0.00013574546017025568 ;
	setAttr ".r" -type "double3" -5.5589128500984391 -5.9252221960709157 9.4939977242717717 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -5.5589128500984648 -5.9252221960709353 9.4939977242717326 ;
	setAttr ".bps" -type "matrix" 0.074003171099619319 0.52696198943214512 -0.84666084848711132 0
		 0.425420739570746 0.7511821419532263 0.50472030269610058 0 0.90196492449001675 -0.3975379872468553 -0.16859069869195153 0
		 -47.68013389352484 104.88449931941965 9.1161428378692566 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_r" -p "thumb_02_r";
	rename -uid "CE6C9729-40EF-A750-5ED8-BF8F48576390";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -3.6035981314329035 -1.485116083443927e-05 4.5825581750591482e-05 ;
	setAttr ".r" -type "double3" -6.3870719926475835e-14 1.8195487894792498e-14 -1.5961076220386874 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 6.7909245024239074e-17 -4.8751869239822535e-15 -1.5961076220386687 ;
	setAttr ".bps" -type "matrix" 0.062124904019716348 0.5058343084168645 -0.86039069539888147 8.6736173798840355e-19
		 0.42731694477315196 0.76556854763251214 0.48094181309757866 2.6020852139652106e-18
		 0.90196492449001786 -0.39753798724685613 -0.16859069869195137 -5.6378512969246231e-18
		 -47.946776567543893 102.98551070562957 12.167153067985568 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "weapon_r" -p "hand_r";
	rename -uid "0C56D920-4A66-ACEE-8E16-EDAF22ECE298";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -4.2750354736808136 -3.1827133011595707 0.3092436132237133 ;
	setAttr ".r" -type "double3" -80.518423862920073 1.3823065841855855 -0.79371355688128564 ;
	setAttr ".jo" -type "double3" 80.51972042519219 -1.0105617424208884 -1.232701509868418 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -80.518423861804166 1.3823065842010229 -0.79371355685436928 ;
	setAttr ".bps" -type "matrix" 0.67678661503287874 0.68948062150301725 -0.2580239335490967 0
		 -0.71273477411195696 0.70141706061181441 0.0048217065714997211 0 0.18430686228112847 0.18063936352438706 0.96612649319930688 0
		 -48.529103068231102 107.63352738769706 3.9233040373042609 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_02_r" -p "upperarm_r";
	rename -uid "68D2E8A6-4DAF-C84B-A12E-34875CD96306";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -6.9423561073714044 -1.3114509478384662e-15 -6.9460062701587333e-14 ;
	setAttr ".jo" -type "double3" 0 -4.3732626870123352e-15 -18.075153072333308 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2856771001042713 -1.7275331319019243 1.9858280738917142 ;
	setAttr ".bps" -type "matrix" 0.71787901194537207 0.66599231968131367 -0.20274110173774754 0
		 0.046233629773318671 0.24497251172795709 0.96842703389345708 0 0.69463096366799004 -0.7045868992702029 0.1450693823330223 0
		 -35.900869613991439 119.93849911154371 -0.45481831857706001 1;
	setAttr ".radi" 9.5;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_01_r" -p "upperarm_r";
	rename -uid "6E8FD4B7-4ACD-9EDF-2716-10A4980FB692";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -15.639978137258215 2.0816681711721685e-17 -5.5724522218802974e-14 ;
	setAttr ".jo" -type "double3" 0 -4.3732626870123352e-15 -18.075153072333308 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.2856771234272997 -1.7275255552831468 1.9858281585699809 ;
	setAttr ".bps" -type "matrix" 0.7178789200206942 0.66599241248856966 -0.20274112236439082 0
		 0.046233631156798211 0.24497251240220427 0.96842703365685123 0 0.69463105857712559 -0.70458681131213874 0.14506935508582813 0
		 -42.214964528401374 113.78603462526465 1.7342352610077956 1;
	setAttr ".radi" 7.2;
	setAttr ".fbxID" 5;
createNode joint -n "neck_01" -p "spine_05";
	rename -uid "0E05D530-435A-EF9C-8174-0D815B6AE865";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 5.2855761761029498 0.054372259906909193 8.6477981315573629e-13 ;
	setAttr ".r" -type "double3" -3.1805546725771426e-15 9.5416640473526757e-15 1.0672179165642563e-07 ;
	setAttr ".jo" -type "double3" -4.2448485682508546e-15 -6.5459230760914505e-16 -3.7769086842379268e-15 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 2.7011220729498483e-15 9.368993548731956e-12 1.067217065765879e-07 ;
	setAttr ".bps" -type "matrix" 7.3301872589903683e-16 0.99992928498490652 -0.011892225593855069 2.6020852139652106e-18
		 1.5897264914175086e-11 -0.011892225593855069 -0.9999292849849053 0 -1 -1.8832089380684596e-13 -1.5896149454792788e-11 0
		 5.9017897181357096e-13 149.72307038660816 0.8623719883789096 0.99999999999999978;
	setAttr ".radi" 6.8000000000000007;
	setAttr ".fbxID" 5;
createNode joint -n "neck_02" -p "neck_01";
	rename -uid "484F680A-4299-6542-8D97-CFA0EE25DD63";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -k true -sn "control" -ln "control" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 4.3156507682084282 -6.616929226765933e-14 -4.157853352209275e-14 ;
	setAttr ".r" -type "double3" -9.7964785667737682e-05 2.1813723389824497e-15 1.067218075592362e-07 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -9.7964785669111379e-05 1.7913575251998921e-14 0 ;
	setAttr ".bps" -type "matrix" 7.3301872589873548e-16 0.99992928498490619 -0.011892225593855065 0
		 1.7098239581766553e-06 -0.011892225593837685 -0.99992928498344436 0 -0.99999999999853828 -2.0333611503448124e-08 -1.7097030479583611e-06 0
		 6.3492095816211001e-13 154.0384159735074 0.81104929585914765 1;
	setAttr ".radi" 9.6000000000000014;
	setAttr ".fbxID" 5;
createNode joint -n "head" -p "neck_02";
	rename -uid "B7044C74-4B31-5903-219F-F0A6BAFC9272";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 4.315650768208144 -6.0536020196622076e-08 -8.1071053970244774e-14 ;
	setAttr ".r" -type "double3" 9.7951722104086878e-05 -1.6565944876317525e-06 0.96891462830793673 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 9.7951722106836875e-05 -1.6565944856131836e-06 0.96891462830785946 ;
	setAttr ".bps" -type "matrix" 6.9154933614247973e-16 0.99958521488926122 -0.028799273858731506 0
		 -5.7687748269477093e-13 -0.02879927385873152 -0.99958521488926133 0 -1 1.7304915077972947e-14 5.7661828722477932e-13 0
		 6.1564952738264037e-13 158.35376156112625 0.75972666387106236 1;
	setAttr ".radi" 2.3000000000000007;
	setAttr ".fbxID" 5;
createNode joint -n "jaw" -p "head";
	rename -uid "2B9C7908-45B0-BCE5-3FDA-9489ABCD666B";
	addAttr -ci true -sn "fat" -ln "fat" -dv 1.9198842035605246 -at "double";
	addAttr -ci true -sn "fatFront" -ln "fatFront" -dv 1 -at "double";
	addAttr -ci true -sn "fatWidth" -ln "fatWidth" -dv 1 -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.8026209177277508 -0.59032389316749878 9.299045418401675e-13 ;
	setAttr ".r" -type "double3" 9.2704083743503555e-16 -8.5730055101687938e-07 8.5725549487803261e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 180.00000000002876 60.544255427963456 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.5380539267074458e-11 4.3546897028614232e-13 -1.2722218725795616e-14 ;
	setAttr ".bps" -type "matrix" -1.7463370926686538e-16 -0.4664706185847135 0.88453669341480445 0
		 -2.8428232111885524e-13 -0.88453669341480434 -0.4664706185847135 0 1 -2.5153960579228148e-13 -1.3245488110052588e-13 0
		 2.9610796227202033e-14 163.17139132266948 1.211493704427848 1;
	setAttr ".radi" 4.3000000000000007;
createNode joint -n "eye_r" -p "head";
	rename -uid "DC972D60-4886-DC70-BFD2-64AFF5E84065";
	addAttr -ci true -sn "fat" -ln "fat" -dv 1.9198842035605246 -at "double";
	addAttr -ci true -sn "fatFront" -ln "fatFront" -dv 1 -at "double";
	addAttr -ci true -sn "fatWidth" -ln "fatWidth" -dv 1 -at "double";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 4.4203330421564715 -4.6518287504795239 3.0371199999986622 ;
	setAttr ".r" -type "double3" 3.3793392015917016e-15 7.9513867663306843e-15 2.1251698900587212e-06 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.52643721155579 -4.3171973691317698 82.083803390732598 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 2.9492657161093977e-23 -1.5902773407317592e-15 2.1251699168138967e-06 ;
	setAttr ".bps" -type "matrix" -0.075278028969123417 0.10883293651208024 -0.99120563471193102 0
		 0.0082416869295999211 0.99406005448874113 0.108520425111578 0 0.99712852378771988 -2.8188515732550138e-09 -0.075727848569213205 0
		 3.0371200000000149 165.2241490554247 7.2913819121150825 1;
	setAttr ".radi" 4.3000000000000007;
createNode joint -n "thigh_r" -p "pelvis";
	rename -uid "AE642858-4EB7-713F-D42B-36877AC25EC6";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -6.3079823146496636 -0.92081298517785015 8.8499904284986499 ;
	setAttr ".r" -type "double3" -0.47083369674539244 -9.5689805922406599 175.34082709625423 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -9.9244839178970459 -9.0453581763798017 -130.50105735372679 ;
	setAttr ".bps" -type "matrix" -0.16623491312112548 -0.98592806263842836 -0.017658113196129133 0
		 0.0081031688513768414 -0.019272484445916012 0.99978143111274498 0 -0.98605288515077893 0.16605549266830816 0.01119290134436518 0
		 -8.8499904284986251 100.68112073166319 2.5312835994138636 1;
	setAttr ".radi" 8.3;
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "calf_r" -p "thigh_r";
	rename -uid "089576C2-485F-C19F-41F2-DF950E2536DC";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 41.453336505553231 4.3615836609056657e-08 -1.8549689073665832e-07 ;
	setAttr ".r" -type "double3" 3.0995564090060439e-16 -6.3535533229675396e-15 -5.5858763372657227 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 1.0276667425028807 2.5484352406944 -68.029381101100512 ;
	setAttr ".bps" -type "matrix" -0.16623427681814179 -0.97937037187599296 -0.11489055619253195 0
		 -0.0081162119594864468 -0.11514880827070119 0.99331509555491238 0 -0.9860528851507806 0.16605549266831734 0.011192901344364282 0
		 -15.740982037816888 59.81111294920089 1.7992959325716233 1;
	setAttr ".radi" 6.5;
	setAttr ".fbxID" 5;
createNode joint -n "foot_r" -p "calf_r";
	rename -uid "54CAB744-48BB-E2D3-2640-9B876D1BCB58";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 53.688662530854735 -1.0219349810824951e-08 -2.0373125408923443e-07 ;
	setAttr ".r" -type "double3" 8.9793667142551428 3.743778681599268 12.770443722310718 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 5.6591311307731269 5.7161989099113724 21.635057168824119 ;
	setAttr ".bps" -type "matrix" -0.099182376818907778 -0.9893472865885552 0.1065589163252635 0
		 -0.12676742842520825 0.1187771259798186 0.98479541704581142 0 -0.98696143552775739 0.084166150344640839 -0.13719760900668576 0
		 -24.665877825994066 7.2300275281790407 -4.3690243792628065 1;
	setAttr ".radi" 6.3000000000000007;
	setAttr ".fbxID" 5;
createNode joint -n "ball_r" -p "foot_r";
	rename -uid "C4A1E0FC-4D5E-B242-2E2E-BB9275784FDC";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 4.9455585600775027 10.559536326537632 -0.53894556655509973 ;
	setAttr ".r" -type "double3" 4.7553440277593131e-14 3.8411113191064284e-15 -115.49624281164658 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" -2.8216493754339134e-05 -2.3440771714055234e-05 -115.49562073126413 ;
	setAttr ".bps" -type "matrix" 0.15711523734246471 0.3186565887746684 -0.93475814017601011 0
		 -0.034956072087819645 -0.94412607080127597 -0.32772554898502482 0 -0.98696143552775761 0.084166150344640533 -0.13719760900668507 0
		 -25.963076854118835 3.5460229890649622 6.6308940051413616 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "interaction" -p "root";
	rename -uid "6EDEFD5B-499B-9DD9-9B31-96B4411B0CFB";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "center_of_mass" -p "root";
	rename -uid "8CBB13B9-434D-7A77-A396-6191F5F5AF5D";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "ik_hand_root" -p "root";
	rename -uid "624D6EF0-44FC-0AE2-183D-5DB6694B68D2";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_gun" -p "ik_hand_root";
	rename -uid "60ECE73E-466D-874D-64C5-36BFEC7974AE";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776599577967658 0.63486688008580827 -0.62241010409371778 0
		 -0.64550907761389853 0.71872766733298943 0.25835744798269883 0 0.61136594918746878 0.28350411774821049 0.7388214205028939 0
		 -47.768318176269531 104.4664306640625 15.69880485534668 1;
	setAttr ".radi" 9.2;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_l" -p "ik_hand_gun";
	rename -uid "E57D103D-459A-C804-70EC-2FA500B0F8EF";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 44.430246931746908 -62.651610831048139 59.338210013778045 ;
	setAttr ".r" -type "double3" -107.73758596138396 -34.036790747396616 -134.5069948150531 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776611850929966 -0.63486684526340897 0.62241004934867217 0
		 -0.64550905383748747 -0.71872771643705502 -0.2583573707851351 0 0.61136588239675294 -0.28350407124142607 -0.73882149361721705 0
		 47.768601260708799 104.46653900739912 15.698887991063664 1;
	setAttr ".radi" 6.8000000000000007;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode parentConstraint -n "ik_hand_gun_parentConstraint1" -p "ik_hand_gun";
	rename -uid "47A83AF8-4F81-E226-5233-60BE75DD6402";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hand_rW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 1.9847217700430519e-06 1.0294279775280302e-06 
		5.877771016571387e-07 ;
	setAttr ".tg[0].tor" -type "double3" 16.528942179673987 23.72050939586337 7.2816790808351533 ;
	setAttr ".lr" -type "double3" 68.473107710141036 -39.410112319456928 53.666511456036929 ;
	setAttr ".rst" -type "double3" -48.529102325439467 -3.9233043193817139 107.63352966308597 ;
	setAttr ".rsrr" -type "double3" 68.473107478131126 -39.410111911239156 53.666512015145287 ;
	setAttr -k on ".w0";
createNode joint -n "ik_foot_root" -p "root";
	rename -uid "83E3D979-455B-A03B-B25B-47BE8B618881";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_foot_r" -p "ik_foot_root";
	rename -uid "55BA05D1-49EA-9343-F565-959A8B4B1F59";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495233472999553 -0.99950197930433915 -0.031211781419062216 0
		 -0.14803749178978817 -0.031556184234514909 0.98847817793876702 0 -0.98897082007369197 2.4561468946360236e-05 -0.14811048727049325 0
		 -14.087558746337891 8.2382316589355469 -0.98483455181121826 1;
	setAttr ".radi" 10.7;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode parentConstraint -n "ik_foot_r_parentConstraint1" -p "ik_foot_r";
	rename -uid "D44CAA63-4FBB-D996-59A9-2BA098FA0D5F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "foot_rW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -8.8347224647122857e-08 1.7805270252635452e-07 
		4.6212097615239145e-07 ;
	setAttr ".tg[0].tor" -type "double3" 0.45049642661692318 4.843303210007166 -8.6606719883196881 ;
	setAttr ".lr" -type "double3" -89.955404360216178 88.191663071784689 81.527131053350004 ;
	setAttr ".rst" -type "double3" -24.665878295898438 4.3690242767333984 7.2300276756286621 ;
	setAttr ".rsrr" -type "double3" -89.955404360215383 88.191663071784689 81.52713105335107 ;
	setAttr -k on ".w0";
createNode joint -n "ik_foot_l" -p "ik_foot_root";
	rename -uid "34E25A80-4D79-F2AE-3C67-14BB9A33D4C1";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 24.665899276733402 4.3690199851989746 7.2300300598144549 ;
	setAttr ".r" -type "double3" -89.955404360216789 88.191663071784689 81.527131053350047 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999978 ;
	setAttr ".jo" -type "double3" 180 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495233472999553 -0.99950197930433915 -0.031211781419062216 0
		 -0.14803749178978817 -0.031556184234514909 0.98847817793876702 0 -0.98897082007369197 2.4561468946360236e-05 -0.14811048727049325 0
		 -14.087558746337891 8.2382316589355469 -0.98483455181121826 1;
	setAttr ".radi" 10.7;
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "Camera" -p "root";
	rename -uid "ED64A000-48D0-131C-77A0-13838CC0412D";
	addAttr -ci true -k true -sn "blendParent1" -ln "blendParent1" -dv 1 -smn 0 -smx 
		1 -at "double";
	setAttr ".r" -type "double3" 0 -90 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 0 0 ;
	setAttr ".radi" 4.3000000000000007;
createNode transform -n "mesh_grp";
	rename -uid "BAE4A419-467D-228C-9A71-CBBD7F600E66";
createNode transform -n "Heel_ref";
	rename -uid "B9BC1714-4740-E2A5-0F69-EF9252D61B6E";
	setAttr ".t" -type "double3" -24.665878295898438 -2.2786684036254883 -11.665741920471191 ;
createNode locator -n "Heel_refShape" -p "Heel_ref";
	rename -uid "4ABFDD30-4D17-9FBB-6536-0E853B174D57";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 2.6 2.6 2.6 ;
createNode transform -n "FootSideOuter_ref";
	rename -uid "AA442CCC-4D25-4857-44F2-E99A04E7155C";
	setAttr ".t" -type "double3" -30.495073318481445 1.5801992416381836 6.6297540664672852 ;
createNode locator -n "FootSideOuter_refShape" -p "FootSideOuter_ref";
	rename -uid "FAB9536E-4515-DDA3-E4EF-D990A04BE867";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 2.6 2.6 2.6 ;
createNode transform -n "FootSideInner_ref";
	rename -uid "CDBB5FE3-40A4-C714-2755-A38A48520439";
	setAttr ".t" -type "double3" -21.170720210479747 2.5866081714630127 6.9160837702429472 ;
createNode locator -n "FootSideInner_refShape" -p "FootSideInner_ref";
	rename -uid "91B5DCBC-4C8F-F454-232C-16A1B3267FC8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 2.6 2.6 2.6 ;
createNode transform -n "ToesEnd_ref";
	rename -uid "096A09B1-4C85-1409-FBA5-189A938CEDCE";
	setAttr ".t" -type "double3" -25.267730373269515 1.5801992416381836 14.684109603384824 ;
createNode locator -n "ToesEnd_refShape" -p "ToesEnd_ref";
	rename -uid "A567C5AC-4E2E-F907-3B60-2393160C1F74";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 2.6 2.6 2.6 ;
createNode displayLayerManager -n "layerManager";
	rename -uid "C7FE7927-4164-FF22-5FD1-4983D9AB0043";
	setAttr ".cdl" 3;
	setAttr -s 4 ".dli[1:3]"  1 3 2;
	setAttr -s 3 ".dli";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "C391FAE4-48AB-4CD4-5C37-DB8D5631B7FB";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "1EFEE4C5-42DD-71D8-B881-63B6717C88CD";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "3CB8FC4E-4C97-E974-2313-FEB36A63DE46";
createNode displayLayer -n "defaultLayer";
	rename -uid "05EED39D-43CE-DE65-B900-AE9D960FF83D";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C2B5031D-402B-72FD-415E-5691B0190C85";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "CE26CF1C-4303-45B7-A070-F4BFDFE74111";
	setAttr ".g" yes;
createNode keyingGroup -n "Character1_FullBodyKG";
	rename -uid "D47AFF0B-4063-624C-F4BB-EB9FD18E8CDE";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG";
	rename -uid "21821B4D-4054-B553-D352-9EB1F439572C";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG";
	rename -uid "6A54D74E-4310-790F-0D30-6BA4C60D5DF5";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG";
	rename -uid "4F706625-48C9-3D0A-F314-0A8481D7B5FB";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG";
	rename -uid "F48FC848-4BD3-8ABF-6357-03BCCD0D65F6";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG1";
	rename -uid "FA3C1AF4-4EF4-61F5-863B-70851366EFAE";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG1";
	rename -uid "E6B1F333-4204-50BC-FEA2-D48DED6A3684";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG1";
	rename -uid "82AA994B-4346-ED3D-4A4D-139C42A0B86D";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG2";
	rename -uid "0D4BCE27-4E9D-548B-327D-5A8507CA5FD3";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG1";
	rename -uid "B481F91F-459B-567D-9180-078EA0830397";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG1";
	rename -uid "184F304E-40B4-592D-AFDB-B4B112857489";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG2";
	rename -uid "44D28BDB-42DA-3BB5-D5AA-EE94ABF53A53";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG2";
	rename -uid "289D723F-40F1-C801-84E7-CAB2784BC90A";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG3";
	rename -uid "DDEC6A1A-40C0-34EA-B39B-588D432EB391";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG3";
	rename -uid "FC402F1D-4295-C5A8-1AD2-B798288C0560";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG3";
	rename -uid "E334BC92-4814-559D-4585-B0B1AD64D2A5";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG4";
	rename -uid "A635EEA1-4652-A5C1-0C88-BCBAE406AEFA";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG2";
	rename -uid "793F23C8-4067-3627-7792-758CE5330774";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG2";
	rename -uid "02F05A56-465E-C197-B298-7FA03CEF19C7";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG4";
	rename -uid "B0D1D56B-403C-F464-2CED-ABB79CB429B1";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG4";
	rename -uid "8114F81E-404F-7997-8A25-BDBEAC227C5F";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG5";
	rename -uid "D0436D65-49B1-4B3F-EC42-7CB4601B60B7";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG5";
	rename -uid "38648413-41EC-3267-3F8F-39B51B14CE59";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG5";
	rename -uid "1FE310B6-4738-D064-E45E-1C9C27C71E18";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG6";
	rename -uid "30919B92-4376-5969-2332-E4964CBEEB9D";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG3";
	rename -uid "000C7802-453B-9F34-8F49-6998D4DA150C";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG3";
	rename -uid "F74A2986-42A7-483C-D01F-FFB0777B5547";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG6";
	rename -uid "07ABC0B6-4CBE-D172-FDD5-95946E0A2460";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG6";
	rename -uid "23A89768-45AB-3A57-C7BC-AF8BB3B91779";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG7";
	rename -uid "8A9BC402-4D33-81B1-4709-1795A793FE8B";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG7";
	rename -uid "B41A977E-4CD6-B7D3-5A61-44B11FABBE98";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG7";
	rename -uid "D2FA343A-4163-5FE3-42BD-5191544379BB";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "05C839FC-4DE0-AFEC-A155-8D9230AC8F9B";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -177.72341107228323 -1584.2329224798555 ;
	setAttr ".tgi[0].vh" -type "double2" 4243.9332951577198 1502.9598228609125 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo2";
	rename -uid "E2A2DEB2-4918-2035-53C8-A6AD891BF66A";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -44.047617297323995 -324.99998708566085 ;
	setAttr ".tgi[0].vh" -type "double2" 484.52379027056401 44.047617297323995 ;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "F08FD189-44E2-7B0F-F0B8-BD85D285F5C7";
	setAttr ".version" -type "string" "5.2.1.1";
createNode keyingGroup -n "Character1_FullBodyKG8";
	rename -uid "D2B915DA-49E4-963C-2A6E-0090BE2236B3";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG4";
	rename -uid "4531AB5C-461D-2822-B522-94A6D6F459DF";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG4";
	rename -uid "CE900F41-41D9-6338-4F1C-D7893A7C1235";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG8";
	rename -uid "BEBD4F60-4822-27C1-70FB-11988C710F8A";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG8";
	rename -uid "C59B99FB-4C39-0AFD-C0FD-84A32C3508F5";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG9";
	rename -uid "579469CE-4264-BDDE-7AB7-44A457FCFA30";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG9";
	rename -uid "3F92C9FE-458B-EBC5-D863-2EA6DD387988";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG9";
	rename -uid "62D77A79-481A-A4A9-CD37-6ABA4FFE123E";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG10";
	rename -uid "C438F6A1-4F7B-4F63-3705-119CD4A26FD1";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG5";
	rename -uid "0094B24B-42B0-5ED8-D3A6-A88679E75A81";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG5";
	rename -uid "610C7BEB-45C8-F66B-034D-8B90521DA6FB";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG10";
	rename -uid "764275CD-4480-16CA-1C3D-E09D3EEED631";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG10";
	rename -uid "1D93111D-4306-EB05-8D1C-BE9F5DB1ADAA";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG11";
	rename -uid "16252B3A-49E4-A5D9-7AD7-F0BA640E0D9E";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG11";
	rename -uid "38535773-461F-E1E9-A43E-ECA95F205BBC";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG11";
	rename -uid "464B04D3-42FD-E2A5-0245-42829DC7291F";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo3";
	rename -uid "1D407E67-40EB-E639-29B4-9BB4C5D6BC41";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -177.72341107228323 -1584.2329224798555 ;
	setAttr ".tgi[0].vh" -type "double2" 4243.9332951577198 1502.9598228609125 ;
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode1";
	rename -uid "0716452D-480F-8BB8-26A4-C5BBFB463618";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode keyingGroup -n "Character1_FullBodyKG12";
	rename -uid "44D31C37-43A4-8AD4-AF87-CEA23FD50846";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG6";
	rename -uid "108E9E90-4428-785A-BB69-2EA9B4F6078B";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG6";
	rename -uid "465309CD-4141-ECD0-9A13-ABAC5E9BCA3A";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG12";
	rename -uid "15C72F8B-4894-FB43-95FB-7E91EE282195";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG12";
	rename -uid "C61FC043-4587-8599-9BE4-C8BB013F2260";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG13";
	rename -uid "81E76088-4A25-7D0A-69A7-25BBFC0AD5B7";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG13";
	rename -uid "4525F0EA-427D-39AD-E7B2-4FA551E20788";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG13";
	rename -uid "52FE5656-4C22-9C6D-EC04-5BA41BEB7320";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode HIKSkeletonGeneratorNode -n "HIKSkeletonGeneratorNode2";
	rename -uid "4E5F723B-4A10-CA47-4168-11BAF62228E2";
	setAttr ".ihi" 0;
	setAttr ".WantIndexFinger" yes;
	setAttr ".WantMiddleFinger" yes;
	setAttr ".WantRingFinger" yes;
	setAttr ".WantPinkyFinger" yes;
	setAttr ".WantThumb" yes;
	setAttr ".WantToeBase" yes;
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.9100008010000007;
	setAttr ".LeftUpLegTy" 93.729999539999994;
	setAttr ".LeftLegTx" 8.9100008010000007;
	setAttr ".LeftLegTy" 48.851354600000001;
	setAttr ".LeftFootTx" 8.9100008010000007;
	setAttr ".LeftFootTy" 8.1503963469999992;
	setAttr ".RightUpLegTx" -8.9100008010000007;
	setAttr ".RightUpLegTy" 93.729999539999994;
	setAttr ".RightLegTx" -8.9100035169999998;
	setAttr ".RightLegTy" 48.851354600000001;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.9100025980000002;
	setAttr ".RightFootTy" 8.1503963509999995;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".RightFootRy" -0.0048003860000000002;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251070000002;
	setAttr ".LeftArmTy" 146.58868419999999;
	setAttr ".LeftForeArmTx" 45.012716769999997;
	setAttr ".LeftForeArmTy" 146.58868419999999;
	setAttr ".LeftHandTx" 71.709864139999993;
	setAttr ".LeftHandTy" 146.58868419999999;
	setAttr ".RightArmTx" -17.707274909999999;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873159999998;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861270000005;
	setAttr ".RightHandTy" 146.58897870000001;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.9100092279999998;
	setAttr ".LeftToeBaseTy" 1.8880791539999999;
	setAttr ".LeftToeBaseTz" 12.9547209;
	setAttr ".RightToeBaseTx" -8.9110879789999995;
	setAttr ".RightToeBaseTy" 1.888079171;
	setAttr ".RightToeBaseTz" 12.95518809;
	setAttr ".RightToeBaseRx" 0.0029125930000000002;
	setAttr ".RightToeBaseRy" -0.0048003860000000002;
	setAttr ".LeftShoulderTx" 7.0000004770000004;
	setAttr ".LeftShoulderTy" 146.58854679999999;
	setAttr ".LeftShoulderRz" 0.00073528199999999997;
	setAttr ".RightShoulderTx" -6.9999995229999996;
	setAttr ".RightShoulderTy" 146.58854679999999;
	setAttr ".RightShoulderRz" -0.0023183610000000001;
	setAttr ".NeckTy" 145;
	setAttr ".LeftFingerBaseTx" 80.519743439999999;
	setAttr ".LeftFingerBaseTy" 147.08957459999999;
	setAttr ".LeftFingerBaseTz" 1.304684401;
	setAttr ".LeftFingerBaseRy" -0.0035633340000000005;
	setAttr ".RightFingerBaseTx" -80.519626680000002;
	setAttr ".RightFingerBaseTy" 147.0898718;
	setAttr ".RightFingerBaseTz" 1.305458317;
	setAttr ".RightFingerBaseRy" -2.0000646359999998;
	setAttr ".Spine1Ty" 111;
	setAttr ".Spine2Ty" 115;
	setAttr ".Spine3Ty" 119;
	setAttr ".Spine4Ty" 123;
	setAttr ".Spine5Ty" 127;
	setAttr ".Spine6Ty" 131;
	setAttr ".Spine7Ty" 135;
	setAttr ".Spine8Ty" 139;
	setAttr ".Spine9Ty" 143;
	setAttr ".Neck1Ty" 147;
	setAttr ".Neck2Ty" 149;
	setAttr ".Neck3Ty" 151;
	setAttr ".Neck4Ty" 153;
	setAttr ".Neck5Ty" 155;
	setAttr ".Neck6Ty" 157;
	setAttr ".Neck7Ty" 159;
	setAttr ".Neck8Ty" 161;
	setAttr ".Neck9Ty" 163;
	setAttr ".LeftUpLegRollTx" 8.9100008010000007;
	setAttr ".LeftUpLegRollTy" 70.997711179999996;
	setAttr ".LeftLegRollTx" 8.9100008010000007;
	setAttr ".LeftLegRollTy" 26.759407039999999;
	setAttr ".RightUpLegRollTx" -8.9100035169999998;
	setAttr ".RightUpLegRollTy" 70.997711179999996;
	setAttr ".RightUpLegRollRx" -0.0011371;
	setAttr ".RightLegRollTx" -8.9100025980000002;
	setAttr ".RightLegRollTy" 26.75940705;
	setAttr ".RightLegRollTz" 0.00043902399999999999;
	setAttr ".LeftArmRollTx" 32.968441489999996;
	setAttr ".LeftArmRollTy" 146.58868419999999;
	setAttr ".LeftForeArmRollTx" 61.340445039999999;
	setAttr ".LeftForeArmRollTy" 146.58868419999999;
	setAttr ".RightArmRollTx" -32.968521590000002;
	setAttr ".RightArmRollTy" 146.58898;
	setAttr ".RightForeArmRollTx" -61.340504160000002;
	setAttr ".RightForeArmRollTy" 146.58898;
	setAttr ".HipsTranslationTy" 100;
	setAttr ".LeftHandThumb1Tx" 76.058620989999994;
	setAttr ".LeftHandThumb1Ty" 145.79018170000001;
	setAttr ".LeftHandThumb1Tz" 4.2824339670000002;
	setAttr ".LeftHandThumb2Tx" 78.571210930000007;
	setAttr ".LeftHandThumb2Ty" 145.25408229999999;
	setAttr ".LeftHandThumb2Tz" 4.9898882909999998;
	setAttr ".LeftHandThumb2Rz" -0.00029786199999999997;
	setAttr ".LeftHandThumb3Tx" 81.114351339999999;
	setAttr ".LeftHandThumb3Ty" 145.25406910000001;
	setAttr ".LeftHandThumb3Tz" 4.989897633;
	setAttr ".LeftHandThumb4Tx" 83.78109748;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.9898894220000001;
	setAttr ".LeftHandIndex1Tx" 80.531840860000003;
	setAttr ".LeftHandIndex1Ty" 146.7884134;
	setAttr ".LeftHandIndex1Tz" 3.4716694160000001;
	setAttr ".LeftHandIndex1Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex1Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex2Tx" 84.754595460000004;
	setAttr ".LeftHandIndex2Ty" 146.7883913;
	setAttr ".LeftHandIndex2Tz" 3.618868435;
	setAttr ".LeftHandIndex2Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex2Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex3Tx" 87.406920909999997;
	setAttr ".LeftHandIndex3Ty" 146.7883775;
	setAttr ".LeftHandIndex3Tz" 3.711324415;
	setAttr ".LeftHandIndex3Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex3Rz" -0.00029934100000000001;
	setAttr ".LeftHandIndex4Tx" 89.363955140000002;
	setAttr ".LeftHandIndex4Ty" 146.7883673;
	setAttr ".LeftHandIndex4Tz" 3.7795433150000002;
	setAttr ".LeftHandIndex4Ry" -1.9999999850000001;
	setAttr ".LeftHandIndex4Rz" -0.00029934100000000001;
	setAttr ".LeftHandMiddle1Tx" 80.519743500000004;
	setAttr ".LeftHandMiddle1Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle1Tz" 1.3046843809999999;
	setAttr ".LeftHandMiddle1Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle2Tx" 85.382995179999995;
	setAttr ".LeftHandMiddle2Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle2Tz" 1.3049868360000001;
	setAttr ".LeftHandMiddle2Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle3Tx" 88.148231789999997;
	setAttr ".LeftHandMiddle3Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle3Tz" 1.305158619;
	setAttr ".LeftHandMiddle3Ry" -0.0035633340000000005;
	setAttr ".LeftHandMiddle4Tx" 90.153863950000002;
	setAttr ".LeftHandMiddle4Ty" 147.08957469999999;
	setAttr ".LeftHandMiddle4Tz" 1.3052822150000001;
	setAttr ".LeftHandMiddle4Ry" -0.0035633340000000005;
	setAttr ".LeftHandRing1Tx" 80.603623929999998;
	setAttr ".LeftHandRing1Ty" 146.96860380000001;
	setAttr ".LeftHandRing1Tz" -0.79315890899999997;
	setAttr ".LeftHandRing1Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing2Tx" 85.141382759999999;
	setAttr ".LeftHandRing2Ty" 146.96860380000001;
	setAttr ".LeftHandRing2Tz" -0.79315882000000004;
	setAttr ".LeftHandRing2Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing3Tx" 87.445908619999997;
	setAttr ".LeftHandRing3Ty" 146.96860380000001;
	setAttr ".LeftHandRing3Tz" -0.79315893699999995;
	setAttr ".LeftHandRing3Ry" -0.0035635290000000002;
	setAttr ".LeftHandRing4Tx" 89.369255980000005;
	setAttr ".LeftHandRing4Ty" 146.96860380000001;
	setAttr ".LeftHandRing4Tz" -0.79315975400000005;
	setAttr ".LeftHandRing4Ry" -0.0035635290000000002;
	setAttr ".LeftHandPinky1Tx" 80.592138829999996;
	setAttr ".LeftHandPinky1Ty" 146.27565720000001;
	setAttr ".LeftHandPinky1Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky1Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky2Tx" 83.636238160000005;
	setAttr ".LeftHandPinky2Ty" 146.27569779999999;
	setAttr ".LeftHandPinky2Tz" -2.4903564650000001;
	setAttr ".LeftHandPinky2Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky3Tx" 85.610739649999999;
	setAttr ".LeftHandPinky3Ty" 146.27572409999999;
	setAttr ".LeftHandPinky3Tz" -2.4903566079999999;
	setAttr ".LeftHandPinky3Rz" 0.00076302599999999998;
	setAttr ".LeftHandPinky4Tx" 87.277354299999999;
	setAttr ".LeftHandPinky4Ty" 146.27574630000001;
	setAttr ".LeftHandPinky4Tz" -2.4903558170000002;
	setAttr ".LeftHandPinky4Rz" 0.00076302599999999998;
	setAttr ".LeftHandExtraFinger1Tx" 80.592138829999996;
	setAttr ".LeftHandExtraFinger1Ty" 146.7884134;
	setAttr ".LeftHandExtraFinger1Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger1Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger1Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger2Tx" 82.636238160000005;
	setAttr ".LeftHandExtraFinger2Ty" 146.7883913;
	setAttr ".LeftHandExtraFinger2Tz" -4.4903564649999996;
	setAttr ".LeftHandExtraFinger2Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger2Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger3Tx" 84.610739649999999;
	setAttr ".LeftHandExtraFinger3Ty" 146.7883775;
	setAttr ".LeftHandExtraFinger3Tz" -4.4903566079999999;
	setAttr ".LeftHandExtraFinger3Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger3Rz" -0.00029934100000000001;
	setAttr ".LeftHandExtraFinger4Tx" 86.277354299999999;
	setAttr ".LeftHandExtraFinger4Ty" 146.7883673;
	setAttr ".LeftHandExtraFinger4Tz" -4.4903558170000002;
	setAttr ".LeftHandExtraFinger4Ry" -1.9999999850000001;
	setAttr ".LeftHandExtraFinger4Rz" -0.00029934100000000001;
	setAttr ".RightHandThumb1Tx" -76.058242059999998;
	setAttr ".RightHandThumb1Ty" 145.7904806;
	setAttr ".RightHandThumb1Tz" 4.2828147379999999;
	setAttr ".RightHandThumb2Tx" -78.570769569999996;
	setAttr ".RightHandThumb2Ty" 145.25438170000001;
	setAttr ".RightHandThumb2Tz" 4.9904913879999997;
	setAttr ".RightHandThumb2Rz" -0.00060208600000000005;
	setAttr ".RightHandThumb3Tx" -81.112358929999999;
	setAttr ".RightHandThumb3Ty" 145.25440850000001;
	setAttr ".RightHandThumb3Tz" 5.0793117030000001;
	setAttr ".RightHandThumb3Rz" -0.00039149399999999999;
	setAttr ".RightHandThumb4Tx" -83.777478689999995;
	setAttr ".RightHandThumb4Ty" 145.2544268;
	setAttr ".RightHandThumb4Tz" 5.1724490200000002;
	setAttr ".RightHandThumb4Rz" -0.00039149399999999999;
	setAttr ".RightHandIndex1Tx" -80.531533929999995;
	setAttr ".RightHandIndex1Ty" 146.78871240000001;
	setAttr ".RightHandIndex1Tz" 3.4724442959999999;
	setAttr ".RightHandIndex1Ry" -2.0000646579999999;
	setAttr ".RightHandIndex2Tx" -84.754284150000004;
	setAttr ".RightHandIndex2Ty" 146.7887121;
	setAttr ".RightHandIndex2Tz" 3.325092508;
	setAttr ".RightHandIndex2Ry" -2.0000646359999998;
	setAttr ".RightHandIndex3Tx" -87.406606949999997;
	setAttr ".RightHandIndex3Ty" 146.78871179999999;
	setAttr ".RightHandIndex3Tz" 3.2325403669999999;
	setAttr ".RightHandIndex3Ry" -2.0000646359999998;
	setAttr ".RightHandIndex4Tx" -89.363639169999999;
	setAttr ".RightHandIndex4Ty" 146.78871169999999;
	setAttr ".RightHandIndex4Tz" 3.164250215;
	setAttr ".RightHandIndex4Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle1Tx" -80.519627299999996;
	setAttr ".RightHandMiddle1Ty" 147.0898718;
	setAttr ".RightHandMiddle1Tz" 1.305458427;
	setAttr ".RightHandMiddle1Ry" -2.0000646579999999;
	setAttr ".RightHandMiddle2Tx" -85.379921789999997;
	setAttr ".RightHandMiddle2Ty" 147.08987139999999;
	setAttr ".RightHandMiddle2Tz" 1.1358596750000001;
	setAttr ".RightHandMiddle2Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle3Tx" -88.143476890000002;
	setAttr ".RightHandMiddle3Ty" 147.0898712;
	setAttr ".RightHandMiddle3Tz" 1.039426113;
	setAttr ".RightHandMiddle3Ry" -2.0000646359999998;
	setAttr ".RightHandMiddle4Tx" -90.147889570000004;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.96948263800000001;
	setAttr ".RightHandMiddle4Ry" -2.0000646359999998;
	setAttr ".RightHandRing1Tx" -80.603693699999994;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.79237675600000002;
	setAttr ".RightHandRing1Ry" -2.0000646579999999;
	setAttr ".RightHandRing2Tx" -85.138693309999994;
	setAttr ".RightHandRing2Ty" 146.96889859999999;
	setAttr ".RightHandRing2Tz" -0.95062442800000002;
	setAttr ".RightHandRing2Ry" -2.0000646359999998;
	setAttr ".RightHandRing3Tx" -87.441817880000002;
	setAttr ".RightHandRing3Ty" 146.9688984;
	setAttr ".RightHandRing3Tz" -1.0309913799999999;
	setAttr ".RightHandRing3Ry" -2.0000646359999998;
	setAttr ".RightHandRing4Tx" -89.363995799999998;
	setAttr ".RightHandRing4Ty" 146.96889830000001;
	setAttr ".RightHandRing4Tz" -1.0980652959999999;
	setAttr ".RightHandRing4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky1Tx" -80.592357370000002;
	setAttr ".RightHandPinky1Ty" 146.2759509;
	setAttr ".RightHandPinky1Tz" -2.4895741939999998;
	setAttr ".RightHandPinky1Ry" -2.0000646579999999;
	setAttr ".RightHandPinky1Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky2Tx" -83.638299989999993;
	setAttr ".RightHandPinky2Ty" 146.27588489999999;
	setAttr ".RightHandPinky2Tz" -2.5958615950000001;
	setAttr ".RightHandPinky2Ry" -2.0000646359999998;
	setAttr ".RightHandPinky2Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky3Tx" -85.613997130000001;
	setAttr ".RightHandPinky3Ty" 146.27584210000001;
	setAttr ".RightHandPinky3Tz" -2.6648030450000002;
	setAttr ".RightHandPinky3Ry" -2.0000646359999998;
	setAttr ".RightHandPinky3Rz" 0.0012412149999999999;
	setAttr ".RightHandPinky4Tx" -87.28162098;
	setAttr ".RightHandPinky4Ty" 146.27580589999999;
	setAttr ".RightHandPinky4Tz" -2.7229943639999998;
	setAttr ".RightHandPinky4Ry" -2.0000646359999998;
	setAttr ".RightHandPinky4Rz" 0.0012412149999999999;
	setAttr ".RightHandExtraFinger1Tx" -80.592357370000002;
	setAttr ".RightHandExtraFinger1Ty" 146.78871240000001;
	setAttr ".RightHandExtraFinger1Tz" -4.4895741940000002;
	setAttr ".RightHandExtraFinger1Ry" -2.0000646579999999;
	setAttr ".RightHandExtraFinger2Tx" -82.638299989999993;
	setAttr ".RightHandExtraFinger2Ty" 146.7887121;
	setAttr ".RightHandExtraFinger2Tz" -4.5958615949999997;
	setAttr ".RightHandExtraFinger2Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger3Tx" -84.613997130000001;
	setAttr ".RightHandExtraFinger3Ty" 146.78871179999999;
	setAttr ".RightHandExtraFinger3Tz" -4.6648030450000002;
	setAttr ".RightHandExtraFinger3Ry" -2.0000646359999998;
	setAttr ".RightHandExtraFinger4Tx" -86.28162098;
	setAttr ".RightHandExtraFinger4Ty" 146.78871169999999;
	setAttr ".RightHandExtraFinger4Tz" -4.7229943639999998;
	setAttr ".RightHandExtraFinger4Ry" -2.0000646359999998;
	setAttr ".LeftFootThumb1Tx" 6.18422217;
	setAttr ".LeftFootThumb1Ty" 4.9992492679999998;
	setAttr ".LeftFootThumb1Tz" 1.930123209;
	setAttr ".LeftFootThumb2Tx" 4.551409713;
	setAttr ".LeftFootThumb2Ty" 2.6643834059999998;
	setAttr ".LeftFootThumb2Tz" 3.591937658;
	setAttr ".LeftFootThumb3Tx" 3.4619466889999999;
	setAttr ".LeftFootThumb3Ty" 1.8880788850000001;
	setAttr ".LeftFootThumb3Tz" 6.4001420700000002;
	setAttr ".LeftFootThumb4Tx" 3.4619466999999999;
	setAttr ".LeftFootThumb4Ty" 1.8880788550000001;
	setAttr ".LeftFootThumb4Tz" 9.6971958839999992;
	setAttr ".LeftFootIndex1Tx" 7.1105199680000002;
	setAttr ".LeftFootIndex1Ty" 1.888079117;
	setAttr ".LeftFootIndex1Tz" 12.9547209;
	setAttr ".LeftFootIndex2Tx" 7.1105199749999999;
	setAttr ".LeftFootIndex2Ty" 1.8880790999999999;
	setAttr ".LeftFootIndex2Tz" 14.82972745;
	setAttr ".LeftFootIndex3Tx" 7.1105199810000004;
	setAttr ".LeftFootIndex3Ty" 1.888079083;
	setAttr ".LeftFootIndex3Tz" 16.76314442;
	setAttr ".LeftFootIndex4Tx" 7.1105199880000001;
	setAttr ".LeftFootIndex4Ty" 1.8880790649999999;
	setAttr ".LeftFootIndex4Tz" 18.850666449999999;
	setAttr ".LeftFootMiddle1Tx" 8.9167242489999996;
	setAttr ".LeftFootMiddle1Ty" 1.888079163;
	setAttr ".LeftFootMiddle1Tz" 12.9547209;
	setAttr ".LeftFootMiddle2Tx" 8.9167242550000001;
	setAttr ".LeftFootMiddle2Ty" 1.888079147;
	setAttr ".LeftFootMiddle2Tz" 14.82860045;
	setAttr ".LeftFootMiddle3Tx" 8.9167242610000006;
	setAttr ".LeftFootMiddle3Ty" 1.888079131;
	setAttr ".LeftFootMiddle3Tz" 16.64971237;
	setAttr ".LeftFootMiddle4Tx" 8.9167242669999993;
	setAttr ".LeftFootMiddle4Ty" 1.8880791139999999;
	setAttr ".LeftFootMiddle4Tz" 18.565581959999999;
	setAttr ".LeftFootRing1Tx" 10.723903740000001;
	setAttr ".LeftFootRing1Ty" 1.888079211;
	setAttr ".LeftFootRing1Tz" 12.9547209;
	setAttr ".LeftFootRing2Tx" 10.723903740000001;
	setAttr ".LeftFootRing2Ty" 1.888079195;
	setAttr ".LeftFootRing2Tz" 14.71345226;
	setAttr ".LeftFootRing3Tx" 10.72390375;
	setAttr ".LeftFootRing3Ty" 1.8880791800000001;
	setAttr ".LeftFootRing3Tz" 16.472174209999999;
	setAttr ".LeftFootRing4Tx" 10.723903760000001;
	setAttr ".LeftFootRing4Ty" 1.8880791640000001;
	setAttr ".LeftFootRing4Tz" 18.27484922;
	setAttr ".LeftFootPinky1Tx" 12.52979668;
	setAttr ".LeftFootPinky1Ty" 1.888079257;
	setAttr ".LeftFootPinky1Tz" 12.9547209;
	setAttr ".LeftFootPinky2Tx" 12.52979669;
	setAttr ".LeftFootPinky2Ty" 1.8880792420000001;
	setAttr ".LeftFootPinky2Tz" 14.5796458;
	setAttr ".LeftFootPinky3Tx" 12.52979669;
	setAttr ".LeftFootPinky3Ty" 1.8880792289999999;
	setAttr ".LeftFootPinky3Tz" 16.143599309999999;
	setAttr ".LeftFootPinky4Tx" 12.5297967;
	setAttr ".LeftFootPinky4Ty" 1.8880792129999999;
	setAttr ".LeftFootPinky4Tz" 17.861196199999998;
	setAttr ".LeftFootExtraFinger1Tx" 5.0860939849999998;
	setAttr ".LeftFootExtraFinger1Ty" 1.888079254;
	setAttr ".LeftFootExtraFinger1Tz" 12.9547209;
	setAttr ".LeftFootExtraFinger2Tx" 5.0860939910000003;
	setAttr ".LeftFootExtraFinger2Ty" 1.888079236;
	setAttr ".LeftFootExtraFinger2Tz" 14.94401483;
	setAttr ".LeftFootExtraFinger3Tx" 5.0860939979999999;
	setAttr ".LeftFootExtraFinger3Ty" 1.8880792179999999;
	setAttr ".LeftFootExtraFinger3Tz" 16.99182682;
	setAttr ".LeftFootExtraFinger4Tx" 5.0860940049999996;
	setAttr ".LeftFootExtraFinger4Ty" 1.8880791990000001;
	setAttr ".LeftFootExtraFinger4Tz" 19.0793827;
	setAttr ".RightFootThumb1Tx" -6.180000014;
	setAttr ".RightFootThumb1Ty" 4.9992496019999999;
	setAttr ".RightFootThumb1Tz" 1.930123112;
	setAttr ".RightFootThumb2Tx" -4.5499999820000001;
	setAttr ".RightFootThumb2Ty" 2.6643838419999999;
	setAttr ".RightFootThumb2Tz" 3.5919375690000002;
	setAttr ".RightFootThumb3Tx" -3.4599999860000001;
	setAttr ".RightFootThumb3Ty" 1.888079335;
	setAttr ".RightFootThumb3Tz" 6.4001419850000003;
	setAttr ".RightFootThumb4Tx" -3.4599999860000001;
	setAttr ".RightFootThumb4Ty" 1.8880793090000001;
	setAttr ".RightFootThumb4Tz" 9.6971957989999993;
	setAttr ".RightFootIndex1Tx" -7.1099999839999999;
	setAttr ".RightFootIndex1Ty" 1.888079262;
	setAttr ".RightFootIndex1Tz" 12.95472064;
	setAttr ".RightFootIndex2Tx" -7.1099999839999999;
	setAttr ".RightFootIndex2Ty" 1.8880792479999999;
	setAttr ".RightFootIndex2Tz" 14.82972719;
	setAttr ".RightFootIndex3Tx" -7.1099999839999999;
	setAttr ".RightFootIndex3Ty" 1.8880792340000001;
	setAttr ".RightFootIndex3Tz" 16.76314416;
	setAttr ".RightFootIndex4Tx" -7.1099999839999999;
	setAttr ".RightFootIndex4Ty" 1.8880792179999999;
	setAttr ".RightFootIndex4Tz" 18.850666189999998;
	setAttr ".RightFootMiddle1Tx" -8.92;
	setAttr ".RightFootMiddle1Ty" 1.8880792049999999;
	setAttr ".RightFootMiddle1Tz" 12.954720630000001;
	setAttr ".RightFootMiddle2Tx" -8.92;
	setAttr ".RightFootMiddle2Ty" 1.8880791910000001;
	setAttr ".RightFootMiddle2Tz" 14.82860018;
	setAttr ".RightFootMiddle3Tx" -8.92;
	setAttr ".RightFootMiddle3Ty" 1.8880791770000001;
	setAttr ".RightFootMiddle3Tz" 16.649712099999999;
	setAttr ".RightFootMiddle4Tx" -8.92;
	setAttr ".RightFootMiddle4Ty" 1.8880791619999999;
	setAttr ".RightFootMiddle4Tz" 18.565581689999998;
	setAttr ".RightFootRing1Tx" -10.72;
	setAttr ".RightFootRing1Ty" 1.8880791610000001;
	setAttr ".RightFootRing1Tz" 12.95472062;
	setAttr ".RightFootRing2Tx" -10.72;
	setAttr ".RightFootRing2Ty" 1.888079147;
	setAttr ".RightFootRing2Tz" 14.713451989999999;
	setAttr ".RightFootRing3Tx" -10.72;
	setAttr ".RightFootRing3Ty" 1.888079134;
	setAttr ".RightFootRing3Tz" 16.472173940000001;
	setAttr ".RightFootRing4Tx" -10.72;
	setAttr ".RightFootRing4Ty" 1.88807912;
	setAttr ".RightFootRing4Tz" 18.274848949999999;
	setAttr ".RightFootPinky1Tx" -12.530000060000001;
	setAttr ".RightFootPinky1Ty" 1.8880791029999999;
	setAttr ".RightFootPinky1Tz" 12.95472062;
	setAttr ".RightFootPinky2Tx" -12.530000060000001;
	setAttr ".RightFootPinky2Ty" 1.888079091;
	setAttr ".RightFootPinky2Tz" 14.57964552;
	setAttr ".RightFootPinky3Tx" -12.530000060000001;
	setAttr ".RightFootPinky3Ty" 1.8880790789999999;
	setAttr ".RightFootPinky3Tz" 16.143599040000002;
	setAttr ".RightFootPinky4Tx" -12.530000060000001;
	setAttr ".RightFootPinky4Ty" 1.888079066;
	setAttr ".RightFootPinky4Tz" 17.86119592;
	setAttr ".RightFootExtraFinger1Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger1Ty" 1.8880791260000001;
	setAttr ".RightFootExtraFinger1Tz" 12.95472064;
	setAttr ".RightFootExtraFinger2Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger2Ty" 1.8880791109999999;
	setAttr ".RightFootExtraFinger2Tz" 14.944014579999999;
	setAttr ".RightFootExtraFinger3Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger3Ty" 1.888079096;
	setAttr ".RightFootExtraFinger3Tz" 16.99182656;
	setAttr ".RightFootExtraFinger4Tx" -5.0900000030000001;
	setAttr ".RightFootExtraFinger4Ty" 1.88807908;
	setAttr ".RightFootExtraFinger4Tz" 19.079382450000001;
	setAttr ".LeftInHandThumbTx" 71.709864199999998;
	setAttr ".LeftInHandThumbTy" 146.58868419999999;
	setAttr ".LeftInHandIndexTx" 71.709864199999998;
	setAttr ".LeftInHandIndexTy" 146.58868419999999;
	setAttr ".LeftInHandMiddleTx" 71.709864199999998;
	setAttr ".LeftInHandMiddleTy" 146.58868419999999;
	setAttr ".LeftInHandRingTx" 71.709864199999998;
	setAttr ".LeftInHandRingTy" 146.58868419999999;
	setAttr ".LeftInHandPinkyTx" 71.709864199999998;
	setAttr ".LeftInHandPinkyTy" 146.58868419999999;
	setAttr ".LeftInHandExtraFingerTx" 71.709864199999998;
	setAttr ".LeftInHandExtraFingerTy" 146.58868419999999;
	setAttr ".RightInHandThumbTx" -71.709861489999994;
	setAttr ".RightInHandThumbTy" 146.58897870000001;
	setAttr ".RightInHandIndexTx" -71.709861489999994;
	setAttr ".RightInHandIndexTy" 146.58897870000001;
	setAttr ".RightInHandMiddleTx" -71.709861489999994;
	setAttr ".RightInHandMiddleTy" 146.58897870000001;
	setAttr ".RightInHandRingTx" -71.709861489999994;
	setAttr ".RightInHandRingTy" 146.58897870000001;
	setAttr ".RightInHandPinkyTx" -71.709861489999994;
	setAttr ".RightInHandPinkyTy" 146.58897870000001;
	setAttr ".RightInHandExtraFingerTx" -71.709861489999994;
	setAttr ".RightInHandExtraFingerTy" 146.58897870000001;
	setAttr ".LeftInFootThumbTx" 8.9100008010000007;
	setAttr ".LeftInFootThumbTy" 8.15039625;
	setAttr ".LeftInFootIndexTx" 8.9100008010000007;
	setAttr ".LeftInFootIndexTy" 8.1503963469999992;
	setAttr ".LeftInFootMiddleTx" 8.9100008010000007;
	setAttr ".LeftInFootMiddleTy" 8.1503963469999992;
	setAttr ".LeftInFootRingTx" 8.9100008010000007;
	setAttr ".LeftInFootRingTy" 8.1503963469999992;
	setAttr ".LeftInFootPinkyTx" 8.9100008010000007;
	setAttr ".LeftInFootPinkyTy" 8.1503963469999992;
	setAttr ".LeftInFootExtraFingerTx" 8.9100008010000007;
	setAttr ".LeftInFootExtraFingerTy" 8.1503963469999992;
	setAttr ".RightInFootThumbTx" -8.9100025980000002;
	setAttr ".RightInFootThumbTy" 8.1503963929999994;
	setAttr ".RightInFootThumbTz" 0.00043882099999999999;
	setAttr ".RightInFootIndexTx" -8.9100026190000001;
	setAttr ".RightInFootIndexTy" 8.1503963939999995;
	setAttr ".RightInFootIndexTz" 0.00043882099999999999;
	setAttr ".RightInFootMiddleTx" -8.9100026190000001;
	setAttr ".RightInFootMiddleTy" 8.1503963939999995;
	setAttr ".RightInFootMiddleTz" 0.00043882099999999999;
	setAttr ".RightInFootRingTx" -8.9100026190000001;
	setAttr ".RightInFootRingTy" 8.1503963939999995;
	setAttr ".RightInFootRingTz" 0.00043882099999999999;
	setAttr ".RightInFootPinkyTx" -8.9100026190000001;
	setAttr ".RightInFootPinkyTy" 8.1503963939999995;
	setAttr ".RightInFootPinkyTz" 0.00043882099999999999;
	setAttr ".RightInFootExtraFingerTx" -8.9100026190000001;
	setAttr ".RightInFootExtraFingerTy" 8.1503963939999995;
	setAttr ".RightInFootExtraFingerTz" 0.00043882099999999999;
	setAttr ".LeftShoulderExtraTx" 12.353625535000001;
	setAttr ".LeftShoulderExtraTy" 146.58868419999999;
	setAttr ".RightShoulderExtraTx" -12.353637216499999;
	setAttr ".RightShoulderExtraTy" 146.58898;
createNode keyingGroup -n "Character1_FullBodyKG14";
	rename -uid "2B6B9233-42AC-4100-5115-81ACB893601E";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftHandBPKG7";
	rename -uid "5478ECBC-41F3-1358-F5AB-8C851AA18C66";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightHandBPKG7";
	rename -uid "3ED26024-45C8-C81E-40F6-41832DCCF895";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG14";
	rename -uid "9CBEFFCA-4582-B807-CD42-69B1A94E8A98";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG14";
	rename -uid "B1E7BFA0-4257-C0B0-921A-3B9C84881D2C";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_FullBodyKG15";
	rename -uid "FD9518FB-4C45-40D7-57A0-E3987CD7B733";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dnsm";
	setAttr ".cat" -type "string" "FullBody";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_LeftFootBPKG15";
	rename -uid "5FF87F01-4034-C796-4B44-A09BC6B044BE";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode keyingGroup -n "Character1_RightFootBPKG15";
	rename -uid "9D3BF0D6-40C6-0557-4EC3-AE8CE31FE0AE";
	setAttr ".ihi" 0;
	setAttr ".cat" -type "string" "BodyPart";
	setAttr ".mr" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo4";
	rename -uid "15A22DE8-47E6-1A3B-3A91-C5BDBA4A79F4";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -177.72341107228323 -1584.2329224798555 ;
	setAttr ".tgi[0].vh" -type "double2" 4243.9332951577198 1502.9598228609125 ;
createNode dagPose -n "bindPose1";
	rename -uid "39B4B373-4EC2-C784-592E-E0BA3253ABA7";
	setAttr -s 23 ".wm";
	setAttr -s 163 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.70710678118654757 0 0 0.70710678118654757 1 1 1 no;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 -1.5073866481569131
		 1.5707963267948966 0 2.9500488819890415e-15 -1.212602049203561 106.91807643174153 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[2]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999989 1 -8.9264221175903663e-20
		 4.6749824007264644e-18 -0.063409678637981803 0 6.1017875939996031 -0.15395801327481351
		 3.6258441666402254e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[3]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0
		 0 0 0 7.1064128537484663 1.7430501486614958e-14 2.1839356133292227e-15 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002 1.0000000000000002 1 no;
	setAttr ".xm[4]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0
		 0 0 0 7.1064128537483384 -1.7652546091539989e-14 2.1212619842216188e-15 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[5]" -type "matrix" "xform" 1 0.99999999999999989 1 7.8457562573637358e-06
		 0 0 0 7.1064128537483953 -4.2632564145606011e-14 -2.7678297188432797e-15 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[6]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 -7.845217342097133e-06
		 9.3303503364568271e-08 0.011892505921057447 0 4.5239779651899994 -1.7817312462117957e-07
		 8.0897561063715891e-13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 4.7143473671269263e-17 1.6351978502348041e-13
		 1.8626451648434683e-09 0 5.2855761761029783 0.054372259906902976 8.6300995386784964e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[8]" -type "matrix" "xform" 1 0.99999999999999989 1 -1.7098080609365499e-06
		 3.1265086895115411e-16 0 0 7.7206084597669928 -6.616929226765933e-14 -4.1188866088533962e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[9]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002 1 1.7095800587628203e-06
		 -2.8913028144331897e-08 0.016910750434709208 0 7.7206084597667655 -6.0536033075209161e-08
		 -8.4972279355193057e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1 no;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 2.6844105141038133e-13 7.6003673217625351e-15
		 -9.313229076823857e-10 0 -2.0063207609930203 -0.47516860238492686 8.6268543321160735e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.50410755400545404 0.8636408825400973 -1.2656689649336428e-13 -2.1683536642005498e-13 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 1.7347234332490273e-18 2.3039296487032022e-18
		 3.7091219874278256e-08 2 -0.1297772826950952 -6.6116481265508948 3.0371181404886238 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.65625665333955818 0.75358573954222441 -0.027846241509105252 -0.025696788514876053 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 -1.570796326793062 1.2416537372796448
		 -1.5707963267937375 0 10.252570934236559 2.1811802671040001 -6.4709378782650853e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770992 0.49274758399758456 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 -0.15195976197719577 0 9.2652752597442571
		 -2.8421709430404007e-14 -5.2997581325512435e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 -0.1179986596107483 0 9.2012168781528416
		 0 -5.2997581325516474e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0.074121385812759399 0 10.150239309512799
		 5.6843418860808015e-14 -5.2735593669698975e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.9012613903194095 -1.1918244169351055e-13
		 2.7911256618952912e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 -1.4210139915614191 2.1207073672090191
		 -0.75628730137992051 0 7.6370897535407494 -5.672793200880025 3.674494995349876 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770992 0.49274758399758456 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 -0.15195976197719577 0 9.0873998039533603
		 5.6843418860808015e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 -0.18224464356899259 0 9.0233414223619448
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 -0.16351142525672913 0 8.8075513458457841
		 8.5265128291212022e-14 1.4210854715202004e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 1.5707963267940752 0.76506022547182428
		 1.570796326793751 0 8.3532385927598796 -7.1057403133821984 4.7082008761618489e-12 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770992 0.49274758399758456 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 -0.15195975949345536 0 9.3133286318802675
		 1.4210854715202004e-14 -5.5794520904806395e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 -0.18224464340561783 0 9.2492702502888164
		 -2.8421709430404007e-14 -5.5794520904802356e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 -0.16351142380633849 0 9.033480173772702
		 2.8421709430404007e-14 -5.5794520904814473e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 -1.5707963267939566 0.88884556005657323
		 -1.5707963267947436 0 1.5938213460679833 5.5457986560951795 -2.5872689090275107e-12 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770992 0.49274758399758456 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 -0.15195976197719577 0 10.430087767620407
		 0 -5.2735593669686858e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 0 0 -0.1179986596107483 0 10.366029386028984
		 4.2632564145606011e-14 -5.2735593669698975e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0.074121385812759399 0 10.150239309512855
		 2.8421709430404007e-14 -5.2735593669698975e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 -0.34905313916639802 2.2854272777301823
		 -0.46761769217306792 0 -1.7565486671202564 0.77378622866140567 5.2074456457593747 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770992 0.49274758399758456 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 15.814505966825358
		 -4.5352610555937645e-14 -4.829470157119431e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 1.720578648738158 1.020885281877044
		 2.3853053271376199 0 7.6366002248695111 -5.6727799120119444 -3.6744899999961183 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.49274758399776025 0.50714871434752906 0.49274758399712482 0.50714871434818309 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 -0.15195976197719577 0 -9.0873941134107454
		 3.2050348153234154e-06 6.0716738232713396e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 -0.18224464356899259 0 -9.0235233507382588
		 -0.00052037032475027445 -0.00043999529064819853 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 4.337008212278408e-09 -4.2013793970830154e-09
		 -0.16351142525672899 0 -8.807561995847859 6.6491917607436335e-06 -4.1861853063096532e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.2904784139758925e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075 -9.3151160456272919e-06
		 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.2904784139758925e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 -0.34905313934729243 2.2854272777913955
		 -0.46761769230783834 0 -1.7566394529985132 0.77378881061231652 -5.2074499999998416 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.49274758399776025 0.50714871434752906 0.49274758399712482 0.50714871434818309 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 -15.81463041927654
		 -0.00035596689897943179 4.2982948684766598e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 -1.3889662852490146 -0.64201572205671908
		 -1.8565782974958536 0 1.6984097531280895 -3.842039019966335 6.9258910268335176 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.50714871434800235 0.4927475839973004 -0.50714871434770981 0.49274758399758467 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0 -0.010549634695053099 -0.036985330283641815 0 10.430087767620421
		 2.8421709430404007e-14 7.1054273576010019e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 0 0 0.0069214617833495157 0 10.366029386029012
		 1.4210854715202004e-14 -1.4210854715202004e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0.050343506038188934 0 10.150239309512855
		 1.4210854715202004e-14 -7.1054273576010019e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 -1.3889663028588772 -0.64201572129852802
		 -1.8565783017469597 0 1.6988610894660212 -3.8420479762028803 -6.9258899999971746 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.49274758399776025 0.50714871434752906 0.49274758399712482 0.50714871434818309 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 0 -0.010549634695053099 -0.036985330283641815 0 -10.430416042632189
		 -0.00028979722566191413 -7.0129914448102681e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 -3.308747365321917e-24 -1.4740445350874387e-27
		 0.0069214617833495201 0 -10.365849858855455 0.00022733790768825202 5.369419530865116e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 0 0 0.050343506038188934 0 -10.150095412245179
		 0.00010630270716660561 3.1937686834737633e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0661204877087442 -8.7574835262671513e-05
		 9.7789364588152239e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 3.4694472093255951e-18 -1.3877787743471456e-17
		 3.7091211646918464e-08 2 -0.1295108471051028 -6.6116528950816615 -3.0371199999955785 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.75358573954224051 -0.65625665333957295 -0.02569678851449838 0.027846241508669881 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[52]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000004 0.99999999999999967 27.982228337402809
		 1.4107710302056784 -0.30407647001989146 0 -2.2141795287908774 8.4150467369044613
		 1.9059464187580843 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1.0000000000000004 0.99999999999999978
		 0.99999999999999978 1 no;
	setAttr ".xm[53]" -type "matrix" "xform" 1.0000000000000002 1 1 -0.10347254404048133
		 0.66858452684291225 0.043424274486516243 0 -12.710774898881334 144.38451287150539
		 -0.56662372936283534 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70487216736321479 0.037845096394011304 0.070399731910308364 0.70481689402466008 0.99999999999999956
		 0.99999999999999956 1.0000000000000004 no;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1.0000000000000002 -2.6112311360944729e-17
		 -6.6983105161823217e-11 -0.31547094674046777 0 -24.985365366661782 -3.3750779948604759e-14
		 -2.5096937861235347e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1.0000000000000007 no;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1.0000000000000002 0.022439298514312051
		 -0.030151141088978074 0.034659238267947687 0 -9.0836620330809907 9.5923269327613525e-14
		 -4.9788198452915822e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[56]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 0.022439298921375767
		 -0.030151008852034238 0.034659239745862332 0 -18.167304992675646 1.0302869668521453e-13
		 -9.9576482170959935e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[57]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000007 0.99999999999999956 -1.4053116049243259
		 0.024125801166034331 -0.013852914885293747 0 -27.25101089477532 9.2370555648813024e-14
		 2.6822291943062737e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[58]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999978
		 0.99999999999999944 -0.4846613375939916 -0.34082271412454923 0.20683247113898265 0 -3.3146772399041708
		 0.30593533141113483 -2.3912868507469316 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[59]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000004 0.21728739203637917
		 0.14210397090404683 -0.13081736170822419 0 -3.8750499018763378 -0.35138326677190435
		 0.064411754382078357 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1.0000000000000002 1.0000000000000007 no;
	setAttr ".xm[60]" -type "matrix" "xform" 1 0.99999999999999989 1.0000000000000002 2.2178300331086355e-16
		 -1.4589308742428252e-17 0.042839880343696589 0 -3.3456226980806747 3.0366025498551608e-05
		 3.2629206579315451e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956
		 0.99999999999999978 0.99999999999999956 no;
	setAttr ".xm[61]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000007 2.9800130513526238e-08
		 -6.4543095601079156e-17 0.11221964471582041 0 -1.9787311726574046 -1.7523876564951024e-05
		 -3.1002964590243209e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 0.99999999999999978 no;
	setAttr ".xm[62]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999978
		 0.99999999999999978 -0.23212590879105952 -0.20611149294555831 -0.027830380771129131 0 -3.3742079734802317
		 0.54299175739285488 -1.091781616210957 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[63]" -type "matrix" "xform" 1 0.99999999999999989 1.0000000000000002 0.19051677473984646
		 0.05681300688767689 0.08051547341706751 0 -4.1776169446008176 -0.51780591948947574
		 0.14500821420174148 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1.0000000000000002 1.0000000000000002 no;
	setAttr ".xm[64]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000002 2.972044402216162e-19
		 -1.4326173864667107e-17 -0.041485160975394751 0 -3.9758372396751653 -2.0846833564291956e-05
		 -2.3612021331942401e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 0.99999999999999978 no;
	setAttr ".xm[65]" -type "matrix" "xform" 1 0.99999999999999956 1 -3.447891665256482e-16
		 -1.2043899633318689e-16 0.17337618308525676 0 -2.3413558190788599 5.0017570160321156e-05
		 -1.1221488382062716e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[66]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999933
		 0.99999999999999989 -0.074569197575235169 -0.0022820379734449525 -0.040463566458287019 0 -3.3758001327514577
		 0.75400394201273002 0.18280552327630417 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[67]" -type "matrix" "xform" 1.0000000000000004 1 1.0000000000000004 0.16860687799989738
		 0.017959778098465724 0.027625356480491959 0 -4.4404035511891742 -0.47697989864842327
		 0.53759891364655132 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000004
		 1.0000000000000007 1.0000000000000002 no;
	setAttr ".xm[68]" -type "matrix" "xform" 1.0000000000000007 1.0000000000000002 1.0000000000000002 -3.334143927409144e-16
		 -1.4940923247695419e-17 0.038323517305857868 0 -3.983175570897135 -7.7438591659984013e-05
		 -3.7052828829153839e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956
		 1 0.99999999999999956 no;
	setAttr ".xm[69]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 -2.2625740236204852e-16 -3.9690470029425263e-17 0.17089466466272393 0 -2.7829159846058182
		 4.5777305771821375e-05 3.4382665349497188e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 0.99999999999999933 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[70]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999967
		 0.99999999999999989 0.049897453557281833 0.19110757594355188 -0.084965933649405467 0 -2.6599845153330506
		 -0.41595882908778492 1.9767106018318685 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[71]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0.13455677328442264
		 0.038547231323638478 0.055182065616881701 0 -4.9880958094806047 -0.11433259102443571
		 -0.035673193551044591 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1.0000000000000004 1.0000000000000002 no;
	setAttr ".xm[72]" -type "matrix" "xform" 0.99999999999999956 0.99999999999999956
		 1 3.2875301788388266e-16 -1.3696226739209953e-16 0.065586671320115891 0 -3.8498719637273133
		 5.0402059628140705e-06 3.2097038908052156e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 0.99999999999999978 0.99999999999999978 1 no;
	setAttr ".xm[73]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 1.2561451013245747e-16
		 1.2699520275229033e-16 0.21845240790709697 0 -2.6011178677174094 3.9602186006959528e-05
		 -3.566275708521971e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000004
		 1.0000000000000004 1 no;
	setAttr ".xm[74]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 0.99999999999999867 1.9225701588674873
		 0.92057782684982259 0.67904225884542324 0 -0.91760942893500896 -1.1014244062154717
		 1.7308490315453042 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[75]" -type "matrix" "xform" 0.99999999999999989 1 1 -0.097021332065640217
		 -0.10341463623368641 0.16570151946539097 0 -3.7008624939682875 0.00042712956193469154
		 -0.00013574546019867739 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999978 1.0000000000000013 no;
	setAttr ".xm[76]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002 1.0000000000000002 2.2431092692288314e-16
		 -1.6115224534170936e-16 -0.027857333220751981 0 -3.603598131432932 -1.4851160905493543e-05
		 4.582558183585661e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1 1 no;
	setAttr ".xm[77]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 -1.3137109869868504
		 -3.1238565618287173 -0.10527572783881656 0 -5.0243041591167623 -4.0265002729985904
		 -0.21078184111117451 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[78]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000004 0.99999999999999967 27.982228337402805
		 1.4107710302056786 -0.30407647001988908 0 -2.2143360908098355 8.4150482516978027
		 -1.9059499999973881 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 6.123233995736766e-17 0.99999999999999978
		 0.99999999999999978 1 no;
	setAttr ".xm[79]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999944 -0.1034725440289767
		 0.66858452670266633 0.043424274505075466 0 10.245101491015642 1.3422635522432214
		 4.5437012368924172 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956
		 0.99999999999999956 1.0000000000000004 no;
	setAttr ".xm[80]" -type "matrix" "xform" 1 1 1.0000000000000002 6.0949199455213934e-17
		 1.1864307294263235e-09 -0.31547094674046761 0 24.985277002212683 -9.8236507604099188e-06
		 0.00011955467631707961 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1.0000000000000007 no;
	setAttr ".xm[81]" -type "matrix" "xform" 1 1 1.0000000000000002 0.022439298514312433
		 -0.030151141088978064 0.034659238267947486 0 9.0840112339541577 0.00014459457466742265
		 -0.0003610129840154741 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[82]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 0.022439298921375694
		 -0.030151008852034235 0.034659239745862207 0 18.167344191501591 8.6565893049339593e-06
		 -4.2865752234888532e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[83]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000007 0.99999999999999956 -1.4053116049243273
		 0.024125801166034376 -0.013852914885293865 0 27.250677631026093 -0.00012919570059821694
		 0.00027496033122531571 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[84]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999978
		 0.99999999999999944 -0.48466133759399149 -0.34082271412454934 0.20683247113898273 0 3.3148242982810956
		 -0.3057721351980689 2.3913208096074019 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[85]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000004 0.21728739203637965
		 0.14210397090404678 -0.13081736170822428 0 3.8755997674089429 0.35169646323929271
		 -0.064326199278809781 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.2351741790771471e-08 0 0 0.99999999999999978 1.0000000000000002
		 1.0000000000000002 1.0000000000000007 no;
	setAttr ".xm[86]" -type "matrix" "xform" 1 0.99999999999999989 1.0000000000000002 -5.1158815463672298e-16
		 1.2598315181475368e-16 0.042839880343696589 0 3.3453105626032098 -0.00024109367943481175
		 -6.4101482191603054e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 3.8714352419276774e-08 0 0 0.99999999999999922 0.99999999999999956
		 0.99999999999999978 0.99999999999999956 no;
	setAttr ".xm[87]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000007 2.9800130919853667e-08
		 1.9065736210636468e-16 0.11221964471582037 0 1.9787529400971451 1.1572617680144504e-05
		 2.8686236287711608e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.6345732554492353e-08 0 0 0.99999999999999711 1
		 1.0000000000000002 0.99999999999999978 no;
	setAttr ".xm[88]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999978
		 0.99999999999999978 -0.23212590879105943 -0.20611149294555797 -0.027830380771128815 0 3.3743761960165486
		 -0.5428908496620295 1.0918213341065197 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[89]" -type "matrix" "xform" 1 0.99999999999999989 1.0000000000000002 0.19051677473984591
		 0.05681300688767655 0.080515473417067593 0 4.1778693871914108 0.51815042149331703
		 -0.14491585612133662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.3560804576936208e-08 0 0 0.99999999999999967 1.0000000000000002
		 1.0000000000000002 1.0000000000000002 no;
	setAttr ".xm[90]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000002 1.3124359343037876e-16
		 1.563834114722811e-16 -0.041485160975394751 0 3.9757387559728556 -6.4581993029833029e-05
		 9.178552216937419e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 4.2800326992109625e-08 0 0 0.99999999999999911 1
		 1.0000000000000002 0.99999999999999978 no;
	setAttr ".xm[91]" -type "matrix" "xform" 1 0.99999999999999956 1 -7.5452711507258884e-17
		 -2.629716691967909e-17 0.17337618308525679 0 2.341359399271056 -8.33254179042342e-05
		 1.0103868246957859e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 8.2966154259890625e-08 0 0 0.99999999999999656 0.99999999999999956
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[92]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999933
		 0.99999999999999989 -0.074569197575235086 -0.0022820379734449403 -0.040463566458286901 0 3.3760325592988281
		 -0.75375612098058298 -0.18274871473835219 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978 0.99999999999999933
		 1.0000000000000004 no;
	setAttr ".xm[93]" -type "matrix" "xform" 1.0000000000000004 1 1.0000000000000004 0.16860687799989721
		 0.017959778098465707 0.027625356480491969 0 4.440443699632624 0.47702804534414156
		 -0.53758918852235738 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.2351741790771478e-08 0 0 0.99999999999999978 1.0000000000000004
		 1.0000000000000007 1.0000000000000002 no;
	setAttr ".xm[94]" -type "matrix" "xform" 1.0000000000000007 1.0000000000000002 1.0000000000000002 -1.8005390660773861e-16
		 8.9609057490232435e-17 0.038323517305857854 0 3.9830851285799049 -2.1883413310774813e-05
		 3.0108925588301361e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 4.0808510594454864e-08 0 0 0.99999999999999911 0.99999999999999956
		 1 0.99999999999999956 no;
	setAttr ".xm[95]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 9.2762754485427091e-17 -5.4993469738097321e-17 0.17089466466272396 0 2.7830709757864192
		 0.00012697305767517264 -1.0629917097659813e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		7.9200758134831861e-08 0 0 0.99999999999999689 0.99999999999999933 0.99999999999999978
		 0.99999999999999978 no;
	setAttr ".xm[96]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999967
		 0.99999999999999989 0.049897453557281833 0.19110757594355185 -0.08496593364940544 0 2.6602268929713873
		 0.41613756851492667 -1.9766503434048008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[97]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0.13455677328442273
		 0.038547231323638541 0.055182065616881715 0 4.9880011577783918 0.11424086994028926
		 0.035627345724726922 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.1073424255447021e-08 0 0 0.99999999999999978 1.0000000000000002
		 1.0000000000000004 1.0000000000000002 no;
	setAttr ".xm[98]" -type "matrix" "xform" 0.99999999999999956 0.99999999999999956
		 1 1.5625244155758119e-16 1.9472542759354152e-16 0.065586671320115905 0 3.8499195821353602
		 0.00017879725817238068 -4.712590102151637e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		3.7990655851310396e-08 0 0 0.99999999999999922 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[99]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 2.7961117619694048e-16
		 3.3245808689318694e-17 0.21845240790709697 0 2.6012102559848032 5.987196242074333e-05
		 2.3972451818954355e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.4132340930895503e-08 0 0 0.99999999999999722 1.0000000000000004
		 1.0000000000000004 1 no;
	setAttr ".xm[100]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 0.99999999999999867 1.9225701567424816
		 0.92057782533339183 0.67904225748605607 0 0.91790935800678142 1.1017207357669889
		 -1.7307772025261787 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[101]" -type "matrix" "xform" 0.99999999999999989 1 1 -0.097021332065640634
		 -0.10341463623368638 0.16570151946539094 0 3.7011050364633888 -1.1292003598839528e-05
		 -0.00012057200518711397 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.6660004686562634e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999978 1.0000000000000013 no;
	setAttr ".xm[102]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002
		 1.0000000000000002 9.2794100308492908e-17 1.1535335784538707e-17 -0.027857333220751936 0 3.6031235500480179
		 -0.00072853678690876222 0.00040733675724879959 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.7877519926234639e-08 0 0 0.99999999999999967 1.0000000000000002 1 1 no;
	setAttr ".xm[103]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 -1.3137109869868504
		 -3.1238565618287173 -0.10527572783881656 0 5.0246535902412006 4.0268592406751793
		 0.2108674215355979 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[104]" -type "matrix" "xform" 1 0.99999999999999989 1 -0.0082175982375429519
		 -0.16701021739403649 3.0602747459997248 0 -6.3079823146496494 -0.92081298517784838
		 8.8499904284986481 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[105]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999989
		 1 0 0 -0.09749193369452884 0 41.453336505553189 4.3615838052346589e-08 -1.8549687297308992e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002 1 no;
	setAttr ".xm[106]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002
		 1.0000000000000002 0.15671951390773695 0.065341264459879186 0.22288628989496273 0 53.688662530854756
		 -1.0219345369932853e-08 -2.0373123987837971e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000004 1.0000000000000002 1 no;
	setAttr ".xm[107]" -type "matrix" "xform" 0.99999999999999967 1 0.99999999999999978 -2.5489349677471402e-18
		 9.6732909758315343e-17 -2.0157897107460658 0 4.9455585600775134 10.559536326537643
		 -0.5389455665551246 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[108]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 4.3413491466327303e-05 -0.0026810060715949384 -2.0539199705110372e-15 0 0
		 3.5527136788005009e-15 -4.7961634663806763e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000004 1.0000000000000002 1 no;
	setAttr ".xm[109]" -type "matrix" "xform" 1 0.99999999999999989 1 -0.0082175980476633589
		 -0.16701021345083347 3.0602747459668631 0 -6.3081025755912066 -0.92080174257104197
		 -8.84999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 6.123233995736766e-17 1 1 1 no;
	setAttr ".xm[110]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999989
		 1 0 0 -0.097491933694528826 0 -41.453233161590418 -5.482523969035924e-06 -3.5910339612144071e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002 1 no;
	setAttr ".xm[111]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002
		 1.0000000000000002 0.15671951390773686 0.065341264459879214 0.22288628989496279 0 -53.688648092285362
		 1.4419976848145666e-06 -6.5215241491500819e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000004 1.0000000000000002 1 no;
	setAttr ".xm[112]" -type "matrix" "xform" 0.99999999999999967 1 0.99999999999999978 -4.8508930302938919e-17
		 -1.8363389984002579e-17 -2.0157897107460658 0 -4.9455631719995434 -10.559527537256416
		 0.53894399512878977 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[113]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 4.3413491466327303e-05 -0.0026810060715949384 -2.0539199705110372e-15 0 2.1316282072803006e-14
		 2.6645352591003757e-15 3.5527136788005009e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000004 1.0000000000000002 1 no;
	setAttr ".xm[114]" -type "matrix" "xform" 1 1 1 2.6844105141038133e-13 7.6003673217625351e-15
		 -9.313229076823857e-10 0 -2.0063207609929918 -0.47516860238495262 8.6268543321162189e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.50410755400545404 0.8636408825400973 -1.2656689649336428e-13 -2.1683536642005498e-13 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[115]" -type "matrix" "xform" 1 1 1 1.7347234332490273e-18 2.3039296487032022e-18
		 3.7091219874278256e-08 2 -0.1297772826950952 -6.6116481265508948 3.0371181404886238 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.65625665333955818 0.75358573954222441 -0.027846241509105252 -0.025696788514876053 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[116]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.9012613903194095 -1.1918244169351055e-13
		 2.7911256618952912e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[117]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[118]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[119]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[120]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 15.814505966825358
		 -4.5352610555937645e-14 -4.829470157119431e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[121]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075
		 -9.3151160456272919e-06 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[122]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 -15.81463041927654
		 -0.00035596689897943179 4.2982948684766598e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[123]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955973 -9.9475983006414026e-14
		 7.1054273576010019e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[124]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0661204877087442
		 -8.7574835248460658e-05 9.7789364588152239e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[125]" -type "matrix" "xform" 1 1 1 3.4694472093255951e-18 -1.3877787743471456e-17
		 3.7091211646918464e-08 2 -0.1295108471051028 -6.6116528950816615 -3.0371199999955785 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.75358573954224051 -0.65625665333957295 -0.02569678851449838 0.027846241508669881 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[126]" -type "matrix" "xform" 1 1 1.0000000000000002 0.022439298514312051
		 -0.030151141088978074 0.034659238267947687 0 -9.0836620330810049 9.2370555648813024e-14
		 -4.9788198452915822e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[127]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 0.022439298921375778
		 -0.030151008852034238 0.034659239745862332 0 -18.167304992675639 9.9475983006414026e-14
		 -9.9576453749250504e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[128]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000007 2.9800130513526238e-08
		 -6.4543095601079156e-17 0.11221964471582041 0 -1.9787311726573904 -1.7523876564951024e-05
		 -3.1002964568926927e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 0.99999999999999978 no;
	setAttr ".xm[129]" -type "matrix" "xform" 1 0.99999999999999956 1 -3.447891665256482e-16
		 -1.2043899633318689e-16 0.17337618308525676 0 -2.3413558190788493 5.0017570117688592e-05
		 -1.1221488376733646e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[130]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 -2.2625740236204852e-16 -3.9690470029425263e-17 0.17089466466272393 0 -2.7829159846058253
		 4.577730575761052e-05 3.4382665351273545e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 0.99999999999999933 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[131]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 1.2561451013245747e-16
		 1.2699520275229033e-16 0.21845240790709697 0 -2.6011178677174236 3.9602186006959528e-05
		 -3.5662757198462458e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000004
		 1.0000000000000004 1 no;
	setAttr ".xm[132]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002
		 1.0000000000000002 2.2431092692288314e-16 -1.6115224534170936e-16 -0.027857333220751981 0 -3.6035981314329035
		 -1.4851160827333842e-05 4.5825581821645756e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000002 1 1 no;
	setAttr ".xm[133]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 -1.3137109869868504
		 -3.1238565618287173 -0.10527572783881656 0 -5.0243041591167623 -4.0265002729985904
		 -0.21078184111117451 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[134]" -type "matrix" "xform" 1 1 1.0000000000000002 0.022439298514312433
		 -0.030151141088978064 0.034659238267947486 0 9.0840112339541648 0.00014459457466742265
		 -0.0003610129840154741 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[135]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 0.022439298921375701
		 -0.030151008852034228 0.034659239745862221 0 18.16734419150162 8.6565893155921003e-06
		 -4.2865752234888532e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0.99999999999999978 no;
	setAttr ".xm[136]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000007 2.9800130919853667e-08
		 1.9065736210636468e-16 0.11221964471582037 0 1.9787529400971451 1.1572617623301085e-05
		 2.8686236301922463e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.6345732554492353e-08 0 0 0.99999999999999711 1
		 1.0000000000000002 0.99999999999999978 no;
	setAttr ".xm[137]" -type "matrix" "xform" 1 0.99999999999999956 1 -7.5452711507258884e-17
		 -2.629716691967909e-17 0.17337618308525679 0 2.3413593992710524 -8.3325417875812491e-05
		 1.0103868234523361e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 8.2966154259890625e-08 0 0 0.99999999999999656 0.99999999999999956
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[138]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 9.2762754485427091e-17 -5.4993469738097321e-17 0.17089466466272396 0 2.7830709757863943
		 0.00012697305766096179 -1.0629917113647025e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		7.9200758134831861e-08 0 0 0.99999999999999689 0.99999999999999933 0.99999999999999978
		 0.99999999999999978 no;
	setAttr ".xm[139]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 2.7961117619694048e-16
		 3.3245808689318694e-17 0.21845240790709697 0 2.6012102559848174 5.9871962406532475e-05
		 2.397245184670993e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.4132340930895503e-08 0 0 0.99999999999999722 1.0000000000000004
		 1.0000000000000004 1 no;
	setAttr ".xm[140]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002
		 1.0000000000000002 9.2794100308492908e-17 1.1535335784538707e-17 -0.027857333220751936 0 3.603123550048025
		 -0.00072853678694428936 0.00040733675726301044 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.7877519926234639e-08 0 0 0.99999999999999967 1.0000000000000002 1 1 no;
	setAttr ".xm[141]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 -1.3137109869868504
		 -3.1238565618287173 -0.10527572783881656 0 5.0246535902412006 4.0268592406751793
		 0.2108674215355979 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 0.99999999999999978
		 0.99999999999999933 1.0000000000000004 no;
	setAttr ".xm[142]" -type "matrix" "xform" 1 1 1 1.8735013540549522e-16 3.4745225328065672e-24
		 3.7091219873275369e-08 2 -0.1297772826951018 -6.6116481265508975 3.0371181404886234 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.65625665333955818 0.75358573954222441 -0.027846241509105252 -0.025696788514876053 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[143]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.901261390319398 -1.1368683772161603e-13
		 2.791125661897642e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[144]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[145]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[146]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955689 -8.5265128291212022e-14
		 3.0531133177151415e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[147]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 15.814505966825344
		 -5.6843418860808015e-14 -7.1054273576010019e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[148]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075
		 -9.3151160456272919e-06 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[149]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 -15.814630419276547
		 -0.00035596689897943179 4.2982948667003029e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[150]" -type "matrix" "xform" 1 1 1 -1.6653345112005362e-16 -1.387778811666083e-16
		 3.7091211546602658e-08 2 -0.12951084710505256 -6.6116528950816624 -3.0371199999955785 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.75358573954224051 -0.65625665333957295 -0.02569678851449838 0.027846241508669881 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[151]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[152]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[153]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075
		 -9.3151160456272919e-06 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[154]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[155]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[156]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075
		 -9.3151160456272919e-06 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[157]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955795 -1.1368683772161603e-13
		 -1.4210854715202004e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[158]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[159]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419039
		 -9.3151160456272919e-06 3.4175490185361923e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[160]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[161]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955689 -8.5265128291212022e-14
		 3.0531133177232195e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[162]" -type "matrix" "xform" 1 1 1 0.80818294284461045 0.14353084711452238
		 -0.11220279931057231 0 -24.92430495530099 -7.8370384420249737 96.496711917571744 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70710678118654757 0 0 0.70710678118654757 1
		 1 1 no;
	setAttr -s 87 ".m";
	setAttr -s 115 ".p";
	setAttr -s 163 ".g[0:162]" yes no no no no yes yes yes yes yes no no 
		yes yes yes yes no yes yes yes yes no yes yes yes yes no yes yes yes yes no yes no 
		yes yes yes yes no yes no yes yes yes yes no yes yes yes yes no no yes yes yes no 
		no yes yes yes yes no yes yes yes no yes yes yes no yes yes yes no yes yes no no 
		yes yes yes no no yes yes yes yes no yes yes yes no yes yes yes no yes yes yes no 
		yes yes no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no;
	setAttr ".bp" yes;
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "90CCB4D9-4DF1-0901-B9F0-BFB513E301E7";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode multiplyDivide -n "multiplyDivide2";
	rename -uid "AE1342F0-4E50-0403-E104-429B4AF967BE";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode choice -n "offsetL_origHandObject_choice";
	rename -uid "ED2DE3C2-4C8D-4285-C6CC-FD82FB1A7033";
createNode choice -n "offsetL_origHandObject_choice_offset";
	rename -uid "CEEAE646-4CA0-E3C9-D037-20BE7E3E1710";
createNode multMatrix -n "offsetL_origHandObject_multMatrix";
	rename -uid "C0822395-45D4-4764-B352-B39C8027AE1F";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "offsetL_origHandObject_decomposeMatrix";
	rename -uid "DA122443-4CD1-F6F9-5DB8-9CB2572AEEAF";
createNode choice -n "offsetR_origHandObject_choice";
	rename -uid "36066638-4B2D-FA11-8E03-CE8D45A5AEBB";
createNode choice -n "offsetR_origHandObject_choice_offset";
	rename -uid "427BFF02-4AAE-C412-8CC8-06B8012A1C08";
createNode multMatrix -n "offsetR_origHandObject_multMatrix";
	rename -uid "9F30963D-42AA-2316-D4F5-29B845DA5453";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "offsetR_origHandObject_decomposeMatrix";
	rename -uid "1FA42D6A-4061-561F-4BC4-BEAA343FF9E1";
createNode multiplyDivide -n "mad_IKArm_R_values_rot_default";
	rename -uid "FA7EDC80-475C-AE32-9060-F6A1E72AE17C";
	setAttr ".i1" -type "float3" 13.912718 14.523484 43.192059 ;
createNode multiplyDivide -n "mad_IKArm_L_values_rot_default";
	rename -uid "91986287-4929-FDE3-97B0-0CABE0BCD207";
	setAttr ".i1" -type "float3" 13.912718 -14.523484 -43.192059 ;
createNode lambert -n "lambert2";
	rename -uid "BB37676E-460D-8953-A354-0E94853CF62F";
createNode shadingEngine -n "lambert2SG";
	rename -uid "003F094B-4056-CE3F-88BB-B585ABBC4190";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "38CA643F-4E22-4CAB-A6E8-AD8481FF3332";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "2C4386AC-4089-8EA0-8714-10A64034A907";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 2599.9990052762964 -22125.595733712609 ;
	setAttr ".tgi[0].vh" -type "double2" 26885.713833818612 22160.119541864558 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 14778.5712890625;
	setAttr ".tgi[0].ni[0].y" -125.71428680419922;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 15085.7138671875;
	setAttr ".tgi[0].ni[1].y" -125.71428680419922;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode file -n "file1";
	rename -uid "C873CA4C-438C-9ABD-C698-969331F9E25B";
	setAttr ".ftn" -type "string" "C:/dev/hydrogen/ContentSource/characters/zikius/archer/Model/Textures/T_Archer_BC.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture1";
	rename -uid "83A0A786-4544-45BD-0276-DB89CDD3D32F";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "27790B34-47AE-793C-894F-00998E3B0756";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 635\n            -height 344\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 635\n            -height 344\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1277\n            -height 732\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1277\n            -height 732\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"print(\\\"\\\")\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n"
		+ "            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n"
		+ "            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n"
		+ "                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n"
		+ "                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n"
		+ "                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n"
		+ "                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererOverrideName \"stereoOverrideVP2\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1277\\n    -height 732\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1277\\n    -height 732\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 100 -size 2000 -divisions 4 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "CCE7A981-490A-55B6-372F-7EB6555D6DDB";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 220 -ast 0 -aet 220 ";
	setAttr ".st" 6;
createNode multiplyDivide -n "multiplyDivide3";
	rename -uid "A0340DDA-45D2-31A8-323E-9E8B59996F45";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode multiplyDivide -n "multiplyDivide4";
	rename -uid "11FFF169-43F9-CF91-AC5C-FD84FC80FB81";
	setAttr ".i2" -type "float3" -1 -1 -1 ;
createNode choice -n "offsetL_origHandObject_choice1";
	rename -uid "D764F012-49E3-4921-499B-04B9AEA1E07C";
createNode choice -n "offsetL_origHandObject_choice_offset1";
	rename -uid "4F931F1E-4A4D-B9B9-5404-D0AA3EEF4A25";
createNode multMatrix -n "offsetL_origHandObject_multMatrix1";
	rename -uid "9FD359F2-4E88-114E-A587-808AA24E6D8C";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "offsetL_origHandObject_decomposeMatrix1";
	rename -uid "477277CF-4728-CCF2-B8B2-E797FFBCC1BD";
createNode choice -n "offsetR_origHandObject_choice1";
	rename -uid "15BB6A42-4E72-C4AF-26C1-0FA1D88F8297";
createNode choice -n "offsetR_origHandObject_choice_offset1";
	rename -uid "E84CB289-45E1-2CF2-CB69-15A962282382";
createNode multMatrix -n "offsetR_origHandObject_multMatrix1";
	rename -uid "17473235-4A52-5B44-0FE8-68971C8F331B";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "offsetR_origHandObject_decomposeMatrix1";
	rename -uid "A1EE7BA3-4223-B8EF-E9FB-C8AC4385B1C3";
createNode multiplyDivide -n "mad_IKArm_R_values_rot_default1";
	rename -uid "62FA53EF-4D5B-C50F-6618-90BE42AEC98E";
	setAttr ".i1" -type "float3" 13.912718 14.523484 43.192059 ;
createNode multiplyDivide -n "mad_IKArm_L_values_rot_default1";
	rename -uid "C6291101-4EAC-120D-2103-74A48793BD37";
	setAttr ".i1" -type "float3" 13.912718 -14.523484 -43.192059 ;
createNode dagPose -n "bindPose2";
	rename -uid "9ABDDB38-4934-14FC-5A17-20960A698F7E";
	setAttr -s 116 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 0 0.99799027985102484 -0.063367194374323171 0 0 -0.063367194374323171 -0.99799027985102473 0
		 -1 0 0 0 2.9500488819890415e-15 106.91807643174158 1.2126020492035607 1;
	setAttr ".wm[2]" -type "matrix" 0 0.99999999999999978 -1.3877787807814457e-17 0 0 -1.3877787807814457e-17 -0.99999999999999978 0
		 -1 0 0 0 -6.7579528465118397e-16 113.01735702762139 0.97959748945719227 1;
	setAttr ".wm[3]" -type "matrix" 0 1 -1.387778780781446e-17 0 0 -1.387778780781446e-17 -1 0
		 -1 0 0 0 -2.8597308979804067e-15 120.12376988136985 0.97959748945717495 1;
	setAttr ".wm[4]" -type "matrix" 0 1.0000000000000002 -1.3877787807814463e-17 0 0 -1.3877787807814463e-17 -1.0000000000000002 0
		 -1 0 0 0 -4.9809928822020255e-15 127.23018273511818 0.97959748945719272 1;
	setAttr ".wm[5]" -type "matrix" 0 1.0000000000000002 -1.3877787807814463e-17 0 -7.8457562573359887e-06 -1.3877787807387332e-17 -0.99999999996922218 0
		 -0.99999999996922206 1.0888174053114144e-22 7.8457562573359921e-06 0 -2.2131631633587458e-15 134.33659558886663 0.97959748945723568 1;
	setAttr ".wm[6]" -type "matrix" 7.3301872589879701e-16 0.99992928498490585 -0.011892225593855055 8.6736173798840355e-19
		 1.5897264914175083e-11 -0.011892225593855067 -0.99992928498490585 1.3552527156068805e-20
		 -1 -1.8832089380684568e-13 -1.5896149454792781e-11 1.9721522630525295e-31 5.8671413893249739e-13 144.43851458728514 0.97959766763036082 0.99999999999999967;
	setAttr ".wm[7]" -type "matrix" 7.3301872589887196e-16 0.9999292849849063 -0.011892225593855069 8.6736173798840355e-19
		 1.5897264914175086e-11 -0.011892225593855065 -0.99992928498490552 0 -1 -1.8832089380684573e-13 -1.5896149454792778e-11 0
		 5.9017897181354632e-13 149.72307038660816 0.86237198837890938 0.99999999999999978;
	setAttr ".wm[8]" -type "matrix" 7.3301873878480756e-16 0.99992928498490607 -0.011892225593855065 0
		 1.7098239581766553e-06 -0.011892225593837683 -0.99992928498344424 0 -0.99999999999853828 -2.0333611503448131e-08 -1.7097030479583615e-06 0
		 6.3492095676806793e-13 154.03841597350737 0.8110492958591482 1;
	setAttr ".wm[9]" -type "matrix" 6.9154933614248604e-16 0.99958521488926122 -0.028799273858731503 0
		 -5.7687748269477072e-13 -0.028799273858731517 -0.99958521488926089 0 -1 1.7304915077972941e-14 5.7661828722477902e-13 0
		 6.1564952738263926e-13 158.3537615611263 0.75972666387105914 1;
	setAttr ".wm[10]" -type "matrix" -1.7463370926690445e-16 -0.46647061858471361 0.88453669341480445 0
		 -2.8428232111885519e-13 -0.88453669341480434 -0.4664706185847135 0 1 -2.5153960579228148e-13 -1.3245488110052588e-13 0
		 2.9610796227212888e-14 163.17139132266945 1.2114937044278802 1;
	setAttr ".wm[11]" -type "matrix" -0.075278028969123403 0.10883293651208326 -0.99120563471193113 0
		 0.0082416869295999107 0.99406005448874046 0.10852042511157796 0 0.99712852378772032 -2.8188601528300529e-09 -0.075727848569213427 0
		 3.0371200000000136 165.22414905542462 7.2913819121150727 1;
	setAttr ".wm[12]" -type "matrix" -0.075278028969122737 -0.10883293651208942 0.99120563471193024 0
		 0.0082416869296025042 -0.99406005448873991 -0.10852042511158393 0 0.99712852378772032 2.818862333937585e-09 0.075727848569213038 0
		 -3.0371181404841883 165.223882593018 7.2913848187172636 1;
	setAttr ".wm[13]" -type "matrix" -0.22577723380523509 0.7684074393237077 -0.59881102852839818 -8.6736173798840355e-19
		 0.007468973060811377 0.6160300974058236 0.78768720538776593 -4.3368086899420177e-19
		 0.97415032471209173 0.17336933489562784 -0.14482478579709221 -2.1684043449710089e-19
		 6.9258900000000345 166.97200000000012 4.4702700000001299 0.99999999999999989;
	setAttr ".wm[14]" -type "matrix" -0.21560969886261247 0.74689054536876998 -0.62902064433142058 0
		 -0.00088467672595343369 0.64402213120186547 0.76500634760065778 0 0.97647922410231758 0.16549926815834917 -0.13819666108696974 0
		 9.2807699999683511 158.9570000354091 10.715900045452113 1;
	setAttr ".wm[15]" -type "matrix" -0.21561065752310829 0.75133019391208655 -0.62371065733918629 0
		 0.00060766684027764974 0.63883717170737486 0.76934173082313295 0 0.97647922410231758 0.16549926815834917 -0.13819666108696974 0
		 11.515799996628559 151.21500007811022 17.23640009729727 1;
	setAttr ".wm[16]" -type "matrix" -0.21530690684668824 0.78252600302467235 -0.58420543514618439 0
		 0.011456908860918224 0.60021916566307865 0.79975351978598452 0 0.97647922410231758 0.16549926815834917 -0.13819666108696974 0
		 13.704299993461209 143.58900011958511 23.567200148352399 1;
	setAttr ".wm[17]" -type "matrix" -0.21530690684668824 0.78252600302467235 -0.58420543514618439 0
		 0.011456908860918224 0.60021916566307865 0.79975351978598452 0 0.97647922410231758 0.16549926815834917 -0.13819666108696974 0
		 15.440999991513859 137.27700014873523 28.279400188116725 1;
	setAttr ".wm[18]" -type "matrix" -0.22577722918572884 -0.76840744006587025 0.59881102931779029 0
		 0.0074689730601102712 -0.61603009751089355 -0.78768720530560066 0 0.97415032578275196 -0.17336933123287077 0.14482478298006426 0
		 -6.925891026830679 166.97154859293687 4.4702740456453105 1;
	setAttr ".wm[19]" -type "matrix" -0.21560969423520146 -0.74689054606785787 0.62902064508747302 0
		 -0.00088467655583921497 -0.64402213133430708 -0.76500634748935847 0 0.9764792251242187 -0.16549926448801661 0.13819665826180855 0
		 -9.2807673559435315 158.95699155403094 10.715925635749681 1;
	setAttr ".wm[20]" -type "matrix" -0.21561065289475934 -0.75133019447684568 0.62371065825884486 0
		 0.00060766693271924568 -0.63883717199401591 -0.76934173058504252 0 0.9764792251242187 -0.16549926448801661 0.13819665826180855 0
		 -11.515783802547915 151.21470221018973 17.236372125957807 1;
	setAttr ".wm[21]" -type "matrix" -0.21530690221955134 -0.78252600360314073 0.58420543607665842 0
		 0.01145690872033397 -0.60021916592093583 -0.79975351959447538 0 0.9764792251242187 -0.16549926448801661 0.13819665826180855 0
		 -13.704283545563063 143.58852093891437 23.567184564567356 1;
	setAttr ".wm[22]" -type "matrix" -0.21530690221955134 -0.78252600360314073 0.58420543607665842 0
		 0.01145690872033397 -0.60021916592093583 -0.79975351959447538 0 0.9764792251242187 -0.16549926448801661 0.13819665826180855 0
		 -15.440964929657534 137.27660836659183 28.279428783689333 1;
	setAttr ".wm[23]" -type "matrix" -0.58498460372779315 -0.29540113832174358 0.75533514474016694 2.1684043449710089e-19
		 0.19298113339045037 -0.95526095005993417 -0.22413121033433037 -1.7347234759768071e-18
		 0.78775078264434162 0.014652125061136178 0.61581979480560656 -1.3552527156068805e-20
		 5.2074499999999908 163.38500000000008 -0.044136299999858318 0.99999999999999989;
	setAttr ".wm[24]" -type "matrix" -0.61507902264923431 -0.035761390504310792 0.78765406038822738 0
		 0.033563377960049628 -0.99925294004090459 -0.019158848595881295 0 0.78775078264434195 0.014652125061138523 0.61581979480560678 0
		 14.458700000011543 168.0569999322494 -11.989400026489413 1;
	setAttr ".wm[25]" -type "matrix" -0.5849846039965968 0.29540114022141534 -0.75533514378905486 0
		 0.1929811346090769 0.95526094947506068 0.22413121177782899 0 0.78775078214619276 -0.014652124893389191 -0.61581979544682575 0
		 -5.207445645759206 163.38509082258025 -0.044136333681317134 1;
	setAttr ".wm[26]" -type "matrix" -0.61507902322686792 0.035761392490786803 -0.78765405984696235 0
		 0.033563379066234411 0.99925293997227205 0.019158850237629005 0 0.78775078214619265 -0.014652124893391381 -0.61581979544682586 0
		 -14.458688156164353 168.05671391721881 -11.989388472086201 1;
	setAttr ".wm[27]" -type "matrix" 1.5977438034206521e-08 -0.63030867721597728 -0.77634462156071249 0
		 3.7271166744389059e-13 0.77634462156071227 -0.63030867721597783 0 0.99999999999999978 1.007042847994257e-08 1.2404233007573045e-08 0
		 7.1080071651350741e-15 166.59664065941638 -4.9106576249527771 1;
	setAttr ".wm[28]" -type "matrix" 1.5793262676665097e-08 -0.74056483071432244 -0.67198491910835911 0
		 2.4189626499142517e-09 0.67198491910835956 -0.74056483071432255 0 0.99999999999999933 1.0070428479942579e-08 1.2404233007573047e-08 0
		 1.6664608512773885e-07 160.022465835361 -13.008000165751115 1;
	setAttr ".wm[29]" -type "matrix" 1.5398667568243601e-08 -0.81452455351941044 -0.58012908194125656 0
		 4.2614039234206891e-09 0.58012908194125734 -0.81452455351941078 0 0.99999999999999933 1.0070428479942572e-08 1.2404233007573032e-08 0
		 3.3035950810270064e-07 152.34574903791687 -19.973815584196689 1;
	setAttr ".wm[30]" -type "matrix" 1.5671958967690527e-08 -0.76932747816775882 -0.63885462457122288 0
		 3.1093774924970408e-09 0.638854624571223 -0.76932747816775882 0 0.99999999999999933 1.0070428479942574e-08 1.2404233007573048e-08 0
		 4.8665966754864256e-07 144.07812989622064 -25.862264596308485 1;
	setAttr ".wm[31]" -type "matrix" 1.5671958967690537e-08 -0.76932747816775848 -0.638854624571223 0
		 3.1093774924970383e-09 0.638854624571223 -0.76932747816775882 0 0.99999999999999989 1.0070428479942569e-08 1.2404233007573047e-08 0
		 6.1307084701683364e-07 137.87267760540703 -31.015313208303905 1;
	setAttr ".wm[32]" -type "matrix" 3.6287458264456852e-13 -0.32323176275934468 -0.94631983364161154 0
		 1.1395221247600389e-12 0.94631983364161121 -0.32323176275934473 0 0.99999999999999956 -9.6105979650686174e-13 7.1172515892857336e-13 0
		 1.5019323423135899e-14 175.34869729359301 -1.7968005302365739 1;
	setAttr ".wm[33]" -type "matrix" 1.861970850874288e-13 -0.46275667494826583 -0.88648534099037724 -1.7347234759768071e-18
		 1.181320989845424e-12 0.88648534099037779 -0.46275667494826583 2.6020852139652106e-18
		 1 -9.6105979650434345e-13 7.1172515892747466e-13 -2.9818942217354246e-28 3.3718524580455413e-12 172.35386603893528 -10.564714272681464 1;
	setAttr ".wm[34]" -type "matrix" 4.5831275648052411e-14 -0.5639002777743809 -0.82584288864527766 0
		 1.1950264138183435e-12 0.82584288864527799 -0.56390027777438068 0 0.99999999999999956 -9.6105979650099474e-13 7.1172515893296897e-13 0
		 5.0797924622753739e-12 168.09594151092344 -18.721458154437137 1;
	setAttr ".wm[35]" -type "matrix" 1.3420136465612692e-13 -0.50119537384577606 -0.86533415351273069 0
		 1.1883512230277457e-12 0.86533415351273035 -0.5011953738457765 0 0.99999999999999956 -9.6105979650422733e-13 7.1172515893116991e-13 0
		 5.5397173177494221e-12 162.37221874481278 -27.103961106246121 1;
	setAttr ".wm[36]" -type "matrix" 1.3420136465612664e-13 -0.50119537384577628 -0.86533415351273046 0
		 1.1883512230277453e-12 0.86533415351273024 -0.50119537384577639 0 1 -9.6105979650422733e-13 7.1172515893117011e-13 0
		 6.4661551271684192e-12 158.91333846228409 -33.075858289608206 1;
	setAttr ".wm[37]" -type "matrix" -0.38014163594198058 0.35862932403383363 -0.85257102024780906 0
		 -0.51080653635249462 0.68704859868981538 0.51676000760307228 0 0.771083016959213 0.63194084452693433 -0.077985575433431834 0
		 -3.6744949953458992 172.96048970833206 6.1292391852901398 1;
	setAttr ".wm[38]" -type "matrix" -0.29843735531530963 0.25049419573556214 -0.92097111944685872 0
		 -0.56246433301097598 0.7334189982004824 0.38174657453488559 0 0.77108301695921266 0.63194084452691524 -0.077985575433431931 0
		 -7.1289940232796623 176.21949775724906 -1.6184145369660663 1;
	setAttr ".wm[39]" -type "matrix" -0.19155540859654335 0.1134228217542186 -0.97490604108433099 0
		 -0.60723760291543993 0.76667205017786266 0.20851009827246761 0 0.77108301695921277 0.63194084452691646 -0.077985575433432056 0
		 -9.8218961734764374 178.47979240969107 -9.9286513878699552 1;
	setAttr ".wm[40]" -type "matrix" -0.090151954790194944 -0.012891825770606059 -0.99584457917679547 0
		 -0.63032024083364568 0.77490939460488539 0.047030034536553494 0 0.77108301695921289 0.63194084452691535 -0.077985575433431639 0
		 -11.50903027026505 179.4787697360822 -18.515186402095413 1;
	setAttr ".wm[41]" -type "matrix" -0.090151954790194236 -0.012891825770609169 -0.99584457917679525 0
		 -0.63032024083364557 0.77490939460488306 0.047030034536553939 0 0.771083016959213 0.63194084452691857 -0.077985575433432014 0
		 -12.236202599669436 179.37478331673367 -26.547742368852926 1;
	setAttr ".wm[42]" -type "matrix" 1.1861879253972002e-12 0.72134064776087259 -0.69258044290026421 0
		 1.5194049340504987e-13 0.69258044290026433 0.72134064776087259 0 1 -9.6087658066823221e-13 7.1192970396136422e-13 0
		 1.3780769643811748e-14 173.71760933599359 7.5409673661191396 1;
	setAttr ".wm[43]" -type "matrix" 2.3314035146391411e-08 0.60818834943026368 -0.79379275104859215 0
		 3.2974951232686465e-13 0.79379275104859259 0.60818834943026345 0 1 -1.4179586307015487e-08 1.8506311547085134e-08 0
		 1.1054396127712171e-11 180.43569184412411 1.0907380973758471 1;
	setAttr ".wm[44]" -type "matrix" 2.2927879971276074e-08 0.45425134641444476 -0.89087356806713314 0
		 4.2257017096177548e-09 0.89087356806713291 0.45425134641444487 0 1 -1.4179586307015477e-08 1.8506311547085148e-08 0
		 2.1564886373023847e-07 186.06099025108156 -6.2512655797928627 1;
	setAttr ".wm[45]" -type "matrix" 2.1934186754332615e-08 0.30317265717084602 -0.95293564312810219 0
		 7.9016255506046516e-09 0.95293564312810164 0.3031726571708464 0 0.99999999999999978 -1.4179586307015468e-08 1.8506311547085131e-08 0
		 4.2276741072907916e-07 190.16446078282604 -14.298954294265522 1;
	setAttr ".wm[46]" -type "matrix" 2.1934186754332609e-08 0.30317265717084607 -0.95293564312810208 0
		 7.9016255506046549e-09 0.95293564312810197 0.3031726571708464 0 0.99999999999999978 -1.4179586307015468e-08 1.8506311547085141e-08 0
		 5.9969018229165877e-07 192.6098738394783 -21.985403611961353 1;
	setAttr ".wm[47]" -type "matrix" -0.38014164144780971 -0.35862932517605672 0.85257101731242046 0
		 -0.51080652817415284 -0.68704860196505502 -0.51676001133265426 0 0.77108301966262593 -0.63194084031785436 0.077985582810803256 0
		 3.6744899999999983 172.96000000000018 6.1292400000000811 1;
	setAttr ".wm[48]" -type "matrix" -0.29843736221066752 -0.25049419664913664 0.92097111696395928 -3.2526065174565133e-18
		 -0.5624643256462627 -0.73341900151514783 -0.3817465790178311 -1.7347234759768071e-18
		 0.77108301966262571 -0.63194084031784603 0.077985582810802784 4.3368086899420177e-19
		 7.1289899593670629 176.21899997954833 -1.6184100267201595 0.99999999999999989;
	setAttr ".wm[49]" -type "matrix" -0.19155541696902814 -0.11342282237584049 0.97490603936693376 0
		 -0.60723759684145739 -0.76667205355528256 -0.20851010354306279 0 0.77108301966262582 -0.63194084031785047 0.077985582810802784 0
		 9.8218998828542592 178.47999991271411 -9.9286500696978148 1;
	setAttr ".wm[50]" -type "matrix" -0.090151967992827722 0.012891827484966705 0.9958445779593913 6.9253413767511596e-18
		 -0.63032021646566849 -0.77490941414561254 -0.047030039157692285 -2.6020852139652106e-18
		 0.7710830353351662 -0.63194082053037204 0.077985588192358929 4.3368086899420177e-19
		 11.508999776846123 179.47899980899845 -18.515200102593287 0.99999999999999989;
	setAttr ".wm[51]" -type "matrix" -0.09015196799282911 0.012891827484964908 0.99584457795939174 0
		 -0.63032019656434801 -0.77490943045573379 -0.047030037144917644 0 0.77108305160345836 -0.63194080053029411 0.077985589406183553 0
		 12.236199652516756 179.3749996814048 -26.547700112197099 1;
	setAttr ".wm[52]" -type "matrix" 0.98722325285176926 0.15258975100903208 0.045897896637834744 0
		 -0.045885930531751475 -0.0036017891527183412 0.99894019265126011 0 0.1525933498157985 -0.9882830540902231 0.003445952711224492 0
		 -1.9059464187554584 141.45115656896127 0.87871365275482916 1;
	setAttr ".wm[53]" -type "matrix" 0.67779167307678567 0.73211442511890834 0.067874269355806802 0
		 -0.16361253477949764 0.060182237351533961 0.98468727866789907 0 0.71681893555541554 -0.67851791932135197 0.16057411618633971 0
		 -12.651888829192069 144.38312290130332 -0.9480130717731452 1;
	setAttr ".wm[54]" -type "matrix" 0.69510601713505227 0.67731245574360655 -0.24098851059170723 0
		 0.05475617382400777 0.28436116200070033 0.95715228201878477 0 0.71681893555541576 -0.67851791932135219 0.16057411618633971 0
		 -29.586761441486431 126.09097651653259 -2.6438764946531084 1;
	setAttr ".wm[55]" -type "matrix" 0.71787901194537296 0.66599231968131534 -0.20274110173774754 0
		 0.046233629773318796 0.244972511727957 0.96842703389345819 0 0.6946309636679886 -0.70458689927020146 0.14506938233302227 0
		 -35.90086961399146 119.93849911154369 -0.45481831857706734 1;
	setAttr ".wm[56]" -type "matrix" 0.71787892002069509 0.66599241248857133 -0.20274112236439107 0
		 0.046233631156798342 0.2449725124022043 0.96842703365685234 0 0.69463105857712493 -0.70458681131213707 0.14506935508582786 0
		 -42.214964528401268 113.78603462526459 1.7342352610077807 1;
	setAttr ".wm[57]" -type "matrix" 0.67678661503287973 0.68948062150301792 -0.25802393354909692 0
		 -0.71273477411195651 0.70141706061181397 0.0048217065715002172 0 0.18430686228112853 0.18063936352438667 0.96612649319930699 0
		 -48.529103068231009 107.63352738769696 3.9233040373042387 1;
	setAttr ".wm[58]" -type "matrix" 0.54792083769858846 0.83211082661588875 0.085873906655628746 0
		 -0.74076070201262489 0.53032371248947952 -0.41234735639402276 0 -0.38865966856549461 0.16232169355942133 0.90697041287495272 0
		 -51.431213582953745 105.13074939041849 2.4697596482421376 1;
	setAttr ".wm[59]" -type "matrix" 0.68846205257286242 0.72521555507253355 0.0090774912832868315 0
		 -0.71077602272477181 0.67713848102938579 -0.19047551818743214 0 -0.14428252730914939 0.12468310306554585 0.98164997637815454 0
		 -53.319177507054093 101.73038695990559 2.3403054912828933 1;
	setAttr ".wm[60]" -type "matrix" 0.65739015052080096 0.75354983828738387 0.00091171009484886795 0
		 -0.73960850611085016 0.64545856956663383 -0.19068951901316419 0 -0.14428252730914942 0.12468310306554588 0.98164997637815476 0
		 -55.622538068176418 99.304113968168949 2.3099618768793126 1;
	setAttr ".wm[61]" -type "matrix" 0.5704306440933149 0.8210911943245327 -0.020448248873665496 0
		 -0.80857370693445085 0.55701290698861161 -0.18959214620436637 0 -0.14428250321354749 0.1246830864664886 0.98164998202802589 0
		 -56.923319017615427 97.813026236516521 2.3081307552543957 1;
	setAttr ".wm[62]" -type "matrix" 0.71933799829637435 0.69248954177435051 -0.054873297150026007 0
		 -0.68373968065412516 0.69186534984082992 -0.23199652322528688 0 -0.12269023313189883 0.20440296529839402 0.97116761399423968 0
		 -51.400953812549758 105.49072132320831 3.7417494539498373 1;
	setAttr ".wm[63]" -type "matrix" 0.66791399412771846 0.73308189319300077 -0.12838159650402989 0
		 -0.74207941164644742 0.66912302716166772 -0.039906407160614471 0 0.056648417972790036 0.12192338739787519 0.99092161362370512 0
		 -54.069819060701789 102.26915341487128 4.2319455243528017 1;
	setAttr ".wm[64]" -type "matrix" 0.69811578462239599 0.70470044489998518 -0.12661608988915721 0
		 -0.71374036455999623 0.69895062097632576 -0.045196475908782396 0 0.056648417972790063 0.12192338739787524 0.99092161362370557 0
		 -56.725322259032623 99.354522296228851 4.742347290882452 1;
	setAttr ".wm[65]" -type "matrix" 0.56452304475794113 0.81471074581573588 -0.13251465047152391 0
		 -0.82347112194563521 0.56690483174673623 -0.022676487025157049 0 0.056648417972790056 0.12192338739787523 0.99092161362370546 0
		 -58.359896048987473 97.704601400504728 5.038787229500155 1;
	setAttr ".wm[66]" -type "matrix" 0.70548331984802271 0.66095266915715378 -0.2558023740121379 0
		 -0.69648163947271235 0.71336369083942031 -0.077624548110516112 0 0.13117397338502093 0.23292448073569544 0.96360758350087372 0
		 -51.317511929990658 105.86787171616714 4.9745901113348481 1;
	setAttr ".wm[67]" -type "matrix" 0.6835096734435685 0.67611211759553658 -0.27511257831939412 0
		 -0.68147768431941269 0.72611272948401817 0.091369961452981679 0 0.26153908328147879 0.12503083028496498 0.95706039485214123 0
		 -54.047415841351857 102.71793494372298 6.6655156204629948 1;
	setAttr ".wm[68]" -type "matrix" 0.656897572866038 0.7034360607963448 -0.27140981399726055 0
		 -0.70716538849055022 0.6996749244110243 0.10184357354019197 0 0.26153908328147879 0.12503083028496498 0.95706039485214123 0
		 -56.769911793174948 100.02480081183569 7.7612947843152469 1;
	setAttr ".wm[69]" -type "matrix" 0.52706514380669856 0.8121786661502155 -0.25013625973552756 0
		 -0.80857877915531973 0.56985358271112818 0.14651707126128602 0 0.26153908328147885 0.12503083028496501 0.95706039485214145 0
		 -58.598025928668029 98.067233682223588 8.5166430624787886 1;
	setAttr ".wm[70]" -type "matrix" 0.68644407301824217 0.58173328566754456 -0.43632661959198482 0
		 -0.63592959937283522 0.77124623364528644 0.027799131811360935 0 0.35268694228682596 0.25839046312587288 0.89935882121985478 0
		 -49.668555333651888 105.86483073662932 6.5173905555281664 1;
	setAttr ".wm[71]" -type "matrix" 0.63625026771310822 0.61296430997845186 -0.46846595556949344 0
		 -0.6160997953676417 0.76917702121868814 0.16966953815313068 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -53.032478128466728 102.86569317894235 8.658568190210385 1;
	setAttr ".wm[72]" -type "matrix" 0.59450333633130881 0.6620580158324737 -0.45633865359282294 0
		 -0.65647478558433181 0.72734979133164102 0.20000784220081153 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -55.481948397552941 100.50586874295713 10.46213082298447 1;
	setAttr ".wm[73]" -type "matrix" 0.43810377078590867 0.80395412349158568 -0.40214780037200681 0
		 -0.76971322389589969 0.56658300592154154 0.29415174716579817 0 0.46433461962570516 0.18066949029038273 0.86703627161455343 0
		 -57.028349301883779 98.783805968834287 11.649126277232277 1;
	setAttr ".wm[74]" -type "matrix" -0.09885983765176326 0.44769312388330573 -0.88870557516371762 0
		 0.50135337936013924 0.79385822750321688 0.34414227236656075 0 0.85957636164778017 -0.411533694189259 -0.3029331560646773 0
		 -48.046098018110513 106.54095506625929 5.8269775914265569 1;
	setAttr ".wm[75]" -type "matrix" 0.074003171099619333 0.52696198943214534 -0.84666084848711198 0
		 0.42542073957074622 0.7511821419532263 0.50472030269610113 0 0.90196492449001597 -0.3975379872468538 -0.16859069869195181 0
		 -47.680133893524776 104.8844993194197 9.1161428378692566 1;
	setAttr ".wm[76]" -type "matrix" 0.062124904019716293 0.50583430841686505 -0.86039069539888235 0
		 0.42731694477315213 0.76556854763251136 0.48094181309757955 0 0.9019649244900162 -0.39753798724685391 -0.16859069869195184 0
		 -47.946776567543857 102.98551070562955 12.167153067985554 1;
	setAttr ".wm[77]" -type "matrix" 0.70576622389036392 0.62040574198440057 -0.34203910964730655 0
		 -0.66257454581708664 0.74894555221145465 -0.0086908605995362799 0 0.25077681003397767 0.232760123593937 0.9396455270013887 0
		 -44.155664700436326 99.500375360597417 4.7707688447158656 1;
	setAttr ".wm[78]" -type "matrix" 0.98722325285328649 -0.15258975100865321 -0.04589789660644783 2.1684043449710089e-19
		 -0.045885930499993371 0.0036017891527009003 -0.99894019265271838 -6.7762635780344027e-21
		 0.15259334981553574 0.98828305409028172 -0.0034459527063724479 8.6736173798840355e-19
		 1.9059499999999823 141.45100000000016 0.8787140000000474 0.99999999999999978;
	setAttr ".wm[79]" -type "matrix" 0.67779167351011005 -0.73211442490166057 -0.067874267371912517 0
		 -0.16361253338183868 -0.060182238827432004 -0.98468727880992535 0 0.71681893546469666 0.67851791942485196 -0.16057411615397876 0
		 12.651900000000044 144.38300000000024 -0.94801299999993571 1;
	setAttr ".wm[80]" -type "matrix" 0.69510601711334885 -0.6773124550791646 0.24098851252176268 0
		 0.054756175287137665 -0.28436116333635914 -0.95715228153827081 0 0.71681893546469655 0.67851791942485074 -0.16057411615397876 0
		 29.586800018770774 126.09100000771571 -2.6438798957774163 1;
	setAttr ".wm[81]" -type "matrix" 0.71787901197163584 -0.66599231906071632 0.20274110368338621 0
		 0.046233631233899924 -0.24497251308359272 -0.96842703348080761 0 0.69463096354363285 0.70458689938547647 -0.14506938236859521 0
		 35.900900023521835 119.93799998602032 -0.45481797045196704 1;
	setAttr ".wm[82]" -type "matrix" 0.71787892004695819 -0.66599241186797242 0.20274112431002958 0
		 0.046233632617379034 -0.24497251375784027 -0.96842703324420198 0 0.69463105845276929 0.70458681142741186 -0.14506935512140098 0
		 42.215000028272755 113.78599996432436 1.7342399548714975 1;
	setAttr ".wm[83]" -type "matrix" 0.67678661499311121 -0.68948062082283301 0.25802393547097052 0
		 -0.71273477378055472 -0.70141706094860345 -0.0048217065656172009 0 0.18430686370872745 -0.18063936481283649 -0.96612649268606021 0
		 48.529100033023006 107.63399994262429 3.9232998801753101 1;
	setAttr ".wm[84]" -type "matrix" 0.54792084636648175 -0.83211082053894303 -0.085873910234983752 0
		 -0.74076070673567562 -0.53032372625926105 0.41234733019986303 0 -0.38865964734391989 -0.16232167972424538 -0.90697042444503095 0
		 51.431200021302487 105.13099994780617 2.4697598478512677 1;
	setAttr ".wm[85]" -type "matrix" 0.68846205599092569 -0.72521555191987963 -0.0090774839186535949 0
		 -0.71077603102665143 -0.67713849237718049 0.19047544686693943 0 -0.14428247010204809 -0.12468305977439442 -0.98164999028500355 0
		 53.319200003301532 101.73000000308912 2.3403099992539231 1;
	setAttr ".wm[86]" -type "matrix" 0.65739015310174154 -0.75354983603706305 -0.0009117090465724613 0
		 -0.73960852571284996 -0.64545859068422351 0.19068937150455195 0 -0.14428241506758013 -0.12468300734443757 -0.98165000503326771 0
		 55.622500003488383 99.304100003267024 2.3099599992119919 1;
	setAttr ".wm[87]" -type "matrix" 0.57043064199581417 -0.8210911965851645 0.020448216611432805 0
		 -0.8085737485942841 -0.55701294714363803 0.18959185055942207 0 -0.14428227804006549 -0.12468289218935949 -0.98165003979975796 0
		 56.923300003603103 97.813000003367236 2.3081299991867885 1;
	setAttr ".wm[88]" -type "matrix" 0.71933800273810278 -0.69248953693861726 0.054873299949034254 0
		 -0.68373968010343122 -0.691865359764544 0.23199649525356103 0 -0.12269021015881407 -0.20440294809130871 -0.97116762051808947 0
		 51.401000029179272 105.49099994000869 3.7417498502451512 1;
	setAttr ".wm[89]" -type "matrix" 0.66791399493226689 -0.73308189318097661 0.12838159238697783 0
		 -0.74207940680089202 -0.66912303704866827 0.039906331487663593 0 0.056648471962234784 -0.12192333320969904 -0.99092161720460048 0
		 54.069800003268838 102.26900000312273 4.2319499992572656 1;
	setAttr ".wm[90]" -type "matrix" 0.69811578502417992 -0.70470044404508159 0.12661609243196051 0
		 -0.71374035484026666 -0.69895064128205464 0.045196315379633999 0 0.056648535484717107 -0.12192327593232903 -0.99092162062060485 0
		 56.725300003495839 99.354500003320851 4.7423499992074456 1;
	setAttr ".wm[91]" -type "matrix" 0.5645230484519953 -0.81471075196659593 0.13251459691856751 0
		 -0.82347110318202643 -0.56690487182321558 0.022676166503178857 0 0.056648653917301076 -0.12192315995383388 -0.99092162812011997 0
		 58.359900003624389 97.704600003443005 5.0387899991786398 1;
	setAttr ".wm[92]" -type "matrix" 0.70548331962441546 -0.66095266820136622 0.2558023770984334 0
		 -0.69648163535994834 -0.71336369797286858 0.077624519456192892 0 0.13117399642476923 -0.23292446160068431 -0.96360758498985788 0
		 51.317500036850063 105.86799993252174 4.9745898530542245 1;
	setAttr ".wm[93]" -type "matrix" 0.68350967268014062 -0.67611211865997423 0.27511257760016794 0
		 -0.68147766575212998 -0.72611273788552189 -0.091370033169628564 0 0.26153913365635062 -0.1250307757374679 -0.95706038821214057 0
		 54.047400003245919 102.71800000308994 6.6655199992631724 1;
	setAttr ".wm[94]" -type "matrix" 0.6568975736324143 -0.7034360625728806 0.27140980753799104 0
		 -0.70716534857727775 -0.69967494296271859 -0.10184372323168761 0 0.26153918927652675 -0.12503071647430875 -0.95706038075478717 0
		 56.76990000345841 100.0250000032856 7.7612899992158582 1;
	setAttr ".wm[95]" -type "matrix" 0.52706515839517298 -0.81217867442397507 0.25013620213152993 0
		 -0.80857869912906766 -0.56985362020700125 -0.14651736706519916 0 0.2615393012925869 -0.12503060564473531 -0.95706036462257493 0
		 58.598000003612782 98.067200003416843 8.5166399991822015 1;
	setAttr ".wm[96]" -type "matrix" 0.68644406818827197 -0.58173328825151771 0.43632662374557374 0
		 -0.63592959247529479 -0.77124623830857908 -0.027799160222421033 0 0.35268696412447609 -0.25839044338934791 -0.89935881832654352 0
		 49.668600045832292 105.86499992516003 6.5173898626391331 1;
	setAttr ".wm[97]" -type "matrix" 0.63625026266132978 -0.61296431630995918 0.46846595414614045 0
		 -0.6160997675505131 -0.7691770290370834 -0.16966960371819631 0 0.46433466345685637 -0.18066943552342049 -0.86703625955323049 0
		 53.032500003244301 102.86600000298513 8.6585699992683871 1;
	setAttr ".wm[98]" -type "matrix" 0.59450333542580558 -0.66205802356247934 0.45633864355776022 0
		 -0.65647472229101556 -0.72734981241624463 -0.20000797326853476 0 0.46433471026892348 -0.18066937708034034 -0.86703624666150891 0
		 55.481900003434774 100.50600000315038 10.462099999225865 1;
	setAttr ".wm[99]" -type "matrix" 0.43810379853869846 -0.80395414141254462 0.40214773431114109 0
		 -0.76971309470228333 -0.56658305098007145 -0.29415199843949114 0 0.46433480760093421 -0.18066926924004981 -0.86703621700738087 0
		 57.028300003573236 98.783800003254186 11.649099999195982 1;
	setAttr ".wm[100]" -type "matrix" -0.098859852428748229 -0.44769314260279847 0.88870556408981594 0
		 0.50135339265469825 -0.7938582166289323 -0.34414227808328923 0 0.8595763521941433 0.41153369480172936 0.3029331820574418 0
		 48.046100002947341 106.54100000263828 5.8269799993403382 1;
	setAttr ".wm[101]" -type "matrix" 0.074003160782616234 -0.52696200096903356 0.84666084220831694 0
		 0.42542078560726548 -0.75118211749601005 -0.50472030029265558 0 0.90196490362290649 0.39753801816797885 0.16859073741933911 0
		 47.680100003090473 104.88400000256792 9.1161399993208327 1;
	setAttr ".wm[102]" -type "matrix" 0.062124891023688567 -0.5058343212478732 0.86039068879376057 0
		 0.42731704077401966 -0.76556850134998067 -0.48094180147381743 0 0.9019648799035519 0.39753806005016695 0.16859076556003924 0
		 47.946800003251084 102.98600000254945 12.16719999929526 1;
	setAttr ".wm[103]" -type "matrix" 0.70576623213612844 -0.6204057326714939 0.34203910952509486 0
		 -0.66257453623466001 -0.7489455606743507 0.0086908618449312702 0 0.25077681214537634 -0.23276012118601855 -0.93964552703435589 0
		 44.155665240309744 99.500375904018341 4.770768841485558 1;
	setAttr ".wm[104]" -type "matrix" -0.16623491312112509 -0.98592806263842847 -0.01765811319612913 0
		 0.0081031688513768466 -0.019272484445916074 0.99978143111274476 0 -0.98605288515078038 0.16605549266831629 0.011192901344365125 0
		 -8.8499904284986464 100.68112073166321 2.5312835994138592 1;
	setAttr ".wm[105]" -type "matrix" -0.16623427681814193 -0.97937037187599285 -0.11489055619253123 0
		 -0.0081162119594854771 -0.11514880827070065 0.99331509555491315 0 -0.98605288515078038 0.16605549266831629 0.011192901344365125 0
		 -15.740982037816881 59.811112949200904 1.7992959325716233 1;
	setAttr ".wm[106]" -type "matrix" -0.099182376818907708 -0.98934728658855575 0.1065589163252639 0
		 -0.1267674284252073 0.11877712597981886 0.98479541704581175 0 -0.98696143552775761 0.084166150344640533 -0.13719760900668507 0
		 -24.665877825994059 7.2300275281790647 -4.3690243792627674 1;
	setAttr ".wm[107]" -type "matrix" 0.15711523734246471 0.3186565887746684 -0.93475814017601011 0
		 -0.034956072087819645 -0.94412607080127597 -0.32772554898502482 0 -0.98696143552775761 0.084166150344640533 -0.13719760900668507 0
		 -25.963076854118835 3.5460229890649622 6.6308940051413616 1;
	setAttr ".wm[108]" -type "matrix" -0.16887728999471369 -0.97892165687134081 -0.11486013508746465 0
		 -0.0081590004482017912 -0.11514148514880791 0.99331559391233415 0 -0.98560331352716546 0.1686855895030637 0.011457759740729542 0
		 -15.740982037816833 59.811112949200897 1.7992959325716262 1;
	setAttr ".wm[109]" -type "matrix" -0.16623490924016593 0.98592806327569127 0.017658114150678458 0
		 0.0081031685181560537 0.019272485313089463 -0.9997814310987293 0 -0.98605288580779482 -0.16605548878402471 -0.011192901090356007 0
		 8.84999 100.68100000000005 2.5312799999998981 1;
	setAttr ".wm[110]" -type "matrix" -0.16623427292317783 0.97937037242583425 0.11489055714106854 0
		 -0.0081162119133415672 0.1151488091956724 -0.99331509544806396 0 -0.98605288580779482 -0.16605548878402471 -0.011192901090356007 0
		 15.740999817396567 59.811099969924619 1.7992999601843469 1;
	setAttr ".wm[111]" -type "matrix" -0.099182372809613034 0.98934728677451489 -0.10655891833047498 0
		 -0.12676742832247015 -0.11877712741227475 -0.98479541688626671 0 -0.98696143594385788 -0.084166146137233555 0.13719760859447774 0
		 24.665899616110075 7.2300299417227194 -4.3690200906524206 1;
	setAttr ".wm[112]" -type "matrix" 0.1571152355239242 -0.31865658756175985 0.93475814089514975 0
		 -0.034956068513199663 0.94412607158572881 0.32772554710641677 0 -0.98696143594385788 -0.084166146137233555 0.13719760859447774 0
		 25.963099517261465 3.5460199445853786 6.6308899219633508 1;
	setAttr ".wm[113]" -type "matrix" -0.16887728610152503 0.97892165743159398 0.11486013603667954 0
		 -0.0081590004020868582 0.11514148607394825 -0.99331559380547396 0 -0.98560331419462199 -0.16868558562030034 -0.011457759489269009 0
		 15.74099981739656 59.811099969924641 1.7992999601843467 1;
	setAttr ".wm[114]" -type "matrix" 0.9834936468362202 -0.11081617994448972 -0.1430385294083481 0
		 0.18011993069812746 0.67488957806275718 0.71559825879300154 0 0.017235347344748631 -0.72955043121417207 0.68370981499253147 0
		 -24.924304955300997 96.496711917571844 7.8370384420249826 1;
	setAttr -s 131 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.70710678118654757 0 0 0.70710678118654757 1 1 1 no;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 -1.5707963267948966 -1.5073866481569129
		 1.5707963267948966 0 2.9500488819890415e-15 -1.2126020492035607 106.91807643174158 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[2]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999989 1 0
		 0 -0.06340967863798358 0 6.1017875939995747 -0.15395801327480907 3.6258441666402254e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[3]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0
		 0 0 0 7.1064128537484663 1.7208456881689926e-14 2.1839356133292227e-15 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002 1.0000000000000002 1 no;
	setAttr ".xm[4]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 0
		 0 0 0 7.1064128537483242 -1.7763568394002505e-14 2.1212619842216188e-15 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[5]" -type "matrix" "xform" 1 0.99999999999999989 1 7.8457562574164839e-06
		 0 0 0 7.1064128537484521 -4.3076653355456074e-14 -2.7678297188432797e-15 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[6]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1 -7.8452173419092492e-06
		 9.3303504099658284e-08 0.011892505921055873 0 10.10191899841854 -1.7817312580881151e-07
		 8.0897561632669538e-13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 -5.5511151076161339e-17 1.6653345374547232e-16
		 1.8626466480320403e-09 0 5.2855761761029498 0.054372259906909193 8.6477981315572983e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[8]" -type "matrix" "xform" 1 0.99999999999999989 1 -1.7098080609125742e-06
		 3.8072129527173599e-17 1.8626469255884449e-09 0 4.3156507682084282 -6.616929226765933e-14
		 -4.1578533522099213e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[9]" -type "matrix" "xform" 0.99999999999999989 1.0000000000000002 1 1.7095800587148238e-06
		 -2.8913028179562562e-08 0.016910750434710551 0 4.315650768208144 -6.0536020196622076e-08
		 -8.1071054817277721e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1.0000000000000002
		 1 no;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 1.6179914913686875e-17 -1.4962717294406165e-08
		 1.4961930916435054e-08 0 4.8026209177277508 -0.59032389316749789 9.2990454192787974e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.50410755400545382 0.86364088254009741 -1.2656689649336423e-13 -2.1683536642005498e-13 1.0000000000000002
		 0.99999999999999978 1 no;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 5.8980595609491589e-17 1.3877787917197543e-16
		 3.7091211745770597e-08 2 4.4203330421564715 -4.6518287504795239 3.0371199999986622 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.036230297806534695 0.011095207388086257 0.9816513894827007 0.18688181136897247 1
		 1 1 no;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 -2.2551397772166909e-17 -3.9985376163088358e-16
		 3.7091218360162804e-08 2 4.4204599100363993 -4.6515944105462665 -3.0371181404855396 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.011095207388366338 0.03623029780658716 -0.1868818113689624 0.98165138948269737 1
		 1 1 no;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 -1.3889663028581698 -0.64201572129838114
		 -1.8565783017479622 0 1.1096349283511842 -4.8819012268364759 6.9258899999985974 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.16989946040616788 -0.68639214254940839 -0.16989946040611961 0.68639214254960335 1
		 1 1 no;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 1.2398541782538445e-16 -0.010549634695053104
		 -0.036985330283640719 0 -10.430416042632132 -0.00028979722559085985 -7.0129922960404656e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 -2.9765865066569792e-22 -6.4914374382539164e-24
		 0.0069214617833507916 0 -10.365849858855441 0.00022733790774509544 5.3694186824770895e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 1.2987546500159025e-09 -3.5478293460282203e-24
		 0.050343506038187706 0 -10.150095412245179 0.00010630270723765989 3.1937678535598479e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0661204877087727 -8.7574835276882368e-05
		 9.7789364517097965e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 -1.3889663062992876 -0.64201572228408965
		 -1.856578295951764 0 1.1098490750047745 -4.8815038278960117 -6.9258910268320983 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 4.7568631481659647e-11 -0.010549634695053104
		 -0.036985330283641572 0 10.43008776762052 0 -1.3114529906488315e-08 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0.006921461571671293 0 10.366029386028998
		 -2.1941843897366198e-09 -2.0739300055083731e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0.050343506038188504 0 10.150239309512926
		 0 -1.8897502229719976e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955831 -8.5265128291212022e-14
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 -0.34905313934870286 2.2854272777904101
		 -0.46761769230970618 0 -1.2102929841183681 0.3967697917467774 5.2074500000000956 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.16989946040616788 -0.68639214254940839 -0.16989946040611961 0.68639214254960335 1
		 1 1 no;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 -15.81463041927654
		 -0.00035596689897943179 4.2982948684766598e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 -0.34905314108374963 2.2854272792419521
		 -0.46761769471148013 0 -1.2103353799759873 0.3966894715563285 -5.2074456457591101 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 15.814505966825358
		 -4.5352610555937645e-14 -4.829470157119431e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 -1.5707963071154689 0.88884557603416059
		 -1.5707963014460664 0 -7.0130456703946322 -0.17395500476195025 -7.3179834872874581e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 -3.2367863451688523e-16 -1.3598403582063527e-16
		 -0.15195975949343166 0 10.430087767620478 -2.8421709430404007e-14 -2.9787611891256716e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 2.0201893129606082e-16 3.4558026964949173e-16
		 -0.1179986596107485 0 10.366029386028856 9.9475983006414026e-14 -2.0326213636361187e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0.074121385812759386 0 10.150239309512983
		 2.8421709430404007e-14 -1.4193671804834003e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 -1.570796326793062 1.2416537372796448
		 -1.5707963267937375 0 -8.3413020841008745 -9.3679930856922908 -2.6792029641649294e-12 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 -0.15195976197719577 0 9.2652752597442358
		 -2.8421709430404007e-14 -5.2997581325791124e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 -0.1179986596107483 0 9.2012168781528345
		 -2.8421709430404007e-14 -5.2997581325015642e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 0.074121385812759399 0 10.150239309512799
		 5.6843418860808015e-14 -5.273559366995343e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.9012613903194095 -1.1918244169351055e-13
		 2.7911256618952912e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 -1.421014020081814 2.1207073604693121
		 -0.75628733483214461 0 -0.21640045264911123 -10.952800494065144 -3.6744949953490935 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 4.3133393145755753e-17 3.0879586016178258e-14
		 -0.15195976654559687 0 9.087399803953339 5.6843418860808015e-14 2.8421709430404007e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 1.4275858617504556e-17 -7.2750710579015288e-14
		 -0.18224464892408626 0 9.0233414223619732 8.5265128291212022e-14 -1.4210854715202004e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 -4.1525065274039051e-17 3.0877114415574972e-13
		 -0.16351142985236447 0 8.8075513458457664 2.8421709430404007e-14 2.8421709430404007e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 1.5707963267940743 0.76506022547182384
		 1.5707963267937504 0 0.67915086336401487 -12.281030303822092 -3.5069912244505841e-12 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.68639214254960323 -0.16989946040612008 0.68639214254940828 0.16989946040616832 1
		 1 1 no;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 -2.5133857222261872e-15 -2.3312885627810856e-08
		 -0.15195978280635897 0 9.313328631880367 7.1054273576010019e-14 -6.7426104766902947e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 -4.2251710478348784e-09 8.3615009589440992e-17
		 -0.18224464356899256 0 9.2492702502887738 -8.5265128291212022e-14 -2.3595940807264078e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 -3.7949616750677825e-09 1.4554146402761714e-16
		 -0.16351142525672907 0 9.033480173772773 2.8421709430404007e-14 -2.1483241584069248e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 -1.4210140071887354 2.1207073660859095
		 -0.75628732919341157 0 -0.21617129745976627 -10.952367709116913 3.6744899999968754 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.16989946040616788 -0.68639214254940839 -0.16989946040611961 0.68639214254960335 1
		 1 1 no;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 5.4635947891447709e-17 -6.810157591515401e-13
		 -0.15195976616339521 0 -9.087394113410781 3.205034687425723e-06 6.0716737664279208e-06 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 6.5154858591901985e-18 4.5376498604812705e-14
		 -0.18224464850158875 0 -9.0235233507382659 -0.00052037032483553958 -0.00043999529067662024 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 1.0789651117708137e-16 -6.0309908950540953e-14
		 -0.16351142872045477 0 -8.807561995847891 6.6491917323219241e-06 -4.1861853119939951e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.2904784139758925e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075 -9.3151160456272919e-06
		 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.2904784139758925e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 2.8494871086844658 1.4107710302056786
		 -0.30407647001988564 0 -2.9859470317928469 0.13640321631411823 1.9059464187582136 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 no;
	setAttr ".xm[53]" -type "matrix" "xform" 0.99999999999999989 1 1 -0.10347254579528929
		 0.66858452661223389 0.043424271655614216 0 -10.245099123158059 -1.3422635037096378
		 -4.5436668046619104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 -7.1411470038265571e-09 -4.6680708679039875e-17
		 -0.3154709339141849 0 -24.985365366661696 -8.8817841970012523e-15 -2.5096966282944777e-08 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002 1 1 no;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1.0000000000000002 0.99999999999999989 0.022439298514312072
		 -0.030151141088977363 0.03465923826794761 0 -9.0836620330811115 8.1712414612411521e-14
		 -4.9788212663770537e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1.0000000000000002 0.99999999999999989 0.022439298921375823
		 -0.03015100885203351 0.034659239745862332 0 -18.167304992675817 4.2632564145606011e-14
		 -9.9576340062412783e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 -1.4053116049243266 0.024125801166034647
		 -0.01385291488529373 0 -27.25101089477554 2.8421709430404007e-14 2.6822348786481598e-08 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 -0.4846613375939911 -0.34082271412454923
		 0.20683247113898254 0 -3.3146772399041424 0.30593533141113483 -2.3912868507469351 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[59]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999967 0.21728739237732986
		 0.14210398117365533 -0.13081735908478787 0 -3.8750499018763662 -0.35138326677190435
		 0.064411754382071251 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[60]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000002 6.0949525941459831e-17
		 -7.0710595287153108e-17 0.042839880343696658 0 -3.345622698080696 3.0366025654871009e-05
		 3.2629206593526305e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1 1.0000000000000004 no;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 2.9800130531997195e-08 -1.0688931583179522e-16
		 0.11221964471581981 0 -1.9787311726573407 -1.7523876778113845e-05 -3.1002964583137782e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999956 0.99999999999999978
		 0.99999999999999978 no;
	setAttr ".xm[62]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999978
		 0.99999999999999978 -0.23212590879105879 -0.20611149294555828 -0.027830380771129908 0 -3.3742079734802459
		 0.54299175739282646 -1.0917816162109872 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 0.99999999999999967 0.19051677519963012
		 0.056813017444128422 0.080515474192024469 0 -4.1776169446006968 -0.5178059194894189
		 0.14500821420175924 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1.0000000000000002 1.0000000000000002 no;
	setAttr ".xm[64]" -type "matrix" "xform" 1 1.0000000000000002 1.0000000000000004 -2.5740344605707482e-16
		 2.9361957016482274e-17 -0.041485160975395258 0 -3.9758372396752577 -2.0846833649557084e-05
		 -2.3612021323060617e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1.0000000000000004 no;
	setAttr ".xm[65]" -type "matrix" "xform" 0.99999999999999956 1 0.99999999999999989 -1.9686770204917884e-16
		 5.8899252292078136e-17 0.17337618308525732 0 -2.3413558190788528 5.0017570259797139e-05
		 -1.122148838561543e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0.99999999999999978
		 0.99999999999999956 no;
	setAttr ".xm[66]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999933
		 0.99999999999999989 -0.074569197575235266 -0.0022820379734448276 -0.04046356645828731 0 -3.3758001327514648
		 0.7540039420127016 0.18280552327627575 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr ".xm[67]" -type "matrix" "xform" 1 1.0000000000000002 0.99999999999999978 0.16860687812014935
		 0.017959788647034548 0.0276253555217135 0 -4.440403551189096 -0.47697989864838064
		 0.53759891364656909 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000004
		 1.0000000000000007 1.0000000000000002 no;
	setAttr ".xm[68]" -type "matrix" "xform" 0.99999999999999956 1.0000000000000002 1 -1.6464704788299938e-18
		 3.7334956056898347e-17 0.038323517305856772 0 -3.9831755708972381 -7.7438591731038287e-05
		 -3.7052828808725735e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0.99999999999999978
		 1.0000000000000002 no;
	setAttr ".xm[69]" -type "matrix" "xform" 1 1.0000000000000004 1.0000000000000002 -3.6358584526221766e-17
		 2.2597200671450969e-16 0.17089466466272379 0 -2.7829159846057685 4.577730578603223e-05
		 3.4382665349497188e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000004
		 0.99999999999999978 1 no;
	setAttr ".xm[70]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999967
		 0.99999999999999989 0.049897453557281972 0.19110757594355124 -0.084965933649405578 0 -2.6599845153329866
		 -0.4159588290877565 1.9767106018318614 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr ".xm[71]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000004 1 0.13455677356558426
		 0.03854724164864904 0.05518206327710496 0 -4.9880958094806296 -0.11433259102436466
		 -0.035673193551019722 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 1.0000000000000004 1.0000000000000002 no;
	setAttr ".xm[72]" -type "matrix" "xform" 0.99999999999999978 1 1 -1.0396192035568533e-16
		 -6.5581871347501883e-17 0.065586671320114837 0 -3.8498719637273311 5.0402059770249252e-06
		 3.2097038910050557e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978
		 0.99999999999999956 1 no;
	setAttr ".xm[73]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999989
		 1 -1.4353122041272943e-17 1.237326189900545e-16 0.21845240790709661 0 -2.6011178677174307
		 3.9602186035381237e-05 -3.5662756869836443e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1.0000000000000002 1 1 no;
	setAttr ".xm[74]" -type "matrix" "xform" 0.99999999999999978 1.0000000000000004 0.99999999999999989 1.9225701588674511
		 0.92057782684982226 0.67904225884542513 0 -0.91760942893503028 -1.1014244062153011
		 1.7308490315452403 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[75]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 -0.097021332065639801
		 -0.10341463623368634 0.16570151946539086 0 -3.7008624939683514 0.00042712956194890239
		 -0.00013574546019867739 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1.0000000000000002
		 0.99999999999999956 1.0000000000000002 no;
	setAttr ".xm[76]" -type "matrix" "xform" 0.99999999999999956 0.99999999999999978
		 1.0000000000000002 -8.3799869704683397e-16 3.7694279588177936e-16 -0.02785733322075197 0 -3.603598131432868
		 -1.4851160784701278e-05 4.5825581793224046e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 0.99999999999999978 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[77]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 0.0047942892270618868
		 0.088420960355872741 -0.069839543563227038 0 -2.8664323685812079 -8.8177469688888692
		 0.15564549982022413 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[78]" -type "matrix" "xform" 1 1 1 2.8494871086844702 1.4107710302056791
		 -0.30407647001988175 0 -2.9861035938116913 0.13640473110745965 -1.905949999997212 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 6.123233995736766e-17 0.99999999999999978
		 0.99999999999999978 1 no;
	setAttr ".xm[79]" -type "matrix" "xform" 1 1 1 -0.10347254736769751 0.66858452626377407
		 0.043424269118963611 0 10.245101491015639 1.3422635522432187 4.5437012368925309 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[80]" -type "matrix" "xform" 1 1 1 -3.2478416388263032e-09 9.9512977042191868e-09
		 -0.31547093391418474 0 24.985277002212783 -9.8236452270583641e-06 0.00011955467634550132 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[81]" -type "matrix" "xform" 1.0000000000000002 1 1.0000000000000002 0.022439298514312433
		 -0.030151141088978064 0.034659238267947388 0 9.0840112339567298 0.00014459456479087862
		 -0.00036101298397284154 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[82]" -type "matrix" "xform" 1.0000000000000002 1 1.0000000000000002 0.022439298921375739
		 -0.030151008852034214 0.03465923974586229 0 18.167344191504171 8.6565774317648447e-06
		 -4.2865752234888532e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[83]" -type "matrix" "xform" 1 1 1 -1.4053116049243282 0.024125801166034421
		 -0.013852914885293792 0 27.250677631026207 -0.00012919569454794555 0.00027496033115426144 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[84]" -type "matrix" "xform" 1 1 1 -0.48466133759399171 -0.34082271412454912
		 0.20683247113898309 0 3.3148242982811098 -0.30577213519798363 2.3913208096074108 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[85]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000002 0.21728739231244612
		 0.14210397921932891 -0.13081735958403426 0 3.8755997674065981 0.35169646324344228
		 -0.064326199293859077 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.2351741790771471e-08 0 0 0.99999999999999978 1
		 1 1 no;
	setAttr ".xm[86]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 3.2351884525559735e-17
		 -7.74583379897025e-17 0.042839880343696429 0 3.3453105626032595 -0.00024109367956270944
		 -6.4101482177392199e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 3.8714352419276774e-08 0 0 0.99999999999999922 0.99999999999999956
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[87]" -type "matrix" "xform" 1.0000000000000002 0.99999999999999989 0.99999999999999978 2.9800130952496924e-08
		 -9.4296843032386571e-17 0.11221964471582212 0 1.9787529400970811 1.1572617779620487e-05
		 2.8686236287711608e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.6345732554492353e-08 0 0 0.99999999999999711 1.0000000000000002
		 1 1.0000000000000002 no;
	setAttr ".xm[88]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999978
		 0.99999999999999978 -0.23212590879105943 -0.2061114929455572 -0.027830380771128628 0 3.3743761960166054
		 -0.5428908496620295 1.0918213341065286 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[89]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000004 1 0.190516775112131
		 0.056813015435213887 0.080515474044547994 0 4.1778693871913077 0.51815042149446811
		 -0.14491585613709645 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.3560804576936208e-08 0 0 0.99999999999999967 1.0000000000000002
		 1.0000000000000002 1.0000000000000002 no;
	setAttr ".xm[90]" -type "matrix" "xform" 1 1 1 5.1886751309679685e-17 -3.2950662056346453e-17
		 -0.04148516097539362 0 3.9757387559728841 -6.4581993157730722e-05 9.1785522258192032e-06 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 4.2800326992109625e-08 0 0 0.99999999999999911 0.99999999999999956
		 0.99999999999999956 1 no;
	setAttr ".xm[91]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999978
		 0.99999999999999978 9.8084952608258243e-18 -6.9586648795289866e-18 0.17337618308525804 0 2.3413593992710489
		 -8.332541793265591e-05 1.0103868230970647e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		8.2966154259890625e-08 0 0 0.99999999999999656 1 1 1 no;
	setAttr ".xm[92]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999933
		 0.99999999999999989 -0.07456919757523521 -0.0022820379734449941 -0.040463566458286901 0 3.3760325592989133
		 -0.75375612098063982 -0.18274871473837351 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.4901161193847655e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[93]" -type "matrix" "xform" 1.0000000000000004 1.0000000000000002 1.0000000000000002 0.16860687809726399
		 0.017959786639621344 0.027625355704169529 0 4.4404436996352352 0.47702804534273469
		 -0.53758918853787208 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.2351741790771478e-08 0 0 0.99999999999999978 1.0000000000000004
		 1.0000000000000007 1.0000000000000002 no;
	setAttr ".xm[94]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999978
		 0.99999999999999978 -1.4791067683807257e-17 1.6229076646639385e-16 0.038323517305858819 0 3.9830851285798623
		 -2.1883413310774813e-05 3.0108925596294966e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		4.0808510594454864e-08 0 0 0.99999999999999911 0.99999999999999956 0.99999999999999978
		 0.99999999999999978 no;
	setAttr ".xm[95]" -type "matrix" "xform" 0.99999999999999978 1 0.99999999999999989 7.6203623133146036e-17
		 7.6906985121767708e-17 0.17089466466272413 0 2.7830709757863872 0.00012697305766096179
		 -1.062991713318695e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.9200758134831861e-08 0 0 0.99999999999999689 1.0000000000000002
		 1.0000000000000002 1.0000000000000002 no;
	setAttr ".xm[96]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999967
		 0.99999999999999989 0.049897453557295322 0.19110757594333291 -0.084965933649365874 0 2.6602268929717923
		 0.41613756851498351 -1.9766503434042431 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[97]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002 1.0000000000000002 0.13455677351207793
		 0.038547239683780134 0.055182063722367593 0 4.9880011577836356 0.1142408699372055
		 0.035627345710331326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.1073424255447021e-08 0 0 0.99999999999999978 1.0000000000000002
		 1.0000000000000004 1.0000000000000002 no;
	setAttr ".xm[98]" -type "matrix" "xform" 1 0.99999999999999956 0.99999999999999989 4.6223786832100559e-17
		 -6.1058464431048955e-17 0.06558667132011553 0 3.8499195821353283 0.00017879725817238068
		 -4.7125900846101132e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 3.7990655851310396e-08 0 0 0.99999999999999922 0.99999999999999978
		 0.99999999999999978 0.99999999999999978 no;
	setAttr ".xm[99]" -type "matrix" "xform" 1.0000000000000007 1 1 1.1788959362995236e-16
		 -1.0473408412866641e-16 0.21845240790709744 0 2.6012102559847818 5.9871962250213073e-05
		 2.3972451856479893e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7.4132340930895503e-08 0 0 0.99999999999999722 1
		 1.0000000000000004 1.0000000000000002 no;
	setAttr ".xm[100]" -type "matrix" "xform" 1.0000000000000004 1 1 1.9225701567427036
		 0.92057782533355903 0.67904225748620395 0 0.91790935800919016 1.1017207357645447
		 -1.7307772025400165 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[101]" -type "matrix" "xform" 1.0000000000000002 1 0.99999999999999989 -0.097021332065636776
		 -0.10341463623368666 0.16570151946539113 0 3.7011050364634315 -1.1292003584628674e-05
		 -0.00012057200530080081 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.6660004686562634e-08 0 0 0.99999999999999989 0.99999999999999956
		 1 1 no;
	setAttr ".xm[102]" -type "matrix" "xform" 1.0000000000000007 1.0000000000000002 0.99999999999999956 3.1414755876876146e-16
		 6.2697551878086502e-17 -0.027857333220752196 0 3.6031235500480108 -0.00072853678690876222
		 0.00040733675726301044 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.7877519926234639e-08 0 0 0.99999999999999967 0.99999999999999978
		 1 1.0000000000000002 no;
	setAttr ".xm[103]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 0.0047942615034661179
		 0.088420956330574327 -0.069839558226867132 0 2.8667612990107969 8.8180754789934781
		 -0.1555635855703823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[104]" -type "matrix" "xform" 1 1 1 -0.0082175982375436076 -0.16701021739403649
		 3.0602747459997248 0 -6.3079823146496636 -0.92081298517785015 8.8499904284986499 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[105]" -type "matrix" "xform" 1 1 1 5.4097464688447484e-18 -1.1089042468681023e-16
		 -0.097491933694528091 0 41.453336505553246 4.3615836831101262e-08 -1.8549689428937199e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[106]" -type "matrix" "xform" 1 1 1 0.15671951390773708 0.065341264459879672
		 0.22288628989496242 0 53.688662530854735 -1.0219349810824951e-08 -2.0373125053652075e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[107]" -type "matrix" "xform" 1 1 1 8.2996410349448641e-16 6.7040039454029755e-17
		 -2.0157897107460658 0 4.9455585600775018 10.55953632653763 -0.53894556655509973 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[108]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 4.3413491466327303e-05 -0.0026810060715949384 -2.0539199705110372e-15 0 0
		 3.5527136788005009e-15 -4.7961634663806763e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[109]" -type "matrix" "xform" 1 1 1 -0.0082175978941572345 -0.16701021345831646
		 3.0602747450434347 0 -6.3081025755912066 -0.92080174257093717 -8.8499899999999965 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 6.123233995736766e-17 1 1 1 no;
	setAttr ".xm[110]" -type "matrix" "xform" 1 1 1 1.6633563703021583e-16 8.1146197032574914e-18
		 -0.097491933694412281 0 -41.453233161590504 -5.4825239347300325e-06 -3.5910339555300652e-05 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[111]" -type "matrix" "xform" 1 1 0.99999999999999989 0.15671951340793669
		 0.065341264540853816 0.22288629285535713 0 -53.688648092285383 1.4419977247825955e-06
		 -6.5215240852012357e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[112]" -type "matrix" "xform" 1 1 1 1.1611002905574099e-16 -2.4036425414395454e-17
		 -2.0157897107460649 0 -4.9455631719995043 -10.559527537256415 0.53894399512881463 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1.0000000000000002 no;
	setAttr ".xm[113]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999989
		 1.0000000000000002 4.3413491466327303e-05 -0.0026810060715949384 -2.0539199705110372e-15 0 2.1316282072803006e-14
		 2.6645352591003757e-15 3.5527136788005009e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[114]" -type "matrix" "xform" 1 1 1 0.80818294249820322 0.14353083758514359
		 -0.11220280936007172 0 -10.820192436450057 -5.9507504987120967 24.924304955301 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.5155984858332896 0.48389895784803993 -0.5155984858332896 0.48389895784803993 1
		 1 1 no;
	setAttr ".xm[115]" -type "matrix" "xform" 1 1 1 5.8980595609491589e-17 1.3877787917197543e-16
		 3.7091211745770597e-08 2 4.4203330421564715 -4.6518287504794955 3.0371199999986622 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.036230297806534695 0.011095207388086257 0.9816513894827007 0.18688181136897247 1
		 1 1 no;
	setAttr ".xm[116]" -type "matrix" "xform" 1 1 1 -2.2551397772166909e-17 -3.9985376163088358e-16
		 3.7091218360162804e-08 2 4.4204599100363993 -4.6515944105462665 -3.0371181404855396 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.011095207388366338 0.03623029780658716 -0.1868818113689624 0.98165138948269737 1
		 1 1 no;
	setAttr ".xm[117]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 -15.814630419276526
		 -0.00035596689895101008 4.298294871141195e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[118]" -type "matrix" "xform" 1 1 1 0 0 -0.26413570408842246 0 15.814505966825365
		 -2.8421709430404007e-14 -5.3290705182007514e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[119]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955546 -9.9475983006414026e-14
		 3.0531112001368124e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[120]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.9012613903194193 -1.1368683772161603e-13
		 2.7911256618814862e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[121]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[122]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[123]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.0660208336419075
		 -9.3151160456272919e-06 3.4175490199572778e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.2904784139758925e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[124]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 0.0047942615034661179
		 0.088420956330574327 -0.069839558226867132 0 2.8667612990107969 8.8180754789934781
		 -0.1555635855703823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[125]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.066073898195576 -8.5265128291212022e-14
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[126]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[127]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.066020833641911 -9.3151160456272919e-06
		 3.4175490213783632e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.2904784139758925e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[128]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 0.0047942615034661179
		 0.088420956330574327 -0.069839558226867132 0 2.8667612990107969 8.8180754789934781
		 -0.1555635855703823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[129]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.0660738981955777 -9.6589403142388619e-14
		 3.0531133177191805e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[130]" -type "matrix" "xform" 1 0.99999999999999978 0.99999999999999967 0.0047942615034661179
		 0.088420956330574327 -0.069839558226867132 0 2.8667612990107969 8.8180754789934781
		 -0.1555635855703823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.4901161193847655e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr -s 92 ".m";
	setAttr -s 114 ".p";
	setAttr -s 131 ".g[0:130]" yes no no no no no no no no no no no no yes 
		no no no no yes no no no no no no no no no yes yes yes no yes yes yes yes no yes 
		yes yes yes no yes yes yes yes no yes yes yes yes no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no;
	setAttr ".bp" yes;
createNode displayLayer -n "mesh";
	rename -uid "5828E485-4ED6-9794-F7E5-1F954517E8E5";
	setAttr ".do" 1;
createNode displayLayer -n "skeleton";
	rename -uid "C9074069-4F56-332D-A735-DC8B5D2940F7";
	setAttr ".do" 2;
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "9F6978D0-4806-731F-480B-85849DAA2387";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "9745D343-4658-6DAE-A438-EBBCE456566A";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "8405F20F-4114-B7A4-4E34-89B794C7750B";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo5";
	rename -uid "0FB523AF-4AD1-FBDE-AB3E-808EACB44342";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -44.047617297323995 -324.99998708566085 ;
	setAttr ".tgi[0].vh" -type "double2" 158.33332704173222 44.047617297323995 ;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 163;
	setAttr -av -k on ".unw" 163;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -av -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av -k on ".ta";
	setAttr -av -k on ".tq";
	setAttr -k on ".ts";
	setAttr -av -k on ".etmr";
	setAttr -av -k on ".tmr";
	setAttr -av -k on ".aoon";
	setAttr -av -k on ".aoam";
	setAttr -av -k on ".aora";
	setAttr -k on ".aofr";
	setAttr -av -k on ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av -k on ".mbe";
	setAttr -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".mbsc";
	setAttr -k on ".mbc";
	setAttr -k on ".mbfa";
	setAttr -k on ".mbftb";
	setAttr -k on ".mbftg";
	setAttr -k on ".mbftr";
	setAttr -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -k on ".mbcsx";
	setAttr -k on ".mbcsy";
	setAttr -k on ".mbasx";
	setAttr -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av -k on ".msaa";
	setAttr -av -k on ".aasc";
	setAttr -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".fprt" yes;
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 25 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultTextureList1;
	setAttr -cb on ".cch";
	setAttr -cb on ".ihi";
	setAttr -cb on ".nds";
	setAttr -cb on ".bnm";
select -ne :standardSurface1;
	setAttr ".b" 0.80000001192092896;
	setAttr ".bc" -type "float3" 1 1 1 ;
	setAttr ".s" 0.20000000298023224;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".ai_override";
	setAttr -cb on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -cb on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -k on ".ai_surface_shader";
	setAttr -k on ".ai_volume_shader";
lockNode -l 0 -lu 1;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -cb on ".macc";
	setAttr -av -cb on ".macd";
	setAttr -av -cb on ".macq";
	setAttr -av -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -k on ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -cb on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -cb on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -cb on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -cb on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -cb on ".ope";
	setAttr -av -cb on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr";
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "skeleton.di" "root.do";
connectAttr "root.s" "pelvis.is";
connectAttr "pelvis.s" "spine_01.is";
connectAttr "spine_01.s" "spine_02.is";
connectAttr "spine_02.s" "spine_03.is";
connectAttr "spine_03.s" "spine_04.is";
connectAttr "spine_04.s" "spine_05.is";
connectAttr "spine_05.s" "clavicle_r.is";
connectAttr "clavicle_r.s" "upperarm_r.is";
connectAttr "upperarm_r.s" "lowerarm_r.is";
connectAttr "lowerarm_r.s" "lowerarm_twist_02_r.is";
connectAttr "lowerarm_r.s" "lowerarm_twist_01_r.is";
connectAttr "lowerarm_r.s" "hand_r.is";
connectAttr "hand_r.s" "pinky_metacarpal_r.is";
connectAttr "pinky_metacarpal_r.s" "pinky_01_r.is";
connectAttr "pinky_01_r.s" "pinky_02_r.is";
connectAttr "pinky_02_r.s" "pinky_03_r.is";
connectAttr "hand_r.s" "ring_metacarpal_r.is";
connectAttr "ring_metacarpal_r.s" "ring_01_r.is";
connectAttr "ring_01_r.s" "ring_02_r.is";
connectAttr "ring_02_r.s" "ring_03_r.is";
connectAttr "hand_r.s" "middle_metacarpal_r.is";
connectAttr "middle_metacarpal_r.s" "middle_01_r.is";
connectAttr "middle_01_r.s" "middle_02_r.is";
connectAttr "middle_02_r.s" "middle_03_r.is";
connectAttr "hand_r.s" "index_metacarpal_r.is";
connectAttr "index_metacarpal_r.s" "index_01_r.is";
connectAttr "index_01_r.s" "index_02_r.is";
connectAttr "index_02_r.s" "index_03_r.is";
connectAttr "hand_r.s" "thumb_01_r.is";
connectAttr "thumb_01_r.s" "thumb_02_r.is";
connectAttr "thumb_02_r.s" "thumb_03_r.is";
connectAttr "hand_r.s" "weapon_r.is";
connectAttr "upperarm_r.s" "upperarm_twist_02_r.is";
connectAttr "upperarm_r.s" "upperarm_twist_01_r.is";
connectAttr "spine_05.s" "neck_01.is";
connectAttr "neck_01.s" "neck_02.is";
connectAttr "neck_02.s" "head.is";
connectAttr "head.s" "jaw.is";
connectAttr "head.s" "eye_r.is";
connectAttr "pelvis.s" "thigh_r.is";
connectAttr "thigh_r.s" "calf_r.is";
connectAttr "calf_r.s" "foot_r.is";
connectAttr "foot_r.s" "ball_r.is";
connectAttr "root.s" "interaction.is";
connectAttr "root.s" "center_of_mass.is";
connectAttr "root.s" "ik_hand_root.is";
connectAttr "ik_hand_root.s" "ik_hand_gun.is";
connectAttr "ik_hand_gun_parentConstraint1.ctx" "ik_hand_gun.tx";
connectAttr "ik_hand_gun_parentConstraint1.cty" "ik_hand_gun.ty";
connectAttr "ik_hand_gun_parentConstraint1.ctz" "ik_hand_gun.tz";
connectAttr "ik_hand_gun_parentConstraint1.crx" "ik_hand_gun.rx";
connectAttr "ik_hand_gun_parentConstraint1.cry" "ik_hand_gun.ry";
connectAttr "ik_hand_gun_parentConstraint1.crz" "ik_hand_gun.rz";
connectAttr "ik_hand_gun.s" "ik_hand_l.is";
connectAttr "ik_hand_gun.ro" "ik_hand_gun_parentConstraint1.cro";
connectAttr "ik_hand_gun.pim" "ik_hand_gun_parentConstraint1.cpim";
connectAttr "ik_hand_gun.rp" "ik_hand_gun_parentConstraint1.crp";
connectAttr "ik_hand_gun.rpt" "ik_hand_gun_parentConstraint1.crt";
connectAttr "ik_hand_gun.jo" "ik_hand_gun_parentConstraint1.cjo";
connectAttr "hand_r.t" "ik_hand_gun_parentConstraint1.tg[0].tt";
connectAttr "hand_r.rp" "ik_hand_gun_parentConstraint1.tg[0].trp";
connectAttr "hand_r.rpt" "ik_hand_gun_parentConstraint1.tg[0].trt";
connectAttr "hand_r.r" "ik_hand_gun_parentConstraint1.tg[0].tr";
connectAttr "hand_r.ro" "ik_hand_gun_parentConstraint1.tg[0].tro";
connectAttr "hand_r.s" "ik_hand_gun_parentConstraint1.tg[0].ts";
connectAttr "hand_r.pm" "ik_hand_gun_parentConstraint1.tg[0].tpm";
connectAttr "hand_r.jo" "ik_hand_gun_parentConstraint1.tg[0].tjo";
connectAttr "hand_r.ssc" "ik_hand_gun_parentConstraint1.tg[0].tsc";
connectAttr "hand_r.is" "ik_hand_gun_parentConstraint1.tg[0].tis";
connectAttr "ik_hand_gun_parentConstraint1.w0" "ik_hand_gun_parentConstraint1.tg[0].tw"
		;
connectAttr "root.s" "ik_foot_root.is";
connectAttr "ik_foot_root.s" "ik_foot_r.is";
connectAttr "ik_foot_r_parentConstraint1.ctx" "ik_foot_r.tx";
connectAttr "ik_foot_r_parentConstraint1.cty" "ik_foot_r.ty";
connectAttr "ik_foot_r_parentConstraint1.ctz" "ik_foot_r.tz";
connectAttr "ik_foot_r_parentConstraint1.crx" "ik_foot_r.rx";
connectAttr "ik_foot_r_parentConstraint1.cry" "ik_foot_r.ry";
connectAttr "ik_foot_r_parentConstraint1.crz" "ik_foot_r.rz";
connectAttr "ik_foot_r.ro" "ik_foot_r_parentConstraint1.cro";
connectAttr "ik_foot_r.pim" "ik_foot_r_parentConstraint1.cpim";
connectAttr "ik_foot_r.rp" "ik_foot_r_parentConstraint1.crp";
connectAttr "ik_foot_r.rpt" "ik_foot_r_parentConstraint1.crt";
connectAttr "ik_foot_r.jo" "ik_foot_r_parentConstraint1.cjo";
connectAttr "foot_r.t" "ik_foot_r_parentConstraint1.tg[0].tt";
connectAttr "foot_r.rp" "ik_foot_r_parentConstraint1.tg[0].trp";
connectAttr "foot_r.rpt" "ik_foot_r_parentConstraint1.tg[0].trt";
connectAttr "foot_r.r" "ik_foot_r_parentConstraint1.tg[0].tr";
connectAttr "foot_r.ro" "ik_foot_r_parentConstraint1.tg[0].tro";
connectAttr "foot_r.s" "ik_foot_r_parentConstraint1.tg[0].ts";
connectAttr "foot_r.pm" "ik_foot_r_parentConstraint1.tg[0].tpm";
connectAttr "foot_r.jo" "ik_foot_r_parentConstraint1.tg[0].tjo";
connectAttr "foot_r.ssc" "ik_foot_r_parentConstraint1.tg[0].tsc";
connectAttr "foot_r.is" "ik_foot_r_parentConstraint1.tg[0].tis";
connectAttr "ik_foot_r_parentConstraint1.w0" "ik_foot_r_parentConstraint1.tg[0].tw"
		;
connectAttr "ik_foot_root.s" "ik_foot_l.is";
connectAttr "root.s" "Camera.is";
connectAttr "mesh.di" "mesh_grp.do";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "Character1_LeftHandBPKG.msg" "Character1_FullBodyKG.dnsm" -na;
connectAttr "Character1_RightHandBPKG.msg" "Character1_FullBodyKG.dnsm" -na;
connectAttr "Character1_LeftFootBPKG.msg" "Character1_FullBodyKG.dnsm" -na;
connectAttr "Character1_RightFootBPKG.msg" "Character1_FullBodyKG.dnsm" -na;
connectAttr "Character1_LeftFootBPKG1.msg" "Character1_FullBodyKG1.dnsm" -na;
connectAttr "Character1_RightFootBPKG1.msg" "Character1_FullBodyKG1.dnsm" -na;
connectAttr "Character1_LeftHandBPKG1.msg" "Character1_FullBodyKG2.dnsm" -na;
connectAttr "Character1_RightHandBPKG1.msg" "Character1_FullBodyKG2.dnsm" -na;
connectAttr "Character1_LeftFootBPKG2.msg" "Character1_FullBodyKG2.dnsm" -na;
connectAttr "Character1_RightFootBPKG2.msg" "Character1_FullBodyKG2.dnsm" -na;
connectAttr "Character1_LeftFootBPKG3.msg" "Character1_FullBodyKG3.dnsm" -na;
connectAttr "Character1_RightFootBPKG3.msg" "Character1_FullBodyKG3.dnsm" -na;
connectAttr "Character1_LeftHandBPKG2.msg" "Character1_FullBodyKG4.dnsm" -na;
connectAttr "Character1_RightHandBPKG2.msg" "Character1_FullBodyKG4.dnsm" -na;
connectAttr "Character1_LeftFootBPKG4.msg" "Character1_FullBodyKG4.dnsm" -na;
connectAttr "Character1_RightFootBPKG4.msg" "Character1_FullBodyKG4.dnsm" -na;
connectAttr "Character1_LeftFootBPKG5.msg" "Character1_FullBodyKG5.dnsm" -na;
connectAttr "Character1_RightFootBPKG5.msg" "Character1_FullBodyKG5.dnsm" -na;
connectAttr "Character1_LeftHandBPKG3.msg" "Character1_FullBodyKG6.dnsm" -na;
connectAttr "Character1_RightHandBPKG3.msg" "Character1_FullBodyKG6.dnsm" -na;
connectAttr "Character1_LeftFootBPKG6.msg" "Character1_FullBodyKG6.dnsm" -na;
connectAttr "Character1_RightFootBPKG6.msg" "Character1_FullBodyKG6.dnsm" -na;
connectAttr "Character1_LeftFootBPKG7.msg" "Character1_FullBodyKG7.dnsm" -na;
connectAttr "Character1_RightFootBPKG7.msg" "Character1_FullBodyKG7.dnsm" -na;
connectAttr "Character1_LeftHandBPKG4.msg" "Character1_FullBodyKG8.dnsm" -na;
connectAttr "Character1_RightHandBPKG4.msg" "Character1_FullBodyKG8.dnsm" -na;
connectAttr "Character1_LeftFootBPKG8.msg" "Character1_FullBodyKG8.dnsm" -na;
connectAttr "Character1_RightFootBPKG8.msg" "Character1_FullBodyKG8.dnsm" -na;
connectAttr "Character1_LeftFootBPKG9.msg" "Character1_FullBodyKG9.dnsm" -na;
connectAttr "Character1_RightFootBPKG9.msg" "Character1_FullBodyKG9.dnsm" -na;
connectAttr "Character1_LeftHandBPKG5.msg" "Character1_FullBodyKG10.dnsm" -na;
connectAttr "Character1_RightHandBPKG5.msg" "Character1_FullBodyKG10.dnsm" -na;
connectAttr "Character1_LeftFootBPKG10.msg" "Character1_FullBodyKG10.dnsm" -na;
connectAttr "Character1_RightFootBPKG10.msg" "Character1_FullBodyKG10.dnsm" -na;
connectAttr "Character1_LeftFootBPKG11.msg" "Character1_FullBodyKG11.dnsm" -na;
connectAttr "Character1_RightFootBPKG11.msg" "Character1_FullBodyKG11.dnsm" -na;
connectAttr "Character1_LeftHandBPKG6.msg" "Character1_FullBodyKG12.dnsm" -na;
connectAttr "Character1_RightHandBPKG6.msg" "Character1_FullBodyKG12.dnsm" -na;
connectAttr "Character1_LeftFootBPKG12.msg" "Character1_FullBodyKG12.dnsm" -na;
connectAttr "Character1_RightFootBPKG12.msg" "Character1_FullBodyKG12.dnsm" -na;
connectAttr "Character1_LeftFootBPKG13.msg" "Character1_FullBodyKG13.dnsm" -na;
connectAttr "Character1_RightFootBPKG13.msg" "Character1_FullBodyKG13.dnsm" -na;
connectAttr "Character1_LeftHandBPKG7.msg" "Character1_FullBodyKG14.dnsm" -na;
connectAttr "Character1_RightHandBPKG7.msg" "Character1_FullBodyKG14.dnsm" -na;
connectAttr "Character1_LeftFootBPKG14.msg" "Character1_FullBodyKG14.dnsm" -na;
connectAttr "Character1_RightFootBPKG14.msg" "Character1_FullBodyKG14.dnsm" -na;
connectAttr "Character1_LeftFootBPKG15.msg" "Character1_FullBodyKG15.dnsm" -na;
connectAttr "Character1_RightFootBPKG15.msg" "Character1_FullBodyKG15.dnsm" -na;
connectAttr "root.msg" "bindPose1.m[0]";
connectAttr "pelvis.msg" "bindPose1.m[1]";
connectAttr "spine_01.msg" "bindPose1.m[2]";
connectAttr "spine_02.msg" "bindPose1.m[3]";
connectAttr "spine_03.msg" "bindPose1.m[4]";
connectAttr "spine_04.msg" "bindPose1.m[5]";
connectAttr "spine_05.msg" "bindPose1.m[6]";
connectAttr "neck_01.msg" "bindPose1.m[7]";
connectAttr "clavicle_r.msg" "bindPose1.m[52]";
connectAttr "upperarm_r.msg" "bindPose1.m[53]";
connectAttr "lowerarm_r.msg" "bindPose1.m[54]";
connectAttr "hand_r.msg" "bindPose1.m[57]";
connectAttr "pinky_02_r.msg" "bindPose1.m[60]";
connectAttr "thumb_01_r.msg" "bindPose1.m[74]";
connectAttr "thumb_02_r.msg" "bindPose1.m[75]";
connectAttr "thigh_r.msg" "bindPose1.m[104]";
connectAttr "calf_r.msg" "bindPose1.m[105]";
connectAttr "foot_r.msg" "bindPose1.m[106]";
connectAttr "ball_r.msg" "bindPose1.m[107]";
connectAttr "lowerarm_twist_02_r.msg" "bindPose1.m[126]";
connectAttr "lowerarm_twist_01_r.msg" "bindPose1.m[127]";
connectAttr "pinky_03_r.msg" "bindPose1.m[128]";
connectAttr "thumb_03_r.msg" "bindPose1.m[132]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[6]" "bindPose1.p[7]";
connectAttr "bindPose1.m[7]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[14]" "bindPose1.p[15]";
connectAttr "bindPose1.m[9]" "bindPose1.p[17]";
connectAttr "bindPose1.m[17]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[9]" "bindPose1.p[22]";
connectAttr "bindPose1.m[22]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[9]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[28]" "bindPose1.p[29]";
connectAttr "bindPose1.m[29]" "bindPose1.p[30]";
connectAttr "bindPose1.m[9]" "bindPose1.p[32]";
connectAttr "bindPose1.m[9]" "bindPose1.p[34]";
connectAttr "bindPose1.m[34]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[9]" "bindPose1.p[39]";
connectAttr "bindPose1.m[9]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[42]" "bindPose1.p[43]";
connectAttr "bindPose1.m[43]" "bindPose1.p[44]";
connectAttr "bindPose1.m[9]" "bindPose1.p[46]";
connectAttr "bindPose1.m[46]" "bindPose1.p[47]";
connectAttr "bindPose1.m[47]" "bindPose1.p[48]";
connectAttr "bindPose1.m[48]" "bindPose1.p[49]";
connectAttr "bindPose1.m[6]" "bindPose1.p[52]";
connectAttr "bindPose1.m[52]" "bindPose1.p[53]";
connectAttr "bindPose1.m[53]" "bindPose1.p[54]";
connectAttr "bindPose1.m[54]" "bindPose1.p[57]";
connectAttr "bindPose1.m[57]" "bindPose1.p[58]";
connectAttr "bindPose1.m[58]" "bindPose1.p[59]";
connectAttr "bindPose1.m[59]" "bindPose1.p[60]";
connectAttr "bindPose1.m[57]" "bindPose1.p[62]";
connectAttr "bindPose1.m[62]" "bindPose1.p[63]";
connectAttr "bindPose1.m[63]" "bindPose1.p[64]";
connectAttr "bindPose1.m[57]" "bindPose1.p[66]";
connectAttr "bindPose1.m[66]" "bindPose1.p[67]";
connectAttr "bindPose1.m[67]" "bindPose1.p[68]";
connectAttr "bindPose1.m[57]" "bindPose1.p[70]";
connectAttr "bindPose1.m[70]" "bindPose1.p[71]";
connectAttr "bindPose1.m[71]" "bindPose1.p[72]";
connectAttr "bindPose1.m[57]" "bindPose1.p[74]";
connectAttr "bindPose1.m[74]" "bindPose1.p[75]";
connectAttr "bindPose1.m[6]" "bindPose1.p[78]";
connectAttr "bindPose1.m[78]" "bindPose1.p[79]";
connectAttr "bindPose1.m[79]" "bindPose1.p[80]";
connectAttr "bindPose1.m[80]" "bindPose1.p[83]";
connectAttr "bindPose1.m[83]" "bindPose1.p[84]";
connectAttr "bindPose1.m[84]" "bindPose1.p[85]";
connectAttr "bindPose1.m[85]" "bindPose1.p[86]";
connectAttr "bindPose1.m[83]" "bindPose1.p[88]";
connectAttr "bindPose1.m[88]" "bindPose1.p[89]";
connectAttr "bindPose1.m[89]" "bindPose1.p[90]";
connectAttr "bindPose1.m[83]" "bindPose1.p[92]";
connectAttr "bindPose1.m[92]" "bindPose1.p[93]";
connectAttr "bindPose1.m[93]" "bindPose1.p[94]";
connectAttr "bindPose1.m[83]" "bindPose1.p[96]";
connectAttr "bindPose1.m[96]" "bindPose1.p[97]";
connectAttr "bindPose1.m[97]" "bindPose1.p[98]";
connectAttr "bindPose1.m[83]" "bindPose1.p[100]";
connectAttr "bindPose1.m[100]" "bindPose1.p[101]";
connectAttr "bindPose1.m[1]" "bindPose1.p[104]";
connectAttr "bindPose1.m[104]" "bindPose1.p[105]";
connectAttr "bindPose1.m[105]" "bindPose1.p[106]";
connectAttr "bindPose1.m[106]" "bindPose1.p[107]";
connectAttr "bindPose1.m[105]" "bindPose1.p[108]";
connectAttr "bindPose1.m[1]" "bindPose1.p[109]";
connectAttr "bindPose1.m[109]" "bindPose1.p[110]";
connectAttr "bindPose1.m[110]" "bindPose1.p[111]";
connectAttr "bindPose1.m[111]" "bindPose1.p[112]";
connectAttr "bindPose1.m[110]" "bindPose1.p[113]";
connectAttr "bindPose1.m[9]" "bindPose1.p[114]";
connectAttr "bindPose1.m[44]" "bindPose1.p[123]";
connectAttr "bindPose1.m[49]" "bindPose1.p[124]";
connectAttr "bindPose1.m[54]" "bindPose1.p[126]";
connectAttr "bindPose1.m[54]" "bindPose1.p[127]";
connectAttr "bindPose1.m[60]" "bindPose1.p[128]";
connectAttr "bindPose1.m[64]" "bindPose1.p[129]";
connectAttr "bindPose1.m[68]" "bindPose1.p[130]";
connectAttr "bindPose1.m[72]" "bindPose1.p[131]";
connectAttr "bindPose1.m[75]" "bindPose1.p[132]";
connectAttr "bindPose1.m[57]" "bindPose1.p[133]";
connectAttr "bindPose1.m[80]" "bindPose1.p[134]";
connectAttr "bindPose1.m[80]" "bindPose1.p[135]";
connectAttr "bindPose1.m[86]" "bindPose1.p[136]";
connectAttr "bindPose1.m[90]" "bindPose1.p[137]";
connectAttr "bindPose1.m[94]" "bindPose1.p[138]";
connectAttr "bindPose1.m[98]" "bindPose1.p[139]";
connectAttr "bindPose1.m[101]" "bindPose1.p[140]";
connectAttr "bindPose1.m[83]" "bindPose1.p[141]";
connectAttr "bindPose1.m[9]" "bindPose1.p[142]";
connectAttr "bindPose1.m[15]" "bindPose1.p[143]";
connectAttr "bindPose1.m[30]" "bindPose1.p[146]";
connectAttr "bindPose1.m[32]" "bindPose1.p[147]";
connectAttr "bindPose1.m[39]" "bindPose1.p[149]";
connectAttr "bindPose1.m[9]" "bindPose1.p[150]";
connectAttr "bindPose1.m[20]" "bindPose1.p[157]";
connectAttr "bindPose1.m[37]" "bindPose1.p[159]";
connectAttr "bindPose1.m[25]" "bindPose1.p[161]";
connectAttr "bindPose1.m[0]" "bindPose1.p[162]";
connectAttr "root.bps" "bindPose1.wm[0]";
connectAttr "pelvis.bps" "bindPose1.wm[1]";
connectAttr "spine_01.bps" "bindPose1.wm[2]";
connectAttr "spine_02.bps" "bindPose1.wm[3]";
connectAttr "spine_03.bps" "bindPose1.wm[4]";
connectAttr "spine_04.bps" "bindPose1.wm[5]";
connectAttr "spine_05.bps" "bindPose1.wm[6]";
connectAttr "neck_01.bps" "bindPose1.wm[7]";
connectAttr "clavicle_r.bps" "bindPose1.wm[52]";
connectAttr "upperarm_r.bps" "bindPose1.wm[53]";
connectAttr "lowerarm_r.bps" "bindPose1.wm[54]";
connectAttr "hand_r.bps" "bindPose1.wm[57]";
connectAttr "pinky_02_r.bps" "bindPose1.wm[60]";
connectAttr "thumb_01_r.bps" "bindPose1.wm[74]";
connectAttr "thumb_02_r.bps" "bindPose1.wm[75]";
connectAttr "thigh_r.bps" "bindPose1.wm[104]";
connectAttr "calf_r.bps" "bindPose1.wm[105]";
connectAttr "foot_r.bps" "bindPose1.wm[106]";
connectAttr "ball_r.bps" "bindPose1.wm[107]";
connectAttr "lowerarm_twist_02_r.bps" "bindPose1.wm[126]";
connectAttr "lowerarm_twist_01_r.bps" "bindPose1.wm[127]";
connectAttr "pinky_03_r.bps" "bindPose1.wm[128]";
connectAttr "thumb_03_r.bps" "bindPose1.wm[132]";
connectAttr "offsetL_origHandObject_choice_offset.o" "offsetL_origHandObject_multMatrix.i[0]"
		;
connectAttr "offsetL_origHandObject_choice.o" "offsetL_origHandObject_multMatrix.i[1]"
		;
connectAttr "offsetL_origHandObject_multMatrix.o" "offsetL_origHandObject_decomposeMatrix.imat"
		;
connectAttr "offsetR_origHandObject_choice_offset.o" "offsetR_origHandObject_multMatrix.i[0]"
		;
connectAttr "offsetR_origHandObject_choice.o" "offsetR_origHandObject_multMatrix.i[1]"
		;
connectAttr "offsetR_origHandObject_multMatrix.o" "offsetR_origHandObject_decomposeMatrix.imat"
		;
connectAttr "file1.oc" "lambert2.c";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "lambert2.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "lambert2.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "lambert2SG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "file1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file1.ws";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "offsetL_origHandObject_choice_offset1.o" "offsetL_origHandObject_multMatrix1.i[0]"
		;
connectAttr "offsetL_origHandObject_choice1.o" "offsetL_origHandObject_multMatrix1.i[1]"
		;
connectAttr "offsetL_origHandObject_multMatrix1.o" "offsetL_origHandObject_decomposeMatrix1.imat"
		;
connectAttr "offsetR_origHandObject_choice_offset1.o" "offsetR_origHandObject_multMatrix1.i[0]"
		;
connectAttr "offsetR_origHandObject_choice1.o" "offsetR_origHandObject_multMatrix1.i[1]"
		;
connectAttr "offsetR_origHandObject_multMatrix1.o" "offsetR_origHandObject_decomposeMatrix1.imat"
		;
connectAttr "root.msg" "bindPose2.m[0]";
connectAttr "pelvis.msg" "bindPose2.m[1]";
connectAttr "spine_01.msg" "bindPose2.m[2]";
connectAttr "spine_02.msg" "bindPose2.m[3]";
connectAttr "spine_03.msg" "bindPose2.m[4]";
connectAttr "spine_04.msg" "bindPose2.m[5]";
connectAttr "spine_05.msg" "bindPose2.m[6]";
connectAttr "neck_01.msg" "bindPose2.m[7]";
connectAttr "neck_02.msg" "bindPose2.m[8]";
connectAttr "head.msg" "bindPose2.m[9]";
connectAttr "jaw.msg" "bindPose2.m[10]";
connectAttr "clavicle_r.msg" "bindPose2.m[52]";
connectAttr "upperarm_r.msg" "bindPose2.m[53]";
connectAttr "lowerarm_r.msg" "bindPose2.m[54]";
connectAttr "lowerarm_twist_02_r.msg" "bindPose2.m[55]";
connectAttr "lowerarm_twist_01_r.msg" "bindPose2.m[56]";
connectAttr "hand_r.msg" "bindPose2.m[57]";
connectAttr "pinky_metacarpal_r.msg" "bindPose2.m[58]";
connectAttr "pinky_01_r.msg" "bindPose2.m[59]";
connectAttr "pinky_02_r.msg" "bindPose2.m[60]";
connectAttr "pinky_03_r.msg" "bindPose2.m[61]";
connectAttr "ring_metacarpal_r.msg" "bindPose2.m[62]";
connectAttr "ring_01_r.msg" "bindPose2.m[63]";
connectAttr "ring_02_r.msg" "bindPose2.m[64]";
connectAttr "ring_03_r.msg" "bindPose2.m[65]";
connectAttr "middle_metacarpal_r.msg" "bindPose2.m[66]";
connectAttr "middle_01_r.msg" "bindPose2.m[67]";
connectAttr "middle_02_r.msg" "bindPose2.m[68]";
connectAttr "middle_03_r.msg" "bindPose2.m[69]";
connectAttr "index_metacarpal_r.msg" "bindPose2.m[70]";
connectAttr "index_01_r.msg" "bindPose2.m[71]";
connectAttr "index_02_r.msg" "bindPose2.m[72]";
connectAttr "index_03_r.msg" "bindPose2.m[73]";
connectAttr "thumb_01_r.msg" "bindPose2.m[74]";
connectAttr "thumb_02_r.msg" "bindPose2.m[75]";
connectAttr "thumb_03_r.msg" "bindPose2.m[76]";
connectAttr "thigh_r.msg" "bindPose2.m[104]";
connectAttr "calf_r.msg" "bindPose2.m[105]";
connectAttr "foot_r.msg" "bindPose2.m[106]";
connectAttr "ball_r.msg" "bindPose2.m[107]";
connectAttr "eye_r.msg" "bindPose2.m[115]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "bindPose2.m[3]" "bindPose2.p[4]";
connectAttr "bindPose2.m[4]" "bindPose2.p[5]";
connectAttr "bindPose2.m[5]" "bindPose2.p[6]";
connectAttr "bindPose2.m[6]" "bindPose2.p[7]";
connectAttr "bindPose2.m[7]" "bindPose2.p[8]";
connectAttr "bindPose2.m[8]" "bindPose2.p[9]";
connectAttr "bindPose2.m[9]" "bindPose2.p[10]";
connectAttr "bindPose2.m[10]" "bindPose2.p[13]";
connectAttr "bindPose2.m[13]" "bindPose2.p[14]";
connectAttr "bindPose2.m[14]" "bindPose2.p[15]";
connectAttr "bindPose2.m[15]" "bindPose2.p[16]";
connectAttr "bindPose2.m[16]" "bindPose2.p[17]";
connectAttr "bindPose2.m[10]" "bindPose2.p[18]";
connectAttr "bindPose2.m[18]" "bindPose2.p[19]";
connectAttr "bindPose2.m[19]" "bindPose2.p[20]";
connectAttr "bindPose2.m[20]" "bindPose2.p[21]";
connectAttr "bindPose2.m[21]" "bindPose2.p[22]";
connectAttr "bindPose2.m[10]" "bindPose2.p[23]";
connectAttr "bindPose2.m[10]" "bindPose2.p[25]";
connectAttr "bindPose2.m[10]" "bindPose2.p[27]";
connectAttr "bindPose2.m[27]" "bindPose2.p[28]";
connectAttr "bindPose2.m[28]" "bindPose2.p[29]";
connectAttr "bindPose2.m[29]" "bindPose2.p[30]";
connectAttr "bindPose2.m[10]" "bindPose2.p[32]";
connectAttr "bindPose2.m[32]" "bindPose2.p[33]";
connectAttr "bindPose2.m[33]" "bindPose2.p[34]";
connectAttr "bindPose2.m[34]" "bindPose2.p[35]";
connectAttr "bindPose2.m[10]" "bindPose2.p[37]";
connectAttr "bindPose2.m[37]" "bindPose2.p[38]";
connectAttr "bindPose2.m[38]" "bindPose2.p[39]";
connectAttr "bindPose2.m[39]" "bindPose2.p[40]";
connectAttr "bindPose2.m[10]" "bindPose2.p[42]";
connectAttr "bindPose2.m[42]" "bindPose2.p[43]";
connectAttr "bindPose2.m[43]" "bindPose2.p[44]";
connectAttr "bindPose2.m[44]" "bindPose2.p[45]";
connectAttr "bindPose2.m[10]" "bindPose2.p[47]";
connectAttr "bindPose2.m[47]" "bindPose2.p[48]";
connectAttr "bindPose2.m[48]" "bindPose2.p[49]";
connectAttr "bindPose2.m[49]" "bindPose2.p[50]";
connectAttr "bindPose2.m[6]" "bindPose2.p[52]";
connectAttr "bindPose2.m[52]" "bindPose2.p[53]";
connectAttr "bindPose2.m[53]" "bindPose2.p[54]";
connectAttr "bindPose2.m[54]" "bindPose2.p[55]";
connectAttr "bindPose2.m[54]" "bindPose2.p[56]";
connectAttr "bindPose2.m[54]" "bindPose2.p[57]";
connectAttr "bindPose2.m[57]" "bindPose2.p[58]";
connectAttr "bindPose2.m[58]" "bindPose2.p[59]";
connectAttr "bindPose2.m[59]" "bindPose2.p[60]";
connectAttr "bindPose2.m[60]" "bindPose2.p[61]";
connectAttr "bindPose2.m[57]" "bindPose2.p[62]";
connectAttr "bindPose2.m[62]" "bindPose2.p[63]";
connectAttr "bindPose2.m[63]" "bindPose2.p[64]";
connectAttr "bindPose2.m[64]" "bindPose2.p[65]";
connectAttr "bindPose2.m[57]" "bindPose2.p[66]";
connectAttr "bindPose2.m[66]" "bindPose2.p[67]";
connectAttr "bindPose2.m[67]" "bindPose2.p[68]";
connectAttr "bindPose2.m[68]" "bindPose2.p[69]";
connectAttr "bindPose2.m[57]" "bindPose2.p[70]";
connectAttr "bindPose2.m[70]" "bindPose2.p[71]";
connectAttr "bindPose2.m[71]" "bindPose2.p[72]";
connectAttr "bindPose2.m[72]" "bindPose2.p[73]";
connectAttr "bindPose2.m[57]" "bindPose2.p[74]";
connectAttr "bindPose2.m[74]" "bindPose2.p[75]";
connectAttr "bindPose2.m[75]" "bindPose2.p[76]";
connectAttr "bindPose2.m[57]" "bindPose2.p[77]";
connectAttr "bindPose2.m[6]" "bindPose2.p[78]";
connectAttr "bindPose2.m[78]" "bindPose2.p[79]";
connectAttr "bindPose2.m[79]" "bindPose2.p[80]";
connectAttr "bindPose2.m[80]" "bindPose2.p[81]";
connectAttr "bindPose2.m[80]" "bindPose2.p[82]";
connectAttr "bindPose2.m[80]" "bindPose2.p[83]";
connectAttr "bindPose2.m[83]" "bindPose2.p[84]";
connectAttr "bindPose2.m[84]" "bindPose2.p[85]";
connectAttr "bindPose2.m[85]" "bindPose2.p[86]";
connectAttr "bindPose2.m[86]" "bindPose2.p[87]";
connectAttr "bindPose2.m[83]" "bindPose2.p[88]";
connectAttr "bindPose2.m[88]" "bindPose2.p[89]";
connectAttr "bindPose2.m[89]" "bindPose2.p[90]";
connectAttr "bindPose2.m[90]" "bindPose2.p[91]";
connectAttr "bindPose2.m[83]" "bindPose2.p[92]";
connectAttr "bindPose2.m[92]" "bindPose2.p[93]";
connectAttr "bindPose2.m[93]" "bindPose2.p[94]";
connectAttr "bindPose2.m[94]" "bindPose2.p[95]";
connectAttr "bindPose2.m[83]" "bindPose2.p[96]";
connectAttr "bindPose2.m[96]" "bindPose2.p[97]";
connectAttr "bindPose2.m[97]" "bindPose2.p[98]";
connectAttr "bindPose2.m[98]" "bindPose2.p[99]";
connectAttr "bindPose2.m[83]" "bindPose2.p[100]";
connectAttr "bindPose2.m[100]" "bindPose2.p[101]";
connectAttr "bindPose2.m[101]" "bindPose2.p[102]";
connectAttr "bindPose2.m[1]" "bindPose2.p[104]";
connectAttr "bindPose2.m[104]" "bindPose2.p[105]";
connectAttr "bindPose2.m[105]" "bindPose2.p[106]";
connectAttr "bindPose2.m[106]" "bindPose2.p[107]";
connectAttr "bindPose2.m[105]" "bindPose2.p[108]";
connectAttr "bindPose2.m[1]" "bindPose2.p[109]";
connectAttr "bindPose2.m[109]" "bindPose2.p[110]";
connectAttr "bindPose2.m[110]" "bindPose2.p[111]";
connectAttr "bindPose2.m[111]" "bindPose2.p[112]";
connectAttr "bindPose2.m[110]" "bindPose2.p[113]";
connectAttr "bindPose2.m[1]" "bindPose2.p[114]";
connectAttr "bindPose2.m[10]" "bindPose2.p[115]";
connectAttr "bindPose2.m[10]" "bindPose2.p[116]";
connectAttr "bindPose2.m[23]" "bindPose2.p[117]";
connectAttr "bindPose2.m[25]" "bindPose2.p[118]";
connectAttr "bindPose2.m[30]" "bindPose2.p[119]";
connectAttr "bindPose2.m[35]" "bindPose2.p[120]";
connectAttr "bindPose2.m[40]" "bindPose2.p[125]";
connectAttr "bindPose2.m[50]" "bindPose2.p[127]";
connectAttr "bindPose2.m[45]" "bindPose2.p[129]";
connectAttr "eye_r.bps" "bindPose2.wm[115]";
connectAttr "layerManager.dli[1]" "mesh.id";
connectAttr "layerManager.dli[2]" "skeleton.id";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "offsetL_origHandObject_choice.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "offsetL_origHandObject_choice_offset.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetL_origHandObject_multMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetL_origHandObject_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_choice.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "offsetR_origHandObject_choice_offset.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_multMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_decomposeMatrix.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mad_IKArm_R_values_rot_default.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "mad_IKArm_L_values_rot_default.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "offsetL_origHandObject_choice1.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "offsetL_origHandObject_choice_offset1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetL_origHandObject_multMatrix1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetL_origHandObject_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_choice1.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "offsetR_origHandObject_choice_offset1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_multMatrix1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "offsetR_origHandObject_decomposeMatrix1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mad_IKArm_R_values_rot_default1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mad_IKArm_L_values_rot_default1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
// End of generic_skeleton.ma
