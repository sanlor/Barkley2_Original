/// scr_combat_weapons_step_refill(gun)
var userId = argument0;
var gun = argument1;

if !(scr_input_check_held(KEYID_ACTION, PLAYER1))
{
    if (gun[? "bAmmoChangeTimer"] > 0) gun[? "bAmmoChangeTimer"] -= dt();
    else
    {
        if (gun[? "pCurAmmo"] > 0)
        {
            gun[? "pCurAmmo"] += gun[? "bAmmoChange"];
            var actor = PlayerCombatActor;
            var casing = assetOrNull(gun[? "bcasing"], asset_sprite);
            if (casing != NULL && instance_exists(actor))
            {
                var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_wading);
                var swimmove = 0;
                if (current > 0) swimmove = ds_map_find_value(current, "wadingDepthCurrent");
                _casing = instance_create(actor.x , actor.y, o_casings);
                _casing.z = actor.z + 10 - swimmove;
                _casing.casingSound = gun[? "casingSound"];//"hoopz_shellcasings";
                _casing.sprite_index = casing;
                var _dir = actor.look_dir_discrete + gun[? "bcasingDir"] -10+random(20);
                var _spd = gun[? "bcasingSpd"]+random(1);
                with (_casing) scr_entity_setDirSpd(_dir, _spd);
                _casing.rot = gun[? "bcasingRot"];
                _casing.rotspd = gun[? "bcasingSpin"];
                _casing.scale = gun[? "bcasingScale"];
                _casing.move_z = (- gun[? "bcasingVertSpd"] - random(1));
                _casing.col = gun[? "bcasingCol"];
            }
        }
        else gun[? "pCurAmmo"] = 0;
        gun[? "bAmmoChangeTimer"] = 10;
    }
}
if (scr_input_check_released(KEYID_ACTION, PLAYER1)) then gun[? "bAmmoChangeTimer"] = 10;
