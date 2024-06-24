// PREFIX 1 // BULLET MOTION ETC //
if (argument[0] == "prefix1")
{
    // EMPTY
    scr_combat_weapons_fusion_affixhood("create prefix1", "empty", "empty", "empty", "Empty Prefix 1");// Empty prefix must always be created
                                                    
    // MINUS
    scr_combat_weapons_fusion_affixhood("create prefix1", "NoScope360",     "minus", "random", "Shots fire into a random direction.");    
    scr_combat_weapons_fusion_affixhood("create prefix1", "Polarized",      "minus", "homing", "Shots avoid enemies.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Fetching",       "minus", "bounce", "Shots return to the shooter.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Spiraling",      "minus", "curved", "Shots spiral out of control.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Pensioner's",    "minus", "firing", "Shots slow down after being fired.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Afterburner",    "minus", "linear", "Shots fire into the opposite direction.");
                                                 
    // PLUS
    scr_combat_weapons_fusion_affixhood("create prefix1", "Magician's",     "plus", "random", "Shots fire from around the player.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Gravitational",  "plus", "homing", "Shots seek the nearest enemy.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Ricocheting",    "plus", "bounce", "Shots ricochet off solid surfaces.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Surfing",        "plus", "curved", "Shots move in a wave pattern.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Dotline" ,       "plus", "firing", "Shots turn periodically.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Ghost",          "plus", "linear", "Shots pierce through enemies.");      
                                                  
    // POUND
    scr_combat_weapons_fusion_affixhood("create prefix1", "ADHD",           "pound", "random", "Shots are out of control.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Proximity",      "pound", "homing", "Shots fire towards nearest enemy.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Chaining",       "pound", "bounce", "Shots chain to multiple enemies.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Orbiting",       "pound", "curved", "Shots circle around the braster.");
    scr_combat_weapons_fusion_affixhood("create prefix1", "Berzerk'd",      "pound", "firing", "Gun has anger issues.");        
    scr_combat_weapons_fusion_affixhood("create prefix1", "Flooding",       "pound", "linear", "Gun can fire multiple shots at once.");
    }
                                                    
