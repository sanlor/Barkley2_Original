/// scr_equipment_guns_bag_equip(slot)

combat_gunwield_unequip(o_hoopz, scr_equipment_guns_getCurrentGun());

scr_savedata_put("player.guns.equipSlot", argument0);
scr_savedata_put("player.guns.equipFrom", "bag");
