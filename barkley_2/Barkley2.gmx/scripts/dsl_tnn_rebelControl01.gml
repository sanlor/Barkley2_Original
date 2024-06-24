///Script for walking into the Rebel Base in TNN
/*
VARIABLES
    prisonArrested
        0 = Not arrested
        1 = Arrested after going to rebel HQ and selling out your comrades via Gelasio
        2 = Arrested for trying to bomb the statue
        3 = Lost a battle against Duergar for the first time
        4 = Arrested for robbing the bank with Gutterhound
        5 = Arrested for chupsale      
        
    escapedFromTNN
        0 = Have not left TNN
        1 = TNN Primed for a lockdown (won't get locked until you try to re-enter after leaving)
        2 = TNN Lockdown in effect, can't enter TNN via gate nor through the sewers
        3 = TNN Lockdown in effect, escaped TNN via being imprisoned 
*/

external = 1;
script = "
IF govTransfer == 2         | GOTO | POST_SWAP_TO_GOV
IF govFinishInitiate == 1   | GOTO | POST_SPEECH
IF duergarInfoLonginus == 0 | IF govIntro == 0 | GOTO | REBELS_FIRST_CONTACT
IF duergarInfoLonginus == 1 | GOTO | REBELS_CAUGHT

REBELS_FIRST_CONTACT
QUEST  | govIntro = 1
" +
//ADVANCE TIME!
"
QUEST  | time += 1
KNOW   | knowLONGINUSTnn | 3
LOOK   | o_cts_hoopz | NORTH
WAIT   | 1
FRAME  | CAMERA_NORMAL | o_dr_liu01
WAIT   | 0
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu     | I've done it! The body transference device is finally complete! Listen up, L.O.N.G.I.N.U.S., `kw`Operation: Reverse Dunkirk`rt` is officially in the final stages! All we need to do now is `mq`kidnap the incoming governor,_ strap him in the body transference device,`rt` and then have a brave L.O.N.G.I.N.U.S. volunteer `mq`switch bodies with him and infiltrate the Governor's mansion`rt`. There, the volunteer can `mq`find my confiscated Top Secret Dossier!`rt` This should be a snap!
FRAME  | CAMERA_FAST | o_cts_hoopz | o_ritkonen01
WAIT   |
SET    | o_ritkonen01 | pause
LOOKAT | o_cts_hoopz | o_ritkonen01
DIALOG | Soldat Ritkonen | Hey, keep it down! We've got a game goin' on over here!
SET    | o_ritkonen01 | play
WAIT   |
FRAME  | CAMERA_FAST | o_dr_liu01
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu     | Alright, now do we have any volunteers? Naoko? Gormlaith?
FRAME  | CAMERA_FAST | o_naoko01
WAIT   | 0
SET    | o_naoko01   | pause
LOOKAT | o_cts_hoopz | o_naoko01
DIALOG | Sergeant Naoko | Um, I'm kind of busy. This poker game's getting intense.
SET    | o_naoko01   | play
FRAME  | CAMERA_FAST | o_dr_liu01
WAIT   | 0
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu | C'mon! We'll never take Cuchulainn down with that attitude! Someone's got to volunteer or all this work was for nothing!
FRAME  | CAMERA_FAST | o_cts_hoopz | o_pvtmadison01
WAIT   | 0
LOOKAT | o_cts_hoopz | o_pvtmadison01
DIALOG | Pvt. Madison | Kidnap the governor? Are you out of your mind? Not only will it not work and get us all killed, but it doesn't make a lick of sense. Why the hell did `kw`Wiglaf`rt` make you our leader? You're out of your flippin' gourd! We should do it the old fashioned way and blow the hell out of the Governor's mansion with a `w1`humongous bomb.`w0` Now `w1`THAT`w0` would be fun!
LOOKAT | o_cts_hoopz | o_dr_liu01
FRAME  | CAMERA_FAST | o_dr_liu01
WAIT   | 0
DIALOG | Dr. Liu | Sigh... someone has to be willing to volunteer...