// PREFIX 2 - PERIODIC
else if (argument[0] == "prefix2")
{
    // EMPTY
    scr_combat_weapons_fusion_affixhood("create prefix2", "empty", "empty", "empty", "empty", "Empty Prefix 2");// Empty prefix must always be created
                                                    
    // BOTTOM
    scr_combat_weapons_fusion_affixhood("create prefix2", "Malnourishing",      "bottom", "bio", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Tubercular",         "bottom", "bio", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Thorny",             "bottom", "bio", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Withering",          "bottom", "bio", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Fragmenting",        "bottom", "cyber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Compressing",        "bottom", "cyber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Overheating",        "bottom", "cyber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Uninstalling",       "bottom", "cyber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Homeopathic",        "bottom", "mental", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Busting",            "bottom", "mental", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Discriminating",     "bottom", "mental", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Stupefying",         "bottom", "mental", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Godless",            "bottom", "zauber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Narcotizing",        "bottom", "zauber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Zaubric",            "bottom", "zauber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Disenchanting",      "bottom", "zauber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Adhesive",           "bottom", "cosmic", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Push-Over",          "bottom", "cosmic", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Decimating",         "bottom", "cosmic", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Ionizing",           "bottom", "cosmic", "properties", "Add Description");
                                                    
    // TOP
    scr_combat_weapons_fusion_affixhood("create prefix2", "Gut-wrenching",      "top", "bio", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Calorizing",         "top", "bio", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Slurping",           "top", "bio", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Composting",         "top", "bio", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Pariahing",          "top", "cyber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Unzipping",          "top", "cyber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Boobytrapping",      "top", "cyber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Interfacing",        "top", "cyber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Aging",              "top", "mental", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Traumatic",          "top", "mental", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Mindstraining",      "top", "mental", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Meditating",         "top", "mental", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Feebling",           "top", "zauber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Banishing",          "top", "zauber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hexing",             "top", "zauber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Wizardly",           "top", "zauber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Paganizing",         "top", "cosmic", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Agonizing",          "top", "cosmic", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Radiating",          "top", "cosmic", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Celestial",          "top", "cosmic", "properties", "Add Description");
                                                    
    // CHARM
    scr_combat_weapons_fusion_affixhood("create prefix2", "Blighting",          "charm", "bio", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hiccuping",          "charm", "bio", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Deathbound",         "charm", "bio", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Bionic",             "charm", "bio", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Shocking",           "charm", "cyber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hot-Swapping",       "charm", "cyber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Transhuman",         "charm", "cyber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Mindjacker",         "charm", "cyber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Anti-social",        "charm", "mental", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Anesthetic",         "charm", "mental", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Darwinic",           "charm", "mental", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Psychomancer",       "charm", "mental", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Dooming",            "charm", "zauber", "capability", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Eight Armed",        "charm", "zauber", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Glamping",           "charm", "zauber", "hp", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Vortex",             "charm", "zauber", "properties", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Crit",               "charm", "cosmic", "capability", "Chance to deal 500% Cosmic Damage");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Equalizing",         "charm", "cosmic", "weight", "Add Description");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Chronic",            "charm", "cosmic", "hp", "Readjust health to 50% - 150%");
    scr_combat_weapons_fusion_affixhood("create prefix2", "Starbabby",          "charm", "cosmic", "properties", "Add Description");
}
                                                    
// AFFIX - VARIOUS EFFECTS
else if (argument[0] == "suffix")
{
    // EMPTY
    scr_combat_weapons_fusion_affixhood("create suffix", "empty", "empty", "empty", "empty", "Empty Prefix");// Empty prefix must always be created
                                                    
    // DOWN
    scr_combat_weapons_fusion_affixhood("create suffix", "of Allergy",              "down", "bio", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Citronella",           "down", "bio", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Dank Musk",            "down", "bio", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Ballzerker Bball", "down", "cosmic", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Stoic Bball",      "down", "cosmic", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Vengeful Bball",   "down", "cosmic", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Gibson",           "down", "cyber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with Nanomachines",       "down", "cyber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Countermeasure",       "down", "cyber", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of Muramasa",             "down", "mental", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Masamune",             "down", "mental", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Murasame",             "down", "mental", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "from Heck",               "down", "zauber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Reaper's Digest",      "down", "zauber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Unlocking",            "down", "zauber", "reactive", "Add Description");
                                                    
    // STRANGE
    scr_combat_weapons_fusion_affixhood("create suffix", "of Herman's Dumbell",         "strange", "bio", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with the Heart of a Pistol",  "strange", "bio", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Mycelium",             "strange", "bio", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "with a Battery Charger",      "strange", "cosmic", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with the Heart of a Rifle",   "strange", "cosmic", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Power",                    "strange", "cosmic", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "with a NoScope360",           "strange", "cyber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with the Heart of a Minigun", "strange", "cyber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Let's Plays",          "strange", "cyber", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Circus",               "strange", "mental", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with the Heart of a Machine Gun", "strange", "mental", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Bailing Out",              "strange", "mental", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "cursed by a Gypsy Hex",       "strange", "zauber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with the Heart of a Shotgun", "strange", "zauber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Mice and Magic",           "strange", "zauber", "reactive", "Add Description");
                                                    
    // UP
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Entlord",              "up", "bio", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Anti-Swamp",               "up", "bio", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Familiars",                "up", "bio", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Quasar",               "up", "cosmic", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Perfectionist",        "up", "cosmic", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Eternity",                 "up", "cosmic", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Doxxer",               "up", "cyber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Perpetual War",            "up", "cyber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Caltropix",                "up", "cyber", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Encephalon",           "up", "mental", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "with a hole in the pocket",   "up", "mental", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Fight or Flight",          "up", "mental", "reactive", "Add Description");
    
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Ps. Pocus",            "up", "zauber", "aggressive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of Sacrifice",                "up", "zauber", "passive", "Add Description");
    scr_combat_weapons_fusion_affixhood("create suffix", "of the Forever Man",          "up", "zauber", "reactive", "Add Description");
}
