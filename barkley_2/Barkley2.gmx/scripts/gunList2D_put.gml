/// gunList2D_put(gun, field, i, j, value)
/// Grants the illusion of storing 2D arrays in guns.

var gun = argument0;
var field = argument1;
var i = argument2;
var j = argument3;
var value = argument4;

var name = field + string(round(i));
if (!ds_map_exists(gun, name)) {
    ds_map_add_list(gun, name, ds_list_create());
}
var list = gun[? name];
list[| j] = value;
