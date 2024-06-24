/*
Required input vars from step script:
none
*/

// Dodge animation
if (BodySwap() == "diaper")
{
    scr_draw_spr(s_cts_hoopzDiaper_goofroll, scr_entity_animation_getImage("default"), dx, dy);
}
else if (dodgeStance == "leap")
{
    var spr = noone;
    if(dodgeDir>=45&&dodgeDir<135) ///north
    {
        if(look_dir>90&&look_dir<270){spr = s_HoopzRollLeap_NorthLeft;}
        else{spr = s_HoopzRollLeap_NorthRight;}
    }
    else if(dodgeDir>=135&&dodgeDir<225) ///west
    {
        if(look_dir<180){spr = s_HoopzRollLeap_LeftUp;}
        else{spr = s_HoopzRollLeap_LeftDown;}
    }
    else if(dodgeDir>=225 && dodgeDir<315) ///south
    {
        if(look_dir>90 && look_dir<270){spr = s_HoopzRollLeap_SouthLeft;}
        else{spr = s_HoopzRollLeap_SouthRight;}
    }
    else ///east
    {
        if(look_dir<180){spr = s_HoopzRollLeap_RightUp;}
        else{spr = s_HoopzRollLeap_RightDown;}
    }
    scr_draw_spr(spr, scr_entity_animation_getImage("default"), dx, dy);
    
}
else if (dodgeStance == "roll") 
{
    scr_draw_spr(s_HoopzRollGoofy, scr_entity_animation_getImage("default"), dx, dy);
}
else 
{
    var spr = noone;
    if(dodgeDir>90 && dodgeDir<270){spr = s_HoopzRollStop_Left;}else{spr = s_HoopzRollStop_Right;}
    scr_draw_spr(spr, scr_entity_animation_getImage("default"), dx, dy);
}
