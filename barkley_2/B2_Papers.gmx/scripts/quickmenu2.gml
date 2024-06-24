//NOTE: Removed the down effect offal had, I added an exit to the End Step of o_qmenu_perst
//NOTE: I also removed two lines on destroy for this script
if (argument_count == 0)
{
    //Return if Quickmenu is active or not
    return global.quickmenuActive; //o_qmenu_button sets on create and destroy
}
else
{
    if (argument[0] == "init")
    {
        global.toggleMenu = 1;
        global.quickmenuActive = 0;
    }
    else if (argument[0] == "check") //Check if QM should be opened
    {
        if(keyboard_check_pressed(ord('Q')) and global.quickmenuActive == 0){
            quickmenu2("create");
        } else if(keyboard_check_released(ord('Q')) and global.toggleMenu == 0){
            quickmenu2("destroy");
        } else if(keyboard_check_pressed(ord('Q')) and global.quickmenuActive == 1){
            quickmenu2("destroy");
        }
    }
    else if (argument[0] == "load")
    {
    
    }
    else if (argument[0] == "create")
    {
        global.quickmenuActive = 1;
        paused(true); //Pause game
        
        instance_create(view_xview[0], view_yview[0], q_menu_left);
        instance_create(view_xview[0], view_yview[0], q_menu_right);
        instance_create(view_xview[0], view_yview[0], q_menu_top);
        instance_create(view_xview[0], view_yview[0], q_menu_bottom);
    }
    else if (argument[0] == "destroy")
    {
        global.quickmenuActive = 0;
        paused(false);
        //mouse_clear(mb_left); //only when i click out?
    } 
    else if (argument[0] == "showAnimation") //instance, targetX, targetY, lerpSpeed = 0.2;
    {
        if(argument_count == 5) lerpSpeed = argument[4];
        else lerpSpeed = 0.2;
        with(argument[1]){
            x = lerp(x, argument[2], lerpSpeed);
            y = lerp(y, argument[3], lerpSpeed);
            image_xscale = lerp(image_xscale, 1, lerpSpeed);
            image_yscale = lerp(image_yscale, 1, lerpSpeed);
        }    
    } 
    else if (argument[0] == "hideAnimation") //instance, targetX, targetY, targetScaleX, targetScaleY;
    {
        lerpSpeed = 0.4;
        with(argument[1]){ 
            x = lerp(x, argument[2], lerpSpeed);
            y = lerp(y, argument[3], lerpSpeed);
            image_xscale = lerp(image_xscale, argument[4], lerpSpeed);
            image_yscale = lerp(image_yscale, argument[5], lerpSpeed);
        }      
    }
}

