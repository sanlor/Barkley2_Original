/// scr_debug_questlist()
// Quest Tracker List
for (var i = 0; i < 5; i += 1) tabDSL[i] = ds_list_create();

//--------------
// MAINQUEST and CUTSCENES
//--------------
ds_list_add(tabDSL[0], "- MAINQUEST -");
ds_list_add(tabDSL[0], "mainQuest");
ds_list_add(tabDSL[0], "- IDENTITY 0=X1,1=Hpz,2=CC -");
ds_list_add(tabDSL[0], "playerIdentity");
ds_list_add(tabDSL[0], "- REVERSE DUNKIRK -");
ds_list_add(tabDSL[0], "operationX");
ds_list_add(tabDSL[0], "- GOV SPEECH -");
ds_list_add(tabDSL[0], "govQuest");
ds_list_add(tabDSL[0], "govFinishInitiate");
ds_list_add(tabDSL[0], "govSpeechInitiate");
ds_list_add(tabDSL[0], "longinusGov");
ds_list_add(tabDSL[0], "govTransfer");
ds_list_add(tabDSL[0], "govIntro");
ds_list_add(tabDSL[0], "- GOV POLICIES -");
ds_list_add(tabDSL[0], "govChoicesMade");
ds_list_add(tabDSL[0], "govAelfleda");
ds_list_add(tabDSL[0], "govBball");
ds_list_add(tabDSL[0], "govBomb");
ds_list_add(tabDSL[0], "govCar");
ds_list_add(tabDSL[0], "govChurch");
ds_list_add(tabDSL[0], "govCow");
ds_list_add(tabDSL[0], "govGuillaume");
ds_list_add(tabDSL[0], "govKalevi");
ds_list_add(tabDSL[0], "govKelpster");
ds_list_add(tabDSL[0], "govWilmer");
ds_list_add(tabDSL[0], "govZhang");
ds_list_add(tabDSL[0], "- HOOSEGOW -");
ds_list_add(tabDSL[0], "prisonDive");
ds_list_add(tabDSL[0], "prisonShankTime");
ds_list_add(tabDSL[0], "prisonQuest");
ds_list_add(tabDSL[0], "shankExecute");
ds_list_add(tabDSL[0], "prisonLiberated");
ds_list_add(tabDSL[0], "shankPending");
ds_list_add(tabDSL[0], "prisonDistress");
ds_list_add(tabDSL[0], "prisonIntro");
ds_list_add(tabDSL[0], "prisonFadeToggle");
ds_list_add(tabDSL[0], "kunigundeArrest");
ds_list_add(tabDSL[0], "sureshArrest");
ds_list_add(tabDSL[0], "moriartyArrest");
ds_list_add(tabDSL[0], "- SEWERS -");
ds_list_add(tabDSL[0], "fishgutQuest");
ds_list_add(tabDSL[0], "gutterEscape");
ds_list_add(tabDSL[0], "gutterhoundQuest");
ds_list_add(tabDSL[0], "chanticleerSafety");
ds_list_add(tabDSL[0], "chanticleerRoommate");
ds_list_add(tabDSL[0], "duergarInfoAelfleda");
ds_list_add(tabDSL[0], "- TIR NA NOG -");
ds_list_add(tabDSL[0], "gelasioState");
ds_list_add(tabDSL[0], "bouncerShake");
ds_list_add(tabDSL[0], "bootyBassQuest");
ds_list_add(tabDSL[0], "wilmerEvict");
ds_list_add(tabDSL[0], "mortgageDoor");
ds_list_add(tabDSL[0], "mortgageOver");
ds_list_add(tabDSL[0], "pelekryteState");
ds_list_add(tabDSL[0], "duergarInfoLonginus");
ds_list_add(tabDSL[0], "- MOUNTAIN PASS -");
ds_list_add(tabDSL[0], "duegarOutpost");
ds_list_add(tabDSL[0], "gilbertElevatorEnable");
ds_list_add(tabDSL[0], "- CYBERSPEAR -");
ds_list_add(tabDSL[0], "chatrouletteState");
ds_list_add(tabDSL[0], "csQuest");
ds_list_add(tabDSL[0], "csPieceAIRuins");
ds_list_add(tabDSL[0], "csPieceFactory");
ds_list_add(tabDSL[0], "csPieceGrem");
ds_list_add(tabDSL[0], "csPiecesTotal");
ds_list_add(tabDSL[0], "csComplete");
ds_list_add(tabDSL[0], "routerUsw");
ds_list_add(tabDSL[0], "routerUswReady");
ds_list_add(tabDSL[0], "- OTHER -");
ds_list_add(tabDSL[0], "cdwarfCinema");
ds_list_add(tabDSL[0], "barbaneth");
ds_list_add(tabDSL[0], "elevatorFloor");
ds_list_add(tabDSL[0], "elevatorFloorGoal");
ds_list_add(tabDSL[0], "campfireScene");
ds_list_add(tabDSL[0], "- YAPPING COUNTER -");
ds_list_add(tabDSL[0], "yapWords");
ds_list_add(tabDSL[0], "frogTravel");

