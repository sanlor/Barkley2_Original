/// scr_combat_weapons_prefix2(affix, action, bulletOrNoone, gunOrNull)
var affixScript = ds_map_find_value(global.prefix2Map, argument0); //global.prefix2Map[? argument0];
if (is_undefined(affixScript) == 0)
{
    //if (affixScript == statusEffect_null) return 0;
    if (argument2 != noone)
    {
        if (affixScript == statusEffect_null) argument2.prefix2Has = 0;
        else argument2.prefix2Has = 1;
        argument2.prefix2Name = ds_map_find_value(global.prefix2HitName, argument0); //argument0;
        argument2.prefix2Color = ds_map_find_value(global.prefix2Color, argument0);
        argument2.prefix2Script = affixScript;
    }
    script_execute(affixScript, argument1, argument2, argument3);
}
else
    show_debug_message("scr_combat_weapons_Prefix2 > Missing Prefix2 data. You need to update " + argument0 + " to it's new name");
