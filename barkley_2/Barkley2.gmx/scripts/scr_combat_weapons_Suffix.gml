/// scr_combat_weapons_Suffix(affix, action, bulletOrNoone, gunOrNull)
var affixScript = ds_map_find_value(global.suffixMap, argument0);
if (is_undefined(affixScript) == 0)
{
    script_execute(affixScript, argument1, argument2, argument3);
}
else
    show_debug_message("scr_combat_weapons_Suffix > Missing Suffix data. You need to update " + argument0 + " to it's new name");