//--------------
// HUNDLEY'S VARIABLES
//--------------
ds_list_add(tabDSL[1], "comServ");
ds_list_add(tabDSL[1], "-Redfield-");
ds_list_add(tabDSL[1], "knowGunstiers");
ds_list_add(tabDSL[1], "stahlGuns");
ds_list_add(tabDSL[1], "redfieldUpgrade");
ds_list_add(tabDSL[1], "-Pythagoras-");
ds_list_add(tabDSL[1], "pythagorasState");
ds_list_add(tabDSL[1], "pythagorasOnline");
ds_list_add(tabDSL[1], "pythagorasStateGoof");

//--------------
//BHROOM'S VARIABLES
//--------------
ds_list_add(tabDSL[2], "-Knowledge-");
ds_list_add(tabDSL[2], "knowDarchimedes");
ds_list_add(tabDSL[2], "knowStahl");
ds_list_add(tabDSL[2], "knowGamingKlatch");
ds_list_add(tabDSL[2], "knowKunigunde");
ds_list_add(tabDSL[2], "knowSuresh");
ds_list_add(tabDSL[2], "-Tutorial-");
ds_list_add(tabDSL[2], "zaneState");
ds_list_add(tabDSL[2], "jhodfreyTips");
ds_list_add(tabDSL[2], "tutorialDeath");
ds_list_add(tabDSL[2], "--Misc--");
ds_list_add(tabDSL[2], "comServ");
ds_list_add(tabDSL[2], "cuthbertHousingDept");
ds_list_add(tabDSL[2], "cuthbertTalked");
ds_list_add(tabDSL[2], "junklordState");
ds_list_add(tabDSL[2], "--Joad--");
ds_list_add(tabDSL[2], "joadQuest");
ds_list_add(tabDSL[2], "joadBad");
ds_list_add(tabDSL[2], "joadGood");
ds_list_add(tabDSL[2], "joadLife");
ds_list_add(tabDSL[2], "joadLine");
ds_list_add(tabDSL[2], "joadScrollChoice");
ds_list_add(tabDSL[2], "joadScrollKnow");
ds_list_add(tabDSL[2], "joadScrollOn");
ds_list_add(tabDSL[2], "joadProcess");
ds_list_add(tabDSL[2], "--BballQuest--");
ds_list_add(tabDSL[2], "knowDwarfLeague");
ds_list_add(tabDSL[2], "uschiBall");
ds_list_add(tabDSL[2], "katsuBall");
ds_list_add(tabDSL[2], "katsuState");
ds_list_add(tabDSL[2], "oozeBall");
ds_list_add(tabDSL[2], "knowKatsuBall");
ds_list_add(tabDSL[2], "bballComplete");
ds_list_add(tabDSL[2], "--Longinus Missions--");
ds_list_add(tabDSL[2], "longinusDoorState");
ds_list_add(tabDSL[2], "wiglafMission");
ds_list_add(tabDSL[2], "wiglafState");
ds_list_add(tabDSL[2], "jhodfreyState");
ds_list_add(tabDSL[2], "vrwAccount");
ds_list_add(tabDSL[2], "vrwLoggedIn");
ds_list_add(tabDSL[2], "vrwStationState");
ds_list_add(tabDSL[2], "tuberPeel");
ds_list_add(tabDSL[2], "crustFightAny");
ds_list_add(tabDSL[2], "framptonState");
ds_list_add(tabDSL[2], "framptonChides");
ds_list_add(tabDSL[2], "knowOO");
ds_list_add(tabDSL[2], "knowDwarfNET");
ds_list_add(tabDSL[2], "r&gEncounter");
ds_list_add(tabDSL[2], "cuchu_elevator_floor");
ds_list_add(tabDSL[2], "--TnN--");
ds_list_add(tabDSL[2], "deadSon");
ds_list_add(tabDSL[2], "wilmerEvict");
ds_list_add(tabDSL[2], "wilmerSleep");
ds_list_add(tabDSL[2], "vikingstadTnn");
ds_list_add(tabDSL[2], "--- Lugner ---");
ds_list_add(tabDSL[2], "batteredDwarfState");
ds_list_add(tabDSL[2], "lugnerQuest");
ds_list_add(tabDSL[2], "lugnerPlea");
ds_list_add(tabDSL[2], "slagLugnerOffer");
ds_list_add(tabDSL[2], "slagChase");
ds_list_add(tabDSL[2], "giuseppeState");
ds_list_add(tabDSL[2], "giuseppeScene");
ds_list_add(tabDSL[2], "dwarfCustody");
ds_list_add(tabDSL[2], "clockBatteredDwarfHospital");
ds_list_add(tabDSL[2], "--Shi and Heimdal--");
ds_list_add(tabDSL[2], "shiState");
ds_list_add(tabDSL[2], "shiDate");
ds_list_add(tabDSL[2], "--Other--");
ds_list_add(tabDSL[2], "yskolobElevator");
ds_list_add(tabDSL[2], "bballMonologue");
ds_list_add(tabDSL[2], "sceneBrandingStart");

