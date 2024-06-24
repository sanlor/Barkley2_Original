/// scr_equipment_guns_bandolier_getSlot(gun)
/// Return slot of gun, or NULL

var gun = argument0;

var list = scr_equipment_guns_bandolier_list();
for (var i = 0; i < ds_list_size(list); i++) {
    var g = list[| i];
    if (g == gun) {
        return i;
    }
}
return NULL;
