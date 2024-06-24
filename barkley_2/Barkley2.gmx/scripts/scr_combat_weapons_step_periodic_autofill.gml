/// scr_combat_weapons_step_periodic_autofill(gun)
var userId = argument0;
var curGun = argument1;

curGun[? "pChargeCur"] += (curGun[? "pChargeMax"] * dt_sec()) / 4;
curGun[? "pChargeCur"] = clamp(curGun[? "pChargeCur"], 0, curGun[? "pChargeMax"]);
curGun[? "pChargeRatio"] = curGun[? "pChargeCur"] / curGun[? "pChargeMax"];

