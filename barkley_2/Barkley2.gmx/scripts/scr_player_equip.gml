//Handles everything to do with equipping
//scr_player_equip("gunbag")         - Equip / rotate through gunbag guns (cycles on unholstered only)
//scr_player_equip("object")         - Returns current gun object equipped
//scr_player_equip("object", obj_id) - Set equipped gun to obj_id (must be in gun pouch or gunbag)
//scr_player_equip("list")           - Returns the list that the current gun object resides in
//scr_player_equip("next");          - Goes to next gun
//scr_player_equip("prev");          - Goes to prev gun
//scr_player_equip("swap");          - Does events to change hoopz gun (ie. calc new weight)
//scr_player_equip("hide");          - Hides o_hud change values.
if (argument[0] == "gunbag") //scr_player_equip("gunbag", noSwapFx);
{
    //Equip first available gunbag reserve gun if possible, -1 if not and sound plays (beep)
    //If you have a gunbag gun already equipped and unholstered, it shifts empty and goes to next gun
    //Will NOT shift gun to empty if you are on your last gunbag gun
    if (scr_equipment_guns_bandolier_equippedFrom()) //You are switching from bandolier to bag
    {

        //Check if gunbag even has a gun
        if (scr_equipment_guns_bag_getSlotsUsed() > 0)
        {
            if(argument_count == 2) scr_player_equip("object", scr_equipment_guns_bag_drawGun(),true);
            else scr_player_equip("object", scr_equipment_guns_bag_drawGun());
        }
        else 
        {
            with (o_hud)
            {
                messageShow = "No gun'sbag gun to equip!";
                messageTime = 1.5;
                messageCount = 0;
            }
            with (o_hoopz)
            {
                gunPouchShow = 0;
                gunCountShow = 0;
            }
            show_debug_message("scr_player_equip() - Cannot switch to gunsbag gun, 0 guns inside it.");
        }
    }
    else //You are switching from gunbag to gunbag, cycle to next if possible
    {

        // Mark current gun as used
        var currentGun = scr_equipment_guns_getCurrentGun();
        scr_equipment_guns_bag_markAsUsed(scr_equipment_guns_bag_getSlot(currentGun), true);
        // Draw next gun and mark it as unused
        var nextGun = scr_equipment_guns_bag_drawGun();
        scr_equipment_guns_bag_markAsUsed(scr_equipment_guns_bag_getSlot(nextGun), false);
        // Equip next gun
        if(argument_count == 2) scr_player_equip("object", nextGun, true);
        else scr_player_equip("object", nextGun);
    }
    return 1;
}
else if (argument[0] == "object") //scr_player_equip("object") OR scr_player_equip("object", obj_id, noSwapFx);
{
    if (argument_count == 1)
    {
        //Return currently equipped gun object
        return scr_equipment_guns_getCurrentGun();
    }
    else
    {
        //Find the object in either pouch or gunbag and assign as equipped gun, otherwise return -1
        _obj = argument[1];
        _ind = scr_equipment_guns_bandolier_getSlot(_obj);
        if (_ind != NULL) {
            scr_equipment_guns_bandolier_equip(_ind);
            if(argument_count < 3 ) scr_player_equip("swap");
            return 1;
        } else {
            _ind = scr_equipment_guns_bag_getSlot(_obj);
            if (_ind != NULL) {
                scr_equipment_guns_bag_equip(_ind);
                if(argument_count < 3 ) scr_player_equip("swap");
                return 1;
            } else {
                if(argument_count < 3 ) scr_player_equip("swap");
                return 0;
            }
        }
    }
}
else if (argument[0] == "list") //scr_player_equip("list");
{
    //Returns either the POUCH list or GUNBAG RESERVE list for currently equipped gun
    if (scr_equipment_guns_bandolier_equippedFrom()) {
        return scr_equipment_guns_bandolier_list();
    } else {
        return scr_equipment_guns_bag_list();
    }
}
else if (argument[0] == "next") //scr_player_equip("next", dontSwapAnim); 
{
    //On pouch gun equipped go next, on gunbag equipped go to first pouch gun
    if (scr_equipment_guns_bandolier_equippedFrom()) //You are switching from gunpouch to next gunpouch gun
    {
        var curGun = scr_equipment_guns_getCurrentGun();
        _ind = scr_equipment_guns_bandolier_getSlot(curGun);
        scr_debugLogFile("Current gun: "+string(curGun)+" Current gun index :"+string(_ind));
        _ind += 1;
        if (_ind >= scr_equipment_guns_bandolier_getSlotsUsed()) _ind = 0;
        scr_equipment_guns_bandolier_equip(_ind);
        if(argument_count == 1) scr_player_equip("swap");
    }
    else //You are switching from gunbag to gunpouch first gun
    {
        //Assume player always has one gun
        scr_equipment_guns_bandolier_equip(0);
        if(argument_count == 1) scr_player_equip("swap");
    }

    return 1;
}
else if (argument[0] == "prev" || argument[0] == "previous") //scr_player_equip("prev", dontSwapAnim);
{
    //On gunpouch equipped go prev, on gunbag equipped go to last pouch gun
    if (scr_equipment_guns_bandolier_equippedFrom()) //You are switching from gunpouch to prev gunpouch gun
    {
        _ind = scr_equipment_guns_bandolier_getSlot(scr_equipment_guns_getCurrentGun());
        _ind -= 1;
        if (_ind < 0) _ind = scr_equipment_guns_bandolier_getSlotsUsed() - 1;
        scr_equipment_guns_bandolier_equip(_ind);
        if(argument_count == 1) scr_player_equip("swap");
    }
    else //You are switching from gunbag to gunpouch last gun
    {
        scr_equipment_guns_bandolier_equip(scr_equipment_guns_bandolier_getSlotsUsed() - 1);
        if(argument_count == 1) scr_player_equip("swap");
    }
    return 1;
}
else if (argument[0] == "swap") //HELPER FUNCTION, try not to use directly
{
    o_hud.charge = 0;
    with (o_hoopz)
    {
        swaptick = 6;
        gunPouchShow = 60;
        gunCountShow = 30;
        gunBursting = 0;
        gunBurstTimer = 0;
        scr_player_calculateWeight();
    }
    var gun = scr_equipment_guns_getCurrentGun();
    if (gun == NULL) 
    {
        scr_player_setGunHolstered(true);
        scr_player_equip("hide"); 
        return 0; 
    }
    combat_gunwield_equip(o_hoopz, gun);
    return 1;
}
else if (argument[0] == "hide") //Hides gun pouch info from showing (room start, exit qmenu)
{
    o_hoopz.swaptick = 0;
    o_hoopz.gunPouchShow = 0;
    o_hoopz.gunCountShow = 0;
    return 1;
}

//If no command was found, return error
scr_msg("ERROR: Calling object >" + object_get_name(object_index) + "< using script >scr_player_equip()< caused following error >No such command '" + argument[0] + "' exists<");
