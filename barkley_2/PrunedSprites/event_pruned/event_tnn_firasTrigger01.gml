// Event for Firas Trigger, involved in Dead Son quest. When you are controlling Matthias,
// This collision will trigger, prompting the Dead Son Quiz sequence.
// Note on Firas - deadSon 2 is activated in the sewers by finding his dead son from anywhere between Times 1-3. The quest ends automatically at 4 if it's not completed.
//deadson = 7 means you've completed quest, spoken to firas.
// deadSon = 6 means you completed the quest, haven't returned to Firas.
// deadSon = 5 Used for cutscene inside Firas' house.
// deadSon = 4 means Firas saw through your disguise and realized his son is dead
// deadSon = 3 means you're currently controlling the dead son who is in the sewers
// deadSon = 2 means the quest has been accepted
// deadSon = 1 means Firas has been spoken to but the quest was rejected
// deadSon = 0 means Firas hasn't been spoken to and the quest is not active*
// usage: event_tnn_firas01();

if (argument0 == SCRIPT_START) {
scr_actor_unsetRigid(id);
}

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_COLLISION_HOOPZ) {
    // Build Event
    var firasTrigger = id;
    var event = scr_event_create_main();
    var firas1 = scr_event_create_child(event);
    var firas2 = scr_event_create_child(event);
    var firas3 = scr_event_create_child(event);
    var firasFail = scr_event_create_child(event);
    var firasEnd = scr_event_create_child(event);
    with (event) {

//--------------------------------------------
//--------------- SNIPPETS -------------------
//--------------------------------------------
    
    //Completed the quest.
    with (firasEnd) {
        scr_event_build_dialogue("Firas", s_port_firas, "I... I've gotta tell you somethin', son... I... I was gonna give you a whoopin' to learn ya never to run away like that again but...");
        
        //TODO: firas animation
        
        scr_event_build_dialogue("Firas", s_port_firas, "...but I'm just happy you're back. It's you! It's really you! I was so terrified somethin' had happened, but yer back safe and sound!");
        scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth... what am I supposed to do now? Why did I do this??? I really didn't think this one through...");
        scr_event_build_dialogue("Matthias", s_port_matthias, "Yep! It's me, your real, 100% alive son Matthias! Here I am! G'day, Pa! I love grapes and blue jeans!");
        scr_event_build_dialogue("Firas", s_port_firas, "*sniff sniff* Say... you're kinda ripe. You need a bath, buster brown! You march right in there and scrub yourself up - I ain't lettin' no son of mine run around smellin' like that. And maybe after that we can go out for some grapes, huh?");
        scr_event_build_dialogue("Matthias", s_port_matthias, "THAT SOUNDS LIKE AN EXCELLENT IDEA!!!");
        scr_event_build_quest_state("deadSon", 5);
        scr_event_build_fade(true, 2);
        scr_event_build_wait_for_actions();
        scr_event_build_teleport(r_firas01, 114, 200);
    }

    //Flubbed up the quest.
    with (firasFail) {
        scr_event_build_dialogue("Firas", s_port_firas, "This is startin' to sound fishy. Yer not talkin' like Matthias at all. You don't really even look like him... ");
        scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, this was the worst idea I've ever had... what was I even thinking? Why did I think propping up a dead kid like a marionette was a good idea? This is probably the worst idea I've ever had...");
        scr_event_build_dialogue("Firas", s_port_firas, "Are... are you danglin' from strings? You're... not Matthias at all! You're some kinda Matthias puppet! What in the heck is goin' on here?!");
        
        scr_event_build_fade(true, 2);
        scr_event_build_wait_for_actions();
        scr_event_build_teleport(r_tirnanog01, 1790, 210);
        //TODO: switch hoopz sprite here. 
        scr_event_build_wait_for_actions();
        scr_event_build_fade(false, 2); 
        scr_event_build_wait_for_actions();
                
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "...and when I found his body, I knew it would just break your heart to find out he was gone. I thought it would cheer you up to see him one last time, so I -");
        scr_event_build_dialogue("Firas", s_port_firas, "So you strung up his ragged body like a marionette and dangled him from the rafters.");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I didn't really think this one through.");
        scr_event_build_dialogue("Firas", s_port_firas, "Nobody... nobody should ever have to find out their son's died. Especially not like this... not by havin' his body strung up like a gatdam puppet... not by having whatever dignity he might have had thrown out the window. I... I think I need to sit down. This is the most heinous thing anyone's ever done to me. This is the most awful thing I've ever heard of. Please just... please never speak to me again.");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Hmm, I think I blew it... hope it goes better next time!)");
        scr_event_build_quest_state("deadSon", 4);
        scr_event_build_fade(true, 2);
        scr_event_build_wait_for_actions();
        scr_event_build_time_add(1);
        scr_event_build_fade(false, 2); 
        scr_event_build_wait(1);
    }
    
    //Third question
    with (firas3) {
        scr_event_build_dialogue("Firas", s_port_firas, "Well... well... don't think I'm not mad, bucko, 'cuz I'm madder than a riled up hornet's nest! I'm... I'm just glad you're okay... I told you to be home by dinner 'cuz I was makin' yer favorites! M-my brain's gettin' a little foggy... what's your favorite again?");
        scr_event_build_dialogue("Matthias", s_port_matthias, "(Wh-what? Matthias' favorite food? What am I gonna say? What am I gonna do when I'm done talking to Firas? What am I gonna do with Matt's body? Why did I do this at all? This was a horrible idea...)");
        var matthias3 = scr_event_build_choice("(What's Matthias' favorite food...?)", NULL);
        
        //Right answer 2
        with scr_event_build_add_choice(matthias3, "Um, grapes?") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Umm, you mean more grapes?");
            scr_event_build_dialogue("Firas", s_port_firas, "Of course, you dolt! What's the matter, you get hit on the head or somethin'? 'course your favorite is grapes! The ol' brainpan just got a little misty! Your grapes went sour!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Wh-why's he angry? I thought that's what Matthias' favorite food was... what the heck am I doing? Why did I think this was a good idea? What am I gonna do now??)");
            }
            
        //Wrong answer 2
        with scr_event_build_add_choice(matthias3, "Every kid's favorite is candy, Pa!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Every kid's favorite is candy, Pa! You know that!");
            scr_event_build_dialogue("Firas", s_port_firas, "Candy? Have you been eatin' candy again?! What did I tell you about eating candy? It rots yer teeth, ruins yer appetite! Yer... yer pullin' my leg, aren't you? What the heck is goin' on here?");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Well it's MY favorite... flub it... I think he's figured me out... why did I do this???)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Wrong answer 3
        with scr_event_build_add_choice(matthias3, "You know my favorite is pizza!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "My favorite's pizza, Pa! You know that!");
            scr_event_build_dialogue("Firas", s_port_firas, "Pizza? Are you outta your mind, boy? With your allergies, a single slice of pizza will have you in Gluten Pandemonium! You're off your rocker! Something's not right here...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Flub it, flub it... I think he's figured me out... why did I do this???)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Wrong answer 3
        with scr_event_build_add_choice(matthias3, "Moist, ripe oranges...") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "My favorite? I think you mean oranges, right Pa?");
            scr_event_build_dialogue("Firas", s_port_firas, "Oranges? Hmm... no, that's not right... it's... it's... it's grapes! That's right, it's grapes! What the heck is wrong with you, boy? Did you get hit on the head or somethin'? How'd you forget your favorite flippin' food?!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth, I think he knows... why did I do this... why did I do this...?)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Set deadSonHandler to 3.
        scr_event_build_quest_state("deadSonHandler", 3);
        scr_event_build_execute_event_script(event_tnn_firasTrigger01);
    }
    
    //Second question
    with (firas2) {
    
        scr_event_build_dialogue("Firas", s_port_firas, "Now tell me youngster, why in tarnation did you run away like that? Why'd you up and leave your old man like you did? You can't just leave me like that, I'm an old timer with creaky bones, I need someone to take care of me! And... and 'sides... you're too young to be on your own like that!");
        scr_event_build_dialogue("Matthias", s_port_matthias, "(C-crap, crap, crap, this was a really bad idea... why did I think stringing up Matthias' dead body like a marionette was a smart thing to do? I don't know the first thing about Matthias...)");
        var matthias2 = scr_event_build_choice("(What am I gonna tell Firas...?)", NULL);
            
        //Wrong answer 2
        with scr_event_build_add_choice(matthias2, "I was looking for grub in the sewers!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "I was looking for a snack in the sewers... a snack of clams.");
            scr_event_build_dialogue("Firas", s_port_firas, "Wh-what? A clamsnack? You don't even like clams! What the heck are you yammerin' on about?");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Dad jiggit, that was such a stupid thing to say... clamsnacks... what the heck am I even talking about? I don't know anything about Matthias... this was a terrible idea...)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Wrong answer 2
        with scr_event_build_add_choice(matthias2, "I got lost.") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Um, sorry. I got kind of lost.");
            scr_event_build_dialogue("Firas", s_port_firas, "Got lost? Don't gimme that bunkum, you know the streets of Tir na Nog like the back of yer hand, always zippin' around like some kinda madcap! I'm not buyin' it! Not for one second, buster brown!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Dad jiggit... what a stupid thing to say... what the heck am I supposed to even say? I don't know anything about Matthias... this was a terrible idea...)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Wrong answer 2
        with scr_event_build_add_choice(matthias2, "I ran away from home because you're too strict!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "You're too strict, Pa! I ran away because I can't handle all your rules!");
            scr_event_build_dialogue("Firas", s_port_firas, "Rules? What the heck are you talkin' about, boy? I don't give you any rules, and even if I did, you sure as heck don't listen to 'em! You don't even have any chores! What are you yammerin' on about, /'too strict?/' I think you're pullin' my leg, boy.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Dad jiggit... what a stupid thing to say... what the heck am I supposed to even say? I don't know anything about Matthias... this was a terrible idea...)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Right answer 2
        with scr_event_build_add_choice(matthias2, "I was trying to find the rebels... I wanna be a rebel, Pa!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "I was lookin' for the rebels, but I couldn't find 'em... I wanna be a rebel, Pa!");
            scr_event_build_dialogue("Firas", s_port_firas, "If I've told you once, I've told you a million times - the sewers are no place for a whippersnapper like you! Yer too young to be gettin' involved in this Cyberdwarf, L.O.N.G.I.N.U.S. hoo hah! And... and what if you got hurt?!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(But I thought that's why Matthias ran away... what the heck am I supposed to even say? I don't know anything about him... this was a terrible idea... what am I even doing?)");
            }
            
        //Set deadSonHandler to 2.
        scr_event_build_quest_state("deadSonHandler", 2);
        scr_event_build_execute_event_script(event_tnn_firasTrigger01);
    }

    //First question
    with (firas1) {
        scr_event_build_dialogue("Firas", s_port_firas, "...that knucklehead, that nincompoop son of mine, running off like that... what was he thinking... what was he - mark my lucky stars... are my eyes workin' right? Is that who I think it is? I coulda sworn that's... Matthias... is... is that you?");
        scr_event_build_dialogue("Matthias", s_port_matthias, "(Uh, uh... what do I say?)");
        var matthias1 = scr_event_build_choice("(What am I supposed to say...?)", NULL);
            
        //Wrong answer 1
        with scr_event_build_add_choice(matthias1, "It'sa me, Pap-Paw, your good old son Matthias!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "It'sa me, Pap-Paw! Your good, old son Matthias! I'm back and better than ever!");
            scr_event_build_dialogue("Firas", s_port_firas, "/'It'sa me?/' /'Pap-Paw?/' When did you start saying those, Matthias? You've... never called me Pap-Paw before...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth, why am I doing this?? This was a terrible idea!)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Wrong answer 1
        with scr_event_build_add_choice(matthias1, "Season's greetings, Pappy! It's me, your actual son Matthias!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Season's greetings, Pappy! It's me, Matthias, your actual son! I'm back and better than ever!");
            scr_event_build_dialogue("Firas", s_port_firas, "/'Season's greetings?/' /'Pappy?/' Did you get hit in the head, Matthias? When have you ever called me that? You've... never said those things before...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth, why am I doing this?? This was a terrible idea!)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Right Answer 1
        with scr_event_build_add_choice(matthias1, "G'day, Pa! I'm Matthias and I'm 100% alive!") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "G'day, Pa! It's me, Matthias, your 100% living son! I'm back and better than ever!");
            scr_event_build_dialogue("Firas", s_port_firas, "M-Matthias! My eyes sure don't work like they used to but I knew it was you! Why, I've got half a mind to tan your rumpus for running off like that...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth, why am I doing this?? This was a terrible idea!)");
            }
            
        //Wrong Answer 1
        with scr_event_build_add_choice(matthias1, "Top of the morning to you, P'pa! I AM YOUR SON MATTHIAS.") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Top of the morning to you, P'pa! I AM YOUR SON, MATTHIAS. I AM ALIVE.");
            scr_event_build_dialogue("Firas", s_port_firas, "/'Top of the morning to you...?/' /'P'pa?/' What kinda nonsense is this, Matthias? When did you start saying that bunkum? You've... never said those things before...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Oh Clispaeth, oh Clispaeth, why am I doing this?? This was a terrible idea!)");
            scr_event_build_quest_state_add("deadSonPoints", 1);
            }
            
        //Set deadSonHandler to 1.
        scr_event_build_quest_state("deadSonHandler", 1);
        scr_event_build_execute_event_script(event_tnn_firasTrigger01);
        }
        
    //Currently controlling Matthias
     if (scr_quest_get_state("deadSon") == 3) {
        
        //deadSonHandler = 2, done second question.
        if (scr_quest_get_state("deadSonHandler") == 3) {
            
            //if you got 2 questions wrnog
            if (scr_quest_get_state("deadSonPoints") == 2) {
                scr_event_build_event_snippet(firasFail);
            
            //if you haven't gotten 2 questions wrong.
            } else {
                scr_event_build_event_snippet(firasEnd);
            }
     
        //deadSonHandler = 3, done third question.
        }else if (scr_quest_get_state("deadSonHandler") == 2) {
            
            //if you got 2 questions wrong
            if (scr_quest_get_state("deadSonPoints") == 2) {
                scr_event_build_event_snippet(firasFail);
            
            //if you haven't gotten 2 questions wrong.
            } else {
                scr_event_build_event_snippet(firas3);
            }
        
        //deadSonHandler = 1, done first question.
        }else if (scr_quest_get_state("deadSonHandler") == 1) {
            
            //if you got 2 questions wrnog
            if (scr_quest_get_state("deadSonPoints") == 2) {
                scr_event_build_event_snippet(firasFail);
            
            //if you haven't gotten 2 questions wrong.
            } else {
                scr_event_build_event_snippet(firas2);
            }
        
        //deadSonHandler = 0, haven't started event yet.
        } else if (scr_quest_get_state("deadSonHandler") == 0) {
            scr_event_build_fade(true, 2);
            scr_event_build_wait_for_actions(); 
            scr_event_build_set_object(o_hoopz, 1785, 270);
            scr_event_build_fade(false, 2);
            scr_event_build_wait_for_actions(); 
            scr_event_build_dialogue("Matthias", s_port_matthias, "(That's Firas over there... but I don't know the first thing about Matthias! If I want him to think I'm actually Matthias, I've gotta know more about him. Maybe I should talk to people around Tir na Nog and try to gather some info about him before I talk to Firas...)");
            var startquest = scr_event_build_choice("Should I approach Firas?", NULL);
        
            //ready to talk to Firas, start quest.
            with scr_event_build_add_choice(startquest, "I'm ready... it's time to talk to Firas.") {
                scr_event_build_dialogue("Matthias", s_port_matthias, "(Okay... I'm nervous, but I'm ready to do this... I can't wait to see the smile on his face when he sees his son is back!)");
                scr_event_build_event_snippet(firas1);
            }
        
            //Not ready to start quest.
            with scr_event_build_add_choice(startquest, "I'm not ready yet, I should find out more about Matthias.") {
                scr_event_build_dialogue("Matthias", s_port_matthias, "(I'm too nervous, I should talk to people to find out more about Matthias... I don't want Firas to see through my disguise!)");
                scr_event_build_fade(true, 2);
                scr_event_build_wait_for_actions();
                scr_event_build_set_object(o_hoopz, 1785, 340); 
                scr_event_build_fade(false, 2);
                scr_event_build_wait_for_actions(); 
            }
        }
        
        }
    }
    scr_event_advance(event);
}
