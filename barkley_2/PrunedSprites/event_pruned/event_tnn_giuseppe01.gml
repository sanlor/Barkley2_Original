// Script for Giuseppe, when you actually speak to him.
/*
As far as Giuseppe is concerned, the following quest states concern him:
Quest state 3: Just accepted the quest from Lugner/Slag, haven't completed giuseppe's test.
Quest state 4: Completed the test, some questions right, dwarfs sent to Slag.
Quest state 5: Completed the test, some questions right, dwarfs sent to Lugner.
Quest state (?)(quest completed): Dialogue variances after the quest has finished, same dialogue for completing the quest via the Lugner or Slag routes.

For the sake of reference, the following tnn scripts are involved in the progression of this questline: giuseppe01, lugner01, slag01
*/
// usage: event_tnn_giuseppe01();

if (argument0 == SCRIPT_START) {
    // Opening scene with Giuseppe and the two Doubting Dwarfs
    if (scr_quest_get_state("giuseppeScene") == 0) {
        scr_quest_set_state("giuseppeScene", 1);
        scr_quest_set_state("govChurch", 1);
                
        var event = scr_event_create_main();    
        with event {
            //Safety Wait
            scr_event_build_wait(1);
            //Frame up Giuseppe
            scr_event_build_camera_frame(CAMERA_NORMAL, o_giuseppe02, o_giuseppeDwarf01, o_giuseppeDwarf02);
            scr_event_build_wait_for_actions();
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "-but in these troubled times, we must have hope. It's in hope that we find light and salvation.");
            scr_event_build_dialogue("Decrepit Dwarf", NULL, "I'm very hopeful! I can't wait to get our prize from Cuchulainn!");
            scr_event_build_dialogue("Lanky Dwarf", NULL, "I hope it's fruit! I hope it's grapes!");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Yes, my friends! Fruit! Our faith will bear the fruit of salvation! We must cultivate our spiritual gardens and find the peace we were meant to find. Listen closely, my children, for I speak of a fruit of a different flavor.");
            scr_event_build_dialogue("Decrepit Dwarf", NULL, "Fruit? I love fruit! What fruit is it?");
            scr_event_build_dialogue("Lanky Dwarf", NULL, "Is it lemons? I think he's talking about lemons!");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my friends! I don't speak of lemons. I speak of a far sweeter fruit. That fruit... is Clispaeth.");
            scr_event_build_dialogue("Lanky Dwarf", NULL, "Clispaeth? What's that?");
            scr_event_build_dialogue("Decrepit Dwarf", NULL, "That doesn't sound like fruit to me... this guy's full of it!");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Clispaeth is the most splendid fruit of them all! He sacrificed himself in the times before the Cyberpocalypse for the freedom and personal salvation of all dwarfs! All we need to do is have hope and let Clispaeth into our hearts and we can live forever in his spiritual orchard.");
            scr_event_build_dialogue("Lanky Dwarf", NULL, "What a load of buffalo chips! I wanted to talk about real fruit, not this guy who thinks he's a fruit.");
            scr_event_build_dialogue("Decrepit Dwarf", NULL, "What is this clown talking about? This isn't about fruit at all.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Please, you must believe me! Fruit is like a lemon... I mean, believing in Clispaeth is like believing in fruit... I mean...");
            scr_event_build_dialogue("Lanky Dwarf", NULL, "Whatever, I'm outta here...");
            scr_event_build_camera_follow_frame(CAMERA_NORMAL, o_giuseppeDwarf01, o_giuseppeDwarf02);
            scr_event_build_move_to_point(o_giuseppeDwarf01, 192, 360);
            scr_event_build_wait(0.5);
            scr_event_build_move_to_point(o_giuseppeDwarf02, 224, 360);
            scr_event_build_wait_for_actions();
            scr_event_build_camera_frame(CAMERA_FAST, o_giuseppe02);
            scr_event_build_wait_for_actions();
            scr_event_build_move_to_point(o_cts_hoopz, 216, 216);
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "N-no... please, you must believe...");

            //now Hoopz knows about Clispaeth
            Quest("knowClispaeth",1);
            scr_event_build_destroy_object(o_giuseppeDwarf01);
            scr_event_build_destroy_object(o_giuseppeDwarf02);

            //scr_event_build_end();
        }
        scr_event_advance(event);
    }
    else
    {
        with (o_giuseppeDwarf01) instance_destroy();
        with (o_giuseppeDwarf02) instance_destroy();
    }
} 

else if (argument0 == SCRIPT_STEP) {
}

