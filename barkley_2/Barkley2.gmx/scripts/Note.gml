/// Note(build [optional], take / give / have / selected / exclude / viewer / select / gallery / identity)

//////////////////////////////////
///NOTE: the sprite is called s_tnn_papers... you'll have to add it in there, and not anywhere else...
//       ALL NOTES ARE ADDED TO s_tnn_papers, event for events outside of tnn
//////////////////////////////////

// Note("take", note); <---- Gives hoopz a note
// Note("give", note); <---- Hoopz will lose this note
// Note("have", note); <---- Returns if Hoopz has that note

// Note("selected")            <-- Returns last selected note, "exit" is exit, "none" is no notes
// Note("exclude", "milagros", Note("selected")); <--- Excludes last selected note from Milagros (This is done AUTOMATICALLY)
// Note("include", "milagros", "Blank Paper"); <--- Includes Blank Paper to Milagros (if already excluded)

// BRINGING UP THE MENU
// Note("viewer")              <-- Invoke the note viewer
// Note("select", "milagros")  <-- Invoke the note selector
// Note("gallery", "goofster") <-- Invoke the gallery
// Note("identity")            <-- Invoke identity chooser

// DEBUG FUNCTIONS
// Note("clear")               <-- Clears all notes from inventory, and all exclusions from people
// Note("exists")              <-- Checks if note with the given name exists in the DB

// ALL COMMANDS IN NOTE CAN BE SET TO BUILD BY SIMPLY DOING...
// Note("build", "gallery", "goofster");

