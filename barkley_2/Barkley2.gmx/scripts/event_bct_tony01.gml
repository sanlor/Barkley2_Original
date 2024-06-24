// Event for Tony, a guy selling hot pasta in Brain City.

/*if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //Time 20-24, spoken.
        if (scr_time_get() > 20) and (scr_time_get() <= 24) and (scr_quest_get_state("tonyState") == 6) {
            scr_event_build_dialogue("Tony", NULL, "Tony's warm pasta, warmest pasta in town! Don't believe me? Come closer. Touch it. Touch it. Piping hot. Mmmmm.");
  
        //Time 20-24, unspoken.
        }else if (scr_time_get() > 20) and (scr_time_get() <= 24) and (scr_quest_get_state("tonyState") <= 5) {
            scr_event_build_dialogue("Tony", NULL, "I got warm pasta over here! I got hot pasta! Come close, try my warm pasta. Everyone loves Tony's warm pasta. 'eyyy, come and try Tony's warm pasta. You'll say /'wow!/'");
            scr_event_build_quest_state("tonyState", 6);    
    
        //Time 16-20, spoken.
        } else if (scr_time_get() > 16) and (scr_time_get() <= 20) and (scr_quest_get_state("tonyState") == 5) {
            scr_event_build_dialogue("Tony", NULL, "'ey, you tasted this warm pasta yet? You're kiddin' me, you haven't had any of this yet? MmmmMMMMMmmmmm... it's warm.");
  
        //Time 16-20, unspoken.
        }else if (scr_time_get() > 16) and (scr_time_get() <= 20) and (scr_quest_get_state("tonyState") <= 4) {
            scr_event_build_dialogue("Tony", NULL, "I got your warm pasta right here! 'ey, you want hot pasta? You want to know where the warm pasta's at? I got it right here! Come closer, buy my warm pasta! It's right here!");
            scr_event_build_quest_state("tonyState", 5);    
    
        //Time 12-16, spoken.
        }else if (scr_time_get() > 12) and (scr_time_get() <= 16) and (scr_quest_get_state("tonyState") == 4) {
            scr_event_build_dialogue("Tony", NULL, "Come closer. Come closer and buy my warm pasta. 'ey, come and try some of Tony's warm pasta. MmmmMMMMmmmm! Just like mama used to make!");
  
        //Time 12-16, unspoken.
        }else if (scr_time_get() > 12) and (scr_time_get() <= 16) and (scr_quest_get_state("tonyState") <= 3) {
            scr_event_build_dialogue("Tony", NULL, "Got some warm pasta over here! Got some piping warm pasta over here! 'ey, c'mon and try some of Tony's warm pasta. 'ey, you want some of this hot pasta.");
            scr_event_build_quest_state("tonyState", 4);
        
        //Time 9-12, spoken.
        }else if (scr_time_get() > 8) and (scr_time_get() <= 12) and (scr_quest_get_state("tonyState") == 3) {
            scr_event_build_dialogue("Tony", NULL, "'ey, you tasted some of this pasta yet? Mmmmm, warm. That's some warm pasta. Mmmmmm.");
  
        //Time 9-12, unspoken.
        }else if (scr_time_get() > 8) and (scr_time_get() <= 12) and (scr_quest_get_state("tonyState") <= 2) {
            scr_event_build_dialogue("Tony", NULL, "Tony's warm pasta! Come and get some of Tony's warm pasta! 'ey, I got some hot pasta over here! Come and get it! Come and get some of my warm pasta! Warmest pasta around!");
            scr_event_build_quest_state("tonyState", 3);
        
        //Time 4-8, spoken.
        }else if (scr_time_get() > 4) and (scr_time_get() <= 8) and (scr_quest_get_state("tonyState") == 2) {
            scr_event_build_dialogue("Tony", NULL, "Sellin' hot pasta over here! Sellin' Tony's warm pasta over here! I got some good, warm pasta. Come closer, taste my warm pasta. Just try it.");
  
        //Time 4-8, unspoken.
        }else if (scr_time_get() > 4) and (scr_time_get() <= 8) and (scr_quest_get_state("tonyState") <= 1) {
            scr_event_build_dialogue("Tony", NULL, "'eeeey, come and try Tony's hot pasta! Give my warm pasta a taste! Got some hot pasta over here! Got the warmest pasta in town! C'mon, try my warm pasta.");
            scr_event_build_quest_state("tonyState", 2);
            
        //Time = 1-4, spoken.
        } else if (scr_time_get() <= 4) and (scr_quest_get_state("tonyState") == 1) {
            scr_event_build_dialogue("Tony", NULL, "'eeeey, come close and taste my hot pasta! I got warm pasta over here! Come and try my warm pasta, 'ey! 'eeeey! Try my warm pasta!");
        
        //Time = 1-4, never spoken.
        } else {
            scr_event_build_dialogue("Tony", NULL, "'ey! 'ey, I'm sellin' hot pasta! I got warm pasta over here! Come closer, come closer, I got some warm pasta, warmest pasta in town. Come on, give it a try.");
            scr_event_build_quest_state("tonyState", 1);
        }
    }
    scr_event_advance(event);
}
