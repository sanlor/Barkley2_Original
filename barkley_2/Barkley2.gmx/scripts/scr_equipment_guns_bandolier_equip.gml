/// scr_equipment_guns_bandolier_equip(slot)

if (scr_savedata_contains("player.guns.equipSlot")) {
    combat_gunwield_unequip(o_hoopz, scr_equipment_guns_getCurrentGun());
}

scr_savedata_put("player.guns.equipSlot", argument0);
scr_savedata_put("player.guns.equipFrom", "bandolier");
