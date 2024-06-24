/// scr_equipment_guns_bag_removeGun(slot)

var slot = argument0;

var list = scr_equipment_guns_bag_list();
if (slot >= 0 and slot < ds_list_size(list)) {
    return ds_list_delete(list, slot);
}
