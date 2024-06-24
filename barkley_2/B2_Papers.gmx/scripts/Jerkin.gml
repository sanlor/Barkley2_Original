/// Jerkin("equip")

// Jerkin("pockets", string_jerkin) - Returns the pockets of the specified jerkin, if no jerkin name is provided, uses current
// Jerkin("pockets free")           - Returns free pockets
// Jerkin("pockets used")           - Returns used pockets
// Jerkin("equip", string_jerkin)   - Equips the player with the jerkin (apply stats is done separate)
// Jerkin("unequip")                - Unequips current jerkin
// Jerkin("current")                - Returns current jerkin
// Jerkin("list")                   - Returns the list of jerkins the player has
// Jerkin("count")                  - Returns how many jerkins the player has
// Jerkin("has", string_jerkin)     - Checks to see if the player has the specified jerkin.
// Jerkin("gain", string_jerkin)    - Gives the player the specified jerkin.
// Jerkin("lose", string_jerkin)    - Takes the specified jerkin from the player.

// Jerkin("draw", string_jerkin, x, y) - Draws jerkin at X and Y

// Jerkin("data", string_jerkin) - Returns the ds_map of the specified jerkin, if no jerkin name is provided, returns current
// Jerkin("init")   - Call on GAME INIT
// Jerkin("reset")  - Call on NEW ADVENTURE
// Jerkin("define") - Defines a jerkin, must be put in the "init" section



if (argument[0] == "init") // Define jerkins in here
{
    global.jerkins_db = ds_map_create();
    //               Name                   Sub Pkt Wgt Fsh Normal  Bio     Cyber   Mental  Kosmic  Zauber  Description
    Jerkin("define", "Cornhusk Jerkin",     00, 04, 04, 0,  "+100", "+000", "+000", "+000", "+000", "+000", "Protective outer covering of a once-anointed cob of maize."); // This husk was removed at the peak time, when the endosperm was in the 'milk stage'.  This means you can be guaranteed a firmer defense against piercing weapons.
    Jerkin("define", "Bottlecap Jerkin",    01, 03, 03, 0,  "+030", "+030", "+030", "+030", "+030", "+030", "Gleaming cuirass of discarded bottlecaps. Gives protection.");
    Jerkin("define", "Lead Jerkin",         02, 02, 20, 0,  "+100", "+100", "+100", "+100", "+100", "+100", "Can take a lickin' and keep on tickin'. Extremely heavy.");
    Jerkin("define", "Eggcrate Jerkin",     03, 08, 02, 0,  "-025", "+000", "+050", "+000", "+000", "+000", "Carelessly discarded packing material of great value.");
    Jerkin("define", "Monofilament Jerkin", 04, 05, 06, 0,  "+100", "+100", "+000", "-050", "+000", "-050", "A hectare of used fishing line gleaned from the sewers.");
    Jerkin("define", "Booty Jerkin",        05, 06, 06, 0,  "+050", "-050", "+050", "-050", "+050", "-050", "Has ample room for even the largest of applebottoms.");
    Jerkin("define", "Vestal Jerkin",       06, 04, 03, 0,  "+000", "+075", "+075", "+075", "+075", "+075", "Renowned for it's protection against elements.");
    Jerkin("define", "Bisphenol A Jerkin",  07, 09, 08, 0,  "+100", "+025", "+025", "+025", "-100", "+025", "Not much is known about this jerkin.");
    Jerkin("define", "Kangaroo Skin",       08, 24, 06, 0,  "+000", "+000", "+000", "+000", "+000", "+000", "This Kangaroo Skin is rimmed with pockets.");
    //Jerkin("define", "Name", 00, 04, 02, 0,  "+100", "+000", "+000", "+000", "+000", "+000", "");
    Jerkin("reset");
}



else if (argument[0] == "weight") // Arg1 = string_jerkin (optional) - Returns weight of jerkin
{
    var jerkinName = Jerkin("current");
    if (argument_count == 2) jerkinName = argument[1];
    if (jerkinName != NULL_STRING) // && Jerkin("has", jerkinName)) 
    {
        var jerkin = Jerkin("data", jerkinName);
        return jerkin[? "weight"];
    }
    else return 0; // No jerkin or you don't have equipped jerkin in inventory
}



