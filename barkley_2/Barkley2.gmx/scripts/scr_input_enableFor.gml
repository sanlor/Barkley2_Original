/// scr_input_enableFor(instance)

var instance = argument0;

if (ds_list_contains(global.keyinput_disabled, instance)) {
    ds_list_delete(global.keyinput_disabled, ds_list_find_index(global.keyinput_disabled, instance));
}
