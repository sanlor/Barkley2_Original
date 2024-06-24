///Intial Meeting with Gutterhound
/*

Variable
    gutterhoundQuest 
        0 = Gutter Hound hasn't been spoken to.
        1 = You talked to him but haven't listened to Gutterhound's scheme.
        2 = You refuse Gutterhound's offer.
        3 = You've refused Gutterhound's offer twice. Can't get it again.
        4 = Gutter Hound's quest has been accepted.  Gutterhound and Marquee will remind Hoopz to get back to talk to Gutterhound
        5 = You've nominated to hide in the safe house
        6 = You've nominated to forgoe the safehouse
        7 = Gutterhound has robbed the bank with you
        8 = Gutterhound robbed the bank without you
*/

script = "
IF body == governor | GOTO | GOV
IF gutterhoundQuest >= 4 | DIALOG | Bhroom | RUN GUTTERHOUND EVENT 2
IF gutterhoundQuest >= 4 | GOTO | END
IF gutterhoundQuest == 3 | GOTO | GUTTER03
IF gutterhoundQuest == 2 | GOTO | GUTTER02
IF gutterhoundQuest == 1 | GOTO | GUTTER01
IF gutterhoundQuest == 0 | GOTO | GUTTER00

GOV
DIALOG | Gutter Hound | Lookin' sharp, @P_NAME_S@. Knock 'em dead out there. Oh, and... legalize it.

GUTTER03
DIALOG | Gutterhound | Get steppin', brat, I'm gonna make this withdrawal myself, and it's going alll_l_l straight to my brainpan. Scram.
GOTO | END

GUTTER02
DIALOG | Gutterhound | What the hell do you want, chump? I'm done with you. We've got nothin' to talk about. Unless you want to talk about partyin' up and paintin' the town grape.
DIALOG | P_NAME | Well...
CHOICE | Help Gutterhound rob the bank?
REPLY | YESROB2 | On second thought, sure...
REPLY | THINKABOUTIT | Let me think it over still.
REPLY | NOROB2 | Hey bonehead, the answer's NO.

YESROB2
DIALOG | P_NAME | Well... I don't know about partying... I'm more of a vidcons kind of guy... but I was thinking maybe we could talk about breaking into that Duergar bank... the one you were talking about earlier?
DIALOG | Gutterhound | Ha HA! I knew you'd be back, kid! Lemme tell you something: you shouldn't feel bad about taking from Duergars. Those mother hubbards would slit your throat in an instant if they could make a dime off it. They take from the dwarfs every day. Look at this place. Look at Tir na Nog. I'm glad as hell I got out of here when I could 'cuz this is a pig sty and who do we have to thank for that? Cuchulainn and the Duergars. Well I say we take back, get off our asses unlike these so-called rebels and show the Duergars what's what.
GOTO | YESROB

THINKABOUTIT
DIALOG | P_NAME | Actually, I'm gonna keep mulling this one over.
DIALOG | Gutterhound | You gonna pussyfoot around everything in life? Fine, tyke, but just know I'm going in whether you are with more or not.
GOTO | END

NOROB2
DIALOG | P_NAME | No way, I'm not a crook. I don't care that it's the Duergars or Cuchulainn or whoever, I'm not going to steal from anyone. Stealing is wrong...
DIALOG | Gutterhound | Man, you're as lame as they come. Forget it, kid. I don't want nothin' to do with you. /'Stealing is wrong./' Wah wah. Learn to live a little.
QUEST | gutterhoundQuest = 3

GUTTER01
DIALOG | Gutterhound | Hey party animal, ready to hear my big idea now?
CHOICE | Hear out Gutterhound?
REPLY | LISTEN | Sure, what's this big idea?
REPLY | DONTLISTEN | Sorry, gotta dash.

