var command = argument0;

if(command == "config") {
    var conf = ds_map_create();
    conf[? "switchTime"] = 4;
    conf[? "switchTimeRand"] = 10;
    return conf;
}

if (command = "reset") {
    var conf = argument1;
    
    I_aAI_catfish_jumpDir = 1;
    I_aAI_catfish_jumpDirTimer = conf[? "switchTime"] + random(conf[? "switchTimeRand"]);
    
    if (conf[? "walkScript"] == NULL) {
        conf[? "walkScript"] = scr_AI_movement_init(scr_AI_movementType_hopping);
    }
}

if (command = "execute") {
    var conf = argument1;
    
    I_aAI_catfish_jumpDirTimer -= dt();
    if (I_aAI_catfish_jumpDirTimer <= 0) {
        I_aAI_catfish_jumpDirTimer += conf[? "switchTime"] + random(conf[? "switchTimeRand"]);
        I_aAI_catfish_jumpDir = -I_aAI_catfish_jumpDir;
    }
    else if (!scr_collision_place_free(x + 72 * I_aAI_catfish_jumpDir, y, COLLISION_NORMAL)) {
        I_aAI_catfish_jumpDirTimer = conf[? "switchTime"] + random(conf[? "switchTimeRand"]);
        I_aAI_catfish_jumpDir = -I_aAI_catfish_jumpDir;
    }
    
    scr_AI_movement_doMove(conf[? "walkScript"], x + 48 * I_aAI_catfish_jumpDir, y);
    
    return AI_STATERESULT_CONTINUE;
}
