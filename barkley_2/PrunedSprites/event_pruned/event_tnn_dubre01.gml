/* Dubre the Useless
    Town Greeter whos is always wrong!
*/
// INTERACT //
if (argument0 == SCRIPT_START) then
    {  
    // Be gone after time 4 //
    if scr_time_get() > 4 then scr_event_interactive_deactivate();
    }
    
// INTERACT //
if (argument0 == SCRIPT_INTERACT) then
    {    
    var event = scr_event_create_main();
    var dubreGreet = scr_event_create_child(event);
    var dubreGreetCurfew = scr_event_create_child(event);
    
    /////////////////////////////////
    ///// Standard Questions       //
    /////////////////////////////////
    
    with dubreGreet {
        var dubreq1 = scr_event_build_choice("Ask Dubre the Obliging any question.", s_port_hoopz);
        
        //Town Leader
        var whereLeader = scr_event_build_add_choice(dubreq1, "Who is in charge of this town?");
        with (whereLeader) 
            {
            Dialogue(P_NAME, "Who's pulling the strings here?")
            Dialogue("Dubre", "Uh... hmm...\I'm not sure! There are lots of people here! Maybe one of them is in charge of this town.");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq1, whereLeader);
            scr_event_build_goto_choice(dubreq1);
        }
        
        // Notable Locations?
        var whereToGo = scr_event_build_add_choice(dubreq1, "Where should I go to meet new people?");
        with (whereToGo) 
            {
            Dialogue(P_NAME, "Where should I go to meet new people? Should I go into one of these apartment buildings?");
            Dialogue("Dubre", "Yeah! You should definitely make sure to check out all of them! I think you will not regret it! They're all just so great! There's stuff in all of them, I think! I'm not really sure, I have never been inside any of the buildings! I just like the outsides so much!");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq1, whereToGo);
            scr_event_build_goto_choice(dubreq1);
        }
        
        // Ask about Mortgage office if its on the table //
        if (Quest("wilmerEvict") == 1 ) {
            var mortgageOffice = scr_event_build_add_choice(dubreq1, "Know where the Mortgage Office is?");
            with (mortgageOffice) 
                {
                Dialogue(P_NAME, "I gotta pay the rent, know where I do that?");
                Dialogue("Dubre", "The rent huh? Yeah I know the place for that! You see that oildrum over there, the one with the red marking on it?");
                scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
                scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
                scr_event_build_wait_for_actions();
                scr_event_build_wait(1);
                scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
                scr_event_build_wait_for_actions();
                scr_event_build_wait(0.5);
                scr_event_build_look_object(o_cts_hoopz, o_dubre01);
                Dialogue(P_NAME, "Yeah, I see it. What about it?");
                Dialogue("Dubre", "Okay so first you go past that drum and keep on walking west until you see these stairs. Don't go up the stairs! Go down south. Keep going south until you can see the wall. You know the wall right? When you are there don't turn back! Keep going forward past the stores. You'll reach a dead end soon enough. Don't go into the dead end! Instead follow the path that goes up and then there you go. There's the rent place, you can't miss it!");
                Dialogue(P_NAME, "Alright I think I got it. Thanks.");
                Dialogue("Dubre", "No problem! Is there anything else you want to know?!");
                scr_event_build_remove_choice(dubreq1, mortgageOffice);
                scr_event_build_goto_choice(dubreq1);
                }
            }
        
        //Find Gun's
        var whereGuns = scr_event_build_add_choice(dubreq1, "Where should I go to buy gun's?");
        with (whereGuns) 
            {
            Dialogue(P_NAME, "If I was looking for a handy brastcannon, where would I go to buy one?")
            Dialogue("Dubre", "Hmm, you probably want a store that sells gun's then.\I don't know where that is! There might be one though! There also might not be! It's like a mystery!");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq1, whereGuns);
            scr_event_build_goto_choice(dubreq1);
            }
        
        //Find Candy
        var whereCandy = scr_event_build_add_choice(dubreq1, "Where should I go to buy candy?");
        with (whereCandy) 
            {
            Dialogue(P_NAME, "Where is the candy store! I need somethin' sweet!");
            Dialogue("Dubre", "Whoa!! Take it easy!\Ok, the candy store...\Hmm....\I'm not sure if there is one! I've never been there! Candy is not good for my goiter...");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq1, whereCandy);
            scr_event_build_goto_choice(dubreq1);
            }
            
        //Where BBALL
        var whereBball = scr_event_build_add_choice(dubreq1, "Where should I go to play BBALL?");
        with (whereBball) {
            Dialogue(P_NAME, "I have an immense desire to SLAM, possibly JAM. Where would I go to fill this need?");
            Dialogue("Dubre", "Oh... yes, yes... definitely..._\I don't know what you are saying to me.");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq1, whereBball);
            scr_event_build_goto_choice(dubreq1);
        }
        
        //If you've been around TNN, you can ask why everyone is unhappy
        if (scr_time_get() >= 2) {
            var whyUnhappy = scr_event_build_add_choice(dubreq1, "Why is everyone so unhappy?");
            with (whyUnhappy) {
                Dialogue(P_NAME, "What's the deal with this town? Everybody looks sick and unhappy....");
                Dialogue("Dubre", "I don't know what you mean! They look pretty swell to me!\Maybe you are looking at the wrong people? Try looking away from all the people who are miserable and dying and pay more attention to the people who are happy to be here! We're the ones who count!");
                Dialogue("Dubre", "Is there anything else you want to know?!");
                scr_event_build_remove_choice(dubreq1, whyUnhappy);
                scr_event_build_goto_choice(dubreq1);
            }
        }
        
        //Bathroom
        var whereBathroom = scr_event_build_add_choice(dubreq1, "Where should I go the bathroom?");
        with (whereBathroom) {
            Dialogue(P_NAME, "I need to use the bathroom.");
            Dialogue("Dubre", "Really? That's great! I need to use the bathroom all the time, too! More than most, even, like continuously!\Well since that duergar is still using that one, let me think where the nearest one is..._");
            //TODO: directions to Bathroom
            Dialogue("Dubre", "Oh I know!_ See that oildrum over there?");
            scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
            scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
            scr_event_build_wait_for_actions();
            scr_event_build_wait(1);
            scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
            scr_event_build_wait_for_actions();
            scr_event_build_wait(0.5);
            scr_event_build_look_object(o_cts_hoopz, o_dubre01);
            Dialogue(P_NAME, "Yes I... I do see it.");
            Dialogue("Dubre", "Okay! So what you have to do is, you have to head down from here, past that oildrum. Then you will come to a dead end and a wall. Don't stop there! Instead turn left and keep going. Go all the way to the other end of that little street. Right at the end is this big thing with fans on it. Don't try to touch the blades! You'll hurt yourself! Okay, so from there go a bit more north and you'll see some stairs. Don't go up the stairs!! Instead start going to the right and soon enough you'll see a bathroom you can use.");
            Dialogue(P_NAME, "Okay. Thanks.");
            Dialogue("Dubre", "Anything else before you go to the bathroom??");
            scr_event_build_remove_choice(dubreq1, whereBathroom);
            scr_event_build_goto_choice(dubreq1);
        }
        
        //End Question
        var noThanks = scr_event_build_add_choice(dubreq1, "No thanks.");
        with (noThanks) 
            {
            Dialogue(P_NAME, "No thanks. I'll figure it out on my own.");
            Dialogue("Dubre", "Wow! Good luck!!");
            scr_event_build_end();
        }
    }
    
    /////////////////////////////////
    ///// Curfew Questions         //
    /////////////////////////////////
    
    with dubreGreetCurfew {
        var dubreq3 = scr_event_build_choice("Ask Dubre the Obliging any question.", s_port_hoopz);
        
        //Where did everyone go?
        var whereEveryone = scr_event_build_add_choice(dubreq3, "Where should I go?");
        with (whereEveryone) {
            Dialogue(P_NAME, "Where did everybody go?");
            Dialogue("Dubre", "Hmmm, that's a really good question! Sometimes dwarfs just go somewhere. You never know where that could be. It could be anywhere.\Maybe you could go look for them? Try starting at that drum over there.");
            scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
            scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
            scr_event_build_wait_for_actions();
            scr_event_build_wait(1);
            scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
            scr_event_build_wait_for_actions();
            scr_event_build_wait(0.5);
            scr_event_build_look_object(o_cts_hoopz, o_dubre01);
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq3, whereEveryone);
            scr_event_build_goto_choice(dubreq3);
        }
        
        //Is it safe?
        var isItSafe = scr_event_build_add_choice(dubreq3, "Is it safe to be out here?");
        with (isItSafe) 
            {
            Dialogue(P_NAME, "Is it safe to be out here?");
            Dialogue("Dubre", "Of course! This town is perfectly, 110% safe! There's no way you're going to get hurt in this town! Just no way at all!\Just make sure you don't fall down or scratch yourself! But as long as you watch where you're going, you should be fine!");
            Dialogue(P_NAME, "Yeah but I think if those duergars see you out you might get in trouble.");
            Dialogue("Dubre", "Not if I help them first! I can't wait to help the duergars, whoever they are.");
            Dialogue(P_NAME, "Suit yourself, but it looks sketchy as huck out here!")
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq3, isItSafe);
            scr_event_build_goto_choice(dubreq3);
        }
        
        //Why are Duergars so mean?
        var whyMean = scr_event_build_add_choice(dubreq3, "Why are the duergars so mean?");
        with (whyMean) 
            {
            Dialogue(P_NAME, "Why are the duergars so mean to everybody?");
            Dialogue("Dubre", "Hmmm, duergars, huh? I guess they're pretty mean if what you say is true.\But I don't really know what a duergar is! I've never seen one! I hope I never see one if they're as mean as you say. That would just be no good at all!");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq3, whyMean);
            scr_event_build_goto_choice(dubreq3);
        }
        
        //What is there to do during curfew?
        var curfewActivity = scr_event_build_add_choice(dubreq3, "What should I do during the curfew?");
        with (curfewActivity) 
            {
            Dialogue(P_NAME, "What is there to do when the town is like this?");
            Dialogue("Dubre", "Hey, you're really getting into the spirit of our town now! That's great!\There's probably lots of fun stuff to do around town if you go and look for it. I pretty much just stand here and tell people everything I know about the town, so I don't have time to find other things to do.");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq3, curfewActivity);
            scr_event_build_goto_choice(dubreq3);
        }
            
        //Where is the train station?
        if (Quest("knowTNNTrain") == 1) {
            var whereTrain = scr_event_build_add_choice(dubreq3, "Where is the train station?");
            with (whereTrain) 
                {
                Dialogue(P_NAME, "Where would I find the train station?");
                //TODO: Add faulty directions
                Dialogue("Dubre", "Oh! You're looking to catch a train, huh? I don't know why you'd ever want to leave, this town has everything!\That's probably the best way to find a train station. If you find a train, you're just one step closer to finding a train station!");
                Dialogue("Dubre", "Is there anything else you want to know?!");
                scr_event_build_remove_choice(dubreq3, whereTrain);
                scr_event_build_goto_choice(dubreq3);
            }
        }
        
        //Who is Cuchulainn
        var whoCuchulainn = scr_event_build_add_choice(dubreq3, "Who is Cuchulainn?");
        with (whoCuchulainn) 
            {
            Dialogue(P_NAME, "What do you think about this Cuchulainn guy?");
            Dialogue("Dubre", "Wow! You really ask some tricky questions!\I don't know this Cuchulainn guy! I meet all kinds of people standing here but I've never met anybody named Cuchulainn! But if he's a friend of yours, I bet he's a really swell person.\Hey wait, I know! If there's something you want to know about Cuchulainn, maybe you should find him and ask! He'd probably tell you everything you want to know! Maybe he's even a town greeter like me! He'll tell you all sorts of things!!");
            Dialogue("Dubre", "Is there anything else you want to know?!");
            scr_event_build_remove_choice(dubreq3, whoCuchulainn);
            scr_event_build_goto_choice(dubreq3);
        }
        
        
        if (Quest("knowClispaeth") == 1) {
        //Ask about Clispaeth?
            var askClispaeth = scr_event_build_add_choice(dubreq3, "What do you know about Clispaeth?");
            with (askClispaeth)
                {
                Dialogue(P_NAME, "Have you opened your heart to Clispaeth?");
                Dialogue("Dubre", "Oooh, what a mysterious question! I feel like I'm being interrogated! This is so exciting!\So I think Clispaeth is a really important guy! Just super important.\I don't know who he is or anything about him but I don't think you'd be asking if he wasn't a really important person!! You've said it all, I think!! Maybe there's nothing even more to know about him, I don't know!");
                Dialogue(P_NAME, "._._._", s_port_hoopzAngry);
                Dialogue("Dubre", "Is there anything else you want to know?!");
                scr_event_build_remove_choice(dubreq3, askClispaeth);
                scr_event_build_goto_choice(dubreq3);
            }
        }
            
        //Where did everyone go?
        var whereEveryone = scr_event_build_add_choice(dubreq3, "Nary ye mind.");
        with (whereEveryone) {
            Dialogue(P_NAME, "Nary ye mind. I'll figure it out on my own.")
            Dialogue("Dubre", "Wow! Good luck!!");
            scr_event_build_end();
        }
    }
            
    /////////////////////////////////
    ///// Standard Event           //
    /////////////////////////////////
    
    with (event) {
        
        //As Governor
        if (scr_quest_get_state("govQuest") == 5) 
            {
            Dialogue("Dubre", "Hi! Welcome to our city!!\I am Dubre! I will be your guide through our glorious city! I know everything there is to know about this place. I just love this place so much!!\Ask me any question about our wonderful city, and I will answer it for you! For free!! I just love this town so much!!");
            Dialogue(P_NAME, "Ah, yes, our city. I am the governor so I am committed to questions about our wonderful city. Greetings and welcome.");
            Dialogue("Dubre", "Wow! A governor, huh? I don't know what that is, but that just sounds swell.");
            //TODO: goiter mention with Governor?
            scr_event_build_end();    
        }
        
        //Talked to Dubre Before
        else if (Quest("dubreState") == 1) 
            {
            // During Curfew
            if (scr_tnn_curfew("during") == true) 
                {
                Dialogue("Dubre", "Hi! Just cause everyone is inside doesn't mean we can't have fun out here. How can I help?");
                scr_event_build_event_snippet(dubreGreetCurfew);
                }               
            else 
                {
                Dialogue("Dubre", "Hi you must need more help. How can I help you?");
                Quest("dubreState", 1);
                scr_event_build_event_snippet(dubreGreet);
            }
        }
            
        // First time talking to Dubre
        else if (Quest("dubreState") == 0) {
            Dialogue("Dubre", "Hi! Welcome to our city! I am Dubre, Dubre the Obliging! I will be your guide through our glorious city! I know everything there is to know about this place. I just love this place so much!\Ask me any question about our wonderful city, and I will answer it for you! For free! I just love this town so much!");
            Quest("dubreState", 1);
            scr_event_build_event_snippet(dubreGreet);
        }
    }
    scr_event_advance(event);
}
