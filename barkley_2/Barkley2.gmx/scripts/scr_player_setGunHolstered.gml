/// scr_player_setGunHolstered(holstered)

var holstered = argument0;

scr_savedata_put("player.guns.holstered", holstered);

if (holstered)
{
    if (instance_exists(o_hoopz)) combat_gunwield_unequip(o_hoopz, scr_equipment_guns_getCurrentGun());
}