REBELS_CAUGHT
LOOK     | o_vikingstad01 | NORTHWEST
LOOK     | o_lafferty01   | NORTHEAST
MOVETO   | o_cts_hoopz    | o_cinema9 | MOVE_NORMAL
WAIT     | 0.25
FOLLOWFRAME | CAMERA_NORMAL | o_cts_hoopz
WAIT     | 0
PLAYSET  | o_cts_hoopz | surpriseNE | surpriseHoldNE
WAIT     | 0.25
FOLLOWFRAME | CAMERA_NORMAL | o_cts_hoopz | o_absalomCaptured01
WAIT     | 0.5
DIALOG   | P_NAME = s_port_hoopzSurprise | Gadzooks! What did I walk into?!
LOOKAT   | o_vikingstad01 | o_cts_hoopz
WAIT     | 0.25
LOOKAT   | o_lafferty01 | o_cts_hoopz
WAIT     | 0.5
DIALOG   | Lafferty   | Well well well... what do we have here.
IF vikingstadTnn == 0 | DIALOG  | Vikingstad | I've seen the file on this lanky freak on BureauWEB. He was recently processed into town. Who knew he'd already team up with those lousy rebels.
IF vikingstadTnn >= 1 | DIALOG  | Vikingstad | Hey, this is that lanky freak who came to the office to flap his gums. Who knew he'd already team up with those lousy rebels.
DIALOG   | P_NAME = s_port_hoopzSurprise | What's going on?! How did you get in here?
DIALOG   | Lafferty   | Gelasio finally pulled through for us. These rebels are toast! You too, pipsqueak.
//SURPRISEAT| o_cts_hoopz | o_lafferty01
//DIALOG   | Pvt. Madison | Heh, we should be asking you that.
//LOOKAT   | o_cts_hoopz  | o_pvtmadison01
//WAIT     | 0.3
//FOLLOWFRAME | CAMERA_NORMAL | o_cts_hoopz | o_pvtmadison01
//WAIT     | 0.75
//DIALOG   | Pvt. Madison | Thanks to you the Duergars were able to infiltrate the Sewers and obtain the secret code. All I had to do was let them in the front door! Bwahahaha!
//DIALOG   | P_NAME = s_port_hoopzAngry | What? But that means that you sold out your dwarf comrades! Why?
//DIALOG   | Pvt. Madison | Heh, why? Because I'm about to be a very rich dwarf! And the first one to lay my hands on Lord Cuchu's Prize!_ Take him to_ THE HOOSEGOW!
//WAIT     | 0.1
MOVETO   | o_vikingstad01 | o_cinema15 | MOVE_SLOW
MOVETO   | o_lafferty01   | o_cinema14 | MOVE_SLOW
PLAYSET  | o_cts_hoopz | surpriseSW | surpriseHoldSW
WAIT     | 0.25
FADE     | 1 | 2.0
WAIT     | 3.0
QUEST    | prisonArrested = 1
QUEST    | prisonIntro = 1
QUEST    | rebelsArrest = 1
Teleport | r_pri_prisonGate01 | 464 | 1072

