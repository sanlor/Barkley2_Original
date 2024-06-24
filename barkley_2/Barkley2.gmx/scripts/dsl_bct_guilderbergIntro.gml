/// Guilderberg Intro(s)
Quest("bossColor", global.colorGuilderberg);
Quest("bossName", "Guilderbergs");
Quest("bossDescription", "Human Wealthstrumentality Project");
external = 1;
script  = "
QUEST    | zoneVisible = 0
FADE     | 1 | 0
Misc     | set | o_cts_hoopz | o_cinema1
Camera   | snap | o_cinema1
LOOK     | o_cts_hoopz | NORTH
FRAME    | CAMERA_FAST | o_cinema1
FADE     | 0 | 1.5
WAIT     | 1.5
IF guilderIntroState == 2 | GOTO | GUILDER_INTRO03
IF guilderIntroState == 1 | GOTO | GUILDER_INTRO02
IF guilderIntroState == 0 | GOTO | GUILDER_INTRO01

GUILDER_INTRO03
GOTO     | COMMENCE

GUILDER_INTRO02
WAIT     | 1.5
DIALOG   | Gald | Again, Von Miser.
FRAME    | CAMERA_NORMAL | o_cinema2
WAIT     | 0 
DIALOG   | Gald | The lowly baseborn taints these hallowed halls with its arrears. Why isn't it down with the rest of them producing man-hours?
EVENT    | o_enemy_guilder_gald | 2
DIALOG   | Von Miser | Paupers who do not labor...
EVENT    | o_enemy_guilder_von_miser | 2
DIALOG   | Gald | Serve no purpose!
QUEST    | guilderIntroState = 2
GOTO     | COMMENCE_SHORT

GUILDER_INTRO01
DIALOG   | Gald | Yes, Gothbard... the minutes have been cast... the governance be executed in accordance with the Writ and By-law. `kw`The Great Upward Trickle`rt` can commence.
DIALOG   | Von Miser | Gald speaks truth, Gothbard. Withdrawals have thus been postponed, so sayeth the Board.
DIALOG   | Gald | The Board... praise be to the Board.
WAIT     | 0.25
DIALOG   | Gald | Hmmm?
WAIT     | 1.5
FRAME    | CAMERA_NORMAL | o_cinema2
WAIT     | 0 
DIALOG   | Gald | Look, Von Miser. It appears as though one of the `kw`proles`rt` has lost its way and wandered into these sacred chambers.
DIALOG   | Von Miser | Come to make square, debtor? Or file an official complaint perhaps?
FRAME    | CAMERA_FAST | o_cinema1
WAIT     | 0
QUEST    | guilderIntroState = 1
CHOICE   | State your purpose.
REPLY    | BOTCHEDINVESTEMENT | I speak for the 99 percent!
REPLY    | REVERSEDUNKIRK     | I'm here to deposit on your butts.
REPLY    | IVEMADEAMISTAKE    | I've made a terrible mistake.

BOTCHEDINVESTEMENT
DIALOG   | P_NAME = s_port_hoopzAngry | The protesters downstairs say you botched their investments... I'm here to make you pay!
GOTO     | FIGHTSTART

REVERSEDUNKIRK
DIALOG   | P_NAME = s_port_hoopzAngry | I'm here to deposit some money. These markets will rue the day they crossed with Average Necronian Working Dwarf!
GOTO     | FIGHTSTART

IVEMADEAMISTAKE
DIALOG   | P_NAME | Actually, I forgot to return some videotapes. See you...

FIGHTSTART
FRAME    | CAMERA_FAST | o_cinema2
DIALOG   | Gald | Ha, ha, ha! You hear that, Von Miser? Pay! Pay for what?
DIALOG   | Gald | Seek not vengeance, pauper. Leave room for the Ledger's wrath for it is written, `kw`the Ledger will repay.`rt` So sayeth the Board.
DIALOG   | Von Miser | Even still,_ the system is in motion. The tape already dyed sanguine! Nothing may cut it.
DIALOG   | Gald | Hmm. I'm rather thirsty, Gald. `w1`Shall we sup?`w0`
DIALOG   | Von Miser | Yes, `w1`sup indeed.`w0`
EVENT    | o_enemy_guilder_gald | 2
DIALOG   | Gald | We'll drain this peasant..._ 
EVENT    | o_enemy_guilder_von_miser | 2
DIALOG   | Von Miser | `s1`of its human capital!`s0`
CHOICE | Battle or Skip?
REPLY | COMMENCE_SHORT | Battle!
REPLY | GUILDER_BESTED | Skip!
" +
//GOTO     | COMMENCE_SHORT
"

COMMENCE_SHORT
FRAME    | CAMERA_FAST | o_cinema0
CREATE   | oBossName
WAIT     | 5
FRAME    | CAMERA_FAST | o_cinema1
WAIT     | 0
Misc     | music | mus_snail_ambush | 1
EVENT    | o_enemy_guilder_gald | 1
EVENT    | o_enemy_guilder_von_miser | 1
QUEST    | zoneVisible = 1

