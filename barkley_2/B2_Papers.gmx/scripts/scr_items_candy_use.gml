/// scr_items_candy_use(pos)

if (!instance_exists(o_hoopz)) {
    return 0;
}

var candyPos = argument0;
scr_items_candy_use_fromMap(scr_items_get(ITEMTYPE_CANDY, candyPos));

// Delete candy
scr_items_delete(ITEMTYPE_CANDY, candyPos);
