// scr_player_onDamageHook(damage)

var damage = argument0;

var gun = scr_equipment_guns_getCurrentGun();

if (gun != NULL) {
    gun[? "pChargeHurt"] += damage;
}

