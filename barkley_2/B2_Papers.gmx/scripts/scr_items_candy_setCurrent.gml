/// scr_items_candy_setCurrent(pos)

var current = argument0;

var count = scr_items_count(ITEMTYPE_CANDY);
if (count == 0) {
    scr_savedata_put("player.items.currentCandy", NULL);
}
else {
    scr_savedata_put("player.items.currentCandy", scr_math_mod(current, count));
}