else if (argument0 == SCRIPT_INTERACT) {
    var giuseppe = id;
    var event = scr_event_create_main();
    // Giuseppe's Test Snippet
    var giuseppetest = scr_event_create_child(event);
    var testresults = scr_event_create_child(event);
    
    ////////////////////////
    // Test Tally Snippet //
    ////////////////////////
    
    with testresults {
        // All questions answered incorrectly, 0 Dwarfs.
        if (scr_quest_get_state("dwarfCustody") == 1) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm, yes, I'm afraid you have not performed satisfactorily on this test. I believe I will not be able to grant you any of the Dwarfs in my custody.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "That stinks. Why would they make something so important so hard to understand?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "My child, the fault lies entirely on your own shoulders. These words flow through me like water through a brook, and have since my day of birth. I understand them all, none of Clispaeth's secrets are kept from me.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't see the point of it all if it's just going to cut me off because I don't understand it all exactly right. Isn't being a good person enough?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No. You will never understand Clispaeth. Being GOOD is never enough. You need to be CORRECT.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "That's just not fair.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Please take your lies elsewhere. The book has revealed your true colors, you are nothing but a liar and a scoundrel.");
            scr_event_build_quest_state("lugnerQuest", 4)
            // Check the time on this one! Could be good to have this hear instead of the end?
            // scr_time_change(1);
        }
        
        // All questions answered correctly, 15 Dwarfs.
        else if (scr_quest_get_state("dwarfCustody") >= 15) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Who am I kidding, I don't need to consult my notes. You passed the test perfectly, you speak the language of Clispaeth, you understand his every move.\Tell me, under whose instruction did you study Clispaeth? He is an enviable follower of Clispaeth to have taught so much to someone so young.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I just guessed. I really don't know. I don't know anything about Clispaeth.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Incredible. To do this well on the test without ever studied?\Child, I have never had the privilege of saying this to a newcomer in the ways of our Lord Clispaeth, but whichever path you choose in life, I am certain it will be the path of Clispaeth. This is as great a compliment as I can bestow upon another living being.\I currently am hiding fifteen dwarfs. Their souls are yours, for it is clear to me that this is the will of Clispaeth, and, with you as their shepherd, they shall come to no harm.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh... ok...");
        }
        
        // Some, but not all questions answered correctly. Anywhere between 1-14 Dwarfs.(I'll just refer to this number as [dwarfCustody] for now)
        else if (scr_quest_get_state("dwarfCustody") <= 14) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm, your results were most encouraging! You are but a novice in the ways of Clispaeth, but you have shown me that you are well on your way to a life respectful of the shadow Clispaeth's greatness has cast on all of creation.\As a fellow follower of Clispaeth, I will trust you with some of the dwarfs in my custody. I think " + string(scr_quest_get_state("dwarfCustody")) + " is the correct amount.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok, cool.");
        }
        
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Where do you wish me to send the Dwarfs?");
        var lugnersplit = scr_event_build_choice("/'Where should I send the dwarfs?/'", s_port_hoopz);
        
        // Choice: 1)To the blue container, Lugner 2)To red container, Slag
        with scr_event_build_add_choice(lugnersplit, "The blue container in the warehouse.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Send them to the blue container in the warehouse, Lug-._._._ I mean, our friend is waiting there.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Oh, he's chosen a new location this time, eh? He is always full of surprises. I will send the Dwarfs there. May Clispaeth always be with you in your travels.");
            scr_event_build_quest_state("lugnerQuest", 6)
            scr_event_build_quest_state("giuseppeState", 5);
            // Giuseppe dialogue completed. Lugner route active(lugnerQuest state 6).
        }
        with scr_event_build_add_choice(lugnersplit, "The red container in the warehouse.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "To the warehouse, there's a red container.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmm, really? Well, as you wish. I shall have them meet you there. Clispaethspeed, my son.");
            scr_event_build_quest_state("lugnerQuest", 5)
            scr_event_build_quest_state("giuseppeState", 5); 
            // Giuseppe dialogue completed. Slag route active(lugnerQuest state 5).
        }
        scr_event_build_end();
    }
    
    //////////////////////////////////////////
    /// Book of Clispaeth Test Snippet ///////
    //////////////////////////////////////////
    
    with giuseppetest {
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok, I guess. It's not going to hurt, is it?");
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Goodness, no! If your heart is as pure as I believe it to be, the test shall be as simple as breathing.\Together we shall read the Holy Book of Clispaeth. If you exhibit superior understanding of His holy words, I'll know you are a soul I can trust fully. I shall appoint you the shepherd of the Dwarfs in my care, as I will know then that in your custody they shall come to no harm.");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "This is a pretty big responsibility, but I'll do it.");
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Wonderful! I can feel the sincerity in your voice, child. I think we shall both enjoy this.\The proper method for performing such a test is to read you passages from the Holy Book and leave you to render your feelings on them. What they're trying to say, how you feel about them, what they mean to you.\For you I have chosen my favorite passages, the ones that have had the most value to me, have guided me through the toughest times. This is not merely a test to me, but an expression of what I believe matters most, and a way for us to unite through our devotion to Clispaeth. I urge you to take this test very seriously.\Now, let's begin with a practice verse, shall we?");
        scr_event_build_quest_state("dwarfCustody", 1)
        // Question 0 - Practice
        // NOTE: It's a "practice" round, but you still get points for giving the correct answer. The rest of them just give zero either way so it can't really hurt you.
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Rodman 3:37 /'He who is responsible for desecrating the Cyber-Spear shall perish in flames./'");
        var cyberspear = scr_event_build_choice("/'...desecrating the Cyber-Spear shall perish.../'", s_port_hoopz);
        //q0a)(+0 Dwarfs) "Fire is very important"
        with scr_event_build_add_choice(cyberspear, "Fire is very important") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe it's just talking about how important fire is? You can use it for all sorts of things, I guess. Maybe it's just talking about one of the ways you can use fire.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok...I guess I was wrong...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...");
        }
        //q0b)(+0 Dwarfs) "Do not mess up the Cyber-Spear"
        with scr_event_build_add_choice(cyberspear, "Do not mess up the Cyber-Spear") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it some artifact they're talking about? I think it means they'll die or just be very badly punished if they mess up this spear thing. It sounds really important.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok...I guess I was wrong...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...");
        }
        //q0c)(+0 Dwarfs) "Clispaeth doesn't like you breaking things"
        with scr_event_build_add_choice(cyberspear, "Clispaeth doesn't like you breaking things.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe it means that Clispaeth doesn't like people breaking stuff. Perishing in flames sounds like pretty severe punishment for breaking something. Maybe we aren't supposed to break anything ever!");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok...I guess I was wrong...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...");
        }
        //q0d)(+3 Dwarfs) "A metaphor for smithing a spear"
        with scr_event_build_add_choice(cyberspear, "A metaphor for smithing a spear.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "This is kind of a guess, but is it for how to make a spear? You use flames and stuff to make a spear I think. Desecrating suggests violence I think, maybe it's talking about breaking in the metal and making a spear out of it. Maybe the flames mean you can put a red gemstone in it...\I don't know. I'm terrible at this.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "NO!!!!! You must not say such things!!!! You are absolutely correct!!!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What? I am?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "This is one of the trickiest passages of all Clispaeth's words! I wanted to give you an example of the sheer complexity of Clispaeth's beauty. \I did not expect you to answer it correctly.___.___.___.___son, you may be__.__.__.___\Nevermind, we mustn't jump to conclusions, we have several passages to go. I just want you to know that I am deeply impressed. You are special.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Cool. Thanks...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Let's move on. The next passage!");
            scr_event_build_quest_state_add("dwarfCustody", 3);
        }
        //q0e)(+0 Dwarfs) "I have no idea"
        with scr_event_build_add_choice(cyberspear, "I have no idea.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I have no idea. This is really hard.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "You can't even venture a guess? This one isn't that difficult. It's one of the simplest passages of the entire Holy Book, one of the most basic of all Clispaeth's teachings.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I still don't know. I'm sorry.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmm, yes, well, this verse is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok...I guess that kinda makes sense. I'm really sorry. I'll try harder for the next one.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I should hope so. Certainly the ways of Clispaeth are very mysterious, but this is one of the least mysterious of His words.\Well, that was just for practice. Let's move onto the real test now. The next passage...");
        }
        // Question 1
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Tuberculon 7:43 /'Love thy brother and sister and gremlin such as you love Clispaeth, for their love is as great a bounty as any./'");
        var siblings = scr_event_build_choice("/'Love thy brother and sister and gremlin.../'", s_port_hoopz);
        //q1a)(+0 Dwarfs) "Be nice to your brothers and sisters."
        with scr_event_build_add_choice(siblings, "Be nice to your brothers and sisters.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Does it mean that you should be nice to your brothers and sisters?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm, I'm not sure you've exactly got it. Tell me more.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well, maybe not brothers and sisters. Maybe it means just everybody. You should be nice to everybody.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I'm afraid that is not what this is saying at all. Brother and Sister were the name of two brands of Toffee first released by the Gremlin Corporation sometime around 887 B.E.D. in the Kklugman system. It was then and still is the only Toffee officially recognized by the Church of Clispaeth, as this passage explains.\Remind me when the test is over, I might still have a couple pieces of Sister left... \ Let's move on to the next passage for now.");
        }
        //q1b)(+0 Dwarfs) "You must find where the gremlins are hiding their treasure."
        with scr_event_build_add_choice(siblings, "You must find where the gremlins are hiding their treasure.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You must find where the gremlins are hiding their treasure. It's very important to find the treasure.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "What? What treasure?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uhm... I don't know. I thought it was talking about treasure.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Certainly not, gremlins are too feeble in spirit to have any use for treasure.\Please, try taking this examination a little more seriously. I'm not simply performing this ritual out of some whim, but to ensure you are not going through this life blissfully unaware of the wonders Clispaeth has erected for you. Do you understand?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes, I'm sorry.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Good. Now, let's continue to the next passage.");
        }
        //q1c)(+3 Dwarfs) "Candy is very important."
        with scr_event_build_add_choice(siblings, "Candy is very important.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Candy is very important. We should always eat candy.\That's what I think anyway, I don't really know if that's what this means, but it's what I think.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Yes! So you are familiar with the Brother and Sister line of Toffee? In all the great halls of the finest confectioners in all the galaxy, none have been so pivotal, so praised, as the Gremlin Corporation's line of Brother and Sister brand toffees. The only toffee to be officially recognized by Clispaeth himself.\I wouldn't have known it to look at you, but you must be quite the Gremlin aficionado.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh... it was actually just a guess. I've never heard of it before.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Impressive... so this interpretation just flowed right out of you? Many are misled by the phrasing of this verse. You are showing tremendous understanding of Clispaeth's words.\I eagerly await your reading of this next passage, this is an interesting one...");
            scr_event_build_quest_state_add("dwarfCustody", 3);
        }
        //q1d)(+2 Dwarfs) "Making babies with your brothers and sisters is approved."
        with scr_event_build_add_choice(siblings, "Making babies with your brothers and sisters is approved.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it saying that you are allowed to make babies with your brothers and sisters? Maybe even gremlins too, if that's possible.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm, this is not the reading I was looking for, but this is a very interesting answer. Dwarfs do not procreate, but many of Clispaeth's creatures do. I must meditate more on this sometime...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Darn, I got it wrong.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Yes, but you get bonus Clispaeth points for such an intriguing answer.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh. Are you scoring this? How do you even do that?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Such procedures are rendered from intimate reading of the Holy Book, my child. This is a very advanced procedure, you are not old enough to understand.\Now, the next passage!");
            scr_event_build_quest_state_add("dwarfCustody", 2);
        }
        //q1e)(+0 Dwarfs) "There are many sorts of useful mining tools."
        with scr_event_build_add_choice(siblings, "There are many sorts of useful mining tools.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it talking about the things you use to mine stuff? Maybe brother and sister and gremlin are talking about the different tools you use to mine.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I'm afraid this is not a sound reading of the passage. Mining tools are certainly important, and are covered in greater depth in other sections of the Good Book, but this is not one of them.\This passage refers to the Brother and Sister brands of Toffee first released by the Gremlin Corporation sometime around 887 B.E.D. in the Kklugman System. It was then and still is the only Toffee officially recognized by the Church of Clispaeth, as this passage explains.\Let's move onto the next passage, shall we?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "ok...");
        }
        //Question 2
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Marv 5:47 /'Those not mummified upon death are unfit for Clispaeth's holy quarters./'");
        var mummy = scr_event_build_choice("/'Those not mummified upon death.../'", s_port_hoopz);
        //q2a)(+0 Dwarfs) "Clispaeth likes mummies a lot."
        with scr_event_build_add_choice(mummy, "Clispaeth likes mummies a lot.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it saying that Clispaeth just likes mummies a lot? Maybe all his best friends are mummies. That would be kinda cool I guess, but I've never met a mummy, I don't know if I'd like them.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "ABSOLUTELY NOT.\I can assure you that you would NOT like mummies if you are at all committed to Clispaeth. Mummies and Clispaeth are NOT compatible, do not let any heretic inform you otherwise.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry, I didn't know. This one is really confusing.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, there's nothing confusing about it. It's talking about something completely different.\I'm...I'm sorry to react in such a way. I do not usually lose my composure so easily, but mummies are...they're...\Let's just move to the next passage. This is a very sensitive topic for me.");
        }
        //q2b)(+1 Dwarfs) "You must get mummified when you die."
        with scr_event_build_add_choice(mummy, "You must get mummified when you die.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess it's saying that you need to be mummified when you die, or you aren't getting into this holy quarters place. But._._._ well, that sounds kinda gross. Who would want to be mummified? I don't want to ever be a mummy.\Oh! I'm sorry, I didn't mean to offend...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my son, no need to apologize. You are grossly incorrect in your reading of this passage, but it pleases me greatly to see a youngster fully aware of the sheer obscenity of mummification. I'm afraid it's become all the rage with younger generations nowadays, not even the church or His holy words have been enough to stop it.\There are heretics to have even claimed that Clispaeth himself has proclaimed that mummification is essential, and for the life of me I can't begin to understand how such beautiful words can be perverted so profoundly.\Please, let us move on to the next passage. I find this topic deeply distressing.");
            scr_event_build_quest_state_add("dwarfCustody", 1);
        }
        //q2c)(+0 Dwarfs) "You must preserve all foods through mummification."
        with scr_event_build_add_choice(mummy, "You must preserve all foods through mummification.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe that means that you should mummify all food before you eat it?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, nobody should ever do that. Is there something you're not telling me, my son? Remember, you can always speak to me if you have found yourself on a troubling path and need guidance. Clispaeth is always there for you during these difficult times...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh, no, it was just a guess. I really don't know what the passage means.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Very well, if this is what you say. Just remember that mummification is strictly forbidden by the church of Clispaeth. This is no more true than it is for the mummification of foods. It's a practice that simply must not be done.\Granted, there may have been followers of Clispaeth lost to the pages of history for misunderstanding His words and finding themselves consuming embalming fluid, but the galactic record goes to great lengths to disregard such aberrations.\Let's move on to the next passage. We can discuss this issue in greater length later, if you wish.");
        }
        //q2d)(+0 Dwarfs) "You must protect all tempered metals from rust."
        with scr_event_build_add_choice(mummy, "You must protect all tempered metals from rust.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I think it is saying that you must protect all tempered metals from rust, rub ointment on them and cover them up with something to preserve them. I don't think Clispaeth would like rust very much, stuff that's rusty doesn't work as well.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, that's not quite right. In fact, Clispaeth doesn't have as strong a stance against rust as you might think, all metals are welcome in the Great Halls of Clispaeth, come rust or shine. Clispaeth's boundless love for rusty metals is one of the wonderful surprises of His greatness.\No, this passage concerns the body. It's the conclusion of Clispian scholars that this passage is outlining that the first step, indeed most essential step, in being welcomed into Clispaeth's heart is to make sure you are clothed continuously. There is no place in Clispaeth's heart for a naked man...\It saddens me to think what Clispaeth thinks when He sees these revolting heretics marching around in speedos, unaware of the travesty they are committing.\Let's move onto the next passage, it's not wise to consider naked people as long as we already have...");
        }
        //q2e)(+3 Dwarfs) "Naked people are really gross."
        with scr_event_build_add_choice(mummy, "Naked people are really gross.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Naked people are really gross. I think this is just saying that you need to be wearing shirts and pants and stuff if you want to get into this place.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Ah! Excellent! You are correct!!!\Many novice followers of Clispaeth get lost in some of the archaic slang of this verse, but this is exactly what this passage is talking about.\Clispian scholars have concluded that Clispaeth, indeed, finds naked people /'gross,/' as you say. The first step, indeed most essential step, in being welcomed into Clispaeth's heart is to make sure you are clothed continuously. There is no place in Clispaeth's heart for a naked man...\It saddens me to think what Clispaeth thinks when He sees these revolting heretics marching around in speedos, unaware of the travesty they are committing.\Let's move onto the next passage, it's not wise to consider naked people as long as we already have...");
            scr_event_build_quest_state_add("dwarfCustody", 3);
        }
        //Question 3
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Wilt 2:11 /'Thus, Clispaeth spake: Inside each of you are a multitude of perceptions and identities, for within each individual spirit resides everything./'");
        var perceptions = scr_event_build_choice("/'...a multitude of perceptions and identities.../'", s_port_hoopz);
        //q3a)(+3 Dwarfs) "Eat grapes to cure disease."
        with scr_event_build_add_choice(perceptions, "Eat grapes to cure disease.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't really understand this one. I'm going to guess that it's just saying that you should eat lots of grapes to cure diseases.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "A guess? I think not. You've clearly studied Clispaeth before, as this is precisely what this passage is saying. Indeed the Book of Wilt's function is a complete, exhaustive explanation of the health benefits of regular grape consumption.\This passage in particular is useful in its suggestion to consume grapes as a treatment for radiation sickness. The /'multitudes of perceptions and identity/' noted in this passage is a reference to one of the tragic mental illnesses caused by advanced radiation poisoning.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't like fruit that much. I like candy more.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Well, you'll be able to get by if you can avoid radiation sickness, but I strongly suggest adding grapes to your diet to improve your overall health and stamina. You'll live much, much longer.\Let's go to the next passage. I had some simpler passages for you, but we can skip ahead to the more advanced stuff now. It's clear you truly understand Clispaeth.");
            scr_event_build_quest_state_add("dwarfCustody", 3);
        }
        //q3b)(+0 Dwarfs) "It is good to collect all kinds of gems."
        with scr_event_build_add_choice(perceptions, "It is good to collect all kinds of gems.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it saying something about how it's good to collect all sorts of gems? I don't know anything about gems, but maybe it's just trying to tell you to learn all about them and collect as many as you can.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Well, no, this sort of sentiment isn't really covered in the good book. In fact, dwarf scholars have pointed out that, gems being what they are, mention of this specific concept isn't something that even needs to be mentioned in Clispaeth's doctrines.\The necessity for gems is one of the core Clispaeth-given necessities of dwarfs, one of our key defining traits. It's pointless to point out such core necessities, much in the way it's pointless to devote verses of His book to explaining how much gremlins need garbage.\No, my son, I'm afraid you're trying too hard, looking too deep into His words. You need to loosen your perceptions, let the words flow through you. You're close, I can feel it.\Let's try one more passage, shall we?");
        }
        //q3c)(+1 Dwarfs) "Sometimes there are dogs around to rescue you."
        with scr_event_build_add_choice(perceptions, "Sometimes there are dogs around to rescue you.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe it's talking about dogs. There are a lot of dogs and dogs are really cool, they can do all kinds of neat stuff. They can come to rescue you sometimes.\I wish I had a dog...maybe if I had a magical dog whistle I could get a bunch of dogs to hang out with me whenever I wanted...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Well, your reading of this particular passage isn't accurate, but I am taken slightly aback by your mention of dog whistles. This is an expert topic in Clispian research...\In the early eras of Clispaeth's reign, Dog Whistles were the most prized of all commodities, Dogs would never bite if you had a dog whistle. They were thus known as the great protectors of Clispaeth's closest followers.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wow. That sounds useful. I'd love to get one of these dog whistles...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I'm afraid all the master craftsmen of dog whistles have long since been slain. The last reported sighting of one was during the days of the Gaze=Belork Phenomenon, and even that might simply be a myth. It's unthinkable that you'll ever see a dog whistle in your lifetime.\I can tell this fact is upsetting you. Let's move on to the next passage.");
            scr_event_build_quest_state_add("dwarfCustody", 1);
        }
        //q3d)(+0 Dwarfs) "Eating rotten fruit is dumb."
        with scr_event_build_add_choice(perceptions, "Eating rotten fruit is dumb.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I think it's talking about how fruit can go bad and become rotten, and you shouldn't eat fruit when this happens.\I kinda think eating fruit is dumb, but eating rotten fruit is even more dumb.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "This is vastly incorrect, on both counts. I think you might need a slight reality-check if you think eating fruit is /'dumb,/' as you say.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I can't help it, I just don't like fruit. I don't even like candy apples that much. I'll eat it because it's still candy, but I can't get over that it's an apple. That's really gross.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Very well. What would you say if I told you eating candy was /'stupid/' or /'dumb/'?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know. I guess you're entitled to your opinion, but...\... I just don't think you're right. Candy is the best.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "But it wounds you slightly to hear others say such things, doesn't it? Maybe now you understand how you've made me feel...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh._._._ I'm sorry...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I accept your apology. You can wound me as much as you please, but please try to keep an open heart and an open mind when it comes to Clispaeth.\I think we're close to finished. Let's review this final passage...");
        }
        //q3e)(+0 Dwarfs) "Everyone is cool and beautiful."
        with scr_event_build_add_choice(perceptions, "Everyone is cool and beautiful.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I think it's saying that everyone is pretty cool, we have all kinds of beautiful things going on inside our heads, different ways of looking at things. We're all important! We're the universe.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmm, no, I don't think so. No, Clispaeth is important, Clispaeth is the universe. We are just His humble servants. Please be aware of this distinction.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh... so we aren't important, then?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No. Look at it this way: Individual lives are like grains of sand on the great beach of Clispaeth. You don't go to the beach for an individual grain of sand, or the sand at all, you go for the beach itself. Clispaeth is the beach.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh. So if we're all dead, there's no more Clispaeth? Doesn't that make us important? There won't be a beach without any sand...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No. You simply do not._._._ *sigh*\Let's just move on to the next passage. I don't think you're sufficiently advanced in the ways of Clispaeth to understand this yet.");
        }
        // Question 4
        scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Carl 23:11 /'The truly pious life is not one achieved through worship, or sacrifice, or servitude, or punishment, but one forever embracing all the beauties of consciousness./'");
        var pious = scr_event_build_choice("/'...pious life is not achieved through worship.../'", s_port_hoopz);
        //q4a)(+0 Dwarfs) "There isn't a right way or wrong way to find Clispaeth."
        with scr_event_build_add_choice(pious, "There isn't a right way or wrong way to find Clispaeth.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe it's just saying that there isn't a right or wrong way to find Clispaeth. Maybe he's everywhere, like in the ground, or the food we eat, or the telephone, or dwarfnet, just everything! Just being alive means you're hanging out with Clispaeth.\That would be kinda cool. He's just making this big playground for us all to hang out in. The rest is up to us.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I'm afraid this is not a correct way of looking at Clispaeth, young man. Of course there are rules, Clispaeth wouldn't have created this book if there weren't rules.\And how exactly can he be everywhere? A rock is a rock, Clispaeth isn't hiding in it. With that logic, I'd be Clispaeth, or you'd be Clispaeth. I'll just say that this treads on blasphemy and leave it at that.\We are but parasitic organisms clinging to the wondrous canvas Clispaeth has painted for us.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sorry, I didn't know...\I just thought it was a cool idea I guess. It's a shame it's wrong.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "It's just fortunate I was here to assist you. The path of Clispaeth is not a simple one, but it is one well worth traveling.\Well, I think that does it for the test. Let me just run through some of the notes I was taking, and I will tally up your score.");
        }
        //q4b)(+0 Dwarfs) "Wearing jorts is forbidden."
        with scr_event_build_add_choice(pious, "Wearing jorts is forbidden.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You are never allowed to wear Jorts. According to Clispaeth, wearing Jorts is strictly forbidden and you will be punished for doing so.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Absolutely not! Where did you hear such hogwash? I've known many deeply pious individuals to spend the majority of their life wearing jorts.\And might I add, rare is it that I have encountered a scholarly reference to jorts in all my years of Clispian study, at the very least not one of such bias. For now, the official stance of the church is that Clispaeth is PRO-JORTS, do not spread misinformation to the contrary. The Clispian faith does not need such negative anti-jort speculations floating about.\Am I understood?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes, sir...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Very well. This concludes the test. Let me just run through some of the notes I was taking, and I will tally up your score.");
        }
        //q4c)(+0 Dwarfs) "We should be playing basketball instead of reading the Holy Book."
        with scr_event_build_add_choice(pious, "We should be playing basketball instead of reading the Holy Book.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "We should be playing Basketball instead of reading the holy book. It sounds like a pretty cool book, but I think Basketball is the most beautiful thing in my life. I think this is saying I should find all the beautiful things in life.\Maybe not even just Basketball, maybe there are other things I'll like almost as much as Basketball. I won't have time to read this book over and over again if I'm out looking for all that cool stuff.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "No, my son. You couldn't be more wrong...\I had hoped you were different from all the others, that you wouldn't just turn your back on Clispaeth... for Basketball...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry, I'm just kinda saying whatever. I just really like Basketball. Maybe there's room in my life for both Clispaeth AND Basketball... maybe.\(Is that possible...)");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I understand. And you will hopefully have a long life ahead of you, one where you must decide what is truly important. Dwarfs such as myself can only guide you on this journey. These big decisions are something you need to sort out with Clispaeth...\Well, I shouldn't dwell too much on this one passage. It is just one among many, let me consult my notes, and see how where you really stand in the domain of Clispaeth...");
        }
        //q4d)(+3 Dwarfs) "Gemstones are alive and do not need to follow Clispaeth's rules."
        with scr_event_build_add_choice(pious, "Gemstones are alive and do not need to follow Clispaeth's rules.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is it actually talking about gemstones? Gems are really pretty, maybe it's talking about them, like they're really alive.\Maybe they don't need to go to church or read the book, they just need to be as pretty as possible, that's what they're there for.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Wait, slow down a minute. We're just talking about a standard reading of Clispaeth's book, you're getting into the upper echelon of Clispian theory now.\Yes, son, you are correct, possibly more correct than anyone knows. This passage indeed speaks of gemstones, but the question as to whether or not they are living creatures themselves is something constantly in debate amongst the most revered of Clispian scholars. Such debates probe the most mysterious of Clispaeth's secrets, investigation into the matter is never to be taken lightly.\It is, to say the least, staggeringly impressive that you are aware of such things at such an early age.\I believe I've questioned you enough. Despite your years, it's clear to me now you are a true Clispian. The remaining 173 passages are not necessary for the test, unless you wish to review them with me to pass the time?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, that's ok, some other time maybe. He told me I should hurry, the ship is leaving soon.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Ah, yes! I had nearly forgotten why we were doing this. I suppose I was rather caught up in the moment.\Very well. Allow me a moment to glance through my notes here...");
            scr_event_build_quest_state_add("dwarfCustody", 3);
        }
        //q4e)(+1 Dwarfs) "I'm really hungry."
        with scr_event_build_add_choice(pious, "I'm really hungry.") {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm really hungry, do you have anything to eat?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm, a curious response, but I'm afraid that's not what this passage means. That would be a strange thing for Clispaeth to wish to convey to His followers...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "That wasn't my answer. I'm just really hungry.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Oh...well I don't have any food for you. The Church has been terribly short on donations lately. I'm sorry. Do you have any idea what the reading of this passage is?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know, I can't concentrate on an empty stomach.\Maybe it just means that you can't ever ride a kangaroo. Kangaroos are pretty dangerous, they can punch you out. You shouldn't try to ride something that can punch you out.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "It looks like I wore you out here, young man. You're not making much sense anymore. My apologies. Sometimes I forget how exhausting Clispian study is to the uninitiated.\I had a couple dozen more passages for you to review, but we can stop here if you're feeling weary. Let me just review your answers thus far...");
            scr_event_build_quest_state_add("dwarfCustody", 1);
            
        }
        scr_event_build_quest_state("giuseppeState", 4);
        scr_event_build_execute_event_script(event_tnn_giuseppe01);
    }
    
    ///////////////////////////
    // Test Snippet Complete //
    ///////////////////////////
    
    /////////////////////////
    // MAIN EVENT ///////////
    /////////////////////////
    
    with (event) {
        
        if (scr_quest_get_state("giuseppeState") == 4) {
            scr_event_build_event_snippet(testresults);
        }
        else if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "It's been quite a while since I've seen you here, Matthias. Perhaps you've finally seen the light and decided to let Clispaeth into your heart?");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Ahhh, yep! Definitely. I definitely did that, and I'm definitely Matthias. Well, time to get going! Let's have a prayer sesh later, you and me. Some good, old-fashioned Clispaeth prayers. Well, bye!");
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "It's not often that a Duergar deigns to visit this humble abode of Clispaeth. Could it be that you've seen the wisdom in Clispaeth's teachings and have chosen to walk His sacred path?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Uh, yep! Yes, that is precisely what happened and I am definitely a real, dyed-in-the-wool Duergar. Big time. Well, I'm out of here to do some prayers. May Clispaeth be with you.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(I don't think that went well... why do I keep talking to people?)");
        } else if (scr_quest_get_state("giuseppeState") == 8) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I'm such a failure...\I'm sorry...Clispaeth...");
        } else if (scr_quest_get_state("giuseppeState") == 7) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hello again, young man...no luck with that water purification chip, I imagine...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry. I just haven't seen one.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Well...don't let it ruin your day if you can't find one. These obstacles are all part of Clispaeth's plan... we're just...\We just have to put our faith in Clispaeth. It's all we have left...");
            scr_event_build_quest_state("giuseppeState", 8);
        } else if (scr_quest_get_state("giuseppeState") == 6) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Giuseppe: Saint Slag of Tir na Nog. Has a nice ring to it.");
        } else if (scr_quest_get_state("lugnerQuest") == 9) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Who would have thought a Kobold was capable of such kindness...\To take all these Dwarfs on his Ruby Yacht...to live in his mansion on his private island...a true paradise for Dwarfs, free of persecution...\____.____.____.____I must nominate Slag for sainthood sometime...");
            scr_event_build_quest_state("giuseppeState", 6);
        } else if (scr_quest_get_state("lugnerQuest") == 7) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Who would have thought a Kobold was capable of such kindness...\To take all these Dwarfs on his Ruby Yacht...to live in his mansion on his private island...a true paradise for Dwarfs, free of persecution...\____.____.____.____I must nominate Slag for sainthood sometime...");
            scr_event_build_quest_state("giuseppeState", 6);
        } else if (scr_time_get() > 3) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "This won't do... this just won't do at all...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, is something the matter?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hmmm? Oh._._._ yes... I was talking to myself just now wasn't I? I'm sorry to bother, pay no mind to._._._ say, do you happen to have a water purification chip? I need it for the dwarfs I-some... friends of mine...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't think so. I guess I could keep an eye out for one, though. What do they look like?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Oh, well, my friends look like any other friends. Maybe they look like some friends you have. They're just my friends, nobody you should be worrying yourself with.\Look, just forget I said anything, ok? Don't trouble yourself to tell the duergars about my friends, they aren't anybody special.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, I mean the water purification chip. I don't know what that is, I've never seen one!");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Oh! How foolish of me!\Yes, a water purification chip. I...don't know what they look like either. They just said they need one or they'd...\They just really need one. It's extremely important.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll keep an eye out for one, ok? You seem really upset about it.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Would you? That would be wonderful. I don't know if there are even any around here, but it means so much that you're even listening to me. Bless you, child...");
            scr_event_build_quest_state("giuseppeState", 7);
        } else if (scr_quest_get_state("giuseppeState") == 5) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I've sent word to the dwarfs in hiding, they should be meeting up with our friend right about now.\Many thanks for your assistance. You are a wonderful young man.");
        } else if (scr_quest_get_state("giuseppeState") == 4) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "We have nothing more to talk about.");
        } else if (scr_quest_get_state("giuseppeState") == 3) {
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Greetings, child. It's good to see you again. \ Are you prepared for the test?");
            var choice = scr_event_build_choice("Am I prepared for the test?", s_port_hoopz);
            // Choice: "Are you prepared for the test?" State 4: "Uh, maybe later." ; State 6: "Ok, I guess."
            with scr_event_build_add_choice(choice, "Ok, I guess.") {
                scr_event_build_event_snippet(giuseppetest);
            }
            with scr_event_build_add_choice(choice, "Uh, maybe later.") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh, maybe later. I don't think I'm ready for a test right now.");
                scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "As you wish. I shall remain here for when you have built up enough courage for the task.");
            }
        } else if (scr_quest_get_state("lugnerQuest") == 3) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, excuse me, are you Father Giuseppe?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "That I am, child. Is there something you wish of me?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm, uh... supposed to talk to you about... uh...");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "What weighs on you, son? Is something the matter?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, you see, a friend of mine told me to talk to you about._._._ something._._._ involving a cargo ship. I'm not supposed to say much about it.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Ah, yes! You are a messenger for our *ahem* friend.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "He told me to keep it a secret. He said it could get him into trouble.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I understand. It warms my heart to see a youngster like you getting involved in this. You must have a big heart to be doing something so risky.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well, it's nothing. I want to help the Dwarfs any way I can.");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Yes, I can see that. I vowed to the church to protect them, after all. I would not be fit to be a messenger of Clispaeth if I was not prepared to protect them at all costs.\But, first I think I must perform a test to see if your heart is as pure as it appears to be.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "A test?");
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Indeed. You see, there are many nefarious figures here. You can't always tell someone's intentions by looking at them. Take your friend, for instance. I had reservations about his intentions, but he's shown me my worries were misplaced. It's important I find out the same about you.");
            var choice = scr_event_build_choice("Am I prepared for the test?", s_port_hoopz);
            // Choice: "Are you prepared for the test?" State 1: "Uh, maybe later." ; State 3: "Ok, I guess."
            with scr_event_build_add_choice(choice, "Ok, I guess.") {
                scr_event_build_event_snippet(giuseppetest);
            }
            with scr_event_build_add_choice(choice, "Uh, maybe later.") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh, maybe later. I don't think I'm ready for a test right now.");
                scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "As you wish. I shall remain here for when you have built up enough courage for the task.");
                scr_event_build_quest_state("giuseppeState", 3);
            }
        } else if (scr_quest_get_state("giuseppeState") == 2) {
            // Not interested in Clispaeth.
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Hello again, " + P_NAME + ". I hope you've rethought your stance on Clispaeth. I'm always here to talk if you want to.");
        } else if (scr_quest_get_state("giuseppeState") == 1) {
            // Believe in Clispaeth.
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "It's good to see you again, " + P_NAME + ". If you ever want to talk, I'm always here.");
        } else {
            // Never talked to.
            scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "I don't know what I'm doing wrong. No matter how hard I try, I just can't seem to get younger dwarfs to care about Clispaeth. My congregation consists almost exclusively of older dwarfs like Vivian. I hope that someday my message of hope and salvation reaches more callow ears.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Mr. Giuseppe? I just wanted you to know...");
            
            var clispaeth = scr_event_build_choice("What do you say?", s_port_hoopz);
            with (scr_event_build_add_choice(clispaeth, "I believe in Clispaeth.")) {
                // I believe.
                //ROUNDMOUND: Clispaeth
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I believe in Clispaeth.");
                scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "Thank you, child; you give hope to an old heart. It is sometimes demoralizing to see Clispaeth's message falling on deaf ears, but I know it's too important to stop trying. If you ever need someone to talk to, whether it's about Clispaeth or life or anything, I am always here.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Thank you, Father Giuseppe. I'll remember that.");
                scr_event_build_quest_state("giuseppeState", 1);
            }
            with (scr_event_build_add_choice(clispaeth, "I'm not interested in Clispaeth.")) {
                // Not interested.
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not interested in Clispaeth.");
                scr_event_build_dialogue("Giuseppe", s_port_giuseppe, "That... that is disheartening to hear. Know that no matter what you do, whether or not you're a dwarf, Clispaeth sacrificed himself so you could live a fulfilled life. Please take some time to rethink Clispaeth.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Umm, I'll think about it...");
                scr_event_build_quest_state("giuseppeState", 2);
            }
        }
    }
    scr_event_advance(event);
}
