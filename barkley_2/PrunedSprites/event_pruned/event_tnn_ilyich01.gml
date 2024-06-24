// Former tour guide understudy, in house in TNN.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Ilyich", NULL, "Sorry folks, the tours are closed today. You'll have to come back another day.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Drat! Me and my pappy Firas love tours. Maybe next time.");
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Ilyich", NULL, "Sorry folks, the tours are closed today. You'll have to come back another day.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "I, the new governor of Tir na Nog, will certainly come back another day.");
        //Spoken to Ilyich 7 times.
        } else if (scr_quest_get_state("ilyichState") == 7) {
            scr_event_build_dialogue("Ilyich", NULL, "We at Starlight Tours hope you had a great journey with us today!! Don't forget to hit the gift shop on your way out!!!");
            
        //Spoken to Ilyich 6 times.
        } else if (scr_quest_get_state("ilyichState") == 6) {
            scr_event_build_dialogue("Ilyich", NULL, "We're reaching the end of our time together now, friends. Do any of you have any questions for me?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh.... what are you talking about?");
            scr_event_build_dialogue("Ilyich", NULL, "Oh!!! Oh. I didn't think anybody was listening.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I thought you were talking to me.");
            scr_event_build_dialogue("Ilyich", NULL, "Well, no, I was just talking to myself I guess. This is what my job sounded like back before I came here. I really miss it.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh, you were a tour guide?");
            scr_event_build_dialogue("Ilyich", NULL, "Well... no. But I was the tour guide's understudy. He never missed a day for thirty years. He was the best tour guide in the business. But I got to go on his tour thousands of times, every day of my life for a while there. This was what my life sounded like back then, I guess. It probably sounds pretty stupid just hearing me say it. He could breathe life into the script so much better than I can.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I thought it was pretty cool anyway. I'd like to go there sometime.");
            scr_event_build_dialogue("Ilyich", NULL, "You can't... it's............ I just really miss it. I guess I go through the lines so I don't forget what home sounds like. When I close my eyes sometimes I can see Westman's Borealis reflecting in the tarpits, or smell the sulfur from the twin volcanoes. It's just as real to me as those days.... It's not the same, but I guess it's better than nothing, isn't it?");
            scr_event_build_quest_state("ilyichState", 7);
            
        //Spoken to Ilyich 5 times.
        } else if (scr_quest_get_state("ilyichState") == 5) {
            scr_event_build_dialogue("Ilyich", NULL, "Now this is where it gets a little more dicey ladies, gentlemen, and gremlinkin... we're about to pass the DG789088.1 crater, the only place where the center of our beautiful home is exposed. As much as you'd like to see it with your naked eyes, making direct eye contact with the star at the center of our home will burn them out instantly. If you'd be so kind, please put on your sunglasses... now!! And to those of you that you did not receive your special sunglasses, you can purchase replacements at the vending machine at the back of the trolly.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(What vending machine.....?)");
            scr_event_build_quest_state("ilyichState", 6);
            
        //Spoken to Ilyich 4 times.
        } else if (scr_quest_get_state("ilyichState") == 4) {
            scr_event_build_dialogue("Ilyich", NULL, "Just around the corner............. there it is!!! The pink-bellied rhino!!! Look at the little one right there, rolling on his back. And there's the alpha male himself, the grandfather of all the pink-bellied rhinos, asleep as usual. Look how peaceful he is there... Hushed tones, my friends, they say it's bad luck to wake him.");
            scr_event_build_quest_state("ilyichState", 5);
            
        //Spoken to Ilyich 3 times.
        } else if (scr_quest_get_state("ilyichState") == 3) {
            scr_event_build_dialogue("Ilyich", NULL, "And those with a keen eye will spot the spawning ground for nature's doppelganger: the striped flamingo. Don't make eye contact with them, now! You don't want to lose your pocketbook.");
            scr_event_build_quest_state("ilyichState", 4);
            
        //Spoken to Ilyich 2 times.
        } else if (scr_quest_get_state("ilyichState") == 2) {
            scr_event_build_dialogue("Ilyich", NULL, "We are now approaching the resting place of our Glorious Leader. Please, dear friends, a moment of silence.....");
            scr_event_build_quest_state("ilyichState", 3);
            
        //Spoken to Ilyich 1 time.
        } else if (scr_quest_get_state("ilyichState") == 1) {
            scr_event_build_dialogue("Ilyich", NULL, "To your left is the sight you all came here to see: The Reefer Peak! The tallest point on the entire planet. Hurry!! Make a wish before it touches the moon!!!");
            scr_event_build_quest_state("ilyichState", 2);
        
        //Never spoken to Ilyich before.
        } else {
            scr_event_build_dialogue("Ilyich", NULL, "This is a rare treat now, my friends. Right now we're passing the home of intergalactic pop music superstar Les /'Washbasin/' McGarvey. Those who listen close may hear be fortunate enough to hear some seductive vibes from his electric triangle...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(?!?!?)");
            scr_event_build_quest_state("ilyichState", 1);
        }
    }
    scr_event_advance(event);
}
