/// scr_menu_config()

db_hover = b_hover;
b_hover = -1;
xo = view_xview+82-side*69;
yo = view_yview+14;

    
if !active {
    if scr_mouse_rect(xo,yo,xo+97,yo+29)
        b_hover = 0;
    else if scr_mouse_rect(xo,yo+32,xo+97,yo+51)
        b_hover = 1;
    else if scr_mouse_rect(xo+100,yo+32,xo+192,yo+51)
        b_hover = 2;
    else if scr_mouse_rect(xo+195,yo+32,xo+287,yo+51)
        b_hover = 3;
}
else {
    dconfig = i_config;
    if ar_config[i_config,ks] != "Reserved" {
        if ar_config[i_config,ks] != "Input Key" 
            d_str = ar_config[i_config,ks];
        ar_config[i_config,ks] = "Input Key";
        }
    str_input = scr_get_key();
    if str_input != "" and !keyboard_check_pressed(vk_escape) {
        ar_config[i_config,ks] = str_input;
        if str_input != "Reserved" {
            i_config += 1;
            }
        }
    else if keyboard_check_pressed(vk_escape) and ar_config[i_config,ks] != "Reserved" 
      and ar_config[i_config,ks] != "Undefined"  {
        if !(i_config = 8 or i_config = 9)
            ar_config[i_config,ks] = d_str;
        i_config += 1;
        }
    if i_config = 8 or i_config = 9 {
        i_config = 10;
        }
    if i_config > 14 {
        i_config = 0;
        active = 0;
    }
    if i_config != dconfig
        d_str = ar_config[i_config,ks];
}

if b_hover = db_hover and mouse_check_button_pressed(mb_left) {
    if b_hover = 0
        state = 2;
    else if b_hover = 1
        active = 1;
    }
    
if b_hover != -1
    o_curs.sprite_index = s_winhand;
    