else if (argument[0] == "pockets") // Arg1 = string_jerkin (optional) - Returns pocket size
{
    var jerkinName = Jerkin("current");
    if (argument_count == 2) jerkinName = argument[1];
    if (jerkinName != NULL_STRING) // && Jerkin("has", jerkinName)) 
    {
        var jerkin = Jerkin("data", jerkinName);
        return jerkin[? "pockets"];
    }
    else return 0; // No jerkin or you don't have equipped jerkin in inventory
}



else if (argument[0] == "pockets free")
{
    //show_debug_message("Jerkin('pockets free') - " + string(Jerkin("pockets") - Jerkin("pockets used")));
    return max(0, Jerkin("pockets") - Jerkin("pockets used"));
}



else if (argument[0] == "pockets used")
{
    return scr_items_count(ITEMTYPE_CANDY) + scr_items_count(ITEMTYPE_ZAUBER);
}



else if (argument[0] == "reset") // Call on NEW GAME
{
    scr_savedata_put_list("player.jerkins.has", ds_list_create()); // ds_list of jerkins the player has
    scr_savedata_put("player.jerkins.current", NULL_STRING); // Hoopz current jerkin
}



else if (argument[0] == "define") // 1 = nam 2 = sub 3 = poc 4 = wgt 5 = fsh 6 = nor 7 = bio 8 = cyb 9 = men 10 = kos 11 = zau 12 = des 
{
    var jrk = ds_map_create();
    ds_map_add(global.jerkins_db, argument[1], jrk); // Name
    ds_map_add(jrk, "sub", argument[2]);
    ds_map_add(jrk, "pockets", argument[3]);
    ds_map_add(jrk, "weight", argument[4]);
    ds_map_add(jrk, "fashion", argument[5]);
    ds_map_add(jrk, "description", argument[12]);
    
    var jrkRes = ds_map_create(); // Jerkin resistances
    ds_map_add(jrk, "stats", jrkRes);
    ds_map_add(jrkRes, "res_normal", argument[6]);
    ds_map_add(jrkRes, "res_bio", argument[7]);
    ds_map_add(jrkRes, "res_cyber", argument[8]);
    ds_map_add(jrkRes, "res_mental", argument[9]);
    ds_map_add(jrkRes, "res_cosmic", argument[10]);
    ds_map_add(jrkRes, "res_zauber", argument[11]);
    
    ds_map_add(jrk, "abilities", ds_list_create()); // Blank list for now
}



else if (argument[0] == "current")
{
    return scr_savedata_get("player.jerkins.current");
}



else if (argument[0] == "data") // Arg1 = string_jerkin (optional)
{
    var jerkin = Jerkin("current");
    if (argument_count > 1) jerkin = argument[1];
    if (ds_map_exists(global.jerkins_db, jerkin)) // Check if jerkin exists
    {
        return ds_map_find_value(global.jerkins_db, jerkin);
    }
    else return NULL;
}



else if (argument[0] == "count") // How many jerkins the player has
{
    return ds_list_size(Jerkin("list"));
}



else if (argument[0] == "list") // List of jerkins the player has
{
    return scr_savedata_get("player.jerkins.has");
}



else if (argument[0] == "has") // Arg1 = string_jerkin
{
    return ds_list_find_index(Jerkin("list"), argument[1]) != -1;
}



else if (argument[0] == "gain") // Arg1 = string_jerkin
{
    var jerkin = argument[1];
    if (ds_map_exists(global.jerkins_db, jerkin)) // Verify the jerkin you are gaining exists
    {
        if (Jerkin("has", jerkin) == 0) // Only give to the player if they don't have it
        {
            var jerkinList = Jerkin("list");
            ds_list_add(jerkinList, jerkin);
        }
        else show_debug_message("Jerkin('gain') - Player already has jerkin >" + argument[1] + "<, no reason to gain another.");
    }
    else show_debug_message("Jerkin('gain') - No such jerkin >" + argument[1] + "< exists to gain.");
}



else if (argument[0] == "lose") // Arg1 = string_jerkin
{
    if (Jerkin("has", argument[1]))
    {
        ds_list_delete(Jerkin("list"), ds_list_find_index(Jerkin("list"), argument[1]));
    }
    else show_debug_message("Jerkin('lose') - Player does not have jerkin >" + argument[1] + "< to lose.");
}