//--------------
//BORT'S VARIABLES
//--------------
ds_list_add(tabDSL[3], "aelfledaEvict");
ds_list_add(tabDSL[3], "- guilder tower -");
ds_list_add(tabDSL[3], "officeDirectory");
ds_list_add(tabDSL[3], "raffaelAppt");
ds_list_add(tabDSL[3], "raffaelSolicit");
ds_list_add(tabDSL[3], "raffaelCaught");
ds_list_add(tabDSL[3], "- office workers -");
ds_list_add(tabDSL[3], "mayhewState");
ds_list_add(tabDSL[3], "wentworthState");
ds_list_add(tabDSL[3], "quatermaineState");
ds_list_add(tabDSL[3], "davenportState");
ds_list_add(tabDSL[3], "pembrokeState");
ds_list_add(tabDSL[3], "pomeroyState");
ds_list_add(tabDSL[3], "silvieState");
ds_list_add(tabDSL[3], "- tower duergar -");
ds_list_add(tabDSL[3], "drgEisenchaufelState");
ds_list_add(tabDSL[3], "drgEisenchaufelDead");
ds_list_add(tabDSL[3], "drgDieuwertState");
ds_list_add(tabDSL[3], "drgDieuwertDead");
ds_list_add(tabDSL[3], "drgJeltsjeState");
ds_list_add(tabDSL[3], "drgJeltsjeDead");
ds_list_add(tabDSL[3], "- frog kid -");
ds_list_add(tabDSL[3], "frogAnswer");
ds_list_add(tabDSL[3], "frogSpent");
ds_list_add(tabDSL[3], "frogState");
ds_list_add(tabDSL[3], "frogFrog");
ds_list_add(tabDSL[3], "frogForgive");
ds_list_add(tabDSL[3], "frogTime");
ds_list_add(tabDSL[3], "frogFriend");
ds_list_add(tabDSL[3], "frogQuiz");
ds_list_add(tabDSL[3], "frogletState");
ds_list_add(tabDSL[3], "frogletGrowth");
ds_list_add(tabDSL[3], "frogletCorpse");
ds_list_add(tabDSL[3], "frogletChup");
ds_list_add(tabDSL[3], "---Search for Cdwarf---");
ds_list_add(tabDSL[3], "cdwarfSearchGlobal");
ds_list_add(tabDSL[3], "cdwarfSearchTNN");
ds_list_add(tabDSL[3], "cdwarfSearchBrainCity");
ds_list_add(tabDSL[3], "cdwarfSearchSwamp");
ds_list_add(tabDSL[3], "cdwarfSearchDojo");
ds_list_add(tabDSL[3], "cdwarfSearchDeath");
//ds_list_add(list_Dquests, "guilderPoints");
//ds_list_add(list_Dquests, "guilderJoined");
// guilderberg
/*
ds_list_add(list_Dquests, "guilderProtest");
ds_list_add(list_Dquests, "guilderPoints");
ds_list_add(list_Dquests, "guilderJoined");
ds_list_add(list_Dquests, "guilderPromotion");
ds_list_add(list_Dquests, "guilderRank");
ds_list_add(list_Dquests, "guilderVictory");
ds_list_add(list_Dquests, "guilderFail");
ds_list_add(list_Dquests, "guilderQuestionsEnd");
ds_list_add(list_Dquests, "guilderExit");
ds_list_add(list_Dquests, "guilderRefuse");
ds_list_add(list_Dquests, "guilderBattle");
ds_list_add(list_Dquests, "guilderIntro");
ds_list_add(list_Dquests, "guilderFight");
ds_list_add(list_Dquests, "guilderTime");
ds_list_add(list_Dquests, "----");
ds_list_add(list_Dquests, "guilderDevelopQuest");
ds_list_add(list_Dquests, "guilderDeed");
ds_list_add(list_Dquests, "----");
ds_list_add(list_Dquests, "superEmpty");
ds_list_add(list_Dquests, "superData");
ds_list_add(list_Dquests, "superOn");
ds_list_add(list_Dquests, "superRoomLoop");
ds_list_add(list_Dquests, "superEvictYes");
ds_list_add(list_Dquests, "superEvictLoop");
ds_list_add(list_Dquests, "superManageLoop");
ds_list_add(list_Dquests, "superGoBack");
ds_list_add(list_Dquests, "superRepair");
ds_list_add(list_Dquests, "----");
ds_list_add(list_Dquests, "guilderPrompt");
ds_list_add(list_Dquests, "guilderPromptLoop");
ds_list_add(list_Dquests, "guilderPlazaQuest");
ds_list_add(list_Dquests, "guilderPlazaCount");
ds_list_add(list_Dquests, "ertharinDurian");
ds_list_add(list_Dquests, "ertharinBribe");
ds_list_add(list_Dquests, "ertharinState");
ds_list_add(list_Dquests, "ertharinPlaza");
ds_list_add(list_Dquests, "ertharinPay");
ds_list_add(list_Dquests, "durriyahPlaza");
ds_list_add(list_Dquests, "durriyahState");
ds_list_add(list_Dquests, "durriyahBribe");
ds_list_add(list_Dquests, "qutlughState");
ds_list_add(list_Dquests, "qutlughPlaza");
ds_list_add(list_Dquests, "qutlughPay");
ds_list_add(list_Dquests, "qutlughHome");
ds_list_add(list_Dquests, "mayorKnown");
ds_list_add(list_Dquests, "cryptoKnown");
ds_list_add(list_Dquests, "----");
*/
/* dilapidated zone
ds_list_add(list_Dquests, "longinusDoorKnown");
ds_list_add(list_Dquests, "longinusTalked");
ds_list_add(list_Dquests, "dilapKnockCount");
ds_list_add(list_Dquests, "dilapEmancipated");
ds_list_add(list_Dquests, "longinusFakeCover");
ds_list_add(list_Dquests, "longinusFakeDoor");
ds_list_add(list_Dquests, "longinusFakeItem");
ds_list_add(list_Dquests, "longinusFakeMystery");
*/

