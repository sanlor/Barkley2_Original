/// scr_actor_forEachInTypeList_arg1(typelist, script, arg1)

var typelist = argument0
var scr = argument1
var arg1 = argument2

var n = ds_list_size(typelist)
for (var i = 0; i < n; i++) {
    var t = typelist[| i]
    with t {
        // For each actor of this type
        script_execute(scr, id, arg1);
    }
}
