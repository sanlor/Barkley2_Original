/// scr_AI_init()

AI_states_global = ds_list_create();
AI_states_passive = ds_list_create();
AI_states_active = ds_list_create();
AI_actions = ds_list_create();
AI_movement_scripts = ds_list_create();
AI_switch = NULL;

AI_alertTimer = -1; /// -1:not alerted  0+:alert (can be used as a timer before going back to passive state)
scr_AI_setSwitch(scr_AI_switch_noAI);
scr_AI_setSwitchEnabled(true);

// AI Statestack
AI_statestack = ds_list_create();
AI_stateTop = -1;
AI_stateTopScript = -1;
AI_stateTopType = 0;
AI_stateCount = 0;

// AI Global states
AI_globalState_stagger = NULL;
scr_AI_setGlobalState_stagger(scr_AI_global_staggerStandard);

AI_decisionFrequency = 10;
AI_decisionTimer = AI_decisionFrequency;
