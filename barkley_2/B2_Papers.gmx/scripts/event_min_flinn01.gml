script = "

IF flinnDialog = 0 | GOTO | REPLY0
IF flinnDialog = 1 | GOTO | REPLY1
IF flinnDialog = 2 | GOTO | REPLY2

REPLY0
DIALOG | Flinn | Aww, m'back! Slaving away is hard work, let me tell ya. But it is not without upsides. Reliable employment, free meals, good exercise and no tedious paperwork! There's always two sides to a coin.
QUEST | flinnDialog = 1  
          
REPLY1
DIALOG | Flinn | Many dwarfs in my family are slaves. Now ofcourse you can't say that any of us chose this profession. But we Proboscus Dwarfs love mining more than anything so there really isn't THAT much to complain about honestly.
QUEST | flinnDialog = 2 
            
REPLY2
DIALOG | Flinn | I sometimes have this nightmare where I'm floating through the skies next to this gorgeous vein of sapphire, but when I try to lift my pickaxe it's too heavy! I can't even lift it above my ankles, let alone pummel the sapphires. I have a theory that being deprived of the possibility to grope rubies and gemstones and to mine tall mountains is a subconscious fear that all dwarfs have.
QUEST | flinnDialog = 0             
    


// Talk to Flinn while in Beta Camp //
IF flinnDialog = 0 | GOTO | REPLY0
IF flinnDialog = 1 | GOTO | REPLY1
IF flinnDialog = 2 | GOTO | REPLY2

REPLY0
DIALOG | Flinn | Hmm, so much material to inspect but almost none of it seems worth the effort. Granite, limestone, gneiss... What use are these to anyone? What are the Duergars really after?
QUEST | flinnDialog = 1  
          
REPLY1
DIALOG | Flinn | Every now and then there is something of value for me to inspect. Rubies, Saphires, Bitcoins... But most of my time all I see is common species of stones and rock.
QUEST | flinnDialog = 2 
            
REPLY2
DIALOG | Flinn | My talents are wasted here, inspecting these... pebbles. Even the occasional ruby or gemstone can't lift my spirits.
QUEST | flinnDialog = 0   



DETAINED
DIALOG | Flinn | Hey, what are the Duergars doing out there? Why did they send us here to wait? What's going on?"
            

// Nose Dwarf Flinn // Filler NPC // 
// ***************************************************************************************** //
// Talks about the slave dwarf lifestyle as if its a career choice or something pleasant 
// Can also provide some insight/hints as to what the Duergars are up to in the mines 
// ***************************************************************************************** //

/*

// Initialize //
if (argument0 == SCRIPT_START) 
    {
    // ****** Flinn exists on Alpha, Beta and Sneak ****** //
    // Alpha camp // Exists on Alpha Camp up until Alpha Camp is abandonend //
    if room = r_min_baseCampAlpha01 then
        {
        if scr_time_get() >= 6 then scr_event_interactive_deactivate(); 
        }
    
    // Beta Camp // Exists on Beta Camp up until Sneak Mission begins //
    else if room = r_min_baseCampBeta01 then
        {
        if scr_min_cspear() == "during" or scr_min_cspear() == "after" then scr_event_interactive_deactivate(); 
        }
     
    // Sneak Mission // Exists during Sneak Mission in the detainment room //
    else if room = r_min_sneakPassage01 then
        {
        if scr_min_cspear() == "before" or scr_min_cspear() == "prep" or scr_min_cspear() == "after" then scr_event_interactive_deactivate(); 
        }
    } 
                  
// Step //
if (argument0 == SCRIPT_STEP) 
    {
    
    }

// Interact //
else if (argument0 == SCRIPT_INTERACT) 
    {
    // Variables //
    var event = scr_event_create_main();
    var reply = irandom(2);
        
    // Main event //
    with (event) 
        {
        // Talk to Flinn while in Alpha Camp //
        if room = r_min_baseCampAlpha01 then
            {
            // Reply 01 //
            if reply = 0 then scr_event_build_dialogue("Flinn", NULL, "Aww, m'back! Slaving away is hard work, let me tell ya. But it is not without upsides. Reliable employment, free meals, good exercise and no tedious paperwork! There's always two sides to a coin.");
            
            // Reply 02 //
            else if reply = 1 then scr_event_build_dialogue("Flinn", NULL, "Many dwarfs in my family are slaves. Now ofcourse you can't say that any of us chose this profession. But we Proboscus Dwarfs love mining more than anything so there really isn't THAT much to complain about honestly.");
            
            // Reply 03 //
            else if reply = 2 then scr_event_build_dialogue("Flinn", NULL, "I sometimes have this nightmare where I'm floating through the skies next to this gorgeous vein of sapphire, but when I try to lift my pickaxe it's too heavy! I can't even lift it above my ankles, let alone pummel the sapphires. I have a theory that being deprived of the possibility to grope rubies and gemstones and to mine tall mountains is a subconscious fear that all dwarfs have.");
            }
    
        // Talk to Flinn while in Beta Camp //
        else if room = r_min_baseCampBeta01 then
            {
            // Reply 01 //
            if reply = 0 then scr_event_build_dialogue("Flinn", NULL, "Hmm, so much material to inspect but almost none of it seems worth the effort. Granite, limestone, gneiss... What use are these to anyone? What are the Duergars really after?");
            
            // Reply 02 //
            else if reply = 1 then scr_event_build_dialogue("Flinn", NULL, "Every now and then there is something of value for me to inspect. Rubies, Saphires, Bitcoins... But most of my time all I see is common species of stones and rock.");
            
            // Reply 03 //
            else if reply = 2 then scr_event_build_dialogue("Flinn", NULL, "My talents are wasted here, inspecting these... pebbles. Even the occasional ruby or gemstone can't lift my spirits.");
            }
    
        // Talk to Flinn while in Detainemnt / during Sneak Mission //
        else if room = r_min_sneakPassage01 then
            {
            // Only one reply //
            scr_event_build_dialogue("Flinn", NULL, "Hey, what are the Duergars doing out there? Why did they send us here to wait? What's going on?");
            }
        }
    scr_event_advance(event);
    }