GUTTER00
DIALOG | Gutterhound | Look at these poseurs. /'Rebels/'. Sittin' on their bumpers all day waitin' for someone to fix all their problems. Well that ain't gonna be me! I'm here to party! Where's that purple stuff at? Ol' Gutter Hound's gotta wet his whistle! Oooh boy, I'm gonna get cuffed up tonight!
IF knowLonginus == 0 | GOTO | REBELASK
IF knowLonginus == 1 | GOTO | GUTTER0_CONT
" + 
//TODO: This needs to reflect the new rebel thing
//      not sure what this is above anymore?
"
REBELASK    
DIALOG | P_NAME | Huh? What rebels?
DIALOG | Gutterhound | The ones up that ladder and through that door!
" +
//TODO: add look/frame to Longinus ladder and door
"
DIALOG | Gutterhound | That secret hideout ain't exactly secret, damn nincompoops. They think they can keep pushing against that Ole Man Cuchu and get some ground. Hell, only ground I need is where I pass out each morning! Ha!
FRAME | CAMERA_NORMAL | o_cts_hoopz | o_gutterhound
LOOKAT | o_cts_hoopz | o_gutterhound
GOTO | GUTTER00_CONT1

GUTTER00_CONT1
DIALOG | P_NAME | What's your problem with the rebels?
DIALOG | Gutterhound | I got two problems with 'em. First, they don't know how to party. That's the big one. Second, they don't do diddly. I hiked all the way through the sewers by myself to see what kind of shennanigans were going down. And what do I see when I get there? /'We've got this chair that'll scramble your brains,/' and all that egghead bunk. Waste of my damn time.
DIALOG | P_NAME | Wait, you made it all the way through the sewers on your own?
DIALOG | Gutterhound | Lemme tell you somethin', kid - I eat Fishlians like I eat grapes: by the cluster. Hey speaking of, you got any of that purple stuff?
" +
//TODO: Add logic for Gelasio here
"
IF knowGrape == 1 | GOTO | KNOWGRAPE
IF knowGrape == 0 | GOTO | DUNNOGRAPE

DUNNOGRAPE
DIALOG | P_NAME | Purple stuff? What's that?
DIALOG | Gutterhound | Ahhhh, you're straight off the vine my friend. Purple stuff - it's grape juice, Mother Nature's sweet, sweet gift to dwarfs. It's how the REAL rebels roll back in the BC - Brain City.
QUEST | knowGrape = 1
DIALOG | P_NAME | That grape stuff sounds good._._._
GOTO | GUTTER00_CONT2

KNOWGRAPE
DIALOG | P_NAME | You mean... (gulp) T_H_E_ G_R_A_P_E_?
DIALOG | Gutterhound | Well too be honest for me that's a broad term. I'll drink it whether it's from teh vine or from the bathtub, ha!
GOTO | GUTTER00_CONT2

GUTTER00_CONT2
WAIT | 0.5
DIALOG | P_NAME | Well, I'm not supposed to talk to strangers. Bye.
DIALOG | Gutterhound | Hey now, we just started chewing the flubber, don't need to rush off._ Tell ya what, I got an idea, kid, wanna hear it?
QUEST | gutterhoundQuest = 1
GOTO | GUTTERPROPOSITION

GUTTERPROPOSITION
CHOICE | Hear out Gutterhound?
REPLY | LISTEN | Aye, you have my ear.
REPLY | DONTLISTEN | Mine ear is none but mine own, begone.

LISTEN
DIALOG | P_NAME | Well, I guess you can tell me.
DIALOG | Gutterhound | Attaboy._._._ So look, I got a plan. If I'm gonna get fully C_U_F_F_E_D_ U_P tonight, I'm gonna need some serious scratch. Moolah, you follow? And you know where they keep it?
" + 
//TODO: frame to the BANK
//scr_event_build_camera_move_to_point(360, 400, 10);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(2);
"
DIALOG | Gutterhound | That's Cuchulainn's safe house, where the Duergars keep their loot. All day I've been watchin' the blueskins marching in neuroshekels by the brainload. I'm thinking we bust the place up, run off with the dough and split it fifty-fifty. And THEN we hit that purple stuff. Heh heh, what do you say kid?
CHOICE | Help Gutterhound rob the bank?
REPLY | YESROB | Sure, I'm in.
REPLY | NOROB | No, thou shalt not heist.

