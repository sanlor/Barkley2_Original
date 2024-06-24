/// scr_options_menu()

switch event_type {

  case ev_create: {
    // option buttons
    ar_op_button_str[1] = 'Display';
    ar_op_button_str[2] = 'Scaling';
    ar_op_button_str[3] = 'Post Effects';
    ar_op_button_str[5] = 'Device';
    ar_op_button_str[9] = 'English';
    
    ar_op_selected[1] = !global.fullscreen + !global.border;
    ar_op_selected[2] = global.fullscreen*(global.fullscreen_scale) + !global.fullscreen*(global.win_scale-2);
    ar_op_selected[5] = 0;
    ar_op_selected[9] = global.AlBhed;
    
    ar_op_selection[1,0] = "Fullscreen";
    ar_op_selection[1,1] = "Window";
    ar_op_selection[1,2] = "Borderless Win.";
    
    ar_op_selection[2,0] = "Pixel Perfect";
    ar_op_selection[2,1] = "Proportional";
    ar_op_selection[2,2] = "Stretch Fill";
    
    // window scale
    if ar_op_selected[1] != 0 {
        for(i=2;i<=global.screen_maxscale;i+=1)
            ar_op_selection[2,i-2] = string(i)+"x";
    }
    
    ar_op_selection[3,1] = "Enabled";
    ar_op_selection[3,0] = "Disabled";
    
    ar_op_selection[5,0] = 'Keyboard/Mouse'
    ar_op_selection[5,1] = 'Keyboard'
    ar_op_selection[5,2] = 'Gamepad'
    
    ar_op_selection[9,0] = "English";
    ar_op_selection[9,1] = "Al Bhed";
    
    ar_op_selection[5,0] = "Keyboard/Mouse";
    
    ar_op_selection[9] = "English";
    
    ar_op_button_x[1] = 8;
    ar_op_button_x[2] = 8;
    ar_op_button_x[3] = 8;
    ar_op_button_x[4] = 8;
    ar_op_button_x[5] = 8;
    ar_op_button_x[6] = 8;
    ar_op_button_x[7] = 179;
    ar_op_button_x[8] = 179;
    ar_op_button_x[9] = 179;
    ar_op_button_x[10] = 179;
    ar_op_button_x[11] = 179;
    
    ar_op_button_y[1] = 60;
    ar_op_button_y[2] = 78;
    ar_op_button_y[3] = 96;
    ar_op_button_y[4] = 114;
    ar_op_button_y[5] = 174;
    ar_op_button_y[6] = 192;
    ar_op_button_y[7] = 60;
    ar_op_button_y[8] = 78;
    ar_op_button_y[9] = 123;
    ar_op_button_y[10] = 173;
    ar_op_button_y[11] = 191;
    
    ar_op_button_w[1] = 160;
    ar_op_button_w[2] = 160;
    ar_op_button_w[3] = 160;
    ar_op_button_w[4] = 160;
    ar_op_button_w[5] = 160;
    ar_op_button_w[6] = 160;
    ar_op_button_w[7] = 108;
    ar_op_button_w[8] = 108;
    ar_op_button_w[9] = 108;
    ar_op_button_w[10] = 108;
    ar_op_button_w[11] = 108;
    
    ar_op_button_h[1] = 15;
    ar_op_button_h[2] = 15;
    ar_op_button_h[3] = 15;
    ar_op_button_h[4] = 15;
    ar_op_button_h[5] = 15;
    ar_op_button_h[6] = 15;
    ar_op_button_h[7] = 15;
    ar_op_button_h[8] = 15;
    ar_op_button_h[9] = 15;
    ar_op_button_h[10] = 15;
    ar_op_button_h[11] = 15;
    
    break;
  }
  
  case ev_draw: {
    draw_background(b_options,xo,yo);
    
    scr_draw_set_def();
    
   if state = dstate {
    
    with o_slider
        visible = 1;
    
    if b_hover
        draw_sprite_ext(s_highlight,(b_hover>6)*2,xo+ar_op_button_x[b_hover],yo+ar_op_button_y[b_hover],1,1,0,c_white,0.75-(0.5*(b_hover != dhover)));
    
    dhover = b_hover;
    
    draw_set_font(global.fn_2);            
    // headers
    draw_text(xo+5,yo+40,"Video");
    draw_text(xo+177,yo+40,"Audio");
    draw_text(xo+177,yo+108,"Language");
    draw_text(xo+5,yo+154,"Control");
    draw_text(xo+177,yo+154,"Rollback");
    // labels
    draw_set_color(c_green_gray);
     // video
    draw_text(xo+10,yo+64,"Display");
    draw_text(xo+10,yo+82,"Scaling");
    draw_text(xo+10,yo+100,"Post Effects");
     // audio                 
    draw_text(xo+182,yo+64,"Music");
    draw_text(xo+182,yo+82,"Sounds");
     // control
    draw_text(xo+10,yo+178,"Device");
    // drop-downs
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    draw_text(xo+158,yo+64,ar_op_selection[1,ar_op_selected[1]]);
    draw_text(xo+158,yo+82,ar_op_selection[2,ar_op_selected[2]]);
    draw_text(xo+158,yo+100,ar_op_selection[3,ar_op_selected[3]]);
    draw_text(xo+158,yo+178,ar_op_selection[5,ar_op_selected[5]]);
    draw_set_halign(fa_left);
    draw_text(xo+182,yo+127,ar_op_selection[9,ar_op_selected[9]]);
    
    // buttons
    draw_set_color(c_white);
    draw_text(xo+10,yo+118,"Advanced...");
    draw_text(xo+10,yo+196,"Configure...");
    draw_text(xo+182,yo+178,"Revert Changes");
    draw_text(xo+182,yo+196,"Reset to Default");
    
    if unfocus
        draw_background_ext(b_options,xo,yo,1,1,0,c_white,0.8);
    
    // title
    scr_center_font();
    draw_set_font(global.fn_1);
    draw_set_color(c_ltblue);
    draw_text(xo+145,yo+15,"Options");
    scr_draw_set_def();
    
   }

   break;
    }
    
  case ev_step: {
  
    xo = view_xview+82-side*69;
    yo = view_yview+14; 
  
     if !instance_exists(o_slider) and abs(image_xscale) {
        os1 = instance_create(xo+236,yo+65,o_slider);
        os1.ind = 7;
        os1.len = median((global.music/100),0,1);
        os2 = instance_create(xo+236,yo+83,o_slider);
        os2.ind = 8;
        os2.len = median((global.sounds/100),0,1);
    }
  
    //buttons
    b_hover = 0;
    if hoveron
      for(i=0;i<12;i+=1)
        if scr_mouse_rect(xo+ar_op_button_x[i],yo+ar_op_button_y[i],
           xo+ar_op_button_x[i]+ar_op_button_w[i],yo+ar_op_button_y[i]+ar_op_button_h[i]) {
            b_hover = i;
            o_curs.sprite_index = s_winhand;
            // dropdowns
            if mouse_check_button_pressed(mb_left) and !delay and !unfocus {
                if (b_hover = 1  or b_hover = 2 or  b_hover = 3 or b_hover = 5 or b_hover = 9)
                    scr_option_dropdowns();
                if b_hover = 7
                    os1.hover = 1;
                if b_hover = 8
                    os2.hover = 1;
                }
            break;
        }
        
    // apply change        
    if option_change != -1 {
        if last_option = 1 {
            if option_change = 0
                o_control.t_fullscreen = 1;
            if option_change = 1
                o_control.t_window = 1;
            if option_change = 2
                o_control.t_window_border = 1;
                
            if ar_op_selected[1] = 0 {
                ar_op_selection[2,0] = "Pixel Perfect";
                ar_op_selection[2,1] = "Proportional";
                ar_op_selection[2,2] = "Stretch Fill";
                }
            else {
                for(n=0;n<=global.screen_maxscale-2;n+=1)
                    ar_op_selection[2,n] = string(n+2)+"x";
            }
        }
        if last_option = 2 {
            if ar_op_selected[1] != 0 {
                o_control.t_winscale = 1;
                global.win_scale = ar_op_selected[2]+2;
                }
            else {
                global.fullscreen_scale = ar_op_selected[2];                   
                }
            show_debug_message("scr_menu_options: Resetting rendermode"); 
            scr_rendermode_reset()
            }
        if last_option = 9
            o_control.t_albhed_toggle = 1;
         
        option_change = -1
        scr_save_config();
        }
            
        
    if(!hoveron and (o_curs.x != o_curs.xprevious or o_curs.y != o_curs.yprevious) or 
     scr_mouse_rect(xo+ar_op_button_x[last_option],yo+ar_op_button_y[last_option],xo+ar_op_button_x[last_option]+ar_op_button_w[last_option],yo+ar_op_button_y[last_option]+ar_op_button_h[last_option]))
     {
        show_debug_message('hoveron');
        hoveron = 1;
      }  
   break;
    }
}