//--------------
//STINKO'S VARIABLES
//--------------
ds_list_add(tabDSL[4], "--- WEDDING ---");
ds_list_add(tabDSL[4], "weddingQuest");
ds_list_add(tabDSL[4], "borisWedding");
ds_list_add(tabDSL[4], "dinahWedding");
ds_list_add(tabDSL[4], "garciaWedding");
ds_list_add(tabDSL[4], "guillaumeWedding");
ds_list_add(tabDSL[4], "janeWedding");
ds_list_add(tabDSL[4], "polyWedding");
ds_list_add(tabDSL[4], "wayneWedding");
ds_list_add(tabDSL[4], "wizardWedding");
ds_list_add(tabDSL[4], "zalmoxisWedding");
ds_list_add(tabDSL[4], "stonewallBrain");
ds_list_add(tabDSL[4], "----");
ds_list_add(tabDSL[4], "hoopzSkelly");
ds_list_add(tabDSL[4], "brimbleState");
ds_list_add(tabDSL[4], "conversionQuest");
ds_list_add(tabDSL[4], "irmingardState");
ds_list_add(tabDSL[4], "relicSearch");
ds_list_add(tabDSL[4], "relicName");
ds_list_add(tabDSL[4], "duergarOutpost");
ds_list_add(tabDSL[4], "----");
ds_list_add(tabDSL[4], "frogkidState");
ds_list_add(tabDSL[4], "frogLocation");
//ds_list_add(list_Equests, "wilmerState");