POST_SWAP_TO_GOV
LOOK     | o_cts_hoopz | SOUTHEAST
FADE     | 0 | 2
WAIT     | 2.0
QUEST    | govTransfer += 1
FRAME    | CAMERA_FAST | o_rightChair01 | o_leftChair01 | o_dr_liu01
DIALOG   | P_NAME = s_port_hoopzAngry   | Let me the hell out of this chair you cretinous turd hounds! When I escape, Cuchulainn will crush every single one of you! He'll enslave the dwarfs forever, throw you in the Hoosegow! You've made the worst mistake of your lives!
DIALOG   | Dr. Liu | It sounds like it definitely worked. How's it feel, P_NAME_S?
WAIT     | 0.5
LOOK     | o_cts_hoopz | SOUTHWEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | NORTHWEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | NORTHEAST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTHEAST
WAIT     | 0.5
DIALOG   | Governor Elagabalus | I feel kinda `w1`queasy.`w0` It's really weird looking at my body from the outside. Or being someone else... I uh, kind of want to go back.
DIALOG   | Dr. Liu             | You can go back as soon as you've gotten my `kw`Top Secret Dossier!`rt` You know what you need to do, right?
DIALOG   | Governor Elagabalus | Yeah, I think so. `mq`I gotta get into the Governor's Mansion and take that dossier that was confiscated, right?`rt`
DIALOG   | Dr. Liu             | That's right, that's the only way we can start PHASE TWO of the `mq`Operation: Reverse Dunkirk!`rt` After you're done, get back and we'll switch you back to your old body.
DIALOG   | Governor Elagabalus | I almost can't wait... I already hate this body.
DIALOG   | Dr. Liu             | Oh, one more thing before I forget. Try to not raise too much attention to yourself while you are out there. 
DIALOG   | Governor Elagabalus | What do you mean?
DIALOG   | Dr. Liu             | Times are tough in Tir na nog, and it's impossible to tell how some of the dwarfs might react to you, the governor, walking up to them. 
DIALOG   | Dr. Liu             | They might `kw`plead for help,`rt` `sq`offer tribute`rt` or simply tell you to `kw`go jump off a bridge.`rt` 
DIALOG   | Dr. Liu             | You can try and interact with the dwarfs of Tir na nog but remember to keep a relatively low profile until this mission is done.
DIALOG   | Governor Elagabalus | Okay, I'll try and behave myself.
DIALOG   | Dr. Liu             | Good luck, P_NAME_S! I know you can do it!
Misc     | music | mus_tnn_shadowrun2 | 1
QUEST    | govQuest = 5
QUEST    | ladderReached = 1
QUEST    | operationX = 2
IF tnnCurfew == 0 | GOTO | CURFEW_NULLIFY_1
IF tnnCurfew == 1 | GOTO | CURFEW_NULLIFY_2

CURFEW_NULLIFY_1
EVENT  | o_dr_liu01 | 10

CURFEW_NULLIFY_2
EVENT  | o_dr_liu01 | 10
DIALOG | Governor Elagabalus | Umm, what about the curfew? Should we wait until it's over before we go ahead with this?
DIALOG | Dr. Liu             | Oh the curfew ended while you were passed out, everything should be back to normal now.
DIALOG | Governor Elagabalus | Oh.
DIALOG | Governor Elagabalus | Alright, time to break a leg...

POST_SPEECH
QUEST    | govFinishInitiate = 2
QUEST    | time += 1
WAIT     | 1.5
DIALOG   | Dr. Liu     | Hey... hey, P_NAME, how do you feel? Are you back?
WAIT     | 0.5
LOOK     | o_cts_hoopz | SOUTHWEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | NORTHWEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | NORTHEAST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTHEAST
WAIT     | 0.5
MOVETO   | o_cts_hoopz | o_cinema11 | MOVE_NORMAL
WAIT     | 0
LOOKAT   | o_cts_hoopz | o_dr_liu01
DIALOG   | P_NAME      | Yeah, it's me..._ wow, it's nice to be back in my own body again. although it was kind of a power trip being the Governor for a little bit. I'm so glad your machine worked, Dr. Liu,_ especially the second time.
DIALOG   | Dr. Liu     | ... look we have to talk about that speech you made first.
DIALOG   | P_NAME      | Oh?
ClockTime | event | escapedFromTNN | 1 | 60
IF govPolicyEffect <  0 | GOTO | MADE_WORSE
IF govPolicyEffect == 0 | GOTO | MADE_SAME
IF govPolicyEffect == 1 | GOTO | MADE_SAME
IF govPolicyEffect == 2 | GOTO | MADE_BETTER
IF govPolicyEffect >= 3 | GOTO | MADE_BEST

