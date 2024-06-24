/*
this should be called at the end of Gutter Hound's event script
391,498 is where hoopz teleports, facing up
on failure, he teleports to 186,127 preferably facing down-and-to-the-left


if scr_event_obj_init() { // Object initiation

// initiate any local Object variables here
scr_object_var_set("gutterfail",0)
scr_object_var_set("choice8","Left|Up|Right")
scr_object_var_set("speed","1.45")
}

else {// all Event behaviour

if scr_event_init() {// on Event activation (note: local variables will be discarded when event ends)

// initiate any local Event variables here
scr_init_param(); // reset dialogue parameters

}

if scr_state_update() { // check conditions, update event State

// set object State conditions (like 'priority' tabs)
state = 0;// 0 state (inactive)
state = 12; // if script is to begin just after the 'yes' choice is made in Gutter Hound's Quest
//state = 1 // if script begins at the commencement of the minigame
scr_event_activate();// activate Event
}

if scr_advance() and scr_state_execute() {// perform the next Action on execution

// switch case for defined States (like 'priority' tabs)
switch state {
    
/*MAIN ACTION
// Point 1: 391,498
case 1:  
switch action{
case 0:
scr_time_change(1);
// Hoopz runs to Point 2: 434,648 and stops
// scr_act_path(434,648,scr_object_var_get("speed"));
action += 0;
break;
case 1:
action = 0;
state = 2;
break;
}
break;


// Point 2: 434,648
case 2:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Right|Down";
scr_act_choice();
break;
case 1:
if choice = 0 {
//Hoopz runs to Dead End 2: 652,607
//scr_act_path(652,607,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1)
action += 1;}
else {
//Hoopz runs to Point 3: 531,860
//scr_act_path(531,860,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Cluck it, it's a dead end! They're gaining on me...";
scr_act_dialogue();}
else {
action = 0;
state = 3;}
break;
case 3:
//Hoopz runs back to Point 2: 434,648
//scr_act_path(434,648,scr_object_var_get("speed"));
action += 1;
break;
case 4:
//Hoopz runs down to Point 3: 531,860
//scr_act_path(531,860,scr_object_var_get("speed"));
action += 1;
break;
case 5:
action = 0;
state = 3;
break;
}
break;


// Point 3: 531,860
case 3:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Right|Down";
scr_act_choice();
break;
case 1:
if choice = 0 {
//Hoopz runs to Duergar 3: 756,796
//scr_act_path(756,796,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
action += 1;}
else {
//Hoopz runs to Point 4: 724,1557
//scr_act_path(724,1557,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "What the huck, it's the Duergars! I can't go this way...";
scr_act_dialogue();}
else {
action = 0;
state = 4;}
break;
case 3:
//Hoopz runs back to Point 3: 531,860
//scr_act_path(531,860,scr_object_var_get("speed"));
action += 1;
break;
case 4:
//Hoopz runs to Point 4: 724,1557
//scr_act_path(724,1557,scr_object_var_get("speed"));
action += 1;
break;
case 5:
action = 0;
state = 4;
break;
}
break;


// Point 4: 724,1557
case 4:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Right|Down";
scr_act_choice();
break;
case 1:
if choice = 1 {
//Hoopz runs to Dead End 4: 723,1780
//scr_act_path(723,1780,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
action += 1;}
else {
//Hoopz runs to Point 5: 1044,1638
//scr_act_path(1044,1638,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 1 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Mother Hubbard, it's a dead end! I'm losing time! I can hear the Duergars gaining on me!";
scr_act_dialogue();}
}
else {
action = 0;
state = 5;}
break;
case 3:
//Hoopz runs back to Point 4: 724,1557
//scr_act_path(724,1557,scr_object_var_get("speed"));
action += 1;
break;
case 4:
//Hoopz runs to Point 5: 1044,1638
//scr_act_path(1044,1638,scr_object_var_get("speed"));
action += 1;
break;
case 5:
action = 0;
state = 5;
break;
}
break;


// Point 5: 1044,1638
case 5:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Up|Down";
scr_act_choice();
break;
case 1:
if choice = 0 {
//Hoopz runs to Duergar 5: 1049,1338
//scr_act_path(1049,1338,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
action += 1;}
else {
//Hoopz runs to Point 6: 1299,1791
//scr_act_path(1299,1791,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Crap! It's the Governor's mansion! Why'd I cuffin' come here? It's swarming with Duergar?";
scr_act_dialogue();}
}
else {
action = 0;
state = 6;}
break;
case 3:
//Hoopz runs back to Point 5: 1044,1638
//scr_act_path(1044,1638,scr_object_var_get("speed"));
action += 1;
break;
case 4:
//Hoopz runs to Point 6: 1299,1791
//scr_act_path(1299,1791,scr_object_var_get("speed"));
action += 1;
break;
case 5:
action = 0;
state = 6;
break;
}
break;


// Point 6: 1299,1791
case 6:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Up|Right";
scr_act_choice();
break;
case 1:
if choice = 0 {
//Hoopz runs to Duergar 6: 1320,1602
//scr_act_path(1320,1602,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
action += 1;}
else {
//(to ensure the shortest path to Point 7 is along the bottom of the screen, not around a corner, we might want to have him move to a midpoint along the way first:
//Hoopz runs to Midpoint: 2000,1800
//scr_act_path(2000,1800,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Aww crud! It's the Duergars! I gotta get out of here!";
scr_act_dialogue();}
}
else {
//Hoopz runs to Point 7: 1983,1511
//scr_act_path(1983,1511,scr_object_var_get("speed"));
action += 1;}
break;
case 3:
if choice = 0 {
//Hoopz runs back to Point 6: 1299,1791
//scr_act_path(1299,1791,scr_object_var_get("speed"));
action += 1;}
else {
action = 0;
state = 7;}
break;
case 4:
//(to ensure the shortest path to Point 7 is along the bottom of the screen, not around a corner, we might want to have him move to a midpoint along the way first:
//Hoopz runs to Midpoint: 2000,1800
//scr_act_path(2000,1800,scr_object_var_get("speed"));
action += 1;
break;
case 5:
//Hoopz runs to Point 7: 1983,1511
//scr_act_path(1983,1511,scr_object_var_get("speed"));
action += 1;
break;
case 6:
action = 0;
state = 7;
break;
}
break;


// Point 7: 1983,1511
case 7:  
switch action{
case 0:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Up|Left";
scr_act_choice();
break;
case 1:
if choice = 0 {
//Hoopz runs up to Dead End 7: 2078,1253
//scr_act_path(1049,1338,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
action += 1;}
else {
//Hoopz runs to Point 8: 1553,1269
//scr_act_path(1553,1269,scr_object_var_get("speed"));
action += 1;}
break;
case 2:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Huff... huff... it's a dead end... I'm losing time!";
scr_act_dialogue();}
}
else {
action = 0;
state = 8;}
break;
case 3:
//Hoopz runs back to Point 7: 1983,1511
//scr_act_path(1983,1511,scr_object_var_get("speed"));
action += 1;
break;
case 4:
//Hoopz runs to Point 8: 1553,1269
//scr_act_path(1553,1269,scr_object_var_get("speed"));
action += 1;
break;
case 5:
action = 0;
state = 8;
break;
}
break;


// Point 8: 1553,1269
case 8:  
switch action{
case 0:
if string_length(scr_object_var_get("choice8")) > 5 {
if string_length(scr_object_var_get("choice8")) = 13 {
textbox_height_lines = 3
textbox_y = 185}
else {
textbox_height_lines = 2
textbox_y = 195}
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = scr_object_var_get("choice8");
scr_act_choice();}
else {
choice = 3
//Hoopz runs to Point 9: 1603,769
//scr_act_path(1603,769,scr_object_var_get("speed"));
action += 1;}
case 1:
if choice = 0 {
if string_length(scr_object_var_get("choice8")) = 8 {
//Hoopz runs to Point 9: 1603,769
//scr_act_path(1603,769,scr_object_var_get("speed"));
action += 1;}
else {
if string_length(scr_object_var_get("choice8")) = 13 scr_init_param();
else scr_object_var_set("choice8","Up");
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
//Hoopz runs left to the same Duergar from earlier, Duergar 5: 1194,1258
//scr_act_path(1194,1258,scr_object_var_get("speed"));
action += 1;}
}
else if choice = 1 {
if string_length(scr_object_var_get("choice8")) = 8 {
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
//Hoopz runs to Dead End 8: 2050,1090
//scr_act_path(2050,1090,scr_object_var_get("speed"));
action += 1;}
else {
//Hoopz runs to Point 9: 1603,769
//scr_act_path(1603,769,scr_object_var_get("speed"));
action += 1;}
}
else if choice = 2 {
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1);
scr_object_var_set("choice8","Left|Up");
//Hoopz runs to Dead End 8: 2050,1090
//scr_act_path(2050,1090,scr_object_var_get("speed"));
action += 1;}
else if choice = 3 {
action = 0;
state = 9;}
break;
case 2:
if choice = 0 {
if string_length(scr_object_var_get("choice8")) = 8 {
action = 0;
state = 9;}
else {
scr_object_var_set("choice8","Up|Right");
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "What the frud, it's the Duergars! I can't go this way! I'm losing time, I can hear them gaining on me!"
scr_act_dialogue();}
}
}
else if choice = 1 {
if string_length(scr_object_var_get("choice8")) = 8 {
scr_object_var_set("choice8","Up");
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Mother shucker, it's a dead end! I can't go this way! I can hear the Duergars gaining on me!"
scr_act_dialogue();}
}
else {
action = 0;
state = 9;}
}
else if choice = 2 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Mother shucker, it's a dead end! I can't go this way! I can hear the Duergars gaining on me!"
scr_act_dialogue();}
}
break;
case 3:
//Hoopz runs back to Point 8: 1553,1269
//scr_act_path(1553,1269,scr_object_var_get("speed"));
action += 1
break;
case 4:
action = 0
break;
}
break;

// Point 9: 1603,769
case 9:  
switch action{
case 0:
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "I think I'm almost there... but which way do I go?"
scr_act_dialogue();
break;
case 1:
textbox_height_lines = 2
textbox_y = 195
textbox_width_px = 80
portrait = -1;
title_text = "Which direction?";
choice_text = "Left|Right";
scr_act_choice();
break;
case 2:
if choice = 0 {
//Hoopz runs to Duergar 9: 1421,771
//scr_act_path(1049,1338,scr_object_var_get("speed"));
scr_object_var_set("gutterfail",scr_object_var_get("gutterfail") + 1)
action += 1;;}
else {
//Hoopz runs to Point 10: 1823,469
//scr_act_path(1823,469,scr_object_var_get("speed"));
action += 1;}
break;
case 3:
if choice = 0 {
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
if scr_object_var_get("gutterfail") = 3 {
action = 0;
state = 11;}
else {dialogue_text = "Cluck it, the Duergars! I've gotta get out of here!";
scr_act_dialogue();}
}
else {
action = 0;
state = 10;}
break;
case 4:
//Hoopz runs back to Point 9: 1603,769
//scr_act_path(1603,769,scr_object_var_get("speed"));
action += 1;
break;
case 5:
//Hoopz runs to Point 10: 1823,469
//scr_act_path(1823,469,scr_object_var_get("speed"));
action += 1;
break;
case 6:
action = 0;
state = 10;
break;
}
break;

// Point 10: 1823,469
case 10:

switch action {

case 1:
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Huff... huff... I think... I think I made it. That was a close one. That... that idiot Gutter Hound! I can't believe he did that to me! I think I need to have a word with that guy...";
scr_act_dialogue();
break;
case 2:
// Gutter Hound becomes visible again
scr_quest_set_state("ghoundQuest",4);
scr_event_end();
break;
}
break;


// FAILURE STATE
case 11: // If, at any time scr_object_var_get("gutterfail") = 3 the following sequence happens

switch action {

case 1:
scr_init_param();
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "C-crap...";
scr_act_dialogue();
break;
case 2:
//fade to black;
action += 1;
break;
case 3:
//portrait = s_port_duergar;
portrait = -1
title_text = "Duergar";
dialogue_text = "Heh heh, you little punk! You thought you could get away with stealing from Cuchulainn, huh? Well we're about to show you what happens to people who mess around with Cuchulainn around here....";
scr_act_dialogue();
break;
case 4:
//sound effect & maybe screen flash goes here, something to indicate pain to hoopz
action += 1;
break;
case 5:
title_text = "Duergar";
//portrait = s_port_duergar;
portrait = -1
dialogue_text = "Heh heh, chump. If we catch you hangin' around Tir na Nog again, you won't get a second chance. You're done, buddy. Throw this idiot in the sewers - if he shows his face in Tir na Nog again, we'll beat it in."
scr_act_dialogue();
break;
case 6:
scr_quest_set_state("ghoundQuest",3)
scr_quest_set_state("tnnBan",1)
// the game teleports you to the Doctor's Office in the sewers, to coordinates 186,127 preferably facing down-and-to-the-left
action += 1;
break;
case 7:
// and fades back in.
action += 1;
break;
case 8:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Ugh, my head..."
scr_act_dialogue();
break;
case 9:
portrait = -1
title_text = "Maria"
dialogue_text = "I'm not going to ask what you did. I know whatever you did was for the good of the people in Tir na Nog. I guess the difference between you and me is that you're not afraid to put others first when it counts most. You can stay here as long as you need, but I think you'll be able to do the most good if you leave."; // finish dialogue
scr_act_dialogue();
break;
case 10:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Do you know how I can get out of here?"
scr_act_dialogue();
break;
case 11:
portrait = -1
title_text = "Maria";
dialogue_text = "The sewers are a big place. I don't know the way out, but I know the path to the right will take you to the Duergar plantations. I wouldn't go there if I were you."
scr_act_dialogue();
break;
case 12:
portrait = s_port_hoopz;
title_text = "X114JAM9";
dialogue_text = "Alright, thank you."
scr_act_dialogue();
break;
case 13:
portrait = -1
title_text = "Maria";
dialogue_text = "Yeah. Be careful."
scr_act_dialogue();
break;
case 5:
global.have_sg = -1
if global.have_mg = 0 global.have_mg = -1
if global.have_pistol = 0 global.have_pistol = -1
scr_event_end();
break;

}
break;

// from scr_GutterHound.txt
case 12:
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
}
    
}}

