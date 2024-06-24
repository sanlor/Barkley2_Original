/// scr_equipment_guns_bag_addGun(gun)
/// Returns TRUE, or FALSE if adding gun failed

var gun = argument0;

var list = scr_equipment_guns_bag_list();
var maxSlots = scr_equipment_guns_bag_getSlotsTotal();

if (ds_list_size(list) < maxSlots) {
    ds_list_add_map(list, gun);
    return true;
} else {
    return false;
}
