/// scr_getGunFromIndex(gunIndex)
/// Returns the gun object, or NULL

var _gunIndex = argument0

if(_gunIndex < scr_equipment_guns_bandolier_getSlotsUsed()) {
    return scr_equipment_guns_bandolier_getGun(_gunIndex);
} else {
    return scr_equipment_guns_bag_getGun(_gunIndex - scr_equipment_guns_bandolier_getSlotsUsed());
}
