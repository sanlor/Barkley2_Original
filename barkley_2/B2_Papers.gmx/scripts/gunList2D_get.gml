/// gunList2D_get(gun, field, i, j)
/// Grants the illusion of storing 2D arrays in guns.

var gun = argument0;
var field = argument1;
var i = argument2;
var j = argument3;

var name = field + string(round(i));
var list = gun[? name];
return list[| j];
