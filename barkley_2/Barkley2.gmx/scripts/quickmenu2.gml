if (argument_count == 0)
{
    return global.quickmenuActive or instance_exists(q_menu_inventory);
}
else
{
    if (argument[0] == "init")
    {
        global.toggleMenu = 1;
        global.quickmenuActive = 0;
        global.quickmenuShown = 0; //This hides/shows the menu
        global.quickmenuTextAlpha = 1;

        instance_create(view_xview[0], view_yview[0], q_menu_perst);
    }
    else if (argument[0] == "check") //Check if QM should be opened
    {
        var did = 1;
        if (global.event) did = 0;
        if (instance_exists(o_hoopz) == 0) did = 0;
        if (instance_exists(o_hud) == 0) did = 0;
        if (paused() && quickmenu2() == 0) did = 0;
        if (Quest("hudVisible") == 0) did = 0;
        if (instance_exists(oMap)) did = 0;
        if (instance_exists(q_menu_inventory)) did = 0;
        if (instance_exists(oChatroulette)) did = 0;
        if (did && Gun("total amount") == 0) did = 0;

        if(did==1 && scr_input_check_pressed(KEYID_QUICKMENU, PLAYER1))
        {
            scr_debugLogFile("Testing Quick Menu?");
            var curGun = scr_equipment_guns_getCurrentGun();
            if(curGun == -1)
            {
                scr_player_equip("next");
                curGun = scr_equipment_guns_getCurrentGun();
                if(curGun == -1){did = 0;}
            }
        }
        
        if(scr_input_check_pressed(KEYID_QUICKMENU, PLAYER1) and global.quickmenuActive == 0 and did){
            quickmenu2("create");
        } else if(scr_input_check_released(KEYID_QUICKMENU, PLAYER1) and global.quickmenuActive and !instance_exists(q_menu_inventory) and global.toggleMenu == 0){
            quickmenu2("destroy");
        } else if(scr_input_check_pressed(KEYID_QUICKMENU, PLAYER1) and global.quickmenuActive and !instance_exists(q_menu_inventory)){
            quickmenu2("destroy");
        }
    }
    else if (argument[0] == "load")
    {
    
    }
    else if (argument[0] == "step")
    {
        if(global.quickmenuTextAlpha == 1) global.quickmenuTextAlpha = 0.95;
        else global.quickmenuTextAlpha = 1;
    }
    else if (argument[0] == "create")
    {
        global.quickmenuActive = 1;
        global.quickmenuShown = 1;
        //paused(true); //Pause game
        paused(true);
        
        instance_create(view_xview[0], view_yview[0], q_menu_left);
        instance_create(view_xview[0], view_yview[0], q_menu_right);
        instance_create(view_xview[0], view_yview[0], q_menu_top);
        instance_create(view_xview[0], view_yview[0], q_menu_bottom);
    }
    else if (argument[0] == "destroy")
    {
        global.quickmenuActive = 0;
        quickmenu2("hide");
        paused(false);
        //mouse_clear(mb_left); //only when i click out?
    } 
    else if (argument[0] == "hide")
    {
        global.quickmenuShown = 0;
    } 
    else if (argument[0] == "showAnimation") //instance, targetX, targetY, lerpSpeed = 0.2;
    {
        var scaleSpeed = 1;
        if(argument_count == 5) scaleSpeed = argument[4];
        scaleSpeed = scaleSpeed * global.DELTA_TIME;  

        with(argument[1]){ 
            var moveSpeed = scaleSpeed * wid;
            x = x - (min(abs(x-argument[2]), moveSpeed) * sign(x-argument[2]))
            y = y - (min(abs(y-argument[3]), moveSpeed) * sign(y-argument[3]));
            image_xscale = image_xscale - (min(abs(image_xscale-1), scaleSpeed) * sign(image_xscale-1));
            image_yscale = image_yscale - (min(abs(image_yscale-1), scaleSpeed) * sign(image_yscale-1));
        }      
    } 
    else if (argument[0] == "hideAnimation") //instance, targetX, targetY, targetScaleX, targetScaleY;
    {
        var scaleSpeed = 1 * global.DELTA_TIME;  

        with(argument[1]){ 
            var moveSpeed = scaleSpeed * wid;
            x = x - (min(abs(x-argument[2]), moveSpeed) * sign(x-argument[2]))
            y = y - (min(abs(y-argument[3]), moveSpeed) * sign(y-argument[3]));
            image_xscale = image_xscale - (min(abs(image_xscale-argument[4]), scaleSpeed) * sign(image_xscale-argument[4]));
            image_yscale = image_yscale - (min(abs(image_yscale-argument[5]), scaleSpeed) * sign(image_yscale-argument[5]));
        }      
    } else if (argument[0] == "write"){ // font, color, x, y, alignX, alignY, str
        draw_set_font(argument[1]);
        draw_set_color(argument[2]);
        draw_set_halign(argument[5]);
        draw_set_valign(argument[6]);
        draw_set_alpha(global.quickmenuTextAlpha);
        draw_text(argument[3], argument[4], string(argument[7]));
    } else if (argument[0] == "killSurface") {
        if(surface_exists(argument[1])) surface_free(argument[1]);
    } 
}