/*
//--------
// MAINQUEST
//--------

ds_list_add(list_Aquests, "cdwarfCinema");
ds_list_add(list_Aquests, "wiglafMission");
ds_list_add(list_Aquests, "crustFightAny");
ds_list_add(list_Aquests, "longinusDoorOpen");
ds_list_add(list_Aquests, "longinusHelp");
ds_list_add(list_Aquests, "neneKnock");
ds_list_add(list_Aquests, "trigalScene");
ds_list_add(list_Aquests, "crustDead");
ds_list_add(list_Aquests, "playerX1");
ds_list_add(list_Aquests, "playerCC");
ds_list_add(list_Aquests, "playerHoopz");
//----------Cyberdwarf
ds_list_add(list_Aquests, "cdwarfJoined");
ds_list_add(list_Aquests, "cdwarfOmni");
ds_list_add(list_Aquests, "cdwarfOmniDead");
ds_list_add(list_Aquests, "cdwarfReformat");
ds_list_add(list_Aquests, "cdwarfTakeover");
ds_list_add(list_Aquests, "cdwarfTime");
//---------Cyberspears
ds_list_add(list_Aquests, "csComplete");
ds_list_add(list_Aquests, "csPiecesTotal");
ds_list_add(list_Aquests, "vestibuleScene");
ds_list_add(list_Aquests, "csAIGot");
ds_list_add(list_Aquests, "csEggGot");
ds_list_add(list_Aquests, "csExteriorLost");
ds_list_add(list_Aquests, "csForgeGot");
ds_list_add(list_Aquests, "csMinesGot");
ds_list_add(list_Aquests, "csNecropolisGot");
//----------Cuchulainn
ds_list_add(list_Aquests, "crustDead");
ds_list_add(list_Aquests, "crustDoorAny");
ds_list_add(list_Aquests, "crustDoorComplete");
ds_list_add(list_Aquests, "crustDoorIncomplete");
ds_list_add(list_Aquests, "crustDoorSolo");
ds_list_add(list_Aquests, "crustFightAny");
ds_list_add(list_Aquests, "crustFightComplete");
ds_list_add(list_Aquests, "crustFightIncomplete");
ds_list_add(list_Aquests, "crustFightSolo");
ds_list_add(list_Aquests, "cuchuLairDeath");
ds_list_add(list_Aquests, "oldmanBegin");
ds_list_add(list_Aquests, "oldmanDeath");
ds_list_add(list_Aquests, "oldmanTemptation");
ds_list_add(list_Aquests, "primoDead");
//--------Elevator
ds_list_add(list_Aquests, "campfireScene");
ds_list_add(list_Aquests, "elevatorChastise");
ds_list_add(list_Aquests, "elevatorCSPieces");
ds_list_add(list_Aquests, "elevatorDirection");
ds_list_add(list_Aquests, "elevatorFloor");
ds_list_add(list_Aquests, "elevatorRide");

//ds_list_add(tabDSL[0], "baldoSeen");
//ds_list_add(tabDSL[0], "baldoState");
//ds_list_add(tabDSL[0], "baldoEscape");
//ds_list_add(tabDSL[0], "baldoTimerAllow");
//ds_list_add(tabDSL[0], "baldoBlank");
//ds_list_add(tabDSL[0], "baldoSuicide");
*/