MADE_WORSE
DIALOG  | Dr. Liu | What's the matter with you? Its great that `kw`Operation: Reverse Dunkirk`rt` can continue, but some of the policies you put in place are horrible! You get to leave on the mission but the rest of us here are screwed.
SURPRISEAT | o_dr_liu01
DIALOG  | P_NAME = s_port_hoopzSurprise | What do you mean? It was that bad?
DIALOG  | Governor Elagabalus | `w1`Bwahahaha!`w0` You did even better than I could have, you fucking idiot!
DIALOG  | Dr. Liu | Yeah it was pretty bad, P_NAME_S.
LOOKAT  | o_cts_hoopz | o_dr_liu01
DIALOG  | P_NAME = s_port_hoopzSad | I... I ruined everything...
DIALOG  | Dr. Liu | It's better that you should get out of here sooner than later.
WAIT    | 0.1
LOOK    | o_cts_hoopz | SOUTHEAST
WAIT    | 0.25
LOOK    | o_cts_hoopz | SOUTH
WAIT    | 0.25
PLAYSET | o_cts_hoopz | sad0 | sad1
WAIT    | 0
DIALOG  | P_NAME = s_port_hoopzSad | I'm a human piece of garbage.
PLAYSET | o_cts_hoopz | sad2 | sad3
" +
//TODO: crestfall event!
"
QUEST | behaveJaded += 1
QUEST | longinusGov = 1

