/// menu_selectMethodGamepad_nearestToEdge_stickdpad(menu)

var menu = argument0;

var selected = menu[? "selected"];
var items = menu[? "items"];

if (selected == NULL/* or selected[? "disabled"]*/) {
    selected = NULL;
    for (var i = 0; i < ds_list_size(items) && selected == NULL; i++) {
        var item = items[| i];
        if (item[? "selectable"]) {
            selected = item;
            menu[? "selected"] = selected;
        }
    }
    menu[? "selected"] = selected;
}

if (selected != NULL) {

    // Select nearest upwards
    if (scr_input_check_pressed(KEYID_UP, PLAYER1) or scr_input_check_pressed(KEYID_QUICKMENU_UP, PLAYER1)) {
        var bx = selected[? "x"] + selected[? "width"] / 2;
        var by = selected[? "y"];
        
        var closest = 9999;
        for (var i = 0; i < ds_list_size(items); i++) {
            var item = items[| i];
            if (item[? "selectable"] and item[? "y"] + item[? "height"] <= by ) {
                var bx2 = item[? "x"] + item[? "width"] / 2;
                var by2 = item[? "y"] + item[? "height"];
                var dist = point_distance(bx, by, bx2, by2);
                if (dist < closest) {
                    menu[? "selected"] = item;
                    closest = dist;
                }
            }
        }
    }
    
    // Select nearest downwards
    if (scr_input_check_pressed(KEYID_DOWN, PLAYER1) or scr_input_check_pressed(KEYID_QUICKMENU_DOWN, PLAYER1)) {
        var bx = selected[? "x"] + selected[? "width"] / 2;
        var by = selected[? "y"] + selected[? "height"];
        
        var closest = 9999;
        for (var i = 0; i < ds_list_size(items); i++) {
            var item = items[| i];
            if (item[? "selectable"] and item[? "y"] >= by ) {
                var bx2 = item[? "x"] + item[? "width"] / 2;
                var by2 = item[? "y"];
                var dist = point_distance(bx, by, bx2, by2);
                if (dist < closest) {
                    menu[? "selected"] = item;
                    closest = dist;
                }
            }
        }
    }
    
    // Select nearest leftwards
    if (scr_input_check_pressed(KEYID_LEFT, PLAYER1) or scr_input_check_pressed(KEYID_QUICKMENU_LEFT, PLAYER1)) {
        var bx = selected[? "x"];
        var by = selected[? "y"] + selected[? "height"] / 2;
        
        var closest = 9999;
        for (var i = 0; i < ds_list_size(items); i++) {
            var item = items[| i];
            if (item[? "selectable"] and item[? "x"] <= bx ) {
                var bx2 = item[? "x"] + item[? "width"];
                var by2 = item[? "y"] + item[? "height"] / 2;
                var dist = point_distance(bx, by, bx2, by2);
                if (dist < closest) {
                    menu[? "selected"] = item;
                    closest = dist;
                }
            }
        }
    }
    
    // Select nearest leftwards
    if (scr_input_check_pressed(KEYID_RIGHT, PLAYER1) or scr_input_check_pressed(KEYID_QUICKMENU_RIGHT, PLAYER1)) {
        var bx = selected[? "x"] + selected[? "width"];
        var by = selected[? "y"] + selected[? "height"] / 2;
        
        var closest = 9999;
        for (var i = 0; i < ds_list_size(items); i++) {
            var item = items[| i];
            if (item[? "selectable"] and item[? "x"] >= bx ) {
                var bx2 = item[? "x"];
                var by2 = item[? "y"] + item[? "height"] / 2;
                var dist = point_distance(bx, by, bx2, by2);
                if (dist < closest) {
                    menu[? "selected"] = item;
                    closest = dist;
                }
            }
        }
    }
}
