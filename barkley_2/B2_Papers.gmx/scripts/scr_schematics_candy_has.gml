/// scr_schematics_candy_has(candyName)

var candyName = argument0;

var list = scr_schematics_candy_getList();
for (var i = 0; i < ds_list_size(list); i++) {
    var map = list[| i];
    if (map[? "name"] == candyName) {
        return true;
    }
}
return false;
