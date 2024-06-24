/// menu_selectMethodGamepad_nearestToEdge(menu)

var menu = argument0;

var selected = menu[? "selected"];
var items = menu[? "items"];

var keyUp = menu[? "keyUp"];
var keyDown = menu[? "keyDown"];
var keyLeft = menu[? "keyLeft"];
var keyRight = menu[? "keyRight"];

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
    if (keyUp != NULL  and scr_input_check_pressed(keyUp, PLAYER1)) {
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
    if (keyDown != NULL  and scr_input_check_pressed(keyDown, PLAYER1)) {
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
    if (keyLeft != NULL  and scr_input_check_pressed(keyLeft, PLAYER1)) {
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
    if (keyRight != NULL  and scr_input_check_pressed(keyRight, PLAYER1)) {
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
