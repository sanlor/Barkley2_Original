/*

Not sure what the difference between cornrow01 and cornrow02 is.

CORNROW!!!!!!!!!!

Community Service

This entire post is for the Community Service quest. Here are the list of quest variables in the quest.

concessionVal - this number is important for the main Tir na Nog governor quest. You have a set amount of concession points, a value you can use to bargain for things during the quest. If you do good quests, it increases. If you do bad quests, it decreases.

comServ - determines your current position in the Community Service quest
0 = not active
1 = rejected
2 = need to break into house
3 = break-in complete
4 = need to rob store
5 = robbery complete
6 = need to kill vivian
7 = vivian dead
8 = mission complete

This quest requires you to break into a house - the house doesn't exist yet, but inside there's no real dialogue and currently NOT lockpicking minigame. I can write up the dialogue when we need it.

CORNROW!!!!!!!!!!
*/

/*if scr_event_obj_init() { // Object initiation

// initiate any local Object variables here
// if scr_time_get() > 2 // make cornrow disappear
// if scr_quest_get_state("comServ") > 6 // cornrow's sprite is replaced with a note
}

else {// all Event behaviour

if scr_event_init() {// on Event activation (note: local variables will be discarded when event ends)

// initiate any local Event variables here
scr_init_param(); // reset dialogue parameters

}

if scr_state_update() { // check conditions, update event State

// set object State conditions (like 'priority' tabs)
state = 0;// 0 state (inactive)

if scr_quest_get_state("comServ") > 0 state = scr_quest_get_state("comServ");
else state = 9; // top priority
//state = have_not_talked;
//else state = 2;


scr_event_activate();// activate Event
}

if scr_advance() and scr_state_execute() {// perform the next Action on execution

// switch case for defined States (like 'priority' tabs)
switch state {
    
case 8: // cornrow is a note, you've already read it
switch action{
case 0:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Here's Mr. Cornrow's thank you letter. Helping the community's tough, but it feels good and it's definitely rewarding. I learned a lot working for Mr. Cornrow and Mr. Juicebox. Wherever you guys are, thanks for showing me the ropes!";
scr_act_dialogue(NULL);
break;
case 1:
scr_event_end();
break;
}
break;

case 7: // cornrow has transmuted into note form. you haven't yet spoken to him.
switch action{
case 0:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Huh? Looks like Cornrow and Juicebox are gone and there's a note here. I wonder what it says...";
scr_act_dialogue(NULL);
break;
case 1:
dialogue_text = "X1, this is an emergency. We've been captured by our enemies and need you to break us out. I need to keep this short 'cuz they're getting suspicious. I've left my gun for you underneath a nearby loose brick. Take it and break us out of here - for the love of Clispaeth, save us! I can hear them torturing Juicebox! Oh Clispaeth, he's screaming! His screams are terrible. Please save us! I'm sorry about all those terrible things we made you do! Please help us, I'm begg-";
scr_act_dialogue(NULL);
break;
case 2:
dialogue_text = "Hmm? This brick feels pretty loose. Whoa! It's Mr. Cornrow's gun!";
scr_act_dialogue(NULL);
break;
case 3:
portrait = -1;
title_text = "";
dialogue_text = "Get Minigun!";
scr_act_dialogue(NULL);
break;
case 4:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "And who says hard work doesn't pay off! I had to get that fruit basket, get Juicebox's change and give granny her vitamins. I worked up a sweat running all over town and I'm tired out, but after a hard day's work, I finally got my dues! Sure it was tough, but in the end? I think it was worth it! And hey, I even got to help the community in the process. I consider this mission accomplished!";
scr_act_dialogue(NULL);
break;
case 5:
//[A really gaudy QUEST COMPLETED marquee scrolls across the screen and a goofy victory tune plays]
global.have_mg = 1;
scr_time_change(1);
scr_quest_set_state("comServ",8);
scr_quest_set_state("concessionVal",scr_quest_get_state("concessionVal")+20);
scr_event_end();
}
break;

case 6: // hoopz is a clumsy assassin and cannot find granny's home
switch action{
case 0:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Hey um, Mr. Cornrow? Can you tell me how to find your granny again?";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Heh heh, you bet, kid. She's up near Giuseppe the preacher's courtyard, which is right off the main shopping district. And make sure she doesn't know you've got her medicine, otherwise she'll get all fussy.";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Yeah, I understand. I'll be right back!";
scr_act_dialogue(NULL);
break;
case 3:
scr_event_end();
}
break;

case 5: // X1114JAM9 is contracted for octogenaricide
switch action{
case 0:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Look who it is, Juicebox. It's our new best buddy X1. Did you get our change back from ol' Morty?";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Sure did Mr. Cornrow! He said he owed you even more than the number you gave me - he gave me 500 whole neo-shekels!";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Whoooo boy! Give it here, kid! And gimme back my gun!";
scr_act_dialogue(NULL);
break;
case 3:
portrait = -1
title_text = "";
dialogue_text = "Cornrow takes the 500 neo-shekels and his gun back.";
scr_act_dialogue(NULL);
break;
case 4:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "But uh, keep a little for yourself.";
scr_act_dialogue(NULL);
break;
case 5:
portrait = -1
title_text = "";
dialogue_text = "Get 100 neo-shekels!";
scr_money_change(-400)
scr_item_take("Cornrow's Gun",1)
scr_act_dialogue(NULL);
break;
case 6:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Wow, thanks Mr. Cornrow!";
scr_act_dialogue(NULL);
break;
case 7:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Hey, no problem kid. I'm always happy to do favors for people in need. Right Juicebox?";
scr_act_dialogue(NULL);
break;
case 8:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "Yep.";
scr_act_dialogue(NULL);
break;
case 9:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Now lemme tell ya something, kid - people talk about all those Dwarf Zones out there, places where dwarfs live free from Cuchulainn? Forget 'em. They're not real. Do you really think people can get away from Cuchulainn on his own ziggurat? Ain't nothin' outside Tir na Nog. No way. And the Cyberdwarf? Yeah, people talk about him like he's the leader of L.O.N.G.I.N.U.S. or whatever, but I say he's a fairy tale. Ain't no Cyberdwarf and ain't nobody fighting our fights for us.";
scr_act_dialogue(NULL);
break;
case 10:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "N-no Cyberdwarf...?";
scr_act_dialogue(NULL);
break;
case 11:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "I take care of my kin, kid.";
scr_act_dialogue(NULL);
break;
case 12:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "He takes care of his kin.";
scr_act_dialogue(NULL);
break;
case 13:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Now here's the thing - just make sure granny doesn't see you do it. Do it from behind or somethin'. She's an ornery ol' coot and she doesn't like to take her medicine, even if it's what's best for her. At this point, it's really up to us to take care of her, y'know?";
scr_act_dialogue(NULL);
break;
case 14:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "I understand, Mr. Cornrow. I'll make sure granny gets her medicine. Do you know where she is?";
scr_act_dialogue(NULL);
break;
case 15:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "She's all over Tir na Nog, but I know she likes Giuseppe's sermons. He's in that little courtyard right off of the main shopping district, just south of the poor quarters.";
scr_act_dialogue(NULL);
break;
case 16:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Alright. I'll go take care of it!";
scr_act_dialogue(NULL);
break;
case 17:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "I like your spirit, kid. You're goin' places.";
scr_act_dialogue(NULL);
break;
case 18:
portrait = -1;
title_text = "";
dialogue_text = "Got Granny's Medicine."
scr_item_give("Granny's Medicine",1)
scr_quest_set_state("comServ",6)
scr_act_dialogue(NULL);
break;
case 19:
scr_event_end();
break;

}
break;

case 4: // X114JAM9 cannot find candy
switch action{
case 0:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Hey Mr. Cornrow, can you tell me how to get to the candy shop again?";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "You got it, kid. It's up in the poor quarters, northeast Tir na Nog - it's the big shop building on the left side, right next to granny's place. You can't miss it!";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Thanks, Mr. Cornrow. I'll be right back!";
scr_act_dialogue(NULL);
break;
case 3:
scr_event_end();
break;
}
break;

case 3: // X114JAM9 returns with fruit, gets paid, gets contract to rob candy store
switch action{
case 0:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "Hi Mr. Cornrow, hi Mr. Juicebox. I've got your fruit.";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "X1, my man! Look at that basket of fruit you got there! Ooooooh baby, look at those strawberries, Juicebox. We're eatin' good tonight. Good job, kid. Here's a little change for yer pocket.";
scr_act_dialogue(NULL);
break;
case 2:
portrait = -1
title_text = "";
dialogue_text = "Gain 100 neo-shekels!";
scr_money_change(100);
scr_act_dialogue(NULL);
break;
case 3:
scr_money_change(-100);
scr_item_take("Fruit Basket",1)
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Wow, thanks Mr. Cornrow!";
scr_act_dialogue(NULL);
break;
case 4:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Here's a little tip - do NOT go in the sewers. Ain't nothin' in there but Bainshees, Duergars, rebels and trouble. Lemme tell ya, kid, don't get involved with none of that crap. Out here, the only guy you gotta worry about is number one - you. Ain't nothin' none of us can do about Cuchulainn so don't even bother. 'sides, if what I hear is true, we're all gettin' some sort of prize soon. And ESPECIALLY stay away from those uppity sons of bitches ('scuse the French) Ooze and Slag. I don't know what crawled up their butts but they strut around here acting like they own the place. I don't know who they are or where they came from but those guys are dangerous.";
scr_act_dialogue(NULL);
break;
case 5:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "Wow, okay! I'll be sure to stay away from all those guys!";
scr_act_dialogue(NULL);
break;
case 6:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Yeah, yeah! That's lesson number one from the streets of Tir na Nog. Ya got it?";
scr_act_dialogue(NULL);
break;
case 7:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "Stay away from the sewers, Cuchulainn, Duergars, rebels, Ooze, Slag and everyone else. Got it!!";
scr_act_dialogue(NULL);
break;
case 8:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "You're catchin' on, kid. Now hey, I got somethin' else for ya to do. This one's a little tricky. My nephew Juicebox, he's a good kid but he just don't get math.";
scr_act_dialogue(NULL);
break;
case 9:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "I just don't get math.";
scr_act_dialogue(NULL);
break;
case 10:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "I gave him some money to get candy at Morty's candy shop. Well Juicebox gives ol' Morty a tenner for a dime candy and gets one neo-shekel back. Poor Juicebox, he didn't know he got the wrong change.";
scr_act_dialogue(NULL);
break;
case 11:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "I didn't know.";
scr_act_dialogue(NULL);
break;
case 12:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "So I need you to go to Morty's candy shop and get that change back. Think you can do that?";
scr_act_dialogue(NULL);
break;
case 13:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "Sure!";
scr_act_dialogue(NULL);
break;
case 14:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Now that's what I'm talkin' about. Okay, now I'm gonna give you my gun - just show it to Morty to let him know you're there representin' me. Otherwise he'll think you're just horsin' around. His shop is next to granny's place, you must've seen it when you were there earlier. I'd do it myself but I've gotta teach Juicebox his numbers.";
scr_act_dialogue(NULL);
break;
case 15:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "Alright, Mr. Cornrow! I'll be back in no time!";
scr_act_dialogue(NULL);
break;
case 16:
portrait = -1; 
title_text = "";
dialogue_text = "Got Cornrow's gun!";
scr_act_dialogue(NULL);
break;
case 17:
scr_item_give("Cornrow's Gun",1);
scr_quest_set_state("comServ",4);
scr_event_end();
break;
}
break;

case 2: // X114JAM9 is lost... again............
switch action{
case 0:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Well look who's back, Juicebox. It's our boy wonder, X1. What's going on, kid?";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_hoopz; 
title_text = "X114JAM9";
dialogue_text = "I forgot where your granny lives. Can I get directions again?";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "You bet, kid. Granny lives in the poor quarters, the northeast part of Tir na Nog just before the sewers. Her house is the furthest on the left - the old blue shack with the shingles falling off. You can't miss it, it's right next to ol' Morty's candy shop.";
scr_act_dialogue(NULL);
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Okay, I'll be right back Mr. Cornrow!";
scr_act_dialogue(NULL);
break;
case 4:
scr_event_end();
break;

}
break;
  
case 1: // X114JAM9 succumbs to the allure of cold hard cash and returns to speak with corn&juice
switch action{
case 0:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Well would you look at that, Juicebox. The kid's back. What'd I tell ya? I told you he'd come around sooner or later.";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "That's what you said, Cornrow.";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Well what can I do for ya, kid? Have you thought about that proposition I gave you earlier? Me and Juicebox show you the ropes, teach you a few things about Tir na Nog and get you a little pocket change in return for running a few errands for us. That's reasonable, right?";
scr_act_dialogue(NULL);
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
choice_text = "Okay, that sounds good to me!|No thanks, Mr. Cornrow.";
scr_act_choice();
break;

// watch out!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

case 4:
title_text = "X114JAM9";
if choice = 0 dialogue_text = "Wow! You'd do that for me?";
else dialogue_text = "No thanks, Mr. Cornrow. I mean, I appreciate it and everything but I've got a lot of stuff going on right now.";
scr_act_dialogue(NULL);
break;
case 5:
portrait = s_port_cornrow;
title_text = "Cornrow";
if choice = 0 dialogue_text = "See, Juicebox? What'd I tell ya'? I said 'that looks like a real bright kid over there!' And whattaya know? I was right!";
else dialogue_text = "You're breakin' my heart, kid.";
scr_act_dialogue(NULL);
break;
case 6:
portrait = s_port_juicebox;
title_text = "Juicebox";
if choice = 0 dialogue_text = "You were right, Cornrow.";
else dialogue_text = "You're breakin' his heart.";
scr_act_dialogue(NULL);
break;
case 7:
portrait = s_port_cornrow;
title_text = "Cornrow";
if choice = 0 dialogue_text = "Now listen up, kid. This is real simple. Me and Juicebox were gonna distribute a buncha fruits to malnourished children but I left my fruit basket at my granny's house. Alls ya gotta do is head over to granny's house and pick up the big ol' basket of fruit, real big, like one of them, uh, whattaya call em - cornucopias? - and bring it back. That's it.";
else dialogue_text = " ...but if you gotta lot on your plate, you gotta lot on your plate. Just don't forget how dangerous it gets out here. Cuchulainn, Duergars, Bainshees, rebels... and worse.";
scr_act_dialogue(NULL);
break;
case 8:
portrait = s_port_juicebox;
title_text = "Juicebox";
if choice = 0 { 
dialogue_text = "That's it.";
scr_act_dialogue(NULL);}
else scr_event_end();
break;
case 9:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "I'd do it myself but I'm uh, busy teaching impoverished children how to read.";
scr_act_dialogue(NULL);
break;
case 10:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "Uncle Cornrow's teachin' me how to do letters.";
scr_act_dialogue(NULL);
break;
case 11:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Oh, and one more thing - I mighta' left it in her padlocked safe. Aaaaaand I forgot the safe combination. I know, I know, I'm a klutz, but what can I say? You're a clever kid, you'll figure out how to get it.";
scr_act_dialogue(NULL);
break;
case 12:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "This doesn't sound too hard. Where does granny live?";
scr_act_dialogue(NULL);
break;
case 13:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Look at that - look at that foresight, Juicebox. This kid's a real go-getter. She lives up in the poor quarter near the sewer entrance, furthest house on the left, a little blue shack. Real easy to find.";
scr_act_dialogue(NULL);
break;
case 14:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Okay, Mr. Cornrow. I'll go get the fruit. Good luck with the reading lessons, Mr. Juicebox!";
scr_act_dialogue(NULL);
break;
case 15:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "Uh... thanks kid.";
scr_act_dialogue(NULL);
break;
case 16:
scr_quest_set_state("comServ", 2);
scr_event_end();
break;




}
break;
 
case 9: // first meeting
switch action {

case 0:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Hey! Hey you! Kid!";
scr_act_dialogue(NULL);
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "M-me?!";
scr_act_dialogue(NULL);
break;
case 2:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Yeah you! Walkin' around like you got your shoelaces tied together. You know where you are, kid? These ain't the 'burbs, this is the real deal. You're walkin' the streets of Tir na Nog.";
scr_act_dialogue(NULL);
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Oh... I'm kinda new here.";
scr_act_dialogue(NULL);
break;
case 4:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Ha! You're tellin' me, kid!!";
scr_act_dialogue(NULL);
break;
case 5:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "You're tellin' him!";
scr_act_dialogue(NULL);
break;
case 6:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Lemme tell ya', the alleys of Tir na Nog aren't a good place for kids like you to wander around alone. You never know what kinda creeps are out here. Duergars, Bainshees, all kindsa goons lookin' to rob ya blind. Ha! I bet you don't even got a dime on ya!";
scr_act_dialogue(NULL);
break;
case 7:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Well, Mr. Wilmer only gave me a little money...";
scr_act_dialogue(NULL);
break;
case 8:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Now THAT is a shame, kid. That's a DAMN shame. Ya know, you're lucky you ran into me and my, uh, nephew Juicebox. See, me and Juicebox, we're like the guardian angels of Tir na Nog - we're the good guys, y'know? Nothin' makes us feel better than seein' a new guy like you land on his feet out here. Now me and Juicebox, we got a proposition for ya -";
scr_act_dialogue(NULL);
break;
case 9:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "A proposition.";
scr_act_dialogue(NULL);
break;
case 10:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "That's right, a proposition. What do you say me and Juicebox show you the ropes around here, fill you in on what's what on the streets and make a little scratch in the process, eh? You don't gotta do nothin' but run a few errands for us. How's that sound, kid?";
scr_act_dialogue(NULL);
break;
case 11:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Well...";
scr_act_dialogue(NULL);
break;
case 12:
title_text = "Reply?";
choice_text = "Okay, that sounds good to me!|No, thank you.";
scr_act_choice();
break;
case 13:
title_text = "X114JAM9";
if choice = 0 dialogue_text = "Wow! You'd do that for me?";
else dialogue_text = "Um, well I appreciate the offer Mr. Cornrow, but I'm a little busy right now.";
scr_act_dialogue(NULL);
break;
case 14:
portrait = s_port_cornrow;
title_text = "Cornrow";
if choice = 0 dialogue_text = "See, Juicebox? What'd I tell ya'? I said 'that looks like a real bright kid over there!' And whattaya know? I was right!";
else dialogue_text = "Awww, what a shame. Alls I wanted you to do was get the basket of fruit I was going to distribute to starving kids. Ahh well. Looks like those kids are going hungry tonight, Juicebox. What a shame.";
scr_act_dialogue(NULL);
break;
case 15:
portrait = s_port_juicebox;
title_text = "Juicebox";
if choice = 0 dialogue_text = "You were right, Cornrow.";
else dialogue_text = "Shame.";
scr_act_dialogue(NULL);
break;
case 16:
portrait = s_port_cornrow;
title_text = "Cornrow";
if choice = 0 dialogue_text = "Now listen up, kid. This is real simple. Me and Juicebox were gonna distribute a buncha fruits to malnourished children but I left my fruit basket at my granny's house. Alls ya gotta do is head over to granny's house and pick up the big ol' basket of fruit, real big, like one of them, uh, whattaya call em - cornucopias? - and bring it back. That's it.";
else dialogue_text = "Well lemme know if you ever change your mind, kid. It's easy to get lost out here in the streets of Tir na Nog. Or worse.";
scr_act_dialogue(NULL);
break;
case 17:
portrait = s_port_juicebox;
title_text = "Juicebox";
if choice = 0 { 
dialogue_text = "That's it.";
scr_act_dialogue(NULL);}
else {
scr_quest_set_state("comServ",1);
scr_event_end();}
break;
case 18:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "I'd do it myself but I'm uh, busy teaching impoverished children how to read.";
scr_act_dialogue(NULL);
break;
case 19:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "Uncle Cornrow's teachin' me how to do letters.";
scr_act_dialogue(NULL);
break;
case 20:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Oh, and one more thing - I mighta' left it in her padlocked safe. Aaaaaand I forgot the safe combination. I know, I know, I'm a klutz, but what can I say? You're a clever kid, you'll figure out how to get it.";
scr_act_dialogue(NULL);
break;
case 21:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "This doesn't sound too hard. Where does granny live?";
scr_act_dialogue(NULL);
break;
case 22:
portrait = s_port_cornrow;
title_text = "Cornrow";
dialogue_text = "Look at that - look at that foresight, Juicebox. This kid's a real go-getter. She lives up in the poor quarter near the sewer entrance, furthest house on the left, a little blue shack. Real easy to find.";
scr_act_dialogue(NULL);
break;
case 23:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Okay, Mr. Cornrow. I'll go get the fruit. Good luck with the reading lessons, Mr. Juicebox!";
scr_act_dialogue(NULL);
break;
case 24:
portrait = s_port_juicebox;
title_text = "Juicebox";
dialogue_text = "Uh... thanks kid.";
scr_act_dialogue(NULL);
break;
case 25:
scr_quest_set_state("comServ", 2);
scr_event_end();
break;
}
break;
}
    
}}*/
