/// scr_combat_weapons_step_reaper(gun)
var userId = argument0;
var gun = argument1;

// Apply to all combat actors //
if instance_exists(CombatActor) and instance_exists(o_hoopz) and gun[? "pCurAmmo"] > 0 then
    {
    with CombatActor
        {
        if distance_to_object(o_hoopz) <= 150 then scr_statusEffect_applyFromScriptToCombatActor(statusEffect_undying, id);
        }
    }

// Bullets keep falling out //
if !(scr_input_check_held(KEYID_ACTION, PLAYER1)) then
    {
    if gun[? "bAmmoChangeTimer"] > 0 then gun[? "bAmmoChangeTimer"] -= dt();
    else
        {
        if gun[? "pCurAmmo"] > 0 then gun[? "pCurAmmo"] += gun[? "bAmmoChange"];
        else gun[? "pCurAmmo"] = 0;
        gun[? "bAmmoChangeTimer"] = 1;
        }
    }
if (scr_input_check_released(KEYID_ACTION, PLAYER1)) then gun[? "bAmmoChangeTimer"] = 5;




