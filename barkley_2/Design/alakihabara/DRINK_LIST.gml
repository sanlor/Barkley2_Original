//------------------------------ INGREDIENTS ------------------------------
// Sand
case "Sandstorm": sand = 3; pebble = 0; dirt = 0; dust = 0; drinkNum = 0; break;
case "Sandblaster": sand = 2; pebble = 1; dirt = 0; dust = 0; drinkNum = 1; break;
case "Sand Trap": sand = 2; pebble = 0; dirt = 1; dust = 0; drinkNum = 2; break;
case "Sandy & Dusty": sand = 2; pebble = 0; dirt = 0; dust = 1; drinkNum = 3; break;
// Pebble
case "Rocks on Rocks on Rocks": sand = 0; pebble = 3; dirt = 0; dust = 0; drinkNum = 4; break;
case "Rock & Roller": sand = 1; pebble = 2; dirt = 0; dust = 0; drinkNum = 5; break;
case "Rocky Top": sand = 0; pebble = 2; dirt = 1; dust = 0; drinkNum = 6; break;
case "Rocky Classic": sand = 0; pebble = 2; dirt = 0; dust = 1; drinkNum = 7; break;
// Dirt
case "Dirtopia": sand = 0; pebble = 0; dirt = 3; dust = 0; drinkNum = 8; break;
case "Dirty Beach": sand = 1; pebble = 0; dirt = 2; dust = 0; drinkNum = 9; break;
case "Dirt Djinni": sand = 0; pebble = 1; dirt = 2; dust = 0; drinkNum = 10; break;
case "Dirty & Dusty": sand = 0; pebble = 0; dirt = 2; dust = 1; drinkNum = 11; break;
// Dust
case "Old Fashioned": sand = 0; pebble = 0; dirt = 0; dust = 3; drinkNum = 12; break;
case "Dust Storm": sand = 1; pebble = 0; dirt = 0; dust = 2; drinkNum = 13; break;
case "Dust Bowl": sand = 0; pebble = 1; dirt = 0; dust = 2; drinkNum = 14; break;
case "Dusty Trail": sand = 0; pebble = 0; dirt = 1; dust = 2; drinkNum = 15; break;
// no dust
case "Grainy Fusion": sand = 1; pebble = 1; dirt = 1; dust = 0; drinkNum = 16; break;
// no dirt
case "Clean Shake": sand = 1; pebble = 1; dirt = 0; dust = 1; drinkNum = 17; break;
// no pebble
case "Splendid Daiquiri": sand = 1; pebble = 0; dirt = 1; dust = 1; drinkNum = 18; break;
// no sand
case "Mojito": sand = 0; pebble = 1; dirt = 1; dust = 1; drinkNum = 19; break;


//------------------------------ DRINK ARRAY ------------------------------
// Sand



//------------------------------ ZELDA TASTES ------------------------------
// this is how to calculate zelda's score. we can have them all be different!
// it is easier to do custom scores for everybody, honestly. i don't want to think about everybody who COULD
// be in this quest all at once. so this is easier.

// define level and score
zeldaLevel = scr_quest_get_state("zeldaLevel");
zeldaScore = scr_quest_get_state("zeldaScore");

// establish perfects, which can have special dialogues
if (zeldaLevel == 1) { zeldaPerfect = "Dirt Djinni"; } 
else if (zeldaLevel == 2) { zeldaPerfect = "Dusty Trail"; }
else if (zeldaLevel == 3) { zeldaPerfect = "Rocky Top"; }

// individual characteristics
zeldaSand = -1;
zeldaPebble = 0;
zeldaDirt = 0;
zeldaDust = 1;

// calculate score
zeldaRound = (sand * zeldaSand) + (pebble * zeldaPebble) + (dirt * zeldaDirt) + (dust * zeldaDust);
zeldaScore = max(0, zeldaScore + zeldaRound);
zeldaDialogue = NULL_STRING;

// if perfect: advance to next level and reset score; get special dialogue
if (zeldaPerfect == drink[sand, pebble, dirt, dust]) {
    // advance to next level
    zeldaLevel += 1;
    // reset score
    zeldaScore = 0;
    // get special dialogue
    if (zeldaLevel == 1) { 
        zeldaDialogue = "Dear Clisp that's spicy!... this dwarf sure done needed to quaff a Dirt Djinni! My throat's scorching! That's the stuff... but it does make ya want water more, don't it now? Water..."
    } 
    else if (zeldaLevel == 2) { 
        zeldaDialogue = "What in blue blazes is this? I didn't think a Trail could be this Dusty! Makes me crave a glass of water...";
    }
    else if (zeldaLevel == 3) {
        zeldaDialogue = "Hoot and holler! It's a Rocky Top!";
    }
}
// if score exceeded, advance to next level and reset score
if (zeldaScore >= zeldaLevel + 2) {
    zeldaLevel += 1;
    zeldaScore = 0;
}

if (zeldaDialogue == NULL_STRING) {
    if dust >= 1
        
    scr_event_build_dialogue("Zelda", NULL, "");
    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
    scr_event_build_dialogue("Zelda", NULL, "");
    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
}
else {
    scr_event_build_dialogue("Zelda", NULL, zeldaDialogue);
    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
    scr_event_build_dialogue("Zelda", NULL, "");
    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
}


//------------------------------ CHARACTER TASTES ------------------------------