MADE_SAME
DIALOG | Dr. Liu | Yeah, it's good that you're back and all, but you really could've done us some more favors when you were up there making the speech. I don't know what you were doing up there, but you could have done a lot more to give the dwarfs some much-needed relief.
DIALOG | P_NAME = s_port_hoopzSurprise | But I thought my mission was to get the Dos-
DIALOG | Dr. Liu | Yeah, yeah I know... I guess it's my fault. I botched it. Should have encouraged you to spend more time with the dwarf community as the governor before sneaking in. It was my botch. I botched it._ It was a botch job.
DIALOG | P_NAME = s_port_hoopzSad | I-I'm sorry.
DIALOG | Dr. Liu | Ah, it's fine, don't worry about it. Life for dwarfs sucked before and it'll just continue to suck, no biggie.
DIALOG | Governor Elagabalus | Sounds like you really botched this one, you four-eyed dingus! `w1`Bwahahaha!`w0` Let me go at once!
DIALOG | P_NAME = s_port_hoopzSad | (Dang... I didn't mean to contribute to the botch job like that... not at all!)
QUEST  | longinusGov = 2
GOTO   | CLOSER

MADE_BETTER
DIALOG | Dr. Liu | I don't want to say it was a long shot, but, well... it was a long shot! Not only did you pull the wool over the Duergars' eyes and got my Dossier back, but those policies you put in place really `sq``managed to do some good for Tir na nOg!`rt` I think there were a few missteps along the way, but you did what you could.
DIALOG | P_NAME  | Sorry for not being able to do more for you guys. I tried my best.
DIALOG | Dr. Liu | I guess that's better than some others around here...
FRAME  | CAMERA_FAST | o_naoko01
LOOKAT | o_cts_hoopz | o_naoko01
WAIT   | 0
DIALOG | Sergeant Naoko | King me! Hahaha suckers! I'm as rich as a `kw`Guilderberg`rt` now!
FRAME  | CAMERA_FAST | o_cts_hoopz | o_naoko01
LOOKAT | o_cts_hoopz | o_dr_liu01
WAIT   | 0
DIALOG | Dr. Liu | `w1`Sigh...`w0` well, there you go.
QUEST  | longinusGov = 3
GOTO   | CLOSER

MADE_BEST
DIALOG | Dr. Liu | I don't want to say it was a long shot, but, well... it was a long shot! Not only did you pull the wool over the Duergars' eyes and got my Dossier back, but those policies you put in place really `sq``managed to do some good for Tir na nOg!`rt` Things will hopefully be a lot more liveable around here.
DIALOG | P_NAME =s_port_hoopzHappy | I'm glad I was able to help you out. It was a great plan, Dr. Liu!
QUEST  | longinusGov = 4
GOTO   | CLOSER

CLOSER
DIALOG | Governor Elagabalus | `w1`Ass_`w2`H_O_O_O_L_L_E_S!`w0`
DIALOG | Dr. Liu | Alright. Let's focus on the job at hand, P_NAME_S! Let's talk about `sq`PHASE TWO of Operation: Reverse Dunkirk.`rt`
DIALOG | Dr. Liu | Take this `kw`Top Secret Dossier`rt`... you'll need to `sq`get this to our contact at`rt` `kw`The Social.`rt`
IF knowTheSocial == 3 | GOTO | BEENTO_SOCIAL
IF knowTheSocial == 2 | GOTO | GOTIT_SOCIAL
IF knowTheSocial == 1 | GOTO | WHERES_SOCIAL
IF knowTheSocial == 0 | GOTO | WHATS_SOCIAL

BEENTO_SOCIAL
DIALOG | P_NAME  | Oh yeah I've been there. The Social? It's in the Eastelands, right?
DIALOG | Dr. Liu | Yeah. Okay good. Where was I?
GOTO | MEETSLAG

GOTIT_SOCIAL
DIALOG | P_NAME  | Okay yeah I know it's in the Eastelands, but I've never been there.
DIALOG | Dr. Liu | Okay, good. Where was I?
GOTO | MEETSLAG

WHERES_SOCIAL
DIALOG | P_NAME  | `kw`The Social?`rt` I've heard of it but I don't know where it is.
DIALOG | Dr. Liu | It's in the eastern part of the Wastelands... what we call `kw`The Eastelands.`rt`
DIALOG | P_NAME  | Ah okay...
DIALOG | Dr. Liu | I'll show you how to get there..._ now where was I?
KNOW   | knowTheSocial | 2
GOTO   | MEETSLAG

WHATS_SOCIAL
DIALOG | P_NAME  | `kw`The Social?`rt` What's that?
DIALOG | Dr. Liu | It's an overflow population center for dwarfs. As you can tell, Tir na nOg is a little crowded these days. The duergars have a bunch of us stuffed into some shipping containers in the middle of the Wastelands.
DIALOG | P_NAME  | Sounds like a dangerous place to be...
DIALOG | Dr. Liu | It is if you're a dwarf. Now, where was I?
GOTO   | MEETSLAG  

MEETSLAG
DIALOG | Dr. Liu | Oh right. You'll notice our contact there. He's an unfortunate character, `kw`a kobold...`rt` 
DIALOG | Dr. Liu | This particular kobold is tall, green and grotesque. Really chatty too. Wears a hat and a trenchcoat at all times.
DIALOG | Dr. Liu | L.O.N.G.I.N.U.S. normally don't work with that species but let's just say he's willing to do things others won't.
IF knowSlag >= 1 | DIALOG | P_NAME = s_port_hoopzAngry | A kobold, eh? I think I might know who you are talking about.
IF knowSlag == 0 | DIALOG | P_NAME | Hmm, okay I'll look for a talking kobold.
DIALOG | Dr. Liu | All you gotta do is `sq`get this dossier to him and make sure the Duergars don't catch you with it!`rt`
DIALOG | P_NAME = s_port_hoopzHappy | Got it!
USEAT  | o_dr_liu01
NOTE   | take | Sealed Secret Dossier
NOTIFY | Got the Sealed Secret L.O.N.G.I.N.U.S. Dossier!
DIALOG | P_NAME = s_port_hoopzSurprise | (So secretive... wow it even has a seal.)
DIALOG | Dr. Liu | Best to keep it sealed and most importantly `sq`NOT to show it to anyone!`rt`
DIALOG | Governor Elagabalus | I'm gonna lose a `s1`GAT_DAM_`s0` shoe in your colon!
DIALOG | Dr. Liu | You'll obviously need help getting there... here take this.
WAIT   | 0.5
USEAT  | o_dr_liu01
Map    | gain | The Eastelands
NOTIFY | Got a map of the Eastelands.
DIALOG | P_NAME  | (Wow this is serious... better not frub this up, P_NAME_S!)
DIALOG | Dr. Liu | I've marked on the map the best route to take... stick to that and you should be able to make it to The Social. Talk to Absalom if you need any more information. `w1`Good luck!`w0`
DIALOG | P_NAME = s_port_hoopzSmirk | You got it, Doc!
DIALOG | Governor Elagabalus | Eat shit. Eat my shit!
QUEST  | operationX = 3
";
/*
DIALOG | P_NAME | 
DIALOG | Dr. Liu | 
DIALOG | P_NAME | 
DIALOG | Dr. Liu | 
DIALOG | P_NAME | 
DIALOG | Dr. Liu |  