else if (argument[0] == "equip") // Arg1 = string_jerkin
{
    if (Jerkin("has", argument[1])) scr_savedata_put("player.jerkins.current", argument[1]);
    else show_debug_message("Jerkin('equip') - Player does not have jerkin >" + argument[1] + "< to equip.");
}



else if (argument[0] == "unequip") // Unequip current jerkin
{
    scr_savedata_put("player.jerkins.current", NULL_STRING);
}



else if (argument[0] == "apply")
{
    var jerkinName = Jerkin("current");
    if (jerkinName != NULL_STRING && Jerkin("has", jerkinName)) {
        var jerkin = Jerkin("data", jerkinName);
        
        // Iterate over and apply all stat modifiers
        if (ds_map_exists(jerkin, "stats")) {
            var jerkinStats = jerkin[? "stats"];
            var key = ds_map_find_first(jerkinStats);
            
            for (var i = 0; i < ds_map_size(jerkinStats); i++) {
                var current = scr_stats_getEffectiveStat(self.id, key);
                // Stat modifier
                var change = jerkinStats[? key];
                var changeSign;
                if (string_char_at(change, 1) == '+') {
                    changeSign = 1;
                    change = string_copy(change, 2, string_length(change)-1); // Cut first char
                }
                else if (string_char_at(change, 1) == '-') {
                    changeSign = -1;
                    change = string_copy(change, 2, string_length(change)-1); // Cut first char
                }
                else {
                    changeSign = 1; // Default to positive
                }
                var isPerc = false;
                if (string_char_at(change, string_length(change)) == '%') {
                    isPerc = true;
                    change = string_copy(change, 1, string_length(change)-1); // Cut last char
                }
                var changeAmount = real(change);
                
                // Update existing value
                if (isPerc) {
                    changeAmount *= 0.01;
                    changeAmount *= current;
                }
                var newStat = current + (changeAmount * changeSign);
                scr_stats_setEffectiveStat(self.id, key, newStat);
                
                // Next key
                key = ds_map_find_next(jerkinStats, key);
            }
        }
        
        // Iterate over and apply all abilities
        if (ds_map_exists(jerkin, "abilities")) {
            var jerkinAbil = jerkin[? "abilities"];
            
            for (var i = 0; i < ds_list_size(jerkinAbil); i++) {
                var statusEffect = assetOrNull(jerkinAbil[| i], asset_script);
                if (statusEffect != NULL) {
                    scr_statusEffect_applyFromScriptToCombatActor(statusEffect, self.id);
                }
            }
        }
    }
}



else if (argument[0] == "draw") // Arg1 = string_jerkin Arg2 = x Arg3 = y Arg4 = xscale Arg5 = yscale Arg6 = Rot Arg7 = Color Arg8 = Alpha
{
    // Only arg1, arg2, and arg3 are needed, rest are optional
    var xsc = 1;
    var ysc = 1;
    var rot = 0;
    var col = c_white;
    var alp = 1;
    if (argument_count > 4) xsc = argument[4];
    if (argument_count > 5) ysc = argument[5];
    if (argument_count > 6) rot = argument[6];
    if (argument_count > 7) col = argument[7];
    if (argument_count > 8) alp = argument[8];
    var jerkinName = argument[1];
    if (jerkinName == "current") jerkinName = Jerkin("current");
    var jerkin = Jerkin("data", jerkinName);
    draw_sprite_ext(sJerkin, jerkin[? "sub"], argument[2], argument[3], xsc, ysc, rot, col, alp);
}



else if (string_copy(argument[0], 1, 4) == "res_")
{
    var jerkinName = Jerkin("current");
    if (argument_count == 2) jerkinName = argument[1];
    if (jerkinName != NULL_STRING) // && Jerkin("has", jerkinName)) 
    {
        var jerkin = Jerkin("data", jerkinName);
        jerkin = jerkin[? "stats"]
        return real(jerkin[? argument[0]]);
    }
    else return 0; // No jerkin or you don't have equipped jerkin in inventory
}



else if (argument[0] == "description")
{
    var jerkinName = Jerkin("current");
    if (argument_count == 2) jerkinName = argument[1];
    if (jerkinName != NULL_STRING) // && Jerkin("has", jerkinName)) 
    {
        var jerkin = Jerkin("data", jerkinName);
        return jerkin[? "description"];
    }
    else return 0; // No jerkin or you don't have equipped jerkin in inventory
}



else show_debug_message("Jerkin() - No such command >" + argument[0] + "< in script.");
