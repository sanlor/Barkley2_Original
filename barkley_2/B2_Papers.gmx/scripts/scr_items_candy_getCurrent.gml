/// scr_items_candy_getCurrent()
/// Returns position of current candy, or NULL if no candy.

var count = scr_items_count(ITEMTYPE_CANDY);
if (count == 0) {
    scr_items_candy_setCurrent(NULL);
    return NULL;
}
else {
    return scr_math_mod(scr_savedata_get("player.items.currentCandy"), count);
}
