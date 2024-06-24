// Script for Jilled-In Dwarf, a dwarf near the chip seller Fievel in Brain City
// usage: event_bct_jill01

// description:

// variables used:
    

if (argument0 == SCRIPT_START) {
    // Init!

} 
else if (argument0 == SCRIPT_STEP) {

}

else if (argument0 == SCRIPT_INTERACT) {
    
    var blank = id;
    
    var event = scr_event_create_main();
    var snippet = scr_event_create_child(event);
    
    //-------------
    // SNIPPET
    //-------------
    with (snippet) {
    
    }  
    
    //-----------
    // MAIN EVENT
    //-----------
    with (event) {
        // chipInstalled == 1
        if chipInstalled == 0 {
            if jillState == 0 {
                Jilled-In Dwarf
                "Looking for a chip?"

                X114JAM9
                "Umm, I don't know... should I be?"

                Jilled-In-Dwarf
                "I'll let you decide for yourself."
                
                * some stupid led blinks somewhere, or something *
                
                X114JAM9
                "Whoa!"
                
                Jilled-In Dwarf
                "No kidding. I wouldn't go anywhere without this baby. I love my chips! ... but FYI you're gonna need to get slotted with some cyberware first."
                
                X114JAM9
                "(Cyberware...?)"
                jillState, 1
            }
            // Early Game
            else if time <= jillTime1 {
                if jillState == 1 {
                    Jilled-In Dwarf
                    "Down a few floors from here is where you'll run into your first techsurg or deckdoc. They've usually got portable, lightweight setups... with good reason. When you're out to supply the cyber-sapien rennaissance AND dodge Big Data, only three words matter: mobility, mobility, mobility."
                    jillState, 2
                }
                else if jillState == 2 {
                    Jilled-In Dwarf
                    "Mobility, mobility, mobility."
                }
            }
            // Mid Game
            else if time <= jillTime2 {
                if jillState == 1 {
                    Jilled-In Dwarf

                    jillState, 2
                }
                else if jillState == 2 {
                    Jilled-In Dwarf
                    "Mobility, mobility, mobility."
                }
            }
            // Late Game
            else if time <= jillTime3 {
                if jillState == 1 {
                    Jilled-In Dwarf

                    jillState, 2
                }
                else if jillState == 2 {
                    Jilled-In Dwarf
                    "Mobility, mobility, mobility."
                }
            }
        } 
        // chipInstalled == 1;
        else {
            if jillState == 0 {
                switch string(chipInstaller) {
                    case:
                        Jilled-In Dwarf
                        "Aww, nice rig! Carbon tooling on the blast panel, vapor-trace heatsinks on the cerebral bus, and those OLEDs! It's hot, such a hot rig."
                        break;
                    case:
                        Jilled-In Dwarf
                        "Sweet datajack, kid. BV-1120s are a classic, vintage pick. Like, those thulium sway-terminals on the pistonettes. They stopped making them in the 1200 series. Aw, why the heck am I telling you. You picked it, you must know your stuff! Carry on!"
                        break;
                    case:
                        Jilled-In Dwarf
                        "Haha, nice rig, n00jaq."
                        break;
                    case:
                        Jilled-In Dwarf
                        "I'm  on your cerebral DATspike. Looks are important! Some people just don't get that... anyway, make sure you keep an eye on your dorsal phasecell. The 5338s have a nice clock on paper but the longevity's not quite there. Just keep an eye out!"
                        break;
                }
                
            } else if jillState == 1 {
                switch string(chipInstaller) {
                    case:
                        endquote = "Now you've got me jonesing... a dwarf and its shekel shall soon part, right?"
                        // dwarfs and their shekels shall soon part, right
                        
                        break;
                    case:
                        Jilled-In Dwarf
                        "Your rig looks like it has many years left of faithful service... just take care of it!"
                        break;
                    case:
                        Jilled-In Dwarf
                        "Look into getting a real rig!"
                        break;
                    case:
                        Jilled-In Dwarf
                        "Keep rocking it, kid. Send any haters my way"
                        break;
                }
            }
        }   
    }
    scr_event_advance(event);
} 