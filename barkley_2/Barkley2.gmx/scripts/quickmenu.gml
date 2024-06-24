//NOTE: Removed the down effect offal had, I added an exit to the End Step of o_qmenu_perst
//NOTE: I also removed two lines on destroy for this script
if (argument_count == 0)
{
    //Return if quickmenu2 is active or not
    return global.quickmenuActive; //o_qmenu_button sets on create and destroy
}
else
{
    if (argument[0] == "check") //Check if QM should be opened
    {
    
    }
    else if (argument[0] == "load")
    {
        //Load up guns - loop through guns list
        scr_gun("clear"); //Intermediate
        var bandolierGunCount = min(5, scr_equipment_guns_bandolier_getSlotsUsed());
        for (var _i = 0; _i < bandolierGunCount; _i += 1)
        {
            var gun = scr_equipment_guns_bandolier_getGun(_i);
            scr_gun("add", gun[? "pName"], gun[? "pWeight"], gun[? "pCurAmmo"], gun[? "pCurAmmo"], gun[? "pPrefix1"], gun[? "pPrefix2"], gun[? "pMaterial"], gun[? "pType"], gun[? "pSuffix"]);
        }
        if (scr_equipment_guns_bag_getSlotsUsed() > 0)
        {
            gun = Gun("index to object", 5); // was 6 //scr_equipment_guns_bag_drawGun();
            scr_gun("bag", gun[? "pName"], gun[? "pWeight"], gun[? "pCurAmmo"], gun[? "pCurAmmo"], gun[? "pPrefix1"], gun[? "pPrefix2"], gun[? "pMaterial"], gun[? "pType"], gun[? "pSuffix"]);
        }
    }
    else if (argument[0] == "create")
    {
        global.quickmenuActive = 1;
        paused(true); //Pause game
        
        //
        with (o_qmenu_perst)
        {
            x = view_xview[0];
            y = view_yview[0];
            xs = o_hoopz.x - (global.qmRoomWidth / 2);
            ys = o_hoopz.y - (global.qmRoomHeight / 2);
            dest_x = xs;
            dest_y = ys;
        }
        
        instance_create(view_xview[0], view_yview[0], o_qmenu_button);
    }
    else if (argument[0] == "destroy")
    {
        global.quickmenuActive = 0;
        paused(false);
        mouse_clear(mb_left); //only when i click out?
        
        //Save gun slots here
    }
    else if (argument[0] == "init")
    {
        //Change toggle menu and swap to 0 for HOLD, change to 1 for TOGGLE
        global.toggleSwap = 1;
        global.toggleMenu = 1;
        global.quickmenuActive = 0; //gz - i did not know where else i should put this!
        global.qmScale = 1;
        global.qmRoomWidth = 384 * global.qmScale; //768
        global.qmRoomHeight = 240 * global.qmScale; //480
        global.pocketX = (242 * global.qmScale);
        global.pocketY = global.qmRoomHeight - (40 * global.qmScale) + (14 * global.qmScale);
        global.zauberX = global.pocketX + (20 * global.qmScale);
        global.zauberY = global.pocketY;
        instance_create(0, 0, o_qmenu_perst);
    }
}
