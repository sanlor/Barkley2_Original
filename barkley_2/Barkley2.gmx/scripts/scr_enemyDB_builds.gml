///scr_enemyDB_builds(object_name)
//Returns an array of the builds contained for the object name, returns 0 length array if not found
//NOTE: Do NOT supply an object index / id. You must supply a string name.
var _arr, _nam, _dsm, _i;
if (string(argument0) == "") return 0;
_nam = string_replace(string(argument0), "o_enemy_", "");
if (ds_map_exists(global.enemyDB, _nam))
{
    _dsm = ds_map_find_value(global.enemyDB, _nam);
    _i = 1;
    _arr[0] = "default"; //ds_map_find_value(dsm, "name");
    if (ds_map_find_value(_dsm, "build 1") != "") { _arr[_i] = ds_map_find_value(_dsm, "build 1"); _i += 1; }
    if (ds_map_find_value(_dsm, "build 2") != "") { _arr[_i] = ds_map_find_value(_dsm, "build 2"); _i += 1; }
    if (ds_map_find_value(_dsm, "build 3") != "") { _arr[_i] = ds_map_find_value(_dsm, "build 3"); _i += 1; }
    return _arr;
}
return 0;
