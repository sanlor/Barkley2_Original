script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF comServ == 6     | GOTO | STATE6
IF comServ == 5     | GOTO | STATE5
IF comServ == 4     | GOTO | STATE4
IF comServ == 3     | GOTO | STATE3
IF comServ == 2     | GOTO | STATE2
IF comServ == 1     | GOTO | STATE1
GOTO | STATE0

MATTHIAS
DIALOG | Cornrow  | Well, well, well. If it ain't our little friend Matthias. Funny seeing you here after our last run-in, eh Juicebox?
DIALOG | Juicebox | Real funny.
DIALOG | Matthias | Yep! It's a real knee slapper! Well, I'll be seeing you guys! Have a nice day!

GOVERNOR
DIALOG | Cornrow | Well if it ain't the new governor! Pleased to meet you, sir! I'm Cornrow, this is my associate Juicebox, and as you can see we're just uh, volunteering. Keeping kids off the streets, teachin' 'em to read, the whole nine yards.
DIALOG | Governor Elagabalus | Hello! It is truly me, the Governor. I am pleased to announce that /'reading is fundamental/'! Please treasure this adage. Thank you.

STATE0
QUEST  | cornrowTalked = 1
DIALOG | Cornrow  | You know where you are, kid? These ain't the 'burbs, this is the real deal. You're walkin' the streets of Tir na Nog.
DIALOG | P_NAME   | Oh... I'm kinda new here.
DIALOG | Cornrow  | Ha! You're tellin' me, kid!!
DIALOG | Juicebox | You're tellin' him!
DIALOG | Cornrow  | Lemme tell ya', the alleys of Tir na Nog aren't a good place for kids like you to wander around alone. You never know what kinda creeps are out here. Duergars, Bainshees, all kindsa goons lookin' to rob ya blind. Ha! I bet you don't even got a dime on ya!
DIALOG | P_NAME   | Well, Mr. Wilmer only gave me l_i_t_t_l_e_m_o_n_e_y_.
DIALOG | Cornrow  | Now THAT is a shame, kid. That's a DAMN shame. Ya know, you're lucky you ran into me and my, uh, nephew Juicebox. See, me and Juicebox, we're like the guardian angels of Tir na Nog - we're the good guys, y'know? Nothin' makes us feel better than seein' a new guy like you land on his feet out here. Now me and Juicebox, we got a proposition for ya -
DIALOG | Juicebox | A proposition.
DIALOG | Cornrow  | That's right, a proposition. What do you say me and Juicebox show you the ropes around here, fill you in on what's what on the streets and make a little scratch in the process, eh? You don't gotta do nothin' but run a few errands for us and it'll only take a moment of your time. How's that sound, kid?
DIALOG | P_NAME   | Well...
GOTO   | HELP

HELP
CHOICE | Help out Mr. Cornrow?
REPLY  | YES | Okay, that sounds good to me!
REPLY  | NO  | No, thank you.

YES
DIALOG | P_NAME   | Wow! You'd do that for me?
DIALOG | Cornrow  | See, Juicebox? What'd I tell ya'? I said 'that looks like a real bright kid over there!' And whattaya know? I was right!
DIALOG | Juicebox | You were right, Cornrow.
DIALOG | Cornrow  | Now listen up, kid. This is real simple. Me and Juicebox were gonna distribute a buncha fruits to malnourished children but I left my fruit basket at my granny's house. Alls ya gotta do is head over to granny's house and pick up the big ol' basket of fruit, real big, like one of them, uh, whattaya call em - cornucopias? - and bring it back. That's it.
DIALOG | Juicebox | That's it.
DIALOG | Cornrow  | I'd do it myself but I'm uh, busy teaching impoverished children how to read.
DIALOG | Juicebox | Uncle Cornrow's teachin' me how to do letters.
DIALOG | P_NAME   | This doesn't sound too hard. Where does granny live?
DIALOG | Cornrow  | Look at that - look at that foresight, Juicebox. This kid's a real go-getter. She lives up in the poor quarter near the sewer entrance, furthest house on the left, a little blue shack. Real easy to find.
DIALOG | P_NAME   | Okay, Mr. Cornrow. I'll go get the fruit. Good luck with the reading lessons, Mr. Juicebox!
DIALOG | Juicebox | Uh... thanks kid.
QUEST  | comServ = 2

NO
IF comServ == 1   | GOTO | NO1
DIALOG | P_NAME   | Um, well I appreciate the offer Mr. Cornrow, but I'm a little busy right now.
DIALOG | Cornrow  | Awww, what a shame. Alls I wanted you to do was get the basket of fruit I was going to distribute to starving kids. Ahh well. Looks like those kids are going hungry tonight, Juicebox. What a shame.
DIALOG | Juicebox | Shame.
DIALOG | Cornrow  | Well lemme know if you ever change your mind, kid. It's easy to get lost out here in the streets of Tir na Nog. Or worse.
QUEST  | comServ = 1

