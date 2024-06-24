/// menu_step(menu, x, y, focused)

var menu = argument0;
var stepx = argument1;
var stepy = argument2;

var items = menu[? "items"];
var itemsbg = menu[? "itemsbg"];

if (menu[? "focused"]) {
    // Find selected item
    var selectMethodMouse = menu[? "selectMethodMouse"];
    var selectMethodGamepad = menu[? "selectMethodGamepad"];
    
    if (selectMethodMouse != NULL and scr_input_getInputType() == KEYINPUT_KEYBOARD_MOUSE) {
        script_execute(selectMethodMouse, menu, stepx, stepy);
    }
    if (selectMethodGamepad != NULL and scr_input_getInputType() != KEYINPUT_KEYBOARD_MOUSE) {
        script_execute(selectMethodGamepad, menu);
    }
    
    // Run selected-script for selected item if any
    if (menu[? "selected"] != NULL) {
        var item = menu[? "selected"];
        if (!item[? "disabled"]) {
            var selected_script = item[? "selected_script"];
            script_execute(selected_script, menu, item);
        }
    }
    
    // Check for button presses
    var keyBindings = menu[? "keyBindings"];
    var keyid = ds_map_find_first(keyBindings);
    for (var i = 0; i < ds_map_size(keyBindings); i++) {
        if (scr_input_check_pressed(keyid, PLAYER1)) {
            var list = keyBindings[? keyid];
            var action  = list[| 0];
            var button  = list[| 1];
            var soundId = list[| 2];
            if (soundId != NULL_STRING) {
                audio_play_sound_fresh(soundId, 0, false);
            }
            script_execute(action, menu, button);
        }
        keyid = ds_map_find_next(keyBindings, keyid);
    }
}

// Step all item step scripts
for (var i = 0; i < ds_list_size(items); i++) {
    var item = items[| i];
    var stepScript = item[? "stepScript"];
    if (stepScript != NULL) {
        script_execute(stepScript, menu, item, stepx, stepy);
    }
}

// Do menu step script
var stepScript = menu[? "stepScript"];
if (stepScript != NULL) {
    script_execute(stepScript, menu);
}