/*
//--------
// SAFIATOU / HEMALATHA
//--------
ds_list_add(list_Equests, "hemalathaState");
ds_list_add(list_Equests, "hemalathaScene");
ds_list_add(list_Equests, "hemalathaHateLoop");
ds_list_add(list_Equests, "hemalathaSafiatou");
ds_list_add(list_Equests, "hemalathaHate");
ds_list_add(list_Equests, "hemalathaRestaurant");
ds_list_add(list_Equests, "hemalathaRemember");
ds_list_add(list_Equests, "hemalathaSecret");
//ds_list_add(list_Equests, "hemalatha");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "safiatouAlaki");
ds_list_add(list_Equests, "safiatouSwamp");
ds_list_add(list_Equests, "safiatouHate");
ds_list_add(list_Equests, "safiatouTip");
ds_list_add(list_Equests, "safiatouDash");
ds_list_add(list_Equests, "safiatouBroke");
ds_list_add(list_Equests, "safiatouState");
ds_list_add(list_Equests, "safiatouBill");
ds_list_add(list_Equests, "safiatouQuest");
ds_list_add(list_Equests, "safiatouRecipe");
ds_list_add(list_Equests, "safiatouDine");
ds_list_add(list_Equests, "safiatouDineStart");
ds_list_add(list_Equests, "safiatouOrder");
ds_list_add(list_Equests, "safiatouAperitif");
ds_list_add(list_Equests, "safiatouTalk");
ds_list_add(list_Equests, "safiatouTalkLoop");
ds_list_add(list_Equests, "safiatouTogo");
ds_list_add(list_Equests, "safiatouWait");
ds_list_add(list_Equests, "safiatouHardtack");
ds_list_add(list_Equests, "safiatouRestaurant");
ds_list_add(list_Equests, "safiatouHome");
ds_list_add(list_Equests, "safiatouOffer");
ds_list_add(list_Equests, "safiatouGoodbye");
ds_list_add(list_Equests, "safiatouDeliberate");
ds_list_add(list_Equests, "safiatouStiff");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "wizardVar");
ds_list_add(list_Equests, "wizardWedding");
ds_list_add(list_Equests, "wizardOffer");
ds_list_add(list_Equests, "wizardChapel");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "superOn");
ds_list_add(list_Equests, "superEmpty");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "sabahState");
ds_list_add(list_Equests, "sabahSound");
ds_list_add(list_Equests, "sabahCrazy");
ds_list_add(list_Equests, "sabahPeak");
ds_list_add(list_Equests, "sabahQuest");
ds_list_add(list_Equests, "sabahWorking");
ds_list_add(list_Equests, "sabahWedding");
ds_list_add(list_Equests, "sabahOffer");
ds_list_add(list_Equests, "sabahTime");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "janeVar");
ds_list_add(list_Equests, "janeSabah");
ds_list_add(list_Equests, "janeWedding");
ds_list_add(list_Equests, "janeDrunk");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "musicianCount");
ds_list_add(list_Equests, "weddingQuest");
ds_list_add(list_Equests, "----");
ds_list_add(list_Equests, "govGuillaume");
ds_list_add(list_Equests, "guillaumeWedding");
ds_list_add(list_Equests, "----");
*/