NO1
DIALOG | P_NAME   | No thanks, Mr. Cornrow. I mean, I appreciate it and everything but I've got a lot of stuff going on right now.
DIALOG | Cornrow  | You're breakin' my heart, kid.
DIALOG | Juicebox | You're breakin' his heart.
DIALOG | Cornrow  | ...but if you gotta lot on your plate, you gotta lot on your plate. Just don't forget how dangerous it gets out here. Cuchulainn, Duergars, Bainshees, rebels... and worse.
	
STATE1
DIALOG | Cornrow  | Well would you look at that, Juicebox. The kid's back. What'd I tell ya? I told you he'd come around sooner or later.
DIALOG | Juicebox | That's what you said, Cornrow.
DIALOG | Cornrow  | Well what can I do for ya, kid? Have you thought about that proposition I gave you earlier? Me and Juicebox show you the ropes, teach you a few things about Tir na Nog and get you a little pocket change in return for running a few errands for us. It'll only take a moment of your time. That's reasonable, right?
GOTO   | HELP

STATE2
DIALOG | Cornrow  | Well look who's back, Juicebox. It's our boy wonder, " + P_NAME_S + ". What's going on, kid? //gender
DIALOG | P_NAME   | I forgot where your granny lives. Can I get directions again?
DIALOG | Cornrow  | You bet, kid. Granny lives in the poor quarters, the northeast part of Tir na Nog just before the sewers. Her house is the furthest on the left - the old blue shack with the shingles falling off. You can't miss it, it's right next to ol' Morty's candy shop.
DIALOG | P_NAME   | Okay, I'll be right back Mr. Cornrow!

