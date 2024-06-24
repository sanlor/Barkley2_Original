if(debug_mode)
{
    ////show bounding box
    col = c_white

    if(sprite_index == noone)
    {
        if(isBlocking){col=c_navy;}
        else{col=c_black;}
        draw_set_color(col);
        draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
        
        if(AI_alertTimer<=0){col=c_green;}
        else{col=c_red;}
        draw_set_color(col);
        draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
    }
    else
    {
        draw_sprite_ext(sprite_index,-1,x,y,1,1,direction,col,1);
    }
    
    ////point to current target
    if(I_AI_target !=noone && instance_exists(I_AI_target))
    {
        draw_set_color(c_white);
        draw_set_alpha(0.4);
        draw_line(x,y,I_AI_target.x,I_AI_target.y);
    }
    
    ///show current direction
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_line(x,y,x+lengthdir_x(32,faceDir),y+lengthdir_y(32,faceDir));
    draw_set_alpha(0.6);
    draw_set_color(c_orange);
    draw_line(x,y,x+lengthdir_x(48,faceDir),y+lengthdir_y(48,faceDir));
    
    ///object name
    draw_set_color(c_white);
    draw_set_alpha(0.7);
    var tx = "";
    tx = string_delete(object_get_name(object_index),1,8);
    draw_text(x-8,y-24,tx);
    
    if(AI_stateTopScript!=-1)
    {
        tx = string_delete(script_get_name(AI_stateTopScript),1,7);
        draw_text(x,y-16,tx);
    }
    
    ///show current action
    if(a_attackName!="")
    {
        draw_set_color(c_white);
        draw_text(x,y-8,a_attackName);
        draw_text(x,y,a_attackState);
        draw_text(x,y+8,string(a_attackAnim));
    }
}