if (is_real(argument[0])) // This is the ACTION event, don't touch.
{
    var siz = ds_list_size(argument[0]) - 1;
    if (siz == 1) Note(ds_list_find_value(argument[0], 1));
    if (siz == 2) Note(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2));
    if (siz == 3) Note(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3));
    if (siz == 4) Note(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4));
    if (siz == 5) Note(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5));
    if (siz == 6) Note(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5), ds_list_find_value(argument[0], 6));
    scr_event_advance(id);
    return 1;
}
else if (argument[0] == "db") // @@@@@ SET THE VALUES FOR ART, NOTES, AND CHARACTERS HERE @@@@@ //
{
    // NOTES - Note("add note", subimage, name, sound)
    // Baldomero
    Note("add note", 0, "Blank Paper", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|0");
    Note("add note", 2, "Suicide Note", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|2~STR|To whoever finds this note:\forget about me, and forget\you saw this, my last missive\to a cruel world. This isn't\what I expected, and\certainly not what I asked\for. This is it... the end! I mean\it! No more living from this\point on. I'm all done, it's over\forever! That's it.|-77|-85|1|8600940|1");
    Note("add note", 2, "Augustino's Letter", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|2~STR|Hello. Good morning.\This is your dear friend who\is very much alive, Augustino.\I am currently engaged in  a\leisurely sewer junket and\will return shortly.  Don't\come looking for me as my\schedule is capricious.\Cordially yours, A.|-74|-82|1|8600940|1");
    // Joad
    Note("add note", 3, "Tattered Paper", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|4~STR|0501 - commence sortie|-134|-63|6|10092545|1~STR|0613 - waypoint BRAVO rea- \       hostiles neutralized|-134|-49|6|10027013|1~STR|0735 - waypoint DEBRA, \       McGillycuddy took\       shrapnel to the hams|-133|-25|6|10223620|1~STR|0747 - EVAC requested|-135|9|6|10223620|1~STR|0756 - unknown entity appro|-134|24|6|10223620|1");
    Note("add note", 3, "Ancient Scroll", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|4~STR|01000010011001010110111001100101011\00001011101000110100000100000011101\00011010000110010100100000010100110\11001010111011001100101011011100111\01000110100000100000010110100110100\10110011101100111011101010111001001\10000101110100001000000110110001101\00101100101001000000111010001101000\01100101001000000100001101101000011\01001011011000110010001110010011001\01011011100010000001101111011001100\01000000111010001101000011001010010\00000100001001100101011011000110111\10111001001101011001000000101000001\10100001100101011011100110111101101\10101100101011011100110111101101110|-49|-60|3|2595772|1~STR|      <0>\       _\     _[ ]_\   _[     ]_\ _[         ]_\[_____________]|-125|-48|9|0|1");
    Note("add note", 3, "Dead Soldier's Note (reused)", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|3~STR|MISSION COMPRIMISED|-105|-33|1|254|1~STR|BAINSHEE ATTACK|-92|-11|1|435|1~STR|REPORTING: SGT. -|-50|50|1|65716|1~STR|WAYPOINT DEBRA SEALED\CASUALTIES 80%|-108|9|1|65716|1~STR|W-W-T-B?|52|-57|0|254|1");
    Note("add note", 3, "Joad's Note (reused)", "ssn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|3~STR|MISSION COMPRIMISED|-105|-33|1|254|1~STR|BAINSHEE ATTACK|-92|-11|1|435|1~STR|REPORTING: SGT. -|-50|50|1|65716|1~STR|WAYPOINT DEBRA SEALED\CASUALTIES 80%|-108|9|1|65716|1~STR|W-W-T-B?|52|-57|0|254|1~STR|REPORTING: SGT. JOAD, LONGINUS|-50|50|1|65716|1~STR|--- 100%|-39|27|1|254|1");
    Note("add note", 4, "Dead Soldier's Note", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|4~STR|0501 - commence sortie|-133|-63|6|10092545|0.27~STR|0613 - waypoint BRAVO rea- \       hostiles neutralized|-135|-49|6|10027013|0.34~STR|0735 - waypoint DEBRA, \       McGillycuddy took\       shrapnel to the hams|-134|-25|6|10223620|0.23~STR|0747 - EVAC requested|-135|9|6|10223620|0.30~STR|0756 - unknown entity appro|-134|23|6|10223620|0.42~STR|MISSION COMPRIMISED|-105|-33|1|254|1~STR|BAINSHEE ATTACK|-92|-11|1|435|1~STR|REPORTING: SGT. -|-50|50|1|65716|1~STR|WAYPOINT DEBRA SEALED\CASUALTIES 80%|-108|9|1|65716|1~STR|W-W-T-B?|52|-57|0|254|1");
    Note("add note", 4, "Joad's Note", "ssn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|4~STR|0501 - commence sortie|-133|-63|6|10092545|0.27~STR|0613 - waypoint BRAVO rea- \       hostiles neutralized|-135|-49|6|10027013|0.34~STR|0735 - waypoint DEBRA, \       McGillycuddy took\       shrapnel to the hams|-134|-25|6|10223620|0.23~STR|0747 - EVAC requested|-135|9|6|10223620|0.30~STR|0756 - unknown entity appro|-134|23|6|10223620|0.42~STR|MISSION COMPRIMISED|-105|-33|1|254|1~STR|BAINSHEE ATTACK|-92|-11|1|435|1~STR|REPORTING: SGT. -|-50|50|1|65716|1~STR|WAYPOINT DEBRA SEALED\CASUALTIES 80%|-108|9|1|65716|1~STR|W-W-T-B?|52|-57|0|254|1~STR|REPORTING: SGT. JOAD, LONGINUS|-50|50|1|65716|1~STR|--- 100%|-39|27|1|254|1");
    Note("add note", 5, "Bloody Paper", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|5~STR|     - commence sortie|-133|-63|6|16475493|1~STR|       way   nt BRAVO rea- \       ho   les neu     zed|-133|-49|6|16777027|0.31~STR|   5 -    poi   DEBRA, \       Mc illy  ddy     \       shrapnel t   h|-132|-24|6|10223620|1~STR|0747 - EVAC requested|-135|10|6|16672102|0.17~STR|07   - unknown en   y|-135|24|6|10223620|0.27");
    // Anxo
    Note("add note", 6, "Sealed Letter", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|6");
    Note("add note", 7, "Love Letter", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|7~STR|My dearest,|-11|-88|9|13657769|1~STR| I wade through the muck and|-3|-55|8|16672102|1~STR| sludge for thee, guided not by|-17|-42|8|16672102|1~STR|the light of my torch, but by the |-15|-28|8|13657701|1~STR|internal compass of our love.|-13|-13|8|10249959|1~STR|Mine heart longs for your gentle|-14|1|8|16672102|1~STR|touch, and I also yearn for your|-14|15|8|16672102|1~STR|prize-winning chicken salad.|-14|30|8|16672102|1~STR|Prepare yourself, and some salad,|-13|46|8|13788773|1~STR|for my return.|-12|60|8|16672102|1~STR|You'res truly,|-7|74|9|13657769|1~STR|- A|110|85|9|13657769|1");
    // Eric
    Note("add note", -1, "Pet Shop Application", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|9");
    Note("add note", -2, "Completed Application", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|9");
    Note("add note", 11, "Pet Manifesto", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|11~STR|Pet Manifesto|-43|-4|7|16777215|1");
    Note("add note", 11, "Pet Apocrypha", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|11~STR|Pet Apocrypha|-43|-4|7|16777215|1");
    // Standalone notes
    Note("add note", 8, "Gamesmasterjasper's Vidcon Almanac", "sn_debug_one", "BAK|s_tnn_papers|8"); // VR Chair
    Note("add note", 11, "Cornrow's Plea", "sn_mnu_noteFlipLight01", " BAK|s_tnn_papers|11~STR|X1, this is an emergency.\We've been captured by \We need you to break us out!\I need to keep this short\'cuz they're getting suspicious\about us running Choco-mallows\through the undersewers.\I've left a gun for you under\this crate. Take it and get to\                        for the love\of Clispaeth! I can hear\them torturing Juicebox!\His screams are terrible!\Come save us, we're part\of the community!|-91|-87|13|16776516|1~STR|MR Z|35|-70|2|3355344|1~STR|Al Akihabara|-87|32|2|3355344|1");
    Note("add note", 12, "Clandestine Courts Baller Zine", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|12"); // Baller Zine
    Note("add note", 13, "Wilmer's Amortization Schedule", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|15~STR|By Holy Supreme\and Regnant Decree\of Lord Emperor\Cuchulainn|-23|-84|3|3355344|1~STR|It is hereby known to\Dwarfkin and Duergar alike\\That        \\of         ,\is duly charged with\remittance to The\Resplendent Coffers of\President Cuchulainn,\the value of\\      Cuchu-Bucks\or current equivalent\neuroshekels.\\Due upon the reading\of this decree.|-69|-48|3|0|1~STR|Mr. Wilmer|-41|-27|3|509|1~STR|Tir na nOg|-54|-13|3|254|1~STR|180,348|-68|36|3|509|1");
    Note("add note", 8, "Aelfleda's Eviction", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|15~STR|By Holy Supreme\and Regnant Decree\of Lord Emperor\Cuchulainn|-23|-83|3|3355344|1~STR|As your first and final\notice, The Tir na nOg\Department of Population\and Housing hereby evicts\your sorry ass and\sentences you to a miser-\able existence in the Sewer\in Accordance with\Section 1 Article 3 of the\Dwarf Codes.\\|-68|-27|3|0|1~STR|Eviction can be postponed\with a payment of |-67|47|3|0|1~STR|Aelfleda (homeowner),|-53|-42|3|11940402|1~STR|10,560|38|54|3|11940402|1~STR|Cuchu-Bucks.|-67|62|3|0|1");
    // Pravda Tir na nOg
    Note("add note", 14, "Pravda Tír na nÓg", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|14~STR|Yesterday's News for the forward-thinking dwarf.|-131|-89|3|0|1~STR|Find us online.|-146|-43|3|0|1~STR|YEAR: 666X, Day:|70|-42|3|0|1~STR|TIR NA NOG, N7 – The stage  is  set\at  the  Governor's  Mansion  as\cowering  dwarfs  welcome  the  Tir\na nOg Governor Decree, Elagabalus.\Governor Elagabalus, our fair city's\seventh, who  served with distinction\as the Mountain Hoosegow Operational\Warden, claims  he /'watches  city\budgets  like [he] monitors jailbirds\rotting in their cells”, adding he's\also proud to /'bleeds blue for\Cuchulainn./' Polls witch show men,\women and pets find his policies\terrifying on a fundamental level\are expected to be quelled in time\for the inauguration.|-143|-13|3|0|1~STR|THE GUBERNATORIAL IRON FIST|-143|-32|1|0|1");
    Note("add note", 14, "Decoded Pravda", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|14~STR|Yesterday's News for the forward-thinking dwarf.|-131|-89|3|0|1~STR|Find us online.|-146|-43|3|0|1~STR|YEAR: 666X, Day:|70|-42|3|0|1~STR|TIR NA NOG, N7 – The stage  is  set\at  the  Governor's  Mansion  as\cowering  dwarfs  welcome  the  Tir\na nOg Governor Decree, Elagabalus.\Governor Elagabalus, our fair city's\seventh,      served with distinction\as the Mountain Hoosegow Operational\Warden, claims  he /'         city\budgets  like [he] monitors jailbirds\rotting in their cells”, adding he's\also proud to /'bleeds      for\Cuchulainn./' Polls witch show    ,\women and pets find his policies\terrifying on a fundamental level\are expected to be quelled in time\for the inauguration.|-144|-13|3|0|1~STR|THE GUBERNATORIAL IRON FIST|-143|-32|1|0|1~STR|who|-91|20|4|254|1~STR|watches|-22|34|2|509|1~STR|blue|-13|55|2|254|1~STR|Men|18|62|2|509|1");
    //MAPS
    Note("add note", 16, "Sewers, Floor One", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|16");
    Note("add note", 17, "Sewers, Floor Two", "sn_mnu_noteFlipMedium01", "BAK|s_tnn_papers|17");
    //Operation: Reverse Dunkirk
    Note("add note", 18, "Sealed Secret Dossier", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|18");
    Note("add note", 19, "Resealed Secret Dossier", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|19");
    Note("add note", 20, "Re-resealed Secret Dossier", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|20");
    Note("add note", 21, "Re-re-resealed Secret Dossier", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|21");
    Note("add note", 22, "Cuchu Cashier's Cheque", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|22");
    
    // Forged Document for Melqart    
    Note("add note", 19, "Forged Document", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|0~STR|The Duergar know as Melqart\is hereby ordered to report\back to the hoosegow and await\for further instructions.|-74|-75|8|6021631|1~STR|The Duergar in possession of this\document shall take over the duties\of the Duergar Melqart until\further notice. The orders detailed\in this document are to be\carried out immediately.\\Failing to follow these orders is\punishable by death and torture.|-78|-19|8|5955838|1~STR|- Warden|16|89|9|130816|1");
    //Gaming Klatch
    Note("add note", 10, "Printed Invitation", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|10~STR|Wrist-CONP\\   2054|-53|-72|5|0|1~STR|PRESENT THIS AT\THE GAMERS DOOR\AT 12:00 TODAY\BRING WITH YOU\NOONE\\IN YOUR WILDEST\GAMER DREAMS YOU\CAN NOT IMAGINE\THE DANKNESS OF\THE SURPRISES\THAT AWAIT YOU|-84|-21|5|0|1");
    Note("add note", 10, "D'archimedes Invitation", "sn_mnu_noteFlipLight01", "BAK|s_tnn_papers|10~STR|Wrist-CONP\\   2054|-53|-72|5|0|1~STR|PRESENT THIS AT\THE GAMERS DOOR\AT 12:00 TODAY\BRING WITH YOU\NOONE\\IN YOUR WILDEST\GAMER DREAMS YOU\CAN NOT IMAGINE\THE DANKNESS OF\THE SURPRISES\THAT AWAIT YOU|-84|-21|5|0|1");
    
    // Pocahontas' letter to Don Diego //
    Note("add note", 23, "Pocahontas' Letter", "sn_mnu_noteFlipHeavy01", "BAK|s_tnn_papers|23");
    
    // PEOPLE YOU CAN GIVE NOTES TO, USE THEIR NAME TO INVOKE THEM WITH Note("select", characters name")
    Note("add person", "Timelord", "TIMELORD NOTE", event_placeholder);
    Note("add person", "Milagros", "Hand Over What Scoop...?", event_placeholder);
    Note("add person", "Gelasio", "Got any clues?", event_placeholder);
    Note("add person", "Sviatoslav", "Any cyphers in your pocket?", event_placeholder);
    Note("add person", "Cuthbert Resume", "What should I submit...?", event_placeholder);
    Note("add person", "Cuthbert Cover", "What should I submit...?", event_placeholder);
    Note("add person", "Absalom", "Turn In What Intel...?", event_placeholder);
    Note("add person", "Vikingstad", "Give Which Paperwork...?", event_placeholder);
    Note("add person", "Dying Dwarf", "A piece of paper for him?", event_placeholder);
    Note("add person", "Melqart", "Duergar document for Melqart...?", event_placeholder);
    Note("add person", "Terlet", "You're gonna need to use something.", event_placeholder);
    Note("add person", "Cpl. Lafayette", "Operation: Reverse Dunkirk- what was it again?", event_placeholder);
    Note("add person", "Cherlindria", "She probably only wants the Dossier.", event_placeholder);
    Note("add person", "Slag", "Slag knows what to do... do you?", event_placeholder);
    Note("add person", "Carol", "Carol can help with your notes.", event_placeholder);
    Note("add person", "Don Diego de la Vega", "Letter designated to Don Diego de la Vega...", event_placeholder);
                        
    // ART GALLERY - Note("add art", subimage, name, description)
    Note("add art", 0, "Goofster", "Goofsters are tall and slender creatures most well known for their supernatural hardy constitution. ##While Goofsters are considered to be benevolent, social creatures, they are rarely, if ever, seen among their kin. Instead they prefer the company of sentient mallards and rats. ##Goofsters live and thrive in ancient subterranean ruins but are highly susceptible to microwave tunnels.");
    Note("add art", 1, "Slender Man", "Slender Men are the cursed offspring of a forgotten Mesopotamian King. They are born without a face and as such are forever plagued by an unsatiable hunger. ##The dark magicks that run in their veins makes them immortal, which rather than being a divine blessing only serves to prolong their suffering. These conditions make the Slender Men weak and malnourished, hence their name.");
    Note("add art", 2, "Drakescorned", "The Drakescorned are a noble subgenus of orc who shun the use of all nunchucks. ##Versed in asceticism, the Drakescorned live in secluded mountain monasteries where they train their minds and bodies to deflect bows and arrows. ##As their name implies, they recieve a -2 penalty to all drake-based skill checks but more than make up for it with high level juggling. ##The Drakescorned are known for their elaborate wicker baskets.");
    Note("add art", 3, "Sergal", "Sergals are the mystical offspring of highborne elves and werewolves. They are worshipped in many cultures almost exclusively as benevolent deities protecting the realm. ##All Sergals have a pathological fear of ghosts, and they try to avoid ancient ruins and graveyards any way they can.");
    Note("add art", 4, "Geldrach", "Geldrachs are a very common barnyard animal found on many traditional farms. They are a genetically engineered species that are bred for the sole purpose of being cattle, and on some more rare occasions, for their milk. ##They are easily identifiable by their mixture of black and brown fur.");
    Note("add art", 5, "Dire Juggler", "Dire Juggler are distant cousins of more well known species, Jugglers. Isolated and imprisoned onto a distant island during the events of The Second Cudgel War the Firstborne Jugglers slowly changed to a more dire existence. ##To this day not much else is known about the Dire Jugglers, but their recent resurgence aligns with the prophecy of the end times.");
    Note("add art", 6, "Hellmonster", "Hellmonster are considered to be one of the most formidable demons of Hell, and their high position in the demon hierarchy supports this viewpoint. They use devastating Hell Magicks to battle their foes and have the ability to conjure Illiorchs Infernal Worms without spending any magicpoints. ##Hellmonsters are archenemies with Sporelips and Elder Stardusters.");
    //Note("add art", 7, "Mujahoudini", "The Mujahoudini are desert dwelling mystics who live solely to entertain people with their crazy stunts and daring feats. ##Not much is known about their day to day existence, but many rumours suggest that the Mujahoudini do not eat, drink or sleep, but rather spend every waking moment honing their art and protecting their oil.");
}
else if (argument[0] == "include") // Note("include", name, note)
{
    var qst = "note_exclude_" + string_lower(argument[1]);
    if (is_real(scr_quest_get_state(qst))) Quest(qst, ""); // Clear if exclusion doesn't exist
    var txt = string_replace_all(scr_quest_get_state(qst), argument[2] + "|", "");
    Quest(qst, txt);
    show_debug_message("Note('exclude') - " + argument[1] + " excludes are now... " + txt);
}
else if (argument[0] == "exclude") // Note("exclude", name, note)
{
    if (argument[2] == "exit" || argument[2] == "none") return -1;
    var qst = "note_exclude_" + string_lower(argument[1]);
    if (is_real(scr_quest_get_state(qst))) Quest(qst, ""); // Clear if exclusion doesn't exist
    var txt = scr_quest_get_state(qst) + argument[2] + "|";
    Quest(qst, txt);
    show_debug_message("Note('exclude') - " + argument[1] + " excludes are now... " + txt);
}
else if (argument[0] == "selected")
{
    if (argument_count == 1) return global.noteSelected;
    else global.noteSelected = argument[1];
}
else if (argument[0] == "exists")
{
    if (ds_list_find_index(global.noteList, argument[1]) == -1) return 0; else return 1;
}
else if (argument[0] == "have")
{
    if (Note("exists", argument[1]) == 0) { show_debug_message("WARNING: You are checking to see if you have a note that doesn't exist."); return -1; }
    return scr_quest_get_state("note_have_" + string_lower(argument[1]));
}
else if (argument[0] == "take")
{
    if (Note("exists", argument[1]) == 0) { show_debug_message("WARNING: You are taking a note that doesn't exist."); return -1; }
    if (Note("have", argument[1]) == 1) { show_debug_message("WARNING: You are taking a note you already have."); return -1; }
    Quest("note_have_" + string_lower(argument[1]), 1);
}
else if (argument[0] == "give")
{
    if (Note("exists", argument[1]) == 0) { show_debug_message("WARNING: You are giving a note that doesn't exist."); return -1; }
    if (Note("have", argument[1]) == 0) { show_debug_message("WARNING: You are giving a note you don't have."); return -1; }
    Quest("note_have_" + string_lower(argument[1]), 0);
}
else if (argument[0] == "clear") // Clear all notes and exclusions
{
    for (var i = 0; i < ds_list_size(global.noteList); i += 1)
    {
        Quest("note_have_" + string_lower(ds_list_find_value(global.noteName, i)), 0);
    }
    for (var i = 0; i < ds_list_size(global.personList); i += 1)
    {
        Quest("note_exclude_" + string_lower(ds_list_find_value(global.personName, i)), 0);
    }
}
else if (argument[0] == "build") // Shift functions to action
{
    var act = ds_list_create();
    ds_list_add(act, Note);
    if (argument_count > 1) ds_list_add(act, argument[1]);
    if (argument_count > 2) ds_list_add(act, argument[2]);
    if (argument_count > 3) ds_list_add(act, argument[3]);
    if (argument_count > 4) ds_list_add(act, argument[4]);
    if (argument_count > 5) ds_list_add(act, argument[5]);
    if (argument_count > 6) ds_list_add(act, argument[6]);
    if (argument_count > 7) ds_list_add(act, argument[7]);
    ds_list_add(_event_list, act);
    return ds_list_size(_event_list) - 1;
}
else if (argument[0] == "gallery") // Note("gallery", "goofster") - Creates gallery object for Goofster
{
    obj = instance_create(0, 0, oNote);
    obj.typ = "gallery";
    obj.notClk = 0;
    obj.galX = floor(384 * 0.25);
    obj.galY = floor(240 * 0.5) - 6;
    obj.butAmt = 1;
    var ind = ds_list_find_index(global.artNameLower, string_lower(argument[1]));
    if (ind == -1) ind = 0;
    obj.sub = ds_list_find_value(global.artSub, ind);
    obj.tit = ds_list_find_value(global.artName, ind);
    obj.dsc = ds_list_find_value(global.artText, ind);
}
else if (argument[0] == "identity")
{
    obj = instance_create(0, 0, oNote);
    obj.typ = "identity";
    obj.tit = "Choose your identity...";
    obj.notClk = 0;
    obj.butAmt = 0;
}
else if (argument[0] == "viewer")
{
    obj = instance_create(0, 0, oNote);
    obj.typ = "viewer";
    obj.notClk = 0;
}
else if (argument[0] == "select")
{
    global.noteExclude = scr_quest_get_state("note_exclude_" + string_lower(argument[1]));
    obj = instance_create(0, 0, oNote);
    global.noteExclude = "";
    var ind = ds_list_find_index(global.personNameLower, string_lower(argument[1]));
    if (ind == -1) ind = 0;
    obj.tit = ds_list_find_value(global.personText, ind);
    obj.event = ds_list_find_value(global.personEvent, ind);
    obj.person = ds_list_find_value(global.personName, ind);
}
else if (argument[0] == "info")
{
    noteLower = string_lower(argument[1]);
    _ind = ds_list_find_index(global.noteNameLower, noteLower);
    if (_ind != -1)
    {
        noteSub = ds_list_find_value(global.noteSub, _ind);
        noteName = ds_list_find_value(global.noteName, _ind);
        noteSound = ds_list_find_value(global.noteSound, _ind);
    }
    else
    {
        noteSub = 0;
        noteLower = "invalid note";
        noteName = "Invalid Note";
        noteSound = "sn_debug_one";
    }
}
else if (argument[0] == "add person")
{
    ds_list_add(global.personName, argument[1]);
    ds_list_add(global.personNameLower, string_lower(argument[1]));
    ds_list_add(global.personText, argument[2]);
    ds_list_add(global.personEvent, argument[3]);
    // person was here quest variable
    ds_list_add(global.personList, argument[1]); // Add to note person list
}
else if (argument[0] == "add art") // Note("add art", subimage, name, description) - sGallery is sprite
{
    ds_list_add(global.artSub, argument[1]);
    ds_list_add(global.artName, argument[2]);
    ds_list_add(global.artNameLower, string_lower(argument[2]));
    ds_list_add(global.artText, argument[3]);
}
else if (argument[0] == "add note") // Note("add note", subimage, name, sound) - s_tnn_papers is sprite
{
    ds_list_add(global.noteSub, argument[1]);
    ds_list_add(global.noteName, argument[2]);
    ds_list_add(global.noteNameLower, string_lower(argument[2]));
    ds_list_add(global.noteSound, argument[3]);
    ds_list_add(global.noteData, argument[4]);
    // note have quest variable was here
    ds_list_add(global.noteList, argument[2]); // Add to note list
}
else if (argument[0] == "game init") // Run on game init
{
    global.noteExclude = ""; // Temp for transferring to oNote
    global.noteSelected = "";
    
    global.noteList = ds_list_create(); // Contains name of every note in the game
    global.personList = ds_list_create(); // Contains name of every note person in the game
    
    global.noteSub = ds_list_create();
    global.noteName = ds_list_create();
    global.noteNameLower = ds_list_create();
    global.noteSound = ds_list_create();
    global.noteData = ds_list_create();
    
    global.personName = ds_list_create();
    global.personNameLower = ds_list_create();
    global.personText = ds_list_create();
    global.personEvent = ds_list_create();

    global.artSub = ds_list_create();
    global.artName = ds_list_create();
    global.artNameLower = ds_list_create();
    global.artText = ds_list_create();
    
    global.dslNoteFont = ds_list_create();
    ds_list_add(global.dslNoteFont, global.fn_1);
    ds_list_add(global.dslNoteFont, global.fn_1o);
    ds_list_add(global.dslNoteFont, global.fn_2);
    //ds_list_add(dslNoteFont, global.fn_3);
    ds_list_add(global.dslNoteFont, global.fn_small);
    ds_list_add(global.dslNoteFont, global.fn_2c);
    ds_list_add(global.dslNoteFont, global.fn_2o);
    ds_list_add(global.dslNoteFont, global.fn_2f);
    //ds_list_add(dslNoteFont, global.fn_5);
    ds_list_add(global.dslNoteFont, global.fn_5o);
    ds_list_add(global.dslNoteFont, global.fn_7oc);
    ds_list_add(global.dslNoteFont, global.fn_12oc);
    ds_list_add(global.dslNoteFont, global.fn_5os);
    ds_list_add(global.dslNoteFont, global.fn_7ocs);
    ds_list_add(global.dslNoteFont, global.fn_12ocs);
    ds_list_add(global.dslNoteFont, global.fn_tactics);
    ds_list_add(global.dslNoteFont, global.fn_tactics_bold);
    
    Note("db");
}
else if (argument[0] == "init") // Run under new player identity
{
    global.noteSelected = "";
    
    for (i = 0; i < ds_list_size(global.noteNameLower); i += 1)
    {
        Quest("note_have_" + ds_list_find_value(global.noteNameLower, i), 0); // Set that I don't have the note
    }
    for (i = 0; i < ds_list_size(global.personNameLower); i += 1)
    {
        Quest("note_exclude_" + ds_list_find_value(global.personNameLower, i), ""); // Make exclusion list empty
    }
}
else if (argument[0] == "draw resume") // draw resume, 1 = x, 2 = y, 3 = progress, 4 = ansInd[0], 5 = andInd[1], 6 = andInd[2], 7 = ansInd[3]
{
    var i = 0;
    progress = argument[3];
    qx = 64;
    qs = 16;
    queX[i] = qx; queY[i] = 80;
    que[i] = "References: ";
    ansX[i] = queX[i] + 80; 
    ansY[i] = queY[i];// + qs;
    _ans[i, 0] = P_NAME;
    _ans[i, 1] = "Not applicable";
    _ans[i, 2] = "Lots of animals";
    _ans[i, 3] = "Cuchulainn";

    i = 1;
    queX[i] = qx; queY[i] = ansY[i - 1] + qs;
    que[i] = "Experience:";
    ansX[i] = queX[i] + 80;// + 96; 
    ansY[i] = queY[i];
    _ans[i, 0] = "None (but full of gumption)";
    _ans[i, 1] = "DwarfNET Moderator";
    _ans[i, 2] = "Full-time MMO player";
    _ans[i, 3] = "Bat guano enthusiast";
    _ans[i, 4] = "fuckyeahbulldogs.cogworx.edu";

    i = 2;
    queX[i] = qx; queY[i] = ansY[i - 1] + qs;// + qs;
    que[i] = "Qualifications:";
    ansX[i] = queX[i];// + 96; 
    ansY[i] = queY[i] + qs;
    _ans[i, 0] = "Love animals, works with them daily";
    _ans[i, 1] = "Unbelievably loud falcon mimicry";
    _ans[i, 2] = "Perhaps my BARNSTARS will convince you";
    _ans[i, 3] = "Basically none, completely dysfunctional cretin";
    _ans[i, 4] = "Mole breeder extraordinaire";

    i = 3;
    queX[i] = qx; queY[i] = ansY[i - 1] + qs;// + qs;
    que[i] = "Skills:";
    ansX[i] = queX[i];// + 96; 
    ansY[i] = queY[i] + qs;
    _ans[i, 0] = "More than two decades of pet care";
    _ans[i, 1] = "I cut through the pet bullshit";
    _ans[i, 2] = "I have NEVER missed Shark Week";
    _ans[i, 3] = "No skills, product of entropy and a wasted life";
    _ans[i, 4] = "Depraved ocelot DwarfNET meme";
    
    for (i = 0; i < 4; i += 1) ansInd[i] = 0;
    ansInd[0] = argument[4];
    ansInd[1] = argument[5];
    ansInd[2] = argument[6];
    ansInd[3] = argument[7];
    
    /// DRAW CODE
    vx = argument[1];
    vy = argument[2];
    col0 = notCol;
    col1 = c_dkgray;
    col2 = make_color_rgb(16, 16, 16);
    if (col0 != c_white) { col1 = make_color_rgb(32, 32, 32); col2 = make_color_rgb(8, 8, 8); }
    
    draw_set_halign(0);
    draw_set_font(global.fn_1o);
    draw_set_alpha(0.8);
    draw_sprite_ext(s_resume_paper, 0, vx + 34, vy + 8, 1, 1, 0, col0, 1);
    draw_set_color(col1);
    if (progress == 0)
    {
        draw_text(vx + 64 + 6, vy + 14 + 24, "PHOTO");
        draw_text(vx + 64 + 6, vy + 14 + 24 + 5, "_____");
        draw_text(vx + 64 + 6, vy + 14 + 24 + - 16, "_____");
    }
    else draw_sprite_ext(s_resume_photo, 0, vx + 64, vy + 14, 1, 1, 0, col0, 1); //43, 60
    
    dx = vx + 107 + 8; //112 + 8;
    dy = vy + 14 + 2; //24;
    vspc = 16 + 4; //24;
    hspc = 32 + 8;
    draw_set_color(col2);
    if (progress > 1) draw_text(dx + hspc, dy, "Eric");
    if (progress > 2) draw_text(dx + hspc, dy + vspc, "???");
    if (progress > 3) draw_text(dx + hspc, dy + vspc + vspc, '"No gods, no masters. Only pets."');
    draw_set_color(col1);
    draw_text(dx, dy, "Name:");
    draw_text(dx, dy + vspc, "Age:");
    draw_text(dx, dy + vspc + vspc, "Quote:");
    
    draw_set_font(global.fn_1o);
    for (i = 0; i < 4; i += 1)
    {
        draw_set_color(col1);
        draw_text(vx + queX[i], vy + queY[i], que[i]);
        draw_set_color(col2);
        if (progress > 4 + i) draw_text(vx + ansX[i], vy + ansY[i], _ans[i, ansInd[i]]);
    }
    draw_set_alpha(1);
}
else if (argument[0] == "draw") // 0 = DRAW, 1 = Note ID, 2 = X, 3 = Y, 4 = Only BG
{
    /// Load from note data
    //var prc = get_timer();
    skp = 1; event_user(6); skp = 0;
    objSel = -1;
    draw_set_halign(0);
    draw_set_valign(0);
    if (global.noteData[| argument[1]] != "")
    {
        var arrCom = string_split(global.noteData[| argument[1]], "~");
        var arrSub = string_split(arrCom[0], "|");
        draw_sprite(asset_get_index(arrSub[1]), real(arrSub[2]), argument[2] - 192, argument[3] - 120);
        if (argument_count > 4) exit;
        for (i = 1; i < array_length_1d(arrCom); i += 1)
        {
            arrSub = string_split(arrCom[i], "|");
            //0 = STR| 1 = Text| 2 = x| 3 = y| 4 = font| 5 = col| 6 = alp
            draw_set_font(global.dslNoteFont[| real(arrSub[4])]);
            draw_set_alpha(real(arrSub[6]));
            draw_set_color(real(arrSub[5]));
            draw_text(argument[2] + real(arrSub[2]), argument[3] + real(arrSub[3]), string_replace_all(arrSub[1], "\", "#"));
        }
    }
    draw_set_alpha(1);
    draw_set_color(c_white);
    //show_debug_message("Note('draw') - Took " + string((get_timer() - prc) / 1000) + " ms");
}
else
{
    show_debug_message("Note() - ERROR! No such sub-command " + argument[0]);
}
