/// scr_equipment_guns_bandolier_addGun(gun)
/// Returns TRUE, or FALSE if adding gun failed

var gun = argument0;

var list = scr_equipment_guns_bandolier_list();
var maxSlots = scr_equipment_guns_bandolier_getSlotsTotal();

if (ds_list_size(list) < maxSlots) {
    ds_list_add_map(list, gun);
    return true;
} else {
    return false;
}
