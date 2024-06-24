// event_swp_safiatou01
// Safiatou sells Hard Tack in the swamp!

/*if (argument0 == SCRIPT_START)
{
    
    // load save data if it exists
    if scr_savedata_contains("supergrid") {
        global.supergrid = scr_savedata_get("supergrid");
    }
    
    // if safiatou is in the dilapidated zone
    if (scr_quest_get_state("safiatouOffer") == 3) {
        scr_event_interactive_deactivate();
        scr_actor_unsetRigid(id);
    }
}

if (argument0 == SCRIPT_STEP)
{

}

else if (argument0 == SCRIPT_INTERACT)
{
    var safiatou = id;
    
    // portrait
    var safiaport = "s_port_safiatou";
    
    // events & snippets
    var event = scr_event_create_main();
    var togo_snippet = scr_event_create_child(event);
    var question_snippet = scr_event_create_child(event);
    var goodbye_snippet = scr_event_create_child(event);
    var confess_snippet = scr_event_create_child(event);
    var move_in_snippet = scr_event_create_child(event);
    

    // rent to be offered
    var safiatou_rent = 50;
    // minimum value requirement
    var safiatou_req = 50;

    
    // salutation
    var salutation = "";
    if (scr_time_get() <= 7) { salutation = "Good morning!"; }
    else if (scr_time_get() <= 16) { salutation = "Good afternoon!"; }
    else { salutation = "Good evening!"; }
    
    // hardtack price
    var price = 10
    var bill = 0;
    bill = scr_quest_get_state("safiatouBill");

    
    //------------------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------------------
    with (event) {
        
        //---------- handler stuff ----------//
        
        // goodbye...
        if (scr_quest_get_state("safiatouGoodbye") == 1) {
            scr_event_build_event_snippet(goodbye_snippet);
        }
        
        // in loop...
        if (scr_quest_get_state("safiatouTalkLoop") == 1) {
            scr_event_build_event_snippet(questions_snippet);
        }
        
        // forward to togo snippet if transferring from safiatouDine
        if (scr_quest_get_state("safiatouTogo") == 2) {
            scr_event_build_event_snippet(togo_snippet);
        }
        
        // send to event_swp_safiatouDine01 if still eating
        else if (scr_quest_get_state("safiatouDine") == 2) {
            scr_event_build_execute_event_script(event_swp_safiatouDine01);
        }
        
        //---------- regular stuff ----------//
        
        // normal, get questions
        else {
            // first talk
            if (scr_quest_get_state("safiatouDine") == 0) {
                scr_event_build_dialogue("Safiatou", safiaport, "Hemalatha's Hardtack. Are you dining in, or taking something to-go?");
            }
            
            // already dined in
            else if (scr_quest_get_state("safiatouDine") >= 3) {
                // first time talking after dining
                if (scr_quest_get_state("safiatouDine") == 3) {
                    switch (scr_quest_get_state("safiatouTip") / scr_quest_get_state("safiatouBill"))
                    {
                    // different dialogue based on tips
                    case 2:
                        scr_event_build_dialogue("Safiatou", safiaport, "Welcome, welcome back! It's great to have you back to Hemalatha's Hardtack! It was a pleasure serving you during your last visit. Unfortunately, we'll need some time to prepare for another guest, but the kitchen has some hardtack already prepared if you'd like to get something to-go. What can I do for you?");
                        break;
                    case 0.5:
                        scr_event_build_dialogue("Safiatou", safiaport, "Welcome back to Hemalatha's Hardtack! How good of you to return! Unfortunately, we'll need some time to prepare for another guest, but the kitchen has some hardtack already prepared if you'd like to get something to-go. What can I do for you?");
                        break;
                    case 0.2:
                        scr_event_build_dialogue("Safiatou", safiaport, "Welcome back to Hemalatha's Hardtack! Unfortunately, we'll need some time to prepare for another guest, but the kitchen has some hardtack already prepared if you'd like to get something to-go. What can I do for you?");
                        break;
                    case 0:
                        scr_event_build_dialogue("Safiatou", safiaport, "Oh... it's you. What do you want? Table service is closed. The kitchen's made some hardtack if you're trying to get something to go.");
                        break;
                    }
                }
                // 2+ times after dining
                else {
                    scr_event_build_dialogue("Safiatou", safiaport, "Welcome back to Hemalatha's Hardtack! We're still unable to serve any more tables right now, but carryout orders are fine. What can I do for you?");
                }
            }
            
            // canceled AND saw togo snippet
            else if (scr_quest_get_state("safiatouDine") == 1) && (scr_quest_get_state("safiatouTogo") == 1)
            {
                scr_event_build_dialogue("Safiatou", safiaport, "Welcome back to Hemalatha's Hardtack! What can I do for you?");
            }
            
            // QUESTION: HERE OR TO GO
            var here_or_togo = scr_event_build_choice("What will it be?", s_port_hoopz);
            
            // CHOICE 1:
            // To Go, open Safiatou's Shop
            var take_togo = scr_event_build_add_choice(here_or_togo, "Hardtack to go.");
            with (take_togo) {
                scr_event_build_quest_state("safiatouTogo", 1);
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll get some hardtack to go.");
                // first time getting to-go, never dined
                if (scr_quest_get_state("safiatouTogo") == 0) && (scr_quest_get_state("safiatouDine") == 0) {
                    scr_event_build_dialogue("Safiatou", safiaport, "Just to-go? You don't want to... I mean, are you sure you don't want to dine in? Well... oh... okay. Well, here's what I've got...");
                }
                // 2+ to-go or already dined
                else {
                    scr_event_build_dialogue("Safiatou", safiaport, "*Sigh*... Okay, then. Here's what I have."); 
                }
                // goto shop
                scr_event_build_event_snippet(togo_snippet);
            }
            
            // CHOICE 2:
            // Eat here, go to Safiatou Dining event
            if (scr_safiatou_table_ready() == true) {
                var eat_here = scr_event_build_add_choice(here_or_togo, "Dine in.");
                with (eat_here) {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll sit down and eat here.");
                    // first time
                    if (scr_quest_get_state("safiatouWait") == 0) 
                    {
                        scr_event_build_dialogue("Safiatou", safiaport, "Wonderful. Today we're offering a selection of hardtack dishes ranging from 10 to 30 neuro-shekels. You're actually our first customer of the day, so it will take some time to get your table ready. Certainly no longer than an hour. Do you mind waiting here?");
                    }
                    // changed mind before
                    else {
                        scr_event_build_dialogue("Safiatou", safiaport, "Wonderful. Have you changed your mind? Will you wait to be seated? Do you mind waiting here for awhile?");
                    }
                    
                    Breakout("build", "add", "money");
                    // QUESTION: CONFIRM WAIT FOR TABLE?
                    var dine_choice = scr_event_build_choice("Wait around?", s_port_hoopz);
                    
                    // CHOICE 1:
                    // don't wait
                    var dine_no = scr_event_build_add_choice(dine_choice, "Nope! I don't have time to wait around.");
                    with (dine_no) 
                    {
                        Breakout("build", "clear");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "No way, I don't have time to wait! I only eat on the go! You'll never catch me slowin' down!");
                        scr_event_build_dialogue("Safiatou", safiaport, "Well, that's unfortunate. Perhaps I can offer you a carryout meal instead? Just let me know!");
                        scr_event_build_quest_state("safiatouWait", 1);
                    }
                    
                    // CHOICE 1:
                    // wait, advance time, eat at the restaurant
                    var dine_confirm = scr_event_build_add_choice(dine_choice, "Sure! A good meal is worth the wait.");
                    with (dine_confirm) 
                    {
                        Breakout("build", "clear");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sure! You know what they say... a good meal is worth the wait. I'm ready to damage my slim waistline! I'm ready to gomp!");
                        scr_event_build_dialogue("Safiatou", safiaport, "Superb. Just one moment, and I'll prepare your table.");
                        scr_event_build_quest_state("safiatouTogo", 0);
                        scr_event_build_quest_state("safiatouDineStart", 1);
                        // INCREASE TIME
                        scr_event_build_time_add(1);
                        // start dining event
                        scr_event_build_teleport(room, o_hoopz.x, o_hoopz.y);
                        // this will begin the autostart event, event_swp_safiatouDine01
                    }
                }
            }
            
            // CHOICE 3:
            // Questions, available after dining.
            if (scr_quest_get_state("safiatouDine") == 2) 
            {
                var ask_questions = scr_event_build_add_choice(here_or_togo, "Just talk.");
                with (ask_questions) 
                {
                    if (scr_quest_get_state("safiatouTalk") >= 2) 
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'd actually just like to talk.");
                        scr_event_build_dialogue("Safiatou", safiaport, "Great! What's going on?");
                    }
                    if (scr_quest_get_state("safiatouTalk") >= 1) 
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I thought we could just talk.");
                        scr_event_build_dialogue("Safiatou", safiaport, "Umm... okay. Well, what do you want to talk about?");
                    }
                    else                    
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'd actually just like to chat a little. I bet you get bored out here in the swamp, huh?");
                        scr_event_build_dialogue("Safiatou", safiaport, "You mean, just talk? Not as a customer and waiter? Um... I'm not really used to that, but I'll try. So... you start I guess.");
                        scr_event_build_quest_state("safiatouTalk", 1);
                    }
                    scr_event_build_event_snippet(question_snippet);
                }
            }
            
            // CHOICE 4:
            // Tell her about Hemalatha's plot
            var hema = scr_event_build_add_choice(here_or_togo, "Tell her about Hemalatha's plot.");
            with (hema)
            {
                scr_event_build_event_snippet(confess_snippet);
            }
            
            
            // CHOICE 5:
            // Nothing, exit conversation
            var leave = scr_event_build_add_choice(here_or_togo, "Nothing, leave.");
            with (leave) 
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Nah, I'm not hungry. Nothing for me! Bye!");
                scr_event_build_end();
            }
        }
    }
    
    //------------------------------------------------------------------------------------------
    // togo_snippet
    //------------------------------------------------------------------------------------------
    with (togo_snippet) 
    {
        var purchased = store("Safiatou");
        if (purchased = true) 
        {
            scr_event_build_dialogue_debug("bort", NULL, "You bought something.");
        }
        else 
        {
            scr_event_build_dialogue_debug("bort", NULL, "You didn't buy something.");
        }
    }
    
    
    //------------------------------------------------------------------------------------------
    // question_snippet
    //------------------------------------------------------------------------------------------
    with (question_snippet) 
    {
    
        if (scr_quest_get_state("safiatouTalk") == 0) 
        {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well first of all, what are you doing out here in the swamp?");
            scr_event_build_dialogue("Safiatou", safiaport, "Running a restaurant of course, Hemalatha's Hardtack.");
            if (scr_quest_get_state("hemalathaScene") == 0) 
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm a little confused... I thought your name was Safiatou. Who's Hemalatha?");
                scr_event_build_dialogue("Safiatou", safiaport, "Hemalatha is my employer and caretaker. I've been working for her as long as I remember. I have lots of tasks, but my most important duty is cooking the hardtack, which she then sells.");
            }
            else 
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hemalatha, that's your boss in Al-Akihabara, right?"); //(Tell me about Hemalatha)
                scr_event_build_dialogue("Safiatou", safiaport, "I suppose you could say that... I've worked for Hemalatha pretty much as long as I can remember. When I was just a young dwarf, I wound up in Al-Akihabara. I'm not sure why or when, but Hemalatha always made sure I had a rug to sleep on and more than just dust in my belly. Since then, I've worked to repay her. It's um... it's been quite awhile.");
            }
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "And she sent you out here?");
            scr_event_build_dialogue("Safiatou", safiaport, "Yes... and I have a feeling it was to punish me, although I don't know what I did wrong. I never know what I do wrong, but she is always upset. She told to leave and not come back until I sold all this hardtack. I wandered for a very long while trying to find a customer, until I ended up here. I'm not exactly sure if I know the way back... but I'm not worrying about that now. Even if I'm lost, I'm freer than I ever have been. She just wanted me to sell hardtack, but here I get to run my very own restaurant. Anything else you want to know?");
            scr_event_build_quest_state("safiatouTalk", 1);
            scr_event_build_quest_state_add("safiatouLike", 1);
        }
        
        var questions = scr_event_build_choice("Talk about...", s_port_hoopz);
        
        
        if (scr_quest_get_state("safiatouHardtack") == 0)
        {
            var hardtack = scr_event_build_add_choice(questions, "Talk about hardtack.");
            with (hardtack) 
            {
                scr_event_build_quest_state("safiatouHardtack", 1);
                scr_event_build_quest_state_add("safiatouLike", 1);
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Tell me about hardtack! It was a lot better than I thought, but is that all you make?");
                if (scr_quest_get_state("hemalathaScene") == 0) 
                {
                    scr_event_build_dialogue("Safiatou", safiaport, "Well... it's hardy and substantial. I know lots of dwarfs like to eat fruit, but it would get soggy out here in the swamp... or all dried out where I'm from. But to be honest... I'm getting bored of making it. It's all I've been making for years. There's a million things I dream of making, if I had the ingredients, or a real kitchen. Hemalatha is very business minded, and this is what she has me make. She even gets mad when I make any embellishments... at home, it's just hardtack. No specials, no small plates, just plain old hardtack.");
                }
                else 
                {
                    scr_event_build_dialogue("Safiatou", safiaport, "You met Hemalatha... maybe you have an idea of how strict she can be. I'm not allowed to cook anything else. She thinks hardtack is nutritious, durable, and inexpensive to prepare... and that's all she cares about. I'm not trying to say she is a bad person, " + P_NAME + ", but I don't know how someone ends up like that. Cooking is my one passion in life! My dream! I yearn to cook anything else, but I depend on her for ingredients... so I guess I have to live with it. Just plain old hardtack.");
                }
            }
        }
        
        if (scr_quest_get_state("safiatouRestaurant") == 0)
        {
            var restaurant = scr_event_build_add_choice(questions, "Talk about the restaurant.");
            with (restaurant) 
            {
                scr_event_build_quest_state("safiatouRestaurant", 1);
                scr_event_build_quest_state_add("safiatouLike", 1);
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Your restaurant is really formal... I've never been to a place half as nice. I was really impressed.");
                // left a tip
                if (scr_quest_get_state("safiatouTip") != 0) {
                    // left a 200% tip
                    if (scr_quest_get_state("safiatouTip") == 2) 
                    {
                        scr_event_build_dialogue("Safiatou", safiaport, "Just as I was impressed by your generosity! I must return all the profits to Hemalatha, so the gratuity is all I am able to keep to myself. I appreciate it a great deal.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well you deserved it. It was magnificent!");
                    }
                    // left a 50% tip
                    else if (scr_quest_get_state("safiatouTip") == 0.5) 
                    {
                        scr_event_build_dialogue("Safiatou", safiaport, "");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well you deserved it. It was really good stuff!");
                    }
                    // left a 20% tip
                    else if (scr_quest_get_state("safiatouTip") == 0.2) 
                    {
                        scr_event_build_dialogue("Safiatou", safiaport, "Do... do you mean that? It's... it's not that I need the money, but you left a very um... /'standard/' tip.");
                        var choice20 = scr_event_build_choice("About the tip...", s_port_hoopz);
                        var good20 = scr_event_build_choice(choice20, "Twenty percent is a great tip!");
                        with (good20) 
                        {
                            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Twenty percent is a great tip! It's not a standard tip!");
                            scr_event_build_dialogue("Safiatou", safiaport, "I always think of that as the minimum acceptable tip. The wait-staff tried to do an exceptional job. It's the only part of the bill that I'm not to return to Hemalatha. I guess I fell short...");
                            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, no! You did a great job! I mean it!");
                        }
                        var bad20 = scr_event_build_choice(choice20, "Twenty percent was all I could spare.");
                        with (bad20) 
                        {
                            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Twenty percent was all I could spare. I'm sorry, I didn't mean to make you feel that way. You did a great job! I mean it!");
                        }
                    }
                    
                    if (scr_quest_get_state("hemalathaScene") == 0) 
                    {
                        scr_event_build_dialogue("Safiatou", safiaport, "Thank you so much... you don't know how much that means to me! It's long been my dream to provide a fine dining experience for my fellow dwarfs. I haven't been around very much, but I think this may be one of the nicer establishments on Necron 7... I mean... I think. You're actually the first diner I've served so far. But I'm not really allowed to do this. I think Hemalatha would be upset if she found out. That's just her personality...");
                    }
                    else {
                        scr_event_build_dialogue("Safiatou", safiaport, "Thank you so much... you don't know how much that means to me! All I've ever wanted to do is become a restaurateur, since I was just a tiny little dwarf. I want to elevate the cuisine that my fellow dwarfs are used to, and bring my culinary dreams into the waking world. Can I tell you a secret?... Please don't tell Hemalatha, but I'm not supposed to be running a restaurant. She would hate it. She would say it's wasteful. She hates everything I do... but this is the first time I've ever been truly alone... so I did it anyway. For the first time in my life I feel like I'm living... even if it's out here in the swamps. Please don't tell her I said this.");
                    }
                }
                else 
                {
                    scr_event_build_dialogue("Safiatou", safiaport, "Then... then why didn't you leave a gratuity? Do you know how insulting it is to have a customer give you a big zero in return for your service? I mean, I didn't know until I served you but... it's heartbreaking!");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm really sorry, I was actually totally out of money. It's really embarrassing, I know...");
                    scr_event_build_dialogue("Safiatou", safiaport, "Then why did you even order!? Are you crazy!?");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know... I was really hungry. I blew it, Safiatou, I know... no, no! Don't cry! I didn't mean it!");
                    scr_event_build_dialogue("Safiatou", safiaport, "*Sniff*... I'm... I'm not crying because you didn't give me a tip. It's just... Hemalatha, she'll kill me if I don't come back with money. She didn't want me to start a restaurant, just sell hardtack. This whole restaurant biz has so much overhead, I'm already losing money, and with no tip... she'll... oh she'll be so upset! It's not your fault... I should be a better restaurateur.");
                }
            }
        }
        
        if (scr_quest_get_state("safiatouHome") == 0)
        {
            var home = scr_event_build_add_choice(questions, "Talk about her home.");
            with (home) 
            {
                scr_event_build_quest_state("safiatouHome", 1);
                scr_event_build_quest_state_add("safiatouLike", 1);
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "");
                if (scr_quest_get_state("hemalathaScene") == 0) 
                {
                    scr_event_build_dialogue("Safiatou", safiaport, "It's called Al-Akihabara. I think it's to the east and south of here, but I wouldn't really be able to tell you. I'm lost myself... I hope I'm not late getting back, or no doubt Hemalatha will be furious. I'm not sure if she would like that I'm running a restaurant either. She'd think it's wasteful, or something like that. She always says something like that about my dreams...");
                }
                else 
                {
                    scr_event_build_dialogue("Safiatou", safiaport, "Al-Akihabara, remember? That's where we met. At least, that's where I live now. Hemalatha never answers me when I talk about it, but I think I may have been born somewhere else... sometimes at night I have dreams that feel more like memories. I'll wake up with a foreign taste on my tongue, or an exotic aroma filling my nostrils. Then suddenly it's gone, replaced like always by hardtack and sand. So much hardtack and so much sand... *sigh*...");
                }
            }
        }
        
        var goodbye = scr_event_build_add_choice(questions, "That's all.");
        with (goodbye) 
        {
            scr_event_build_quest_state("safiatouGoodbye", 1);
            scr_event_build_execute_event_script(event_swp_safiatou01);
        }
    }
    
    //------------------------------------------------------------------------------------------
    // goodbye_snippet
    //------------------------------------------------------------------------------------------
    with (goodbye_snippet) 
    {
        if (scr_quest_get_state("safiatouGoodbye") == 1) 
        {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well Safiatou, it was nice talking to you. I'll catch you later! Stay safe out here, okay?");
            scr_event_build_dialogue("Safiatou", safiaport, "Nice talking to you too. I a lot more nervous when I'm not working, but that was okay. Thanks for talking to me, " + P_NAME + "... but um... actually, wait a moment, please.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Huh? What's up?");
        }
        
        if (scr_quest_get_state("hemalathaScene") == 0) 
        {
            scr_event_build_dialogue("Safiatou", safiaport, "Please, if you ever meet my master, Hemalatha, don't tell her anything I said today, or about the restaurant. Opening up to you has given me a lot to think about, and I'm worried I may have said something I regret. She really does provide for me... I mean, she can be strict, and I know she wouldn't tolerate the restaurant, but she's not a bad person. Please don't upset her. For my sake too.");
        }
        
        else 
        {
            if (talk == 3) 
            {
                scr_event_build_dialogue("Safiatou", safiaport, "Listen... getting all that off my chest has made me feel like I need to make a change, desperately. Do you remember what I told you about my dreams? When I said that making fine cuisine was my dream, I meant it very literally... when I go to bed at night, sometimes I dream about food I know I've never eaten before... biryani, borscht, beignets, and bouillabaisse... I've never even heard of them, but in my dreams I can see them, smell them, and taste them. They feel like memories... I used to think I had another home before I arrived in Al-Akihabara. I've even wondered if they're visions of the future.");
                //ROUNDMOUND DREAM CHOICE
                scr_event_build_dialogue("Safiatou", safiaport, "Interesting... I don't think it's strange that our passions find our way into our dreams. I think they may even originate there. Very recently, these dreams have been happening every night. And now I do more than just eat these delicious foods. My dream self is making each meal from scratch. If I dream of a demi-glace, I'm the saucier. If I dream of a sausage, I'm the charcutier. I've started keeping a dream journal... the moment I wake up, I've recorded the process from my dream.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "So it's a dream journal and a recipe book...");
                scr_event_build_dialogue("Safiatou", safiaport, "Exactly! At any rate... I've realized that I need to make a change, deseperately. If I ever have any thoughts of opening a restaurant for real, I'll need that dream journal. I've got years' worth of recipes in there. I think Hemalatha would have lost her temper and punished me further if she saw me sneaking out with a recipe book... she only wants me to make hardtack. So I stashed it inside her warehouse when I left, underneath a ---------. I wish there was another place to put it, but I didn't have any time and she was watching me closely. I... I was wondering if you could try to somehow get it back for me.");
            }
            else 
            {
                scr_event_build_dialogue("Safiatou", safiaport, "Please don't tell Hemalatha what I said today. She'll be livid... just let me keep this a secret, then I'll find my way back home.  She won't have to find out. Please... please. I hope I can trust you.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "You shouldn't work for her anymore if you don't want to.");
            }
        }
    }
    
    //------------------------------------------------------------------------------------------
    // goodbye_snippet
    //------------------------------------------------------------------------------------------
    with (goodbye_snippet) 
    {
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I talked to your boss Hemalatha, Saf. She's got it out for you!");
        scr_event_build_dialogue("Safiatou", safiaport, "What!? What do you mean!?");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "She asked me to get a receipt that shows you're running a restaurant, so when you get back she can fire you. She seemed really excited about doing it, too.");
    }





/*    
    
    //------------------------------------------------------------------------------------------
    // move_in_snippet
    //------------------------------------------------------------------------------------------
    with (move_in_snippet) {
        Breakout("build", "add", "superEmpty");
        
        // CHOICE: offer a room?
        var rent_choice = scr_event_build_choice("Offer a room?", s_port_hoopz);
        
        // rent1: yes, offer the room
        var rent_yes = scr_event_build_add_choice(rent_choice, "Yes, offer Safiatou a room.");
        with (rent_yes) {
            // first attempt
            if (scr_quest_get_state("safiatouOffer") == 0) { scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, Safiatou, I was wondering, since you can't dance in Dwarf Zion anymore, would you be interested in renting a room from me?"); }
            // already offered and reneged, or offered and rejected because of value
            else { scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey Safiatou, about that room..."); }
            
            // value is high enough!
            if (scr_quest_get_state("superApparent") > safiatou_req) {
                // first attempt
                if (scr_quest_get_state("safiatouOffer") == 0) { scr_event_build_dialogue("Safiatou", safiaport, "Oh, you run the new apartment complex, yes? Seems like a fine place to spin. I will love to move in and spin there. I can pay " + string(safiatou_rent) + " rent? Deal?"); }
                // 2+ attempts, not enough money last time
                else if (scr_quest_get_state("safiatouOffer") == 1) { scr_event_build_dialogue("Safiatou", safiaport, "Oh yes, the room! I hear it is much nicer now. So what do you think? I will love to move in and spin there. I can pay " + string(safiatou_rent) + " rent? Deal?"); }
                // 2+ attempts, changed mind last time
                else if (scr_quest_get_state("safiatouOffer") == 2) { scr_event_build_dialogue("Safiatou", safiaport, "You change your mind? Then I want to spin in this new home! I can pay " + string(safiatou_rent) + " rent? Deal?"); }
                
                // CHOICE: confirm offer?
                var confirm_choice = scr_event_build_choice("Rent room to Safiatou for " + string(safiatou_rent) + " N.S.?", s_port_hoopz);
                // confirm1: yes, confirm rental
                var confirm_yes = scr_event_build_add_choice(confirm_choice, "Yes, rent the room!");
                with (confirm_yes) {
                    // have enough rooms
                    if (scr_quest_get_state("superEmpty") >= 1) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sounds like a deal to me!");
                        scr_event_build_dilapidated_rent("Safiatou");
                        scr_event_build_dialogue("", NULL, "Rented a room to Safiatou!");
                        Breakout("build", "clear");
                        scr_event_build_dialogue("Safiatou", safiaport, "Wonderful! I'll go soon. Clean myself up... maybe take a break.. maybe start spinning...!");
                        // reset safiatouState for tenant stuff
                        scr_event_build_quest_state("safiatouState", 0);
                        scr_event_build_quest_state("safiatouOffer", 3);
                    }
                    // not enough rooms
                    else {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ummm, I actually realized I don't have any vacancies right now...");
                        scr_event_build_dialogue("Safiatou", safiaport, "Aw, too bad! I was looking forward to having a nice spot to spin. Let me know if it changes, please!");
                        scr_event_build_quest_state("safiatouOffer", 2);
                    }
                }
                // confirm2: no, don't rent
                var confirm_no = scr_event_build_add_choice(confirm_choice, "No, don't rent!");
                with (confirm_no) {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Umm, lemme think about it!");
                    scr_event_build_dialogue("Safiatou", safiaport, "Okay. I'll be here, for awhile I think... still not feeling good. Not in a spinning state...");
                    scr_event_build_quest_state("safiatouOffer", 2);
                }
            }
            // value is too low!
            else {
                // first attempt
                if (scr_quest_get_state("safiatouOffer") == 0) { scr_event_build_dialogue("Safiatou", safiaport, "Oh, you run the new apartment complex, yes? Sorry, not nice enough. Give it some work, make it nice, then I rent and spin all the time!"); }
                // 2+ attempts, not enough money last time
                else if (scr_quest_get_state("safiatouOffer") == 1) { scr_event_build_dialogue("Safiatou", safiaport, "No, no, no! Make the apartment nicer! I want to spin in a great place... with good energy! Just a little nicer, a little work! Then I spin!"); }
                // 2+ attempts, changed mind last time
                else if (scr_quest_get_state("safiatouOffer") == 2) { scr_event_build_dialogue("Safiatou", safiaport, "What happened? Your apartment was nice, now it is worse! It looked like a nice place to spin, but I have only heard bad things... nothing good for spinning. Get it together... then I'll spin!"); }
                scr_event_build_quest_state("safiatouOffer", 1);
            }
        }
        
        // rent2: no, don't offer
        var rent_no = scr_event_build_add_choice(rent_choice, "No, don't offer the room.");
        with (rent_no) {
            scr_event_build_end();
        }
    }
*/

 /*   scr_event_advance(event);
}
