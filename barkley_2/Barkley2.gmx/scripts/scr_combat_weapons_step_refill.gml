/// scr_combat_weapons_step_refill(gun)
var userId = argument0;
var gun = argument1;

if !(scr_input_check_held(KEYID_ACTION, PLAYER1)) then
    {
    if gun[? "pCurAmmo"] <= gun[? "pMaxAmmo"] * 0.2 then
        {
        if gun[? "bAmmoChangeTimer"] > 0 then gun[? "bAmmoChangeTimer"] -= dt();
        else
            {
            if gun[? "pCurAmmo"] < (gun[? "pMaxAmmo"] * 0.2 - gun[? "bAmmoChange"]) then gun[? "pCurAmmo"] += gun[? "bAmmoChange"];
            else gun[? "pCurAmmo"] = gun[? "pMaxAmmo"] * 0.2;
            gun[? "bAmmoChangeTimer"] = 1;
            }
        }
    }
if (scr_input_check_released(KEYID_ACTION, PLAYER1)) then gun[? "bAmmoChangeTimer"] = 5;


