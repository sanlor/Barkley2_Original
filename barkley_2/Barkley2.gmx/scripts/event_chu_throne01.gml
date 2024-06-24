/*if (argument0 == SCRIPT_START) {
    
} else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {

    var throne = id;
    var event = scr_event_create_main()
    with (event) {
        scr_event_build_dialogue_debug("THRONE", NULL, "The player sits on Cuchulainn's throne! What occurs?");
        scr_event_build_dialogue_debug("THRONE", NULL, "First, the player sits on the throne triumphantly and the Necron 7 turns around and flies home. That is actually maybe a joke... it is hard to remember in this game. The player can also push a button.");
        scr_event_build_dialogue_debug("THRONE", NULL, "There can be all sorts of audio and visual effects. Worthy of a big discussion and a good plan!");
        scr_event_build_dialogue_debug("THRONE", NULL, "The day is saved! The player's ending is then chosen. We can maybe have some brief/common dialogue uttered here, but in most cases, the majority of the ending will occur on other maps.");
        // playerX1
        if (scr_quest_get_state("playerX1")) {
            if (scr_quest_get_state("wiglafMission") >= 1) { // gonna go tell cyberdwarf
                scr_event_build_dialogue_debug("You're X114JAM9", NULL, "Player finished the game as X114JAM9 while on Wiglaf's quest. Does that mean the player killed Cuchulainn outright on try #1? If the player can complete the game post-Wiglaf but pre-Cyberdwarf (say, by not going into Cyberdwarf's chamber when told to, instead trying again to kill Cuchulainn) we may have to rethink some of this.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I did it! I did it! Wiglaf is going to be really pleased... and I guess I saved us from going to hell too.");
            }
            else { // maybe i'll find the cyberdwarf out here... who am i?

            }
        }
        // playerHoopz OR playerCC
        else {
            // if Cuchu Primordia was killed, two options:
            if (scr_quest_get_state("primoKilled")) {
                // cyberdwarf was reformatted
                if (scr_quest_get_state("cdwarfReformat")) {
                
                }
                // cyberdwarf was destroyed in the cyberspear
                if (scr_quest_get_state("csDestroyed")) {
                
                }
                                          
            }
            // if SSJ Omnidwarf was killed...
            else if (scr_quest_get_state("cdwarfOmniDead")) {
            
            

                
            } 
            // if Cuchu Primordia was sealed inside the Cyberspear
            else if (scr_quest_get_state("primoAbsorb")) {
                if (scr_quest_get_state("")) { // no hell option
                
                }
                
            } 
            // if Cyberdwarf took over the player's body
            else if scr_quest_get_state("cdwarfTakeover") {
                //if (scr_quest_get_state("")) { //
                
                //}
            }
            // TODO: LINK TO TIMER
            // if timer arrived at hell before fighting Cuchu Primordia
            else if (scr_quest_get_state("primoHell")) {
                
            }
            // TODO: LINK TO TIMER
            // if timer arrived at hell while fighting SSJ Omnidwarf
            else if (scr_quest_get_state("cdwarfOmniHell")) {
                
            }
            // TODO: LINK TO TIMER
            // if timer arrived at hell while not in the final area
            else {
                
            }
        } 
        
        /* 
        //for use
        if scr_quest_get_state("") {
            if (scr_quest_get_state("")) {
            
            }
        } else if scr_quest_get_state("") {
            if (scr_quest_get_state("")) {
            
            }
            else if (scr_quest_get_state("")) {
            
            }
        }
        scr_event_build_dialogue_debug("THRONE", NULL, "");
        scr_event_build_dialogue_debug("THRONE", NULL, "");
        scr_event_build_dialogue_debug("ENDING", NULL, "");
        scr_event_build_dialogue_debug("ENDING", NULL, "");
        */
/*        scr_event_build_wait(2);
        scr_event_build_dialogue_debug("ENDING", NULL, "... dat ending...");
        scr_event_build_fade(true, 3);
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "My ending is" + string(scr_quest_get_state("motiveName")));
        switch string((scr_quest_get_state("motiveName"))) {
            case "0":
                scr_event_build_dialogue_debug("ENDING", NULL, "It's sad in this case, since X114JAM9 / Hoopz / C.C. did not meet with the RoundMound to choose an alignment of any kind. They just want to know what is going on, and here they are at the end of the game... so it can be a failure possibly.");
                scr_event_build_dialogue_debug("ENDING", NULL, "We can have a few different endings based on who the character is, and at what point in the game they are.");
                scr_event_build_dialogue_debug("ENDING", NULL, "Did you sneak in there without doing any of the Wiglaf/LONGINUS stuff? Hoopz prays at Wilmer's grave? or his Home? Hoopz meets the Cyberdwarf at the end of the game? A cryptic ending??? Cyberdwarf is dead too, along with Cuchulainn? W/E.");
                scr_event_build_dialogue_debug("ENDING", NULL, "You could also have already met the Cyberdwarf, but have no goal, in which case you just maybe sit up there like an idiot... is /'going home/' the default goal, if you don't actively choose one?");
                break;
            case "alignBballLaw":
                break;
            case "alignBballChaos":
                break;
            case "alignCandyRarity":
                break;
            case "alignCandyVariety":
                break;
            case "alignClispaethWorship":
                break;
            case "alignClispaethHeresy":
                break;
            case "alignCyberdwarfOne":
                break;
            case "alignDwarfsLiberate":
                break;
            case "alignDwarfsTrouble":
                break;
            case "alignDwarfsSavior":
                break;
            case "alignHomeOne":
                break;
            case "alignPowerLow":
                break;
            case "alignPowerHigh":
                break;
            case "alignTruthNormal":
                break;
            case "alignTruthReal":
                break;
            case "alignVengeanceOne":
                break;
            case "alignVidconsPlay":
                break;
            case "alignVidconsConquer":
                break;
            case "alignVidconsHoard":
                break;
            case "alignVidconsPreserve":
                break;
        }
    }
    scr_event_advance(event);
}
