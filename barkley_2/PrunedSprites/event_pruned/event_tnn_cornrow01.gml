// Event for Cornrow, part of the Community Service quest.

// This entire post is for the Community Service quest. Here are the list of quest variables in the quest.
// concessionVal - this number is important for the main Tir na Nog governor quest. You have a set amount
//      of concession points, a value you can use to bargain for things during the quest. If you do good
//      quests, it increases. If you do bad quests, it decreases.

// comServ - determines your current position in the Community Service quest
//      0 = not active
//      1 = rejected
//      2 = need to break into house
//      3 = break-in complete
//      4 = need to rob store
//      5 = robbery complete
//      6 = need to kill vivian
//      7 = vivian dead
//      8 = mission complete
//
//  cornrowTalked -
//      0 = never talked to him
//      1 = talked to him, opportunity to ask about the Housing Department
//
//

// time > 2: make cornrow disappear.
// comServ > 6: cornrow's sprite is replaced with a note.

// usage: event_tnn_cornrow01();

if (argument0 == SCRIPT_START)
{
    // missed quest
    if (scr_time_get() > 2)
    {
        scr_event_interactive_deactivate();
    }
    // quest complete, turn into a note
    else if (Quest("comServ") > 6)
    {
        scr_event_interactive_deactivate();
    }
}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var curmoney = scr_money_count();
    var event = scr_event_create_main();

    var accept_snippet = scr_event_create_child(event);


    //------------------------------------------------------------------------------
    // accept_snippet
    //------------------------------------------------------------------------------
    with (accept_snippet)
    {
        var choice1 = Choice("Help out Mr. Cornrow?", s_port_hoopz);

        //accept quest
        with (ChoiceAdd(choice1, "Okay, that sounds good to me!"))
        {
            Dialogue(P_NAME, "Wow! You'd do that for me?");
            Dialogue("Cornrow", "See, Juicebox? What'd I tell ya'? I said 'that looks like a real bright kid over there!' And whattaya know? I was right!");
            Dialogue("Juicebox", "You were right, Cornrow.");
            Dialogue("Cornrow", "Now listen up, kid. This is real simple. Me and Juicebox were gonna distribute a buncha fruits to malnourished children but I left my fruit basket at my granny's house. Alls ya gotta do is head over to granny's house and pick up the big ol' basket of fruit, real big, like one of them, uh, whattaya call em - cornucopias? - and bring it back. That's it.");
            Dialogue("Juicebox", "That's it.");
            Dialogue("Cornrow", "I'd do it myself but I'm uh, busy teaching impoverished children how to read.");
            Dialogue("Juicebox", "Uncle Cornrow's teachin' me how to do letters.");
            Dialogue(P_NAME, "This doesn't sound too hard. Where does granny live?");
            Dialogue("Cornrow", "Look at that - look at that foresight, Juicebox. This kid's a real go-getter. She lives up in the poor quarter near the sewer entrance, furthest house on the left, a little blue shack. Real easy to find.");
            Dialogue(P_NAME, "Okay, Mr. Cornrow. I'll go get the fruit. Good luck with the reading lessons, Mr. Juicebox!");
            Dialogue("Juicebox", "Uh... thanks kid.");
            Quest("comServ", 2);
        }

        //refuse quest
        with (ChoiceAdd(choice1, "No, thank you."))
        {
            if (Quest("comServ") == 1)
            {
                Dialogue(P_NAME, "No thanks, Mr. Cornrow. I mean, I appreciate it and everything but I've got a lot of stuff going on right now.");
                Dialogue("Cornrow", "You're breakin' my heart, kid.");
                Dialogue("Juicebox", "You're breakin' his heart.");
                Dialogue("Cornrow", "...but if you gotta lot on your plate, you gotta lot on your plate. Just don't forget how dangerous it gets out here. Cuchulainn, Duergars, Bainshees, rebels... and worse.");
            }
            else
            {
                Dialogue(P_NAME, "Um, well I appreciate the offer Mr. Cornrow, but I'm a little busy right now.");
                Dialogue("Cornrow", "Awww, what a shame. Alls I wanted you to do was get the basket of fruit I was going to distribute to starving kids. Ahh well. Looks like those kids are going hungry tonight, Juicebox. What a shame.");
                Dialogue("Juicebox", "Shame.");
                Dialogue("Cornrow", "Well lemme know if you ever change your mind, kid. It's easy to get lost out here in the streets of Tir na Nog. Or worse.");
                Quest("comServ", 1);
            }
        }
    }

    //------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------
    with (event)
    {
        //------------------------------------------
        // Body Swap States
        //------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            Dialogue("Cornrow", "Well, well, well. If it ain't our little friend Matthias. Funny seeing you here after our last run-in, eh Juicebox?");
            Dialogue("Juicebox", "Real funny.");
            Dialogue("Matthias", "Yep! It's a real knee slapper! Well, I'll be seeing you guys! Have a nice day!");
        }
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            Dialogue("Cornrow", "Well if it ain't the new governor! Pleased to meet you, sir! I'm Cornrow, this is my associate Juicebox, and as you can see we're just uh, volunteering. Keeping kids off the streets, teachin' 'em to read, the whole nine yards.");
            Dialogue("Governor Elagabalus", "Hello! It is truly me, the Governor. I am pleased to announce that /'reading is fundamental/'! Please treasure this adage. Thank you.");
        }

        //------------------------------------------
        // Normal States
        //------------------------------------------

        // Need Vivian Directions
        else if (Quest("comServ") == 6)
        {
            Dialogue(P_NAME, "Hey um, Mr. Cornrow? Can you tell me how to find your granny again?");
            Dialogue("Cornrow", "Heh heh, you bet, kid. She's normally at church with that numnutz Giuseppe. And make sure she doesn't know you've got her medicine, otherwise she'll get all fussy.");
            Dialogue(P_NAME, "Yeah, I understand. I'll be right back!");
        }

        // Returning Mortimer Quest
        // Getting Vivian Quest
        else if (Quest("comServ") == 5)
        {
            var monCut = scr_money_db("mortimerRobbery") - scr_money_db("mortimerRobberyCut");

            // Have the money
            if (curmoney >= monCut)
            {
                Dialogue("Cornrow", "Look who it is, Juicebox. It's our new best buddy " + P_NAME_S + ". Did you get our change back from ol' Morty?");
                Dialogue(P_NAME, "Sure did Mr. Cornrow! He said he owed you even more than the number you gave me - he gave me " + string(scr_money_db("mortimerRobbery")) + " whole neuro-shekels!");
                Breakout("build", "add", "money");
                //Removed giving back cornrows gun, as it requires an additional function and i'm going soon
                //Also consider: You could smelt his gun
                Dialogue("Cornrow", "Whoooo boy! Give it here, kid!");// And gimme back my gun!");
                scr_event_build_money_add(-monCut);
                //TODO: scr_event_build_item_loss("Cornrow's Gun", 1); - does he takes his gun back?
                DialogueItem("Cornrow takes " + string(monCut) + " neuro-shekels.");// and his gun back.");
                Dialogue("Cornrow", "Keep the rest for yourself.");
                Breakout("build", "clear");
                Dialogue(P_NAME, "Wow, thanks Mr. Cornrow!");
                Dialogue("Cornrow", "Hey, no problem kid. I'm always happy to do favors for people in need. Right Juicebox?");
                Dialogue("Juicebox", "Yep.");
                Dialogue("Cornrow", "Now lemme tell ya something, kid - people talk about all those Dwarf Zones out there, places where dwarfs live free from Cuchulainn? Forget 'em. They're not real. Do you really think people can get away from Cuchulainn on his own ziggurat? Ain't nothin' outside Tir na Nog. No way. And the Cyberdwarf? Yeah, people talk about him like he's the leader of L.O.N.G.I.N.U.S. or whatever, but I say he's a fairy tale. Ain't no Cyberdwarf and ain't nobody fighting our fights for us.");
                Dialogue(P_NAME, "N-no Cyberdwarf...?");
                Dialogue("Cornrow", "Never was, never will be. But forget about it, kid. I got one last thing for you to do. Think you're up for it?");
                Dialogue(P_NAME, "I-I guess...");
                Dialogue("Cornrow", "Yeah, that's the stuff kid. Remember granny? She's a sweetheart but she's gettin' a bit old, startin' to forget things. You know how the elderly can be. Well this mornin' she up and left her house without takin' her vitamins! Can you believe it? She's gettin' on in her years and she needs those vitamins. I've just got her best interests at heart, y'know? So I want you to take this syringe and inject her with vitamins. Think you can handle that?");
                Dialogue(P_NAME, "Sure, Mr. Cornrow. That's really thoughtful of you.");
                Dialogue("Cornrow", "I take care of my kin, kid.");
                Dialogue("Juicebox", "He takes care of his kin.");
                Dialogue("Cornrow", "Now here's the thing - just make sure granny doesn't see you do it. Do it from behind or somethin'. She's an ornery ol' coot and she doesn't like to take her medicine, even if it's what's best for her. At this point, it's really up to us to take care of her, y'know?");
                Dialogue(P_NAME, "I understand, Mr. Cornrow. I'll make sure granny gets her medicine. Do you know where she is?");
                Dialogue("Cornrow", "She's all over Tir na Nog, but I know she likes Giuseppe's sermons. He's in that warehouse in the main shopping district."); //TODO: basic description edit
                Dialogue(P_NAME, "Alright. I'll go take care of it!");
                Dialogue("Cornrow", "I like your spirit, kid. You're goin' places.");
                DialogueItem("Got Granny's Medicine.");
                Item("Granny's Medicine", 1);
                Quest("comServ", 6);
            }

            // Don't have the money.
            else
            {
                Dialogue("Cornrow", "Well, well, well, Juicebox! Look who it is, our new friend " + P_NAME_S + ". What's happenin', friend? You got our money from ol' Morty?");
                Dialogue(P_NAME, "Um, sort of. See, he gave me the money but I kind of accidentally spent some of it. Maybe most of it. B-but I'll get it back, I promise! I didn't mean to, I swear!");
                Dialogue("Cornrow", "Well that's not good, " + P_NAME_S + ". Not good at all.");
                Dialogue("Juicebox", "Not good at all.");
                Dialogue("Cornrow", "But I'm glad you've taken it upon yourself to pay back what you've thoughtlessly squandered. It's important you get it back to us soon, " + P_NAME_S + ", 'cuz we were gonna start a fund to teach impoverished children to read their letters with it.");
                Dialogue(P_NAME, "Y-yes, Mr. Cornrow, sir! I'll be back real soon! I promise!");
                Dialogue("Cornrow", "Now that's real good of you, " + P_NAME_S + ".");
                Dialogue("Juicebox", "Real good of you.");
            }
        }

        //needs direction for candy shop
        else if (Quest("comServ") == 4)
        {
            Dialogue(P_NAME, "Hey Mr. Cornrow, can you tell me how to get to the candy shop again?");
            Dialogue("Cornrow", "You got it, kid. It's up in the poor quarters, northeast Tir na Nog - it's the big shop building on the left side, right next to granny's place. You can't miss it!");
            Dialogue(P_NAME, "Thanks, Mr. Cornrow. I'll be right back!");
        }

        //got the fruit
        else if (Quest("comServ") == 3)
        {
            Dialogue(P_NAME, "Hi Mr. Cornrow, hi Mr. Juicebox. I've got your fruit.");
            Breakout("build", "add", "money");
            Dialogue("Cornrow", P_NAME_S + ", my man! Look at that basket of fruit you got there! Ooooooh baby, look at those strawberries, Juicebox. We're eatin' good tonight. Good job, kid. Here's a little change for yer pocket.");
            scr_event_build_money_add(scr_money_db("cornrowCornucopia"));
            Item("Fruit Basket", -1);
            DialogueItem("Cornrow takes the Cornucopia. Got " + string(scr_money_db("cornrowCornucopia")) + " neuro-shekels!");
            Breakout("build", "clear");
            Dialogue(P_NAME, "Wow, thanks Mr. Cornrow!");
            Dialogue("Cornrow", "Here's a little tip - do NOT go in the sewers. Ain't nothin' in there but Bainshees, Duergars, rebels and trouble. Lemme tell ya, kid, don't get involved with none of that crap. Out here, the only guy you gotta worry about is number one - you. Ain't nothin' none of us can do about Cuchulainn so don't even bother. 'sides, if what I hear is true, we're all gettin' some sort of prize soon. And ESPECIALLY stay away from those uppity sons of bitches ('scuse the French) Ooze and Slag. I don't know what crawled up their butts but they strut around here acting like they own the place. I don't know who they are or where they came from but those guys are dangerous.");
            Dialogue(P_NAME, "Wow, okay! I'll be sure to stay away from all those guys!");
            Dialogue("Cornrow", "Yeah, yeah! That's lesson number one from the streets of Tir na Nog. Ya got it?");
            Dialogue(P_NAME, "Stay away from the sewers, Cuchulainn, Duergars, rebels, Ooze, Slag, and everyone else. Got it!!");
            Dialogue("Cornrow", "You're catchin' on, kid. Now hey, I got somethin' else for ya to do. This one's a little tricky. My nephew Juicebox, he's a good kid but he just don't get math.");
            Dialogue("Juicebox", "I just don't get math.");
            Dialogue("Cornrow", "I gave him some money to get candy at Morty's candy shop. Well Juicebox gives ol' Morty a tenner for a dime candy and gets one neuro-shekel back. Poor Juicebox, he didn't know he got the wrong change.");
            Dialogue("Juicebox", "I didn't know.");
            Dialogue("Cornrow", "So I need you to go to Morty's candy shop and get that change back. Think you can do that?");
            Dialogue(P_NAME, "Sure!");
            Dialogue("Cornrow", "Now that's what I'm talkin' about. Okay, now I'm gonna give you my gun - just show it to Morty to let him know you're there representin' me. Otherwise he'll think you're just horsin' around. His shop is next to granny's place, you must've seen it when you were there earlier. I'd do it myself but I've gotta teach Juicebox his numbers.");
            DialogueItem("Got Cornrow's Gun.");
            scr_event_build_gun_give("cornrowGun");
            Dialogue(P_NAME, "Alright, Mr. Cornrow! I'll be back in no time!");
            Quest("comServ", 4);
        }

        //need to break into house
        else if (Quest("comServ") == 2)
        {
            Dialogue("Cornrow", "Well look who's back, Juicebox. It's our boy wonder, " + P_NAME_S + ". What's going on, kid?"); //gender
            Dialogue(P_NAME, "I forgot where your granny lives. Can I get directions again?");
            Dialogue("Cornrow", "You bet, kid. Granny lives in the poor quarters, the northeast part of Tir na Nog just before the sewers. Her house is the furthest on the left - the old blue shack with the shingles falling off. You can't miss it, it's right next to ol' Morty's candy shop.");
            Dialogue(P_NAME, "Okay, I'll be right back Mr. Cornrow!");
        }

        //rejected quest
        else if (Quest("comServ") == 1)
        {
            Dialogue("Cornrow", "Well would you look at that, Juicebox. The kid's back. What'd I tell ya? I told you he'd come around sooner or later.");
            Dialogue("Juicebox", "That's what you said, Cornrow.");
            Dialogue("Cornrow", "Well what can I do for ya, kid? Have you thought about that proposition I gave you earlier? Me and Juicebox show you the ropes, teach you a few things about Tir na Nog and get you a little pocket change in return for running a few errands for us. It'll only take a moment of your time. That's reasonable, right?");

            Snippet(accept_snippet);
        }

        //never spoken to before
        else
        {
            //Original Lines but intended for a Collision Event, so removing them for something else.
            //Dialogue("Cornrow", "Hey! Hey you! Kid!");
            //Dialogue(P_NAME, "M-me?!");
            //Dialogue("Cornrow", "Yeah you! Walkin' around like you got your shoelaces tied together.");

            Dialogue("Cornrow", "You know where you are, kid? These ain't the 'burbs, this is the real deal. You're walkin' the streets of Tir na Nog.");
            Quest("cornrowTalked", 1);
            Dialogue(P_NAME, "Oh... I'm kinda new here.");
            Dialogue("Cornrow", "Ha! You're tellin' me, kid!!");
            Dialogue("Juicebox", "You're tellin' him!");
            Dialogue("Cornrow", "Lemme tell ya', the alleys of Tir na Nog aren't a good place for kids like you to wander around alone. You never know what kinda creeps are out here. Duergars, Bainshees, all kindsa goons lookin' to rob ya blind. Ha! I bet you don't even got a dime on ya!");
            //Dialogue(P_NAME, "Well, Mr. Wilmer only gave me l_i_t_t_l_e_m_o_n_e_y_.");
            Debug("TODO: Replace this maybe??? Well, Mr. Wilmer only gave me l_i_t_t_l_e_m_o_n_e_y_");
            Dialogue("Cornrow", "Now THAT is a shame, kid. That's a DAMN shame. Ya know, you're lucky you ran into me and my, uh, nephew Juicebox. See, me and Juicebox, we're like the guardian angels of Tir na Nog - we're the good guys, y'know? Nothin' makes us feel better than seein' a new guy like you land on his feet out here. Now me and Juicebox, we got a proposition for ya -");
            Dialogue("Juicebox", "A proposition.");
            Dialogue("Cornrow", "That's right, a proposition. What do you say me and Juicebox show you the ropes around here, fill you in on what's what on the streets and make a little scratch in the process, eh? You don't gotta do nothin' but run a few errands for us and it'll only take a moment of your time. How's that sound, kid?");
            Dialogue(P_NAME, "Well...");

            Snippet(accept_snippet);
        }

    }
    scr_event_advance(event);
}
