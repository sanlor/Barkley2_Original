/// scr_player_calculateWeight()

// Gun weight
var weight = 0;
var curGun = scr_player_equip("object");

if (!scr_player_getGunHolstered() && curGun != NULL) {
    weight += curGun[? "pWeight"];
}

// Jerkin
var jerkinName = Jerkin("current");
if (jerkinName != NULL_STRING && Jerkin("has", jerkinName)) {
    var jerkin = Jerkin("data", jerkinName);
    weight += jerkin[? "weight"];
}    

scr_stats_setBaseStat(o_hoopz, STAT_BASE_WEIGHT, weight);
