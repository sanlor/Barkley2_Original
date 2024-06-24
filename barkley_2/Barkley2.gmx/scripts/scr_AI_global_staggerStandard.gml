var _action, _retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    return conf;
}

if (_action == "reset")
{
    conf = argument1;
}

if (_action == "execute")
{
    conf = argument1;
    
    scr_entity_setMoveXY(0, 0);
    a_attackName = "stagger";
    
    if (scr_stats_getCurrentStat(self.id, STAT_CURRENT_STAGGER_TIME) <= 0) {
        // Exit
        a_attackName = "";
        return AI_STATERESULT_REMOVE;
    }
    
    return AI_STATERESULT_CONTINUE;   
}