YESROB
DIALOG | P_NAME | Well, I don't know about stealing... but if it's from the Duergars, I guess it's okay.
DIALOG | Gutterhound | Awww yeah, that's what I like to hear. So here's the skinny, kid. The bank is closed down you see, all chained up. Plus there are blueskins lousin' up the place at all hours of the day. But I got a little birdie that told me something might just be hitting the mainframe at @temp@ and then ... poof, lights out - we get to work.
DIALOG | P_NAME | Ah, what does that mean?
DIALOG | Gutterhound | It means it'll be time to make a withdrawal... by force.
DIALOG | P_NAME = s_port_hoopzSurprise | That sounds X_-_T_R_E_E_M.
DIALOG | Gutterhound | Not only X_-_T_R_E_E_M, but in fact, T_R_I_P_L_E_X_-_T_R_E_E_M. So I need you come back at @temp@ and we'll start the operation, got it?
DIALOG | P_NAME = s_port_hoopzHappy | Got it!
DIALOG | Gutterhound | But there is actually something that you can do for me now. You see, when we come bustin's out of that bank with a lobe full of shekels, we are gonna need a place to lay low for a bit. There's gonna be a lot of blue heat on the streets after this heist.
DIALOG | P_NAME = s_port_hoopzSurprise | Oh! You're right, I didn't think of that.
DIALOG | Gutterhound | What did my pappy always say before that particular potent strain of Concord Juice took his life? Plan your heist and heist your plan.
DIALOG | P_NAME = s_port_hoopzHappy | Well I've made a lot of good friends in Tir na nOg already! Mr. Wil-
DIALOG | Gutterhound | Nah. kid. The nOg's got eyes in the walls. We'd be rounded up before the new Governor even got here. We gotta go deeper...
DIALOG | P_NAME | Deeper?
DIALOG | Gutterhound | Yeah, I've heard of those rotten blueskins patrolling the sewers but if you can find a good hiding spot for us, we'll be able to law low until the heat drops.
DIALOG | P_NAME | Okay so I'll try to find a safe place in the sewers!
DIALOG | Gutterhound | You got it! And don't forget, kid... @temp@. Come back anytime before then and we'll start cashing in. But don't be late!
DIALOG | P_NAME | Okay, I'll be back.
QUEST | gutterhoundQuest = 4
GOTO | END

NOROB
DIALOG | P_NAME = s_port_hoopzSurprise | No way! I'm not gonna help you rob a bank! Are you out of your mind? Do you even have a plan? What if we get caught? What if... what if...
DIALOG | Gutterhound | Awww, c'mon man. You're no fun. It's just a little theft, a little rough housin'. Who cares if a couple Duergars get smashed up in the process? It's all in good fun. Just a little Robin Hood'n around.
DIALOG | P_NAME | No. No way, I'm sorry, but theft is wrong and I'm not going to have anything to do with it. You need to get off the grape juice and take a bath.
DIALOG | Gutterhound | I thought you might be up for a good time, but you're a party pooper just like these rebels, kid. Can't NOBODY in this kennel run with the Hound! Awooooo!
DIALOG | P_NAME = s_port_hoopzAngry | You're out of your gourd... you're out of your dippin' gourd.
QUEST | gutterhoundQuest = 2

DONTLISTEN
DIALOG | P_NAME | Sorry gotta skeedaddle to a place that doesn't reek of dwarfen garbage.
DIALOG | Gutterhound | Suit yourself, kid. I happen to like the smell.
QUEST | gutterhoundQuest = 1

GUTTERROB
DIALOG | Bhroom | Run Event 02!
//EVENT

END
EXIT |
"
