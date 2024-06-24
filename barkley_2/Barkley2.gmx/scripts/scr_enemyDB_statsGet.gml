/// scr_enemyDB_statsGet(build name?, object name?)
var _bld, _obj, _map, _ene, _G, _L, _A, _M, _P;
var gunsdrop = 0; 
var matGen = 0; var matBio = 0; var matCyb = 0; var matMen = 0; var matCos = 0; var matZau = 0;
var typAut = 0; var typMou = 0; var typPis = 0; var typPro = 0;  var typRif = 0;  var typSho = 0;
_obj = object_get_name(object_index);
_bld = "default";
if (argument_count > 0) _bld = argument[0];
if (argument_count > 1) _obj = argument[1];

// Verify enemy exists in the DB first
if (string(_obj) == "") { show_debug_message("scr_enemyDB_statsGet(): Invalid object sent to script. Can't get stats."); return 0; }
_obj = string_replace(string(_obj), "o_enemy_", "");
_ene = ds_map_find_value(global.enemyDB, _obj);
if (is_undefined(_ene)) { show_debug_message("scr_enemyDB_statsGet(): No such object name >" + _obj + "<"); return 0; }

// Get stats
_map = ds_map_find_value(_ene, "default");
for (var iii = 0; iii < 2; iii += 1)
{
    if (is_undefined(_map)) 
    { 
        if (iii == 0) { show_debug_message("scr_enemyDB_statsGet(): No default build for object name >" + _obj + "<"); return 0; }
        else show_debug_message("scr_enemyDB_statsGet(): No such build >" + _bld + "< for object name >" + _obj + "<, using default build values."); 
    }
    else
    {
        // GLAMP
        if (_map[? "guts"] != "") _G = real(_map[? "guts"]);
        if (_map[? "luck"] != "") _L = real(_map[? "luck"]);
        if (_map[? "agile"] != "") _A = real(_map[? "agile"]);
        if (_map[? "might"] != "") _M = real(_map[? "might"]);
        if (_map[? "piety"] != "") _P = real(_map[? "piety"]);
        
        // Resistances
        if (_map[? "resistance_bio"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_BIO,    real(_map[? "resistance_bio"]) - 100);
        if (_map[? "resistance_cyber"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_CYBER,  real(_map[? "resistance_cyber"]) - 100);
        if (_map[? "resistance_cosmic"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_COSMIC, real(_map[? "resistance_cosmic"]) - 100);
        if (_map[? "resistance_zauber"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_ZAUBER, real(_map[? "resistance_zauber"]) - 100);
        if (_map[? "resistance_mental"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_MENTAL, real(_map[? "resistance_mental"]) - 100);
        
        // Vulnerabilities
        if (_map[? "vuln_bio"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_VULN_BIO,    real(_map[? "vuln_bio"]));
        if (_map[? "vuln_cyber"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_VULN_CYBER,  real(_map[? "vuln_cyber"]));
        if (_map[? "vuln_cosmic"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_VULN_COSMIC, real(_map[? "vuln_cosmic"]));
        if (_map[? "vuln_zauber"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_VULN_ZAUBER, real(_map[? "vuln_zauber"]));
        if (_map[? "vuln_mental"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_VULN_MENTAL, real(_map[? "vuln_mental"]));
        
        // Extras
        if (_map[? "hp"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_HP,                   real(_map[? "hp"]));
        if (_map[? "speed"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_SPEED,                real(_map[? "speed"]));
        if (_map[? "weight"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_WEIGHT,               real(_map[? "weight"]));
        if (_map[? "resistance_normal"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_NORMAL,    real(_map[? "resistance_normal"]));
        if (_map[? "resistance_knockback"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_KNOCKBACK, real(_map[? "resistance_knockback"]));
        if (_map[? "resistance_stagger"] != "")
            scr_stats_setBaseStat(self, STAT_BASE_RESISTANCE_STAGGER,   real(_map[? "resistance_stagger"]));
        
        // OLD
        if (_map[? "droplist"] != "") droplist = "default"; //_map[? "droplist"];
        
        // NEW
        if (ds_map_exists(_map, "wtc") && _map[? "wtc"] != "") thinkfluencing = real(_map[? "wtc"]);
        AI_decisionFrequency = thinkfluencing;
        
        // Boss Alignment
        if(ds_map_exists(_map, "alignment_ethical") && _map[? "alignment_ethical"] != "")
            alignment_ethical = real(_map[? "alignment_ethical"]);
        if(ds_map_exists(_map, "alignment_ethical") && _map[? "alignment_moral"] != "")
            alignment_moral = real(_map[? "alignment_moral"]);
        
        // Dropdata
        if (ds_map_exists(_map, "gunsdrop") && _map[? "gunsdrop"] != "") gunsdrop = real(_map[? "gunsdrop"]);
        if (ds_map_exists(_map, "generic") && _map[? "generic"] != "") matGen = real(_map[? "generic"]);
        if (ds_map_exists(_map, "bio") && _map[? "bio"] != "") matBio = real(_map[? "bio"]);
        if (ds_map_exists(_map, "cyber") && _map[? "cyber"] != "") matCyb = real(_map[? "cyber"]);
        if (ds_map_exists(_map, "mental") && _map[? "mental"] != "") matMen = real(_map[? "mental"]);
        if (ds_map_exists(_map, "cosmic") && _map[? "cosmic"] != "") matCos = real(_map[? "cosmic"]);
        if (ds_map_exists(_map, "zauber") && _map[? "zauber"] != "") matZau = real(_map[? "zauber"]);
        if (ds_map_exists(_map, "automatic") && _map[? "automatic"] != "") typAut = real(_map[? "automatic"]);
        if (ds_map_exists(_map, "mounted") && _map[? "mounted"] != "") typMou = real(_map[? "mounted"]);
        if (ds_map_exists(_map, "pistols") && _map[? "pistols"] != "") typPis = real(_map[? "pistols"]);
        if (ds_map_exists(_map, "projectile") && _map[? "projectile"] != "") typPro = real(_map[? "projectile"]);
        if (ds_map_exists(_map, "rifles") && _map[? "rifles"] != "") typRif = real(_map[? "rifles"]);
        if (ds_map_exists(_map, "shotguns") && _map[? "shotguns"] != "") typSho = real(_map[? "shotguns"]);
        ds_map_destroy(dropdata);
        dropdata = Drop("define", gunsdrop, matGen, matBio, matCyb, matMen, matCos, matZau, typAut, typMou, typPis, typPro, typRif, typSho);
    }
    if (_bld != "default") _map = ds_map_find_value(_ene, _bld); else break;
    //if (object_index == o_woodBarrel) show_debug_message("Barrel > " + string(_bld));
}

// Assign stats - random roll removed
scr_stats_rollBaseStats(0, _G, _L, _A, _M, _P);
scr_stats_genEffectiveStats();
scr_stats_resetCurrentStats();
