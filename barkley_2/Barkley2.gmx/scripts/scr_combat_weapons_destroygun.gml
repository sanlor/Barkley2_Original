/// scr_combat_weapons_destroygun(gun)
/// Return: 0 = Not found, 1 = Deleted from pouch, 2 = Deleted from gunbag reserve, 3 = Deleted from gunbag empty

var gun = argument0;

// Look in bandolier
var slot = scr_equipment_guns_bandolier_getSlot(gun);
if (slot != NULL) {
    scr_equipment_guns_bandolier_removeGun(slot);
} else {
    // Look in bag
    slot = scr_equipment_guns_bag_getSlot(gun);
    scr_equipment_guns_bag_removeGun(slot);
}
