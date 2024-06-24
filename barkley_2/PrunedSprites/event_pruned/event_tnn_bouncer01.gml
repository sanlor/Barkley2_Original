// event_tnn_bouncer01(); 
/* 
    Bouncer standing outside Booty Bass in Tir na Nog.
    bootyBassQuest is the rave quest variable. 
        2 = failed
        3 = won
*/


if (argument0 == SCRIPT_START)
{
    if (scr_inside() == false) && (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
    else if (scr_inside() == true) && (scr_tnn_curfew("during") == false) { scr_event_interactive_deactivate(); }
    
    // Default DJ Name to current P_NAME
    if (string(scr_quest_get_state("djName")) == "0") { scr_quest_set_state("djName", P_NAME); }
    if (string(scr_quest_get_state("djNamePrefix")) == "0") { scr_quest_set_state("djNamePrefix", P_NAME); }
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var bouncer = id;
    var event = scr_event_create_main();
    
    var djname = string(scr_quest_get_state("djName"));
    var djpref = string(scr_quest_get_state("djNamePrefix"));

    with (event)
    {
        //-----------------------------------
        // Body Swap States
        //-----------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            scr_event_build_dialogue("Bouncer", NULL, "Gatdam, dude. We don't have a dress code but I'm not letting you in lookin' like a stank ass bog body.");
        } 
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Bouncer", NULL, "N-no Booty Bass going on here, sir! Uh, yes, I'm well aware Booty Bass is a capital offense! We're just, uh, doing a morality play in honor of Cuchulainn and the Duergars, whom we cherish and respect.");
        }
        
        //-----------------------------------
        // Normal States
        //-----------------------------------
        // Any jobs available? Eric's Quest.
        else if (scr_quest_get_state("ericQuest") == 2) && (scr_time_get() <= 3)
        {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, this is the booty bass club, right? I was wondering if you guys were hiring right now.");
            scr_event_build_dialogue("Bouncer", NULL, "Yeah, we're looking for another bouncer for the day shift. You look a little small for the job, can you fight?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh, I'm looking for a fr... client.");
            scr_event_build_dialogue("Bouncer", NULL, "Yeah? How's your /'client/' in the ring?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh... bad. Really bad.");
            scr_event_build_dialogue("Bouncer", NULL, "Then hit the road, kid.");
        }
        
        //------------------------------------
        // Won or Lost Booty Bass
        //------------------------------------
        
        // Won the rave quest.
        else if (scr_quest_get_state("bootyBassQuest") == 3)
        {
            scr_event_build_dialogue("Bouncer", NULL, "H-hello B-Baron of Booty... my liege...");
            scr_event_build_dialogue(djname, s_port_hoopz, "Hey there. You can just call me " + djpref + ", you know.");
            scr_event_build_dialogue("Bouncer", NULL, "Th-the Baron said hello... they noticed me!");
        }
        // Miserably failed the rave quest.
        else if (scr_quest_get_state("bootyBassQuest") == 2)
        {
            scr_event_build_dialogue("Bouncer", NULL, "Well if it isn't the little DJ! What's going down, pal?");
            scr_event_build_dialogue(djname, s_port_hoopz, "I... I didn't win the Bootypocalypse...");
            scr_event_build_dialogue("Bouncer", NULL, "Sure you didn't win, but that doesn't mean you didn't pump out some of the hottest booty-flavored jock jams this side of the Sombrero Galaxy. You were there, " + djpref + ". You didn't just witness the Bootypocalypse - you lived it.");
            scr_event_build_dialogue(djname, s_port_hoopz, "Yeah, I guess that's true. And I DID get to meet The Anime Bulldog.");
            scr_event_build_dialogue("Bouncer", NULL, "Heck yeah! That's the way to look at it!");
            scr_event_build_dialogue(djname, s_port_hoopz, "Yeah, maybe you're right! Who cares if I didn't win the Bootypocalypse?");
            scr_event_build_dialogue("Bouncer", NULL, "That's the attitude! Go get 'em, tiger!");
            scr_event_build_dialogue(djname, s_port_hoopz, "(I... I will...)");
        }
        
        //------------------------------------
        // After Curfew, Missed Out
        //------------------------------------
            
        else if (scr_tnn_curfew("after") == true) // formerly (scr_time_get() > 3)
        { 
            // First talk
            if (scr_quest_get_state("bouncerShake") == 0)
            {
                scr_event_build_dialogue("Bouncer", NULL, "I can't believe it! All that power! All that... that... that... Booty! Pity yourself, kid, for you just missed the Bootypocalypse! A world and tuckus-shattering event!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Aw, dang... really?");
                scr_event_build_dialogue("Bouncer", NULL, "Sorry to say, but it's true. You're too late to witness the spectacle or compete for the Booty Barony itself, but come on in and dance! Plenty of booty energies are still reverberating within these hallowed booty halls. Wh-whoa!");
                scr_event_build_camera_shake(5, 1);
                scr_event_build_dialogue("Bouncer", NULL, "You feel that? A booty aftershock... the ground's still quaking and the asses are still shaking. Get in and feel that bass!");
                scr_event_build_quest_state("bouncerShake", 1);
            }
            else
            {
                //REALLYBAD
                scr_event_build_dialogue("Bouncer", NULL, "Hey kid, sorry you missed the Bootypocalypse. Unfortunately, it seems there are no legitimate claims to the throne...  the title will be uncontested until the current Baron or Barons of Booty meet their end. No Bootypocalypse until the Barons perish. Long live the Barons of Booty!");
            }
        }
        
        
        //------------------------------------
        // Before Booty Bass
        //------------------------------------
        
        // Talked to the bouncer.
        else if (scr_quest_get_state("bouncerState") == 1)
        {
            scr_event_build_dialogue("Bouncer", NULL, "The Bootypocalypse is here and nobody, not even Cuchulainn or the Bainshees, can stop this party! This is your only chance to witness the greatest modern minds of booty bass clash for the title of Baron... of... BOOTY! And go down forever in the booty chronicles as the greatest booty bassman of all time. Are you ready? Are you hyped? Can you handle the booty madness?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah!!! Yeah!!!!!");
            scr_event_build_dialogue("Bouncer", NULL, "Then step inside, my friend. And if you think you're up to the challenge, you can sign up for the Bootypocalypse yourself.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I'm... I'm shaking...)");
        }
        // Never talked to the bouncer.
        else
        {
            scr_event_build_dialogue("Bouncer", NULL, "This is the booty bass blowout of the century, the Bootypocalypse is upon us! Tir na Nog's blueblood booty bass royalty all competing for the title of Necron 7's Baron of Booty - DJ Booty Slayer, ass_subjugator, The Booty Tyrant, The Anime Bulldog, Booty Sultan, Bootyrajah, Keister Tyc00n, MC Booty Grasper - this party's going nonstop until a new Baron is crowned... all night long!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Whoa, the Anime Bulldog's gonna be there? I love anime...");
            scr_event_build_dialogue("Bouncer", NULL, "This party is just getting started, baby! Are you game? Are you HYPE? Are you READY. TO. ROCK. YOUR. BOOTY?!?!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah! Yeah!!!");
            scr_event_build_dialogue("Bouncer", NULL, "Then step inside, my friend. This party is open to all jock jammers, booty bouncers, techno dwarfs and cyber slickers. And if you think you've got the chops, you can even enter the Baron of Booty contest yourself.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I want to be the Baron of Booty...)");
            // Talked dialogue only.
            scr_event_build_quest_state("bouncerState", 1);
        }
    }
    scr_event_advance(event);
}