STATE3
DIALOG | P_NAME   | Hi Mr. Cornrow, hi Mr. Juicebox. I've got your fruit.
BREAKOUT | add | money
DIALOG | Cornrow  | P_NAME_S, my man! Look at that basket of fruit you got there! Ooooooh baby, look at those strawberries, Juicebox. We're eatin' good tonight. Good job, kid. Here's a little change for yer pocket.
QUEST  | money += @money_cornrowCornucopia@
ITEM   | Fruit Basket | -1
NOTIFY | Cornrow takes the Cornucopia. Got @money_cornrowCornucopia@ neuro-shekels!
BREAKOUT | clear
DIALOG | P_NAME   | Wow, thanks Mr. Cornrow!
DIALOG | Cornrow  | Here's a little tip - do NOT go in the sewers. Ain't nothin' in there but Bainshees, Duergars, rebels and trouble. Lemme tell ya, kid, don't get involved with none of that crap. Out here, the only guy you gotta worry about is number one - you. Ain't nothin' none of us can do about Cuchulainn so don't even bother. 'sides, if what I hear is true, we're all gettin' some sort of prize soon. And ESPECIALLY stay away from those uppity sons of bitches ('scuse the French) Ooze and Slag. I don't know what crawled up their butts but they strut around here acting like they own the place. I don't know who they are or where they came from but those guys are dangerous.
DIALOG | P_NAME   | Wow, okay! I'll be sure to stay away from all those guys!
DIALOG | Cornrow  | Yeah, yeah! That's lesson number one from the streets of Tir na Nog. Ya got it?
DIALOG | P_NAME   | Stay away from the sewers, Cuchulainn, Duergars, rebels, Ooze, Slag, and everyone else. Got it!!
DIALOG | Cornrow  | You're catchin' on, kid. Now hey, I got somethin' else for ya to do. This one's a little tricky. My nephew Juicebox, he's a good kid but he just don't get math.
DIALOG | Juicebox | I just don't get math.
DIALOG | Cornrow  | I gave him some money to get candy at Morty's candy shop. Well Juicebox gives ol' Morty a tenner for a dime candy and gets one neuro-shekel back. Poor Juicebox, he didn't know he got the wrong change.
DIALOG | Juicebox | I didn't know.
DIALOG | Cornrow  | So I need you to go to Morty's candy shop and get that change back. Think you can do that?
DIALOG | P_NAME   | Sure!
DIALOG | Cornrow  | Now that's what I'm talkin' about. Okay, now I'm gonna give you my gun - just show it to Morty to let him know you're there representin' me. Otherwise he'll think you're just horsin' around. His shop is next to granny's place, you must've seen it when you were there earlier. I'd do it myself but I've gotta teach Juicebox his numbers.
NOTIFY | Got Cornrow's Gun.
EVENT  | o_cornrow01 | 0
DIALOG | P_NAME   | Alright, Mr. Cornrow! I'll be back in no time!
QUEST  | comServ = 4

STATE4
DIALOG | P_NAME  | Hey Mr. Cornrow, can you tell me how to get to the candy shop again?
DIALOG | Cornrow | You got it, kid. It's up in the poor quarters, northeast Tir na Nog - it's the big shop building on the left side, right next to granny's place. You can't miss it!
DIALOG | P_NAME  | Thanks, Mr. Cornrow. I'll be right back!

STATE5
QUEST  | calc = @money_mortimerRobbery@
QUEST  | calc -= @money_mortimerRobberyCut@
IF money >= calc | GOTO | MONEY_HAVE
GOTO | MONEY_DONT

MONEY_HAVE
DIALOG | Cornrow | Look who it is, Juicebox. It's our new best buddy " + P_NAME_S + ". Did you get our change back from ol' Morty?
DIALOG | P_NAME  | Sure did Mr. Cornrow! He said he owed you even more than the number you gave me - he gave me " + string(scr_money_db("mortimerRobbery")) + " whole neuro-shekels!
BREAKOUT | add | money
DIALOG | Cornrow | Whoooo boy! Give it here, kid!
QUEST  | money -= calc
NOTIFY | Cornrow takes @calc@ neuro-shekels.
DIALOG | Cornrow | Keep the rest for yourself.
BREAKOUT | clear
DIALOG | P_NAME  | Wow, thanks Mr. Cornrow!
DIALOG | Cornrow | Hey, no problem kid. I'm always happy to do favors for people in need. Right Juicebox?
DIALOG | Juicebox | Yep.
DIALOG | Cornrow | Now lemme tell ya something, kid - people talk about all those Dwarf Zones out there, places where dwarfs live free from Cuchulainn? Forget 'em. They're not real. Do you really think people can get away from Cuchulainn on his own ziggurat? Ain't nothin' outside Tir na Nog. No way. And the Cyberdwarf? Yeah, people talk about him like he's the leader of L.O.N.G.I.N.U.S. or whatever, but I say he's a fairy tale. Ain't no Cyberdwarf and ain't nobody fighting our fights for us.
DIALOG | P_NAME  | N-no Cyberdwarf...?
DIALOG | Cornrow | Never was, never will be. But forget about it, kid. I got one last thing for you to do. Think you're up for it?
DIALOG | P_NAME  | I-I guess...
DIALOG | Cornrow | Yeah, that's the stuff kid. Remember granny? She's a sweetheart but she's gettin' a bit old, startin' to forget things. You know how the elderly can be. Well this mornin' she up and left her house without takin' her vitamins! Can you believe it? She's gettin' on in her years and she needs those vitamins. I've just got her best interests at heart, y'know? So I want you to take this syringe and inject her with vitamins. Think you can handle that?
DIALOG | P_NAME  | Sure, Mr. Cornrow. That's really thoughtful of you.
DIALOG | Cornrow | I take care of my kin, kid.
DIALOG | Juicebox | He takes care of his kin.
DIALOG | Cornrow | Now here's the thing - just make sure granny doesn't see you do it. Do it from behind or somethin'. She's an ornery ol' coot and she doesn't like to take her medicine, even if it's what's best for her. At this point, it's really up to us to take care of her, y'know?
DIALOG | P_NAME  | I understand, Mr. Cornrow. I'll make sure granny gets her medicine. Do you know where she is?
DIALOG | Cornrow | She's all over Tir na Nog, but I know she likes Giuseppe's sermons. He's in that warehouse in the main shopping district. //TODO: basic description edit
DIALOG | P_NAME  | Alright. I'll go take care of it!
DIALOG | Cornrow | I like your spirit, kid. You're goin' places.
NOTIFY | Got Granny's Medicine.
ITEM   | Granny's Medicine | 1
QUEST  | comServ = 6

MONEY_DONT
DIALOG | Cornrow | Well, well, well, Juicebox! Look who it is, our new friend " + P_NAME_S + ". What's happenin', friend? You got our money from ol' Morty?
DIALOG | P_NAME  | Um, sort of. See, he gave me the money but I kind of accidentally spent some of it. Maybe most of it. B-but I'll get it back, I promise! I didn't mean to, I swear!
DIALOG | Cornrow | Well that's not good, " + P_NAME_S + ". Not good at all.
DIALOG | Juicebox | Not good at all.
DIALOG | Cornrow | But I'm glad you've taken it upon yourself to pay back what you've thoughtlessly squandered. It's important you get it back to us soon, " + P_NAME_S + ", 'cuz we were gonna start a fund to teach impoverished children to read their letters with it.
DIALOG | P_NAME  | Y-yes, Mr. Cornrow, sir! I'll be back real soon! I promise!
DIALOG | Cornrow | Now that's real good of you, " + P_NAME_S + ".
DIALOG | Juicebox | Real good of you.

STATE6
DIALOG | P_NAME  | Hey um, Mr. Cornrow? Can you tell me how to find your granny again?
DIALOG | Cornrow | Heh heh, you bet, kid. She's normally at church with that numnutz Giuseppe. And make sure she doesn't know you've got her medicine, otherwise she'll get all fussy.
DIALOG | P_NAME  | Yeah, I understand. I'll be right back!
";
