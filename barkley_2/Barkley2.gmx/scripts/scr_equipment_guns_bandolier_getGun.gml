/// scr_equipment_guns_bandolier_getGun(slot)
/// Returns the gun from the slot, or NULL

var slot = argument0;

var list = scr_equipment_guns_bandolier_list();
if (slot >= ds_list_size(list) or slot < 0) {
    return NULL;
} else {
    return list[| slot];
}
