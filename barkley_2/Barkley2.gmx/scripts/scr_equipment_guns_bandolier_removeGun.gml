/// scr_equipment_guns_bandolier_removeGun(slot)

var slot = argument0;

var list = scr_equipment_guns_bandolier_list();
if (slot < ds_list_size(list)) {
    return ds_list_delete(list, slot);
}
