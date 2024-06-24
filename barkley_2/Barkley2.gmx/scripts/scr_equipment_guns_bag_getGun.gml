/// scr_equipment_guns_bag_getGun(slot)

var slot = argument0;

var list = scr_equipment_guns_bag_list();
if (slot >= ds_list_size(list) or slot < 0) {
    return NULL;
} else {
    return list[| slot];
}
