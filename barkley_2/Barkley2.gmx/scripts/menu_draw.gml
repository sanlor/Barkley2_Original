/// menu_draw(menu, x, y)

var menu = argument0;
var drawx = argument1;
var drawy = argument2;

var drawQueue = ds_priority_create();


// Add all items and decals ordered by priority
items = menu[? "items"];
for (var i = 0; i < ds_list_size(items); i++) {
    var item = items[| i];
    var d = item[? "depth"];
    ds_priority_add(drawQueue, item, d);
}

decals = menu[? "decals"];
for (var i = 0; i < ds_list_size(decals); i++) {
    var decal = decals[| i];
    var d = decal[? "depth"];
    ds_priority_add(drawQueue, decal, d);
}

while (ds_priority_size(drawQueue) > 0) {
    var item = ds_priority_delete_max(drawQueue);
    var drawscript = item[? "draw_script"];
    script_execute(drawscript, menu, item, drawx, drawy);
}
ds_priority_destroy(drawQueue);
