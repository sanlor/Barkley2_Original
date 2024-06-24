/// scr_input_disableFor(instance)

var instance = argument0;

if (!ds_list_contains(global.keyinput_disabled, instance)) {
    ds_list_add(global.keyinput_disabled, instance);
}
