/// menu_selectMethodMouse_mouseover(menu, stepx, stepy)

var menu = argument0;
var stepx = argument1;
var stepy = argument2;

if (scr_input_getInputType() == KEYINPUT_KEYBOARD_MOUSE) {
    var mxprev = menu[? "mxprev"];
    var myprev = menu[? "myprev"];
    var items = menu[? "items"];
    var mousex = o_curs.x - stepx;
    var mousey = o_curs.y - stepy;
    
    if (mousex != mxprev or mousey != myprev) {
        menu[? "selected"] = NULL;
        menu[? "mxprev"] = mousex;
        menu[? "myprev"] = mousey;
        for (var i = 0; i < ds_list_size(items); i++) {
            // bbox check
            var item = items[| i];
            var item_lft = item[? "x"];
            var item_top = item[? "y"];
            var item_rgt = item[? "x"] + item[? "width"];
            var item_btm = item[? "y"] + item[? "height"];
            var item_disabled = item[? "disabled"];
            if (/*!item_disabled and */mousex >= item_lft and mousex < item_rgt and mousey >= item_top and mousey < item_btm) {
                menu[? "selected"] = item;
            }
        }
    }
}
