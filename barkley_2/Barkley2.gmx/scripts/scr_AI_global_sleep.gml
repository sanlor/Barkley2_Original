var _action, _retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    return conf;
}

if (_action == "reset")
{
}

if (_action == "execute")
{
    conf = argument1;

    scr_entity_setMoveXY(0, 0);
    a_attackName = "";
    a_walking = false;
    
    var statusEffectSleep = scr_statusEffect_getFromCombatActor(self.id, statusEffect_sleep)
    var statusEffectStun = scr_statusEffect_getFromCombatActor(self.id, statusEffect_stun)
    if (statusEffectSleep == NULL and statusEffectStun == NULL) {
        // Exit
        return AI_STATERESULT_REMOVE;
    }
    
    return AI_STATERESULT_CONTINUE;   
}
