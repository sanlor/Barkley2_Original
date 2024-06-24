/// scr_items_draw_ext(item, x, y, xscale, yscale, rot, color, alpha)

var item = argument0;

if (item != NULL) {
    var sprite = assetOrNull(item[? "sprite"], asset_sprite);
    if (sprite != NULL) {
        draw_sprite_ext(sprite, item[? "image"],
                        argument1, argument2, argument3, argument4, argument5, argument6, argument7);
    }
}
