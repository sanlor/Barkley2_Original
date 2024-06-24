/// scr_equipment_guns_getCurrentGun()
/// Returns current gun, or NULL if none

var slot = scr_savedata_get("player.guns.equipSlot");
if (scr_equipment_guns_bandolier_equippedFrom()) {
    return scr_equipment_guns_bandolier_getGun(slot);
} else {
    return scr_equipment_guns_bag_getGun(slot);
}
