// This is the hook that is triggered when the unit is staggered

// Check if there is a stagger state defined
if (AI_globalState_stagger != NULL) {
    
    // Remove Action states
    while (AI_stateTopType = AI_STATETYPE_ACTION) {
        scr_AI_statePop(0);
    }
    
    var staggerStateScript = ds_map_find_value(AI_globalState_stagger, "script");
    if (AI_stateTopScript != staggerStateScript) {
        // Push stagger state
        scr_AI_statePush(AI_globalState_stagger);
    }
}
