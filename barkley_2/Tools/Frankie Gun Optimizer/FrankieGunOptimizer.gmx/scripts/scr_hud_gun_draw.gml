///scr_hud_gun_draw(gun_sprite_index, gun_subimage, x, y)

//First get the gun sheet id of the gun, which is the material divided by gunPerSheet
var gunSht = floor(argument1 / global.gunPerSheet);

//Now check if the sheet is loaded, if not, load it up
if (global.gunSheetSprite[gunSht] == -1)
{
    var tim = get_timer();
    global.gunSheetSprite[gunSht] = sprite_add("Guns/FrankieGuns" + string(gunSht) + ".png", 1, 1, 0, 0, 0);
    show_debug_message("Sheet ID " + string(gunSht) + " loaded on demand in " + string((get_timer() - tim) / 1000000) + " seconds.");
}

//Draw the gun from the sheet
var ext = argument1 mod global.gunPerSheet;
var typ = global.gunSwap[? argument0];
draw_sprite_part(global.gunSheetSprite[gunSht], 0, (ext * global.gunWidth), (typ * global.gunHeight), global.gunWidth, global.gunHeight, argument2, argument3);
