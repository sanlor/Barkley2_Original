/// The charge runs forwards and triggers an action when it
/// reaches an enemy.

var _action, conf;

_action = argument0;

if(_action == "config")
{
    var conf = ds_map_create();
    conf[? "mask"] = mask_disk_16by16;
    conf[? "dmg"] = 5;
    conf[? "deathEvent"] = NULL;
    conf[? "knockback"] = 20;
    conf[? "sndAttack"] = NULL;
    return conf;
}

if (_action = "reset")
{
    var conf = argument1;
}

if (_action = "execute")
{
    var conf = argument1;
    scr_entity_setMoveXY(0, 0);

    // Kill me
    if (conf[? "deathEvent"] >= 0) {
        event_user(conf[? "deathEvent"]);
    }
    scr_stats_setCurrentStat(self, STAT_CURRENT_HP, 0);


    return AI_STATERESULT_CONTINUE;
}
