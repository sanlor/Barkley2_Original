/// event script for o_test1
/*
Gutter Hound's Quest
Located in Tir na Nog outside the Rebel Base
Available at Time 2
\art\graphics\NPCs\BadassOlMan.gif
\art\graphics\NPCs\RebelBase\WalkOldMan.gif

ghoundQuest = 0 is Gutter Hound hasn't been spoken to.
ghoundQuest = 1 is Gutter Hound's quest has been rejected.
ghoundQuest = 2 is Gutter Hound's quest has been failed.
ghoundQuest = 3 is Gutter Hound's quest has been completed but the player hasn't spoken to Gutter Hound yet.
ghoundQuest = 4 is Gutter Hound's quest is 100% completed.



if scr_event_obj_init() { // Object initiation

// initiate any local Object variables here

}

else {// all Event behaviour

if scr_event_init() {// on Event activation (note: local variables will be discarded when event ends)

// initiate any local Event variables here
scr_init_param(); // reset dialogue parameters
title_text = "Gutter Hound";
//portrait = -1; // temporary
portrait = s_port_ghound // update when portrait is added

}

if scr_state_update() { // check conditions, update event State

// set object State conditions (like 'priority' tabs)
state = 0;// 0 state (inactive)

if scr_quest_get_state("ghoundQuest") = 2 state = 7; //if failed, gutter hound disappears
if scr_time_get() = 2 {
if scr_quest_get_state("ghoundQuest") = 0 state = 1; // First time talking to Gutter Hound, time must be 2
if scr_quest_get_state("ghoundQuest") = 1 state = 3;} // ghoundQuest = 1 is Gutter Hound's quest has been rejected.
if scr_time_get() = 3 && scr_quest_get_state("ghoundQuest") < 2 state = 4;
if scr_quest_get_state("ghoundQuest") = 3 state = 5; // ghoundQuest = 3 is Gutter Hound's quest has been completed but the player hasn't spoken to Gutter Hound yet
if scr_quest_get_state("ghoundQuest") = 4 state = 6; // ghoundQuest = 4 is Gutter Hound's quest is 100% completed.



scr_event_activate();// activate Event
}

if scr_advance() and scr_state_execute() {// perform the next Action on execution

// switch case for defined States (like 'priority' tabs)
switch state {
     
case 1:// FIRST TIME TALKING TO GUTTER HOUND, TIME = 2
switch action { 

case 0: 
dialogue_text = "Look at these poseurs. /'Rebels/'. Sittin' on their bumpers all day waitin' for someone to fix all their problems. Well that ain't gonna be me! I'm here to party! Where's that purple stuff at? Ol' Gutter Hound's gotta wet his whistle! Oooh boy, I'm gonna get cuffed up tonight!";
scr_act_dialogue();
break; 
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Hey, what's your problem with the rebels?";
scr_act_dialogue();
break;
case 2:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "I got two problems with 'em. First, they don't know how to party. That's the big one. Second, they don't do diddly. I hiked all the way through the sewers by myself to see what kind of shennanigans were going down. And what do I see when I get here? /'We've got this chair that'll scramble your brains,/' and all that egghead bunk. Waste of my time.";
scr_act_dialogue();
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Wait, you made it all the way through the sewers on your own?";
scr_act_dialogue();
break;
case 4:
portrait = s_port_ghound
title_text = "Gutter Hound";
dialogue_text = "Lemme tell you somethin', kid - I eat Duergars like I eat grapes: by the cluster. 'sides, you must've made it too if you're here at the rebel base. You got guts, kid. I like that. Hey, you got any of that purple stuff?";
scr_act_dialogue();
break;
case 5:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Purple stuff? What's that?";
scr_act_dialogue();
break;
case 6:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Ahhhh, you're straight off the vine my friend. Purple stuff - it's grape juice, Mother Nature's sweet, sweet gift to dwarfs. It's how the REAL rebels roll back in the BC - Brain City. Listen kid, I got a plan. If I'm gonna get cuffed up tonight, I'm gonna need some scratch. Moolah, you follow? And you know where they keep it?";
scr_act_dialogue();
break;
case 7:// CAMERA PANNING GOES HERE
// screen pans 240 pixels left to the bank
action += 1;
break;
case 8:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "That's Cuchulainn's safe house, where the Duergars keep their loot. I'm thinking we bust the place up, run off with the dough and split it fifty-fifty. And THEN we hit that purple stuff. Heh heh, what do you say kid?";
scr_act_dialogue();
break;
case 9: // CAMERA PANNING GOES HERE
// screen pans 240 pixels right, back to hoopz
action += 1;
break;
case 10: // CAMERA PANNING GOES HERE
portrait = -1
title_text = "Rob the bank with Gutter Hound?"
choice_text = "Sure, I'm in.|No way!"
scr_act_choice();
break;
case 11:
portrait = s_port_hoopz;
title_text = "X114JAM9";
if choice = 0 dialogue_text = "Well, I don't know about stealing... but if it's from the Duergars, I guess it's okay.";
else dialogue_text = "No way! I'm not gonna help you rob a bank! Are you out of your mind? Do you even have a plan? What if we get caught? What if... what if...";
scr_act_dialogue();
break;
case 12:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
if choice = 0 dialogue_text = "Awww yeah, that's what I like to hear. Let's do this!"
else dialogue_text = "Awww, c'mon man. You're no fun. It's just a little theft, a little rough housin'. Who cares if a couple Duergars get smashed up in the process? It's all in good fun. Just a little Robin Hood'n around.";
scr_act_dialogue();
break;
case 13:
portrait = s_port_hoopz;
title_text = "X114JAM9";
if choice = 0 {
action = 0;
// INVOKE scr_GHoundQuest.txt
//state = 2;} // GO TO QUEST STATE AND/OR INVOKE scr_GHoundQuest.txt
}
else {dialogue_text = "No. No way, I'm sorry, but theft is wrong and I'm not going to have anything to do with it. You need to get off the grape juice and take a bath.";
scr_act_dialogue();}
break;
case 14:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "I thought you might be up for a good time, but you're a party pooper just like these rebels, kid. Can't NOBODY in this kennel run with the Hound! Awooooo!";
scr_act_dialogue();
break;
case 15:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "You're out of your gourd... you're out of your dippin' gourd.";
scr_act_dialogue();
break;
case 16:
scr_quest_set_state("ghoundQuest",1);
scr_event_end();
break;
}
break;


/*case 2:
switch action {

case 0:
//Gutter Hound does the throw back bottle and stand up animation
action += 1
break;
case 1:
//Screen blacks out.
//At this point the regular Gutter Hound object should turn invisible until the quest is over
action += 1
break;
case 2:
//X114JAM9 and Gutter Hound are standing in the alley next to the bank.
//X114JAM9 is at 391,498 facing up-left
//Gutter Hound is at 354,496 facing up 
action += 1
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Okay, so what's the plan? How are we going to pull this off?";
scr_act_dialogue();
break;
case 4:
portrait = s_port_ghound
title_text = "Gutter Hound";
dialogue_text = "Heh, I got it all worked out. I'm gonna go in there and bust some ass, crack some skulls, ya know what I'm sayin'? Then I'll come out with the loot and we'll make a break for it back to the rebel hideout.";
scr_act_dialogue();
break;
case 5:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Wait, that's the plan? You're going to go in there and beat people up?";
scr_act_dialogue();
break;
case 6:
portrait = s_port_ghound
title_text = "Gutter Hound";
dialogue_text = "Hell yeah! Works like a charm! Nobody messes with the Hound! Now what I need you to do is wait outside, keep the place locked down, make sure nobody gets in or out. You read me? Then when we're runnin', I need you to guard my tail, keep the pigs off my ass. You got that?";
scr_act_dialogue();
break;
case 7:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Uhh, Gutter Hound, I think I'm having some second thoughts about this. First, this doesn't really sound like a good plan. I mean, you're just going to go in there and beat money out of Duergars? Is that really safe? And what if this has consequences? What if Duergars start cracking down on innocent people because of us? I think maybe I spoke too soon back at the hideout.";
scr_act_dialogue();
break;
case 8:
//Gutter Hound runs into the building up to 359,461 and disappears
// there are a bunch of punching and grunting sound effects
action += 1
break;
case 9:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Uhh, what do I do??";
scr_act_dialogue();
break;
case 10:
// Gutter Hound reappears facing down at 359,461 immediately runs out of the building to 359,481
action += 1
break;
case 11:
portrait = s_port_ghound
title_text = "Gutter Hound";
dialogue_text = "Run, kid! Get outta here! Get back to the hideout! Run!";
scr_act_dialogue();
break;
case 12:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "What's going on!? Gutter Hound!";
scr_act_dialogue();
break;
case 13:
portrait = s_port_ghound
title_text = "Gutter Hound";
dialogue_text = "I'll see you back at the base! Get outta here kid!";
scr_act_dialogue();
break;
case 14:
//Gutter Hound runs down to 474,740 and disappears
action += 1
break;
case 15:
//Two Duergars are created at 337,474 and 377,478 run out the door and run near X114JAM9 (forget about the running -bort)
action += 1
break;
case 16:
//Will continue the actual interaction portion of the quest in another document
action += 1
break;
case 17:
action = 0;
state = 1;
break;
}
break;

case 3: // ghoundQuest = 1

switch action {

case 0:
dialogue_text = "What the hell do you want, chump? I'm done with you. We've got nothin' to talk about. Unless you want to talk about partyin' up and paintin' the town grape.";
scr_act_dialogue();
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Well...";
scr_act_dialogue();
break;
case 2:
portrait = -1
title_text = "Help Gutter Hound rob the bank?";
choice_text = "Yeah, I guess so...|No way!";
scr_act_choice();
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
if choice = 0 dialogue_text = "Well... I don't know about partying... I'm more of a vidcons kind of guy... but I was thinking maybe we could talk about breaking into that Duergar bank... the one you were talking about earlier?";
else dialogue_text = "No way, I'm not a crook. I don't care that it's the Duergars or Cuchulainn or whoever, I'm not going to steal from anyone. Stealing is wrong..."
scr_act_dialogue();
break;
case 4:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
if choice = 0 dialogue_text = "Ha HA! I knew you'd be back, kid! Lemme tell you something: you shouldn't feel bad about taking from Duergars. Those mother hubbards would slit your throat in an instant if they could make a dime off it. They take from the dwarfs every day. Look at this place. Look at Tir na Nog. I'm glad as hell I got out of here when I could 'cuz this is a pig sty and who do we have to thank for that? Cuchulainn and the Duergars. Well I say we take back, get off our asses unlike these so-called rebels and show the Duergars what's what.";
else dialogue_text = "Man, you're as lame as they come. Forget it, kid. I don't want nothin' to do with you. /'Stealing is wrong./' Wah wah. Learn to live a little.";
scr_act_dialogue();
break;
case 5:
portrait = s_port_hoopz;
title_text = "X114JAM9";
if choice = 1 scr_event_end();
else {dialogue_text = "Yeah, maybe you're right! So what's the plan?";
scr_act_dialogue();}
break;
case 6:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "The plan? Heh heh...";
scr_act_dialogue();
break;
case 7:
action = 0;
state = 2;
break;
}
break;

case 4: // TIME 3, QUEST NOT DONE

switch action {

case 0:
dialogue_text = "Whatever's goin' on down there, I had nothin' to do with it.";
scr_act_dialogue();
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Huh? What do you mean?";
scr_act_dialogue();
break;
case 2:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Haha, nothin' kid. Take it easy.";
scr_act_dialogue();
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Yeah... (what a weirdo).";
scr_act_dialogue();
break;
case 4:
scr_event_end();
break;
}
break;

case 5: // QUEST COMPLETE ghoundQuest = 3

switch action {

case 0:
dialogue_text = "Ha ha! My man X1! Good work covering my ass back there! Hoooo boy, that was one hell of a chase!";
scr_act_dialogue();
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Yeah, for me! What the hell is wrong with you, leaving me behind like that! What even was that? You just... left! I mean, what was that supposed to be? What did you even do in there?";
scr_act_dialogue();
break;
case 2:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Hahaha, kid, relax. It's all good. Look at this loot. There are enough neo-shekels in here to last us a lifetime. We hit it big, kid. Purp's on me tonight.";
scr_act_dialogue();
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Ugh... Gutter Hound, you... ugh... if I had been caught, who knows what could've happened!";
scr_act_dialogue();
break;
case 4:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Well you weren't, so chill out! Take things less seriously! Here, take your share! Oh, and take this too!";
scr_act_dialogue();
break;
case 5:
portrait = -1
title_text = "";
dialogue_text = "Get 4000 neo-shekels!\Get Shotgun!";
scr_money_change(4000);
global.have_sg = 1;
scr_act_dialogue();
break;
case 6:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "That's a lot of walkin' around money, kid. Or party money. Whatever you please, heh heh.";
scr_act_dialogue();
break;
case 7:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Or vidcon money...";
scr_act_dialogue();
break;
case 8:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Haha, I knew you'd come around kid. You're not a bad partner when you chill out, y'know? I mean, you did good back there. Maybe we'll work together again in the future - not anytime soon, I've got some grape juice to guzzle - but maybe sometime in the future, huh?";
scr_act_dialogue();
break;
case 9:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "I don't know about that...";
scr_act_dialogue();
break;
case 10:
scr_quest_set_state("ghoundQuest",4);
scr_event_end();
break;
}
break;

case 6: // QUEST COMPLETE ghoundQuest = 4

switch action {

case 0:
dialogue_text = "Aww man, this is the life! We're livin' like kings! I don't think I can stomach any more of this purple stuff! Whoooooo! So what are you up to X1?";
scr_act_dialogue();
break;
case 1:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Well, I'm trying to get out of Tir na Nog. I'm looking for the Cyberdwarf.";
scr_act_dialogue();
break;
case 2:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Listen, whatever these rebel chumps want you to do? Don't do it. These idiots can barely tie their own shoes, let alone get you out of town. Here's what I think: all these pipes in the sewers? They gotta go somewhere. So why not check 'em out, see if they take you anywhere?";
scr_act_dialogue();
break;
case 3:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "You've been out of Tir na Nog before, right?";
scr_act_dialogue();
break;
case 4:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "I wake up somewhere new every day.";
scr_act_dialogue();
break;
case 5:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Do you know anything about the Cyberdwarf?";
scr_act_dialogue();
break;
case 6:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "All's I know is that he's the leader of these L.O.N.G.I.N.U.S. guys. Hope he's got his head on straighter than these bucketheads 'cuz if he doesn't, dwarfs don't stand a chance. I mean these guys. I can take care of myself.";
scr_act_dialogue();
break;
case 7:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Well, thanks for the tip Gutter Hound. And... sorry for getting mad at you earlier. But I think you should be a little less reckless in the future.";
scr_act_dialogue();
break;
case 8:
portrait = s_port_ghound // update when portrait is added
title_text = "Gutter Hound";
dialogue_text = "Don't sweat it, kid. I'll be seein' you.";
scr_act_dialogue();
break;
case 9:
scr_event_end();
break;
}
break;

case 7: // 

switch action {

case 0:
action += 1;
break;
case 1:
scr_event_end();
break;
}
break;

}
    
}}

