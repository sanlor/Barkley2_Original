/// scr_event_entity_settings(object, interact_enabled, collision_enabled, shadow_enable);
with (argument[0])
{
    _interactive = argument[1];
    _disableOutline = !argument[1];
    
    if (argument[2] == 0) scr_actor_unsetRigid(id); 
    else scr_actor_setRigid(id);
    scr_actor_instantRigid(id);
    
    shadow_visible = argument[3];
}