COMMENCE
FRAME    | CAMERA_NORMAL | o_cinema0
WAIT     | 0
CREATE   | oBossName
WAIT     | 5
EVENT    | o_enemy_guilder_gald | 2
EVENT    | o_enemy_guilder_von_miser | 2
WAIT     | 2
FRAME    | CAMERA_FAST | o_cinema1
WAIT     | 0
Misc     | music | mus_snail_ambush | 1
EVENT    | o_enemy_guilder_gald | 1
EVENT    | o_enemy_guilder_von_miser | 1
QUEST    | zoneVisible = 1

GUILDER_BESTED
" +
//TODO: make sure Hoopz and Guilders are INSTANTLY invulnerable so they don't die by stray bullet's
//TODO: set this to the right arrangement after the battle
"
DIALOG | Gothbard | Stop this at once!
" +
//TODO: SURPRISEAT | gothbard
//TODO: FRAME onto Gothbard
"
DIALOG | Von Miser | Gothbard, your excellency!
DIALOG | Gald | Sir, what are you doing here!? You should have stayed hidden! If you had perished here-
DIALOG | Gothbard | Hm? If I perished?
" +
//TODO: Gothbard steps into the light.
"
DIALOG | Gothbard | It is you fools who certainly would have perished if I did not stop you.
" +
//TODO: offscreen, have von miser and gald either de-glow and fly up, or fly up, then deglow and land
//TODO: up to you implemented how to do this, but maybe snap Hoopz offscreen to a closer cinema, then walk up into view
//TODO: FRAME | all participants
"
DIALOG | Gothbard | Look... look at the youngster's prideful stance, that aura of confidence... the engorged billfold...
DIALOG | Gald | By the heavenly dollar... the precious yuan...
DIALOG | Von Miser | It's true then... the child is one of us!   
DIALOG | Gothbard | Indeed. P_NAME_F, I have been watching you for some time now. Heed what I am about to tell you, for this is the true nature of the world. We are esteemed bankers, and having surveyed the market, found it similar to a great, endless ocean; purchases make ripples, the flow of goods and services form currents, and supply and demand ebb and flow like the tides. Where money gathers in masses, we find vast pools of wealth. Like that trash island in the Pacific.
DIALOG | P_NAME = s_port_hoopzSad | (Why are we so careless with our oceans...?)
DIALOG | Gothbard | I have felt your liquid presence in the market, child. I have examined your bankroll and inspected your soulful ledger. You have done more than ever could have been anticipated by one so young. You are becoming a master of money, child- `kw`A titan of capital!`rt`
DIALOG | P_NAME = s_port_hoopzAngry | Why are you saying this? Who are you?
DIALOG | Gothbard | My moniker in this world is `kw`Gothbard.`rt` My coworkers are often called `kw`Gald`rt`_ and `kw`Von Miser.`rt` We are bankers, investors, traders, and lenders. To some, we are known as `kw`Guilderberg Group.`rt` To others, `kw`d.b.a. Guilderberg Holdings, L.L.C.`rt` We believe in the power of the coin and have invested our lives to protecting and nurturing this power. As for you, we desire nothing more than to see your pockets grow ever deeper. Here... a gift...
" +
//TODO: the GOLD COLLAR floats down from the ceiling, hovers in front of P_NAME
//TODO: FOLLOWFRAME | gold collar and P_NAME
"
DIALOG | P_NAME = s_port_hoopzSurprise | Is that...
DIALOG | P_NAME = s_port_hoopzShock | `w2`INCAN GOLD!`w0`
DIALOG | Gothbard | Indeed it is... The truest standard of wealth. Take it P_NAME_S. Consider it a_ `w1`free_ lunch.`w0`
DIALOG | P_NAME = s_port_hoopzSurprise | The glitter... the glean... Incan Gold. I want the Incan Gold.
DIALOG | Gothbard | This is capitalism, P_NAME_S. What one wants._._._ `s1`one T_A_K_E_S!`s0`
" +
//TODO: Hoopz reaches for the collar and it separates and wraps around Hoopz' neck!
//TODO: some smoke arises from Hoopz, then settles, Hoopz is now in "collared" sprite mode... which is nothing but a Portrait swap
"
NOTIFY | Gained Pachacuti's Embrace
NOTIFY | FREE WILL has been supplanted!
ITEM | Pachacuti's Embrace | 1
DIALOG | Gothbard | Now, there are great secrets of money that still elude you. These secrets are the protected intellectual property of Guilderberg Group. I hereby invite you to join us, P_NAME_S. Forget about the commoners below, and put your faith in us,_ and in the almighty coin. Accept our offer... or your life - and profits - end here.
CHOICE | Join Guilderberg Group?
REPLY | JOIN_YES | I'll invest.
REPLY | JOIN_YES | I'll divest.
" +
//TODO: go in and set all portraits to the COLLARED portrait
"
JOIN_YES
DIALOG | P_NAME | Your shining suit and fine words have convinced me. Tell me what I can do about my credit. I don't know what a promissory note is, but I'm afraid I need one. How is my portfolio doing?
DIALOG | Gothbard | Very good, child. There will be time for all of your questions to be answered. For now, I must resume my rest. Von Miser and Gald will assist you with anything you need, and you will assist them as well. Welcome, P_NAME.
DIALOG | Gothbard | ... Welcome to the family.
"
//TODO: Gothbard slinks back into the darkness.
