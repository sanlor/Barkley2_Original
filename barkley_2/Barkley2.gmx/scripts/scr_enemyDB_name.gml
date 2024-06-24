///scr_enemyDB_name(object name)
//Returns name of enemy, empty string if not found
//NOTE: Do NOT supply an object index / id. You must supply a string name.
var _nam;
if (string(argument0) == "") return "";
_nam = string_replace(string(argument0), "o_enemy_", "");
if (ds_map_exists(global.enemyDB, _nam))
{
    return ds_map_find_value(ds_map_find_value(global.enemyDB, _nam), "name");;
}
return "";
