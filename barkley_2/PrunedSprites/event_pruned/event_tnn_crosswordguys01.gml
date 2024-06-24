/*
The Crossword Guys Quest.

variables:
crosswordguys:
0 - haven't talked to them
1 - declined the game
2 - accepted and won the game
3 - accepted and lost the game (you cannot try again if you win or lose)

cwgame - event snippet "The Crossword Game"
toplay - choice "To play the Crossword Game or not"
crossword - choice with event "your choice in the Crossword Game"

Completing the crossword gets you 100 "monies."
*/

if (argument0 == SCRIPT_START) {
    // If I'm outdoors
    if (scr_inside() == 0) 
    {
        if (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
    }
    // If I'm indoors
    else 
    {
        if (scr_tnn_curfew("during") == false) { scr_event_interactive_deactivate(); }
    }
}
else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var crosswordguys = id
    var event = scr_event_create_main();
    var cwgame = scr_event_create_child(event);
    
    // The Crossword Game Event Snippet
    with (cwgame) {  
        var toplay = scr_event_build_choice("Do you want to play?", s_port_hoopz);  
        with (scr_event_build_add_choice(toplay, "Not now.")) {  // Decline to play
            Dialogue(P_NAME, "I think I need to practice my skills a little more before I try this. I don't want to fail my first time out.");
            Dialogue("Ernstig Van De Drol",  "Do not be sad, Uitwerpselening is very difficult.");
            Dialogue("Altijd Poepen", "Very difficult. Maybe you can uitwerpselening with us another time?");
            Dialogue(P_NAME, "Sure.");
        }
        with (scr_event_build_add_choice(toplay, "Let's do this.")) {  // Accept the crossword challenge
            Dialogue(P_NAME, "I was born ready for this. Game time.");
            Dialogue("Ernstig Van De Drol",  "He is very serious at Uitwerpselening.");
            Dialogue("Altijd Poepen", "I like people who are serious about Uitwerpselening.");
            Dialogue(P_NAME, "Lay it on me.");
            Dialogue("Ernstig Van De Drol",  "Ok!");
            Dialogue("Altijd Poepen", "Yes! It is a four-letter word.");
            Dialogue("Ernstig Van De Drol",  "This is the mystery question. This is not the answer. We do not know the answer.");
            Dialogue("Altijd Poepen", "Yes, this is the question. We do not know the answer.");
            Dialogue("Ernstig Van De Drol",  "The answer is hidden.");
            Dialogue("Altijd Poepen", "Yes, it is a secret. We cannot find it.");
            Dialogue("Ernstig Van De Drol",  "Dwarfs are not skilled in Uitwerpselening.");
            Dialogue("Altijd Poepen", "A four letter word. It is a gemstone.");
            Dialogue("Ernstig Van De Drol",  "It says pretty gemstone.");
            Dialogue("Altijd Poepen", "It is the pretty red gemstone.");
            Dialogue("Ernstig Van De Drol",  "We have located the three secret letters.");
            Dialogue("Altijd Poepen", "Yes, three have been discovered. They are no longer hidden.");
            Dialogue("Ernstig Van De Drol",  "We can give them to you.");
            Dialogue("Altijd Poepen", "It is written down here.");
            Dialogue(P_NAME, "OK, let me take a look.");
            scr_event_build_wait(2)  //Hoopz checks out the crossword puzzle for two seconds
            Dialogue(P_NAME, "R\U\-\Y");
            Dialogue("Altijd Poepen", "RU-Y");
            Dialogue("Ernstig Van De Drol",  "The blank does not count as letter. It means hidden.");
            Dialogue("Altijd Poepen", "Yes, it is still hidden. Please find the letter.");
            Dialogue("Ernstig Van De Drol",  "Can you find the letter?");
            Dialogue(P_NAME, "Let's see.....Pretty Red Gemstone.....Four letters.....R...U...blank...Y...");
            var crossword = scr_event_build_choice("What do you choose?", s_port_hoopz); // Choose the Correct Character
            var wrong = scr_event_build_add_choice(crossword, "RUZY");
            scr_event_build_add_choice_with_event(crossword, "RUFY", wrong);
            scr_event_build_add_choice_with_event(crossword, "RUNY", wrong);
            scr_event_build_add_choice_with_event(crossword, "RU@Y", wrong);
            var right = scr_event_build_add_choice(crossword, "RUBY");
            scr_event_build_add_choice_with_event(crossword, "RU[Y", wrong);
            scr_event_build_add_choice_with_event(crossword, "RU%Y", wrong);
            scr_event_build_add_choice_with_event(crossword, "RU*Y", wrong);
            scr_event_build_add_choice_with_event(crossword, "RUXY", wrong);
            scr_event_build_add_choice_with_event(crossword, "RU?Y", wrong);
            with right {  // Get the crossword right
                Dialogue("Ernstig Van De Drol",  "What...");
                Dialogue("Altijd Poepen", "How...");
                Dialogue("Ernstig Van De Drol",  "You...");
                Dialogue(P_NAME, "Did I get it right?");
                Dialogue("Ernstig Van De Drol",  "He....solved......");
                Dialogue("Altijd Poepen", "You solved the Uitwerpselening!!!");
                Dialogue(P_NAME, "Hey, cool! I'm not so bad at this.");
                Dialogue("Ernstig Van De Drol",  "You are the best at Uitwerpselening.");
                Dialogue("Altijd Poepen", "I am the 18-time Dwarf Uitwerpselening champion. I was called /'Grandmaster of Uitwerpselening
                 Altijd Poepen/'. It said /'Grandmaster of Uitwerpselening Altijd Poepen/' on my Uitwerpselening trophy. Now I am not the Grandmaster.");
                Dialogue("Ernstig Van De Drol",  P_NAME + " is the new Grandmaster.");
                Dialogue("Altijd Poepen", "I miss being the Grandmaster.");
                Dialogue("Ernstig Van De Drol",  "Here is your prize for being Grandmaster of Uitwerpselening!!!");
                Breakout("build", "add", "money");
                scr_event_build_money_add(scr_money_db("crosswordMaster"));  //  You get 100 "monies" for completing this quest
                scr_event_build_dialogue_item("Got " + string(scr_money_db("crosswordMaster") ) + " neuro-shekels!");
                Breakout("build", "clear");
                Dialogue(P_NAME, "Thanks!");
                Dialogue("Ernstig Van De Drol",  "I want to be serious Cross Word Puzzles player like " + P_NAME + ".");
                Dialogue("Altijd Poepen", "No. Dwarves can never be serious Crossword Puzzles player. It is our weakness. 
                It is our curse. Forever bad at Crossword Puzzles.");
                Dialogue("Ernstig Van De Drol",  "Doomed to bad Cross Word Puzzles playing.");
                Dialogue("Altijd Poepen", "Maybe " + P_NAME + " can show us good Crossword Puzzles playing?");
                Dialogue("Ernstig Van De Drol",  "Yes! Please Uitwerpselening again one day!!");
                Dialogue("Altijd Poepen", "You must Uitwerpselening again! Always be the Uitwerpselening Grandmaster " + P_NAME + "!!!");
                Dialogue(P_NAME, "This was fun. I'll play with you guys again sometime.");
                scr_event_build_quest_state("crosswordQuest", 3);
            }
            with wrong {  // Get the crossword wrong
                Dialogue("Ernstig Van De Drol",  "I do not think he has solved the Uitwerpselening.");
                Dialogue("Altijd Poepen", "No, the Uitwerpselening is still hidden. I tried this letter.");
                Dialogue("Ernstig Van De Drol",  "The word was still hidden.")
                Dialogue("Ernstig Van De Drol",  "He tried it before.");
                Dialogue("Ernstig Van De Drol",  "You didn't find it.");
                Dialogue(P_NAME, "Aw, shucks.");
                Dialogue("Altijd Poepen", "Do not be sad! It was fun Uitwerpselening with you.");
                Dialogue("Ernstig Van De Drol",  "I would have enjoyed more the good Uitwerpselening though.");
                Dialogue("Altijd Poepen", "Yes, you are forever cursed as bad Uitwerpselening too.");
                Dialogue("Ernstig Van De Drol",  "Cursed forever.");
                Dialogue("Altijd Poepen", "This puzzle will never be solved.");
                Dialogue("Ernstig Van De Drol",  "Come play bad Uitwerpselening with us again!");
                Dialogue("Altijd Poepen", "Yes, play Uitwerpselening again one day. We love bad Uitwerpselening players.");
                scr_event_build_quest_state("crosswordQuest", 2);
            }
        }
    }
    // The states of the crossword guys are below
    with (event) {
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            Dialogue("Ernstig Van De Drol",  "Oh, Matthias!!! G'day!! That is the expression of greeting you are always saying!!");
            Dialogue("Altijd Poepen", "G'day good friend Matthias!! We are saying it too!!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "You hit the nail right on the head all right! You found me, good old Matthias!!");
            Dialogue("Ernstig Van De Drol",  "Please, Matthias!!! We are stuck on the uitwerpselening!!! Only you can save us!!!");
            Dialogue("Altijd Poepen", "You are the only savior Matthias!!! Please help with the puzzle!!!!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Oh, uh.....let me have a look here._._._._uh, I can't really see too good.....");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Hey, I know!!! Why not try my name in the puzzle! Matthias!!! I bet my name is in the puzzle somewhere!! You guys just found me, I bet you can find me in the puzzle too!! I bet as long as you remember the name Matthias you'll solve the puzzle in no time.");
            Dialogue("Ernstig Van De Drol",  "Oh, Matthias!!! Hello!!");
            Dialogue("Altijd Poepen", "Oh, Matthias!!! Hello!!");
            Dialogue("Ernstig Van De Drol",  ".......");
            Dialogue("Altijd Poepen", ".......");
            Dialogue("Ernstig Van De Drol",  "This is the worst advice for uitwerpselening.");
            Dialogue("Altijd Poepen", "Of all advice for uitwerpselening, this is the worst.");
            Dialogue("Ernstig Van De Drol",  "That's our Matthias!!! You always know how to cheer us up!!! Of all players of uitwerpselening you are almost as bad as we are!!!!");
            Dialogue("Altijd Poepen", "Three cheers for Matthias!! Almost worst uitwerpselening player ever!! Master at cheering up uitwerpselening players Altijd and Ernstig.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Thank you. All in a day's work for good friend Matthias.");
            Dialogue("Ernstig Van De Drol",  "That Matthias is some guy....");
            Dialogue("Altijd Poepen", "Yes. Some guy, that Matthias....");
        }
        //if you're controlling the Governor.
        else if (BodySwap() == "governor") {
            Dialogue("Ernstig Van De Drol",  "The governor!!! Please, Governor!! Do not arrest us for our uitwerpselening!!! We love to play the uitwerpselening more than money or life!!!");
            Dialogue("Altijd Poepen", "Please, Governor, do not imprison us for the game we love more than most!!! Do not make uitwerpselening the thing you arrest us for!!!");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Hello! I am the Governor. I have decided that today is official uit...___werp...___day... Uh._._._tell all your family and friends that I am the Governor and that I have said all these things. Thank you.");           
        }
        // First time talking to Crossword Guys 
        else if (scr_quest_get_state("crosswordQuest") == 0) {  
            Dialogue(P_NAME, "What's wrong with you guys, you look pretty sad.");
            Dialogue("Altijd Poepen", "Hi! We are uitwerpselening. Dwarfs love uitwerpselening.");
            scr_event_build_dialogue("Ernstig Van De Drol",NULL, "Yes, that's right! Dwarves love uitwerpselening.");
            Dialogue(P_NAME, "What's that? I don't know what that is.");
            Dialogue("Ernstig Van De Drol",  "Uitwerpselening.");
            Dialogue("Altijd Poepen", "Uitwerpselening. It's a game we play. You have to find the words from the other words.");
            Dialogue("Ernstig Van De Drol",  "It is very difficult.");
            Dialogue("Altijd Poepen", "The one weakness of Dwarves is Uitwerpselening.");
            Dialogue("Ernstig Van De Drol",  "We are not good at Uitwerpselening.");
            Dialogue(P_NAME, "Is it like B-Ball? That's my favorite game.");
            Dialogue("Altijd Poepen", "I do not know. I have never tried Uitwerpselening with a basketball hoop.");
            Dialogue("Ernstig Van De Drol",  "I want to uitwerpselening with a basketball hoop.");
            Dialogue(P_NAME, "So how do you play it? Can I try?");
            Dialogue("Ernstig Van De Drol",  "It is very difficult. We have spent months on this Uitwerpselening. You will spend many more months on this.");
            Dialogue("Altijd Poepen", "Yes, it is very difficult. You take the words, and find the hidden secret word, and need to fit it into the boxes of words.");
            Dialogue("Ernstig Van De Drol",  "I cannot find the secret word. I am not good at Uitwerpselening.");
            Dialogue("Altijd Poepen", "He cannot find the secret word. He will never find the secret word.");
            Dialogue(P_NAME, "What, is it like a Crossword puzzle?");
            Dialogue("Ernstig Van De Drol",  "Cross-word?");
            Dialogue("Altijd Poepen", "Yes, Crossword Puzzle is the other word for Uitwerpselening.");
            Dialogue("Ernstig Van De Drol",  "I would like to Uitwerpselening on a Crossword Puzzle.");
            Dialogue(P_NAME, "I like puzzles. Can I help?");
            Dialogue("Ernstig Van De Drol",  "You will not find the secret word. It is a hidden secret.");
            Dialogue("Altijd Poepen", "We have spent many weeks on this hidden word. We would like you to try to find it!");
            Dialogue("Ernstig Van De Drol",  "I challenge you to find the hidden word you will not find.");
            Dialogue("Altijd Poepen", "Yes! We propose to you the Uitwerpselening you will not find.");
            scr_event_build_quest_state("crosswordQuest", 1);
            scr_event_build_event_snippet(cwgame);
        }
        else if (scr_quest_get_state("crosswordQuest") == 1) {  // Talking to them after declining
            Dialogue("Altijd Poepen", "Do you wish to Uitwerpselening?");
            Dialogue("Ernstig Van De Drol",  "You will not find the hidden word.");
            scr_event_build_event_snippet(cwgame); 
        }
        else if (scr_quest_get_state("crosswordQuest") == 2) {  // Talking to them after failing the crossword
            Dialogue("Altijd Poepen", "We will never solve the Uitwerpselening.");
            Dialogue("Ernstig Van De Drol",  "Yes, the Uitwerpselening will never be solved.");
        }
        else if (scr_quest_get_state("crosswordQuest") == 3) {  // Talking to them after completing the crossword
            Dialogue("Altijd Poepen", "There are many mysteries left in this Uitwerpselening to be found. We will never find them all.");
            Dialogue("Ernstig Van De Drol",  "Yes. They will remain invisible for all time. There are too many mysteries to be found.");
        }
    }
    scr_event_advance(event);
}

                
