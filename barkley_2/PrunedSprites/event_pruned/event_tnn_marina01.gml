// Event for Marina, the cattle rancher.
// usage: event_tnn_marina01();

if (argument0 == SCRIPT_STEP) {
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var marina = id;
    var event = scr_event_create_main();
    with (event) {
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Marina", NULL, "Well hey there, pardner. Yer lookin' a mite under the weather. Gotta drink yer milk, y'know. I'd offer some if the girls weren't so darn skinny.");
        } 
        //Marina has been spoken to after being allowed to take cows to pasture.
        else if (scr_quest_get_state("govCow") == 3) {
            scr_event_build_dialogue("Marina", NULL, "I guess if you're gonna be out there in the Necron 7 wilds, we might just bump into each other. Good luck! I hear it's pretty dangerous!");
        } 
        //Marina is allowed to take her cows to the pasture. Hasn't been spoken to.
        else if (scr_quest_get_state("govCow") == 2) {
            scr_event_build_dialogue("Marina", NULL, "Well hey there, " + P_NAME_S + "! Yer never gonna believe the good news I just got... or maybe you will, 'cuz I guess you got it too... but they're letting me take my cows to a pasture outside of Tir na Nog! I can't believe it! I thought I was gonna have to get rid of the girls but it looks like there's a free pasture somewhere south of here! I guess if you're also leaving Tir na Nog, we may just run into each other out there. Good luck, " + P_NAME_S + "! I hear it's kinda dangerous.");
            scr_event_build_quest_state("govCow", 3);
        } 
        //if you're controlling the Governor.
        else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Marina", NULL, "Hey there, Mr. Governor, sir. Sorry about the uh, cattle here, but I've got nowhere else to put'em. It'd be right kindly of ya to help me get some pasture for 'em, but I don't want you to think I'm beggin' or nothin'.");
            scr_event_build_quest_state("govCow", 1);
        } 
        //if time = 3 and spoken to before.
        else if (scr_time_get() = 3) && (scr_quest_get_state("marinaState") == 1) {
            scr_event_build_dialogue("Marina", NULL, "Everyone went inside... I think there's a curfew now or somethin', but I can't just leave the girls out here to fend for themselves. I hope we don't get in trouble...");
        } 
        //if time = 3 and spoken to before.
        else if (scr_time_get() = 3) && (scr_quest_get_state("marinaState") == 0) {
            scr_event_build_dialogue("Marina", NULL, "Hey! You there, are you new here?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah... where did everyone go?");
            scr_event_build_dialogue("Marina", NULL, "There's a curfew goin' on right now - everyone's supposed to go inside until the Duergars say it's okay to come out. But my girls... I mean, those cows over there? I can't leave 'em on their own out here! They need a real pasture to graze in, they're not city cows! I don't even think city cows exist! What am I gonna do...");
            scr_event_build_quest_state("marinaState", 1);
            scr_event_build_quest_state("govCow", 1);
        } 
        // Talked to her.
        else if (scr_quest_get_state("marinaState") == 1) {
            scr_event_build_dialogue("Marina", NULL, "The girls are gettin' skinny and nobody likes a skinny cow. I'm gettin' worried that if I don't find a pasture for 'em soon, I'll have to get rid of 'em...");
            
        } 
        // Never talked to her.
        else {
            scr_event_build_dialogue("Marina", NULL, "Howdy, you new here?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I'm kinda lost.");
            scr_event_build_dialogue("Marina", NULL,  "Know the feelin'. We're new too, me and the girls. The girls, those cows over there. I'm a rancher... or I guess I used to be a rancher back when I had a pasture to put my cows in. But nowadays there's nowhere for 'em to graze - they're stuck eatin' the grass in between cobblestones. I'm really worried I might have to get rid of them... or worse.");
            scr_event_build_quest_state("marinaState", 1);
            scr_event_build_quest_state("govCow", 1);
        }
    }
    scr_event_advance(event);
}
