/// scr_combat_weapons_step_beamgun(gun)
// Ripping off the FF7 cart ride lazer thing //
var userId = argument0;
var gun = argument1;
if !(scr_input_check_held(KEYID_ACTION, PLAYER1)) then
    {
    if gun[? "bAmmoChangeTimer"] > 0 then gun[? "bAmmoChangeTimer"] -= dt();
    else
        {
        gun[? "pCurAmmo"] += gun[? "pMaxAmmo"] * dt_sec();
        gun[? "pCurAmmo"] = clamp(gun[? "pCurAmmo"], 0, gun[? "pMaxAmmo"]);
        //gun[? "pRatioAmmo"] = gun[? "pCurAmmo"] / gun[? "pMaxAmmo"];
        }
    }
if (scr_input_check_released(KEYID_ACTION, PLAYER1)) then gun[? "bAmmoChangeTimer"] = 20;

/*
if !(scr_input_check_held(KEYID_ACTION, PLAYER1)) then
    {
    if gun[? "bAmmoChangeTimer"] > 0 then gun[? "bAmmoChangeTimer"] -= dt();
    else
        {
        if gun[? "pCurAmmo"] < (gun[? "pMaxAmmo"] - gun[? "bAmmoChange"]) then gun[? "pCurAmmo"] += gun[? "bAmmoChange"];
        else gun[? "pCurAmmo"] = gun[? "pMaxAmmo"];
        gun[? "bAmmoChangeTimer"] = 1;
        gun[? "pRatioAmmo"] = gun[? "pCurAmmo"] / gun[? "pMaxAmmo"];
        }
    }
if (scr_input_check_released(KEYID_ACTION, PLAYER1)) then gun[? "bAmmoChangeTimer"] = 20;




