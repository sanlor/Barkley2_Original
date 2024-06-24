/// scr_enemy_junkbot_attachPart(partObject, partType)

var partObject = argument0;
var partType = argument1;

// Create new part
var newPart = instance_create(x, y, partObject);
newPart.parent = id;

// Add new part
var prevPart = parts[? partType];
var prevAction = actions[? partType];
parts[? partType] = newPart;
actions[? partType] = NULL;

// Clear AI states
scr_AI_stateClearAll();

// Detach earlier part
var detachedPart = noone;
if (prevPart != noone and instance_exists(prevPart)) {
    detachedPart = instance_create(x, y, o_wasteland_junk_enemypart);
    detachedPart.partType = partType;
    detachedPart.partObject = prevPart.object_index;
    detachedPart.pickupCooldown = 600;
    with (detachedPart) {scr_entity_animation_define(ANIMATION_DEFAULT,
                      object_get_sprite(prevPart.object_index), 0, 1, 0)}                  
    
    with (prevPart) {instance_destroy()}
}

// If previous part had an action, remove it
if (prevAction != NULL) {
    scr_AI_deleteState(prevAction);
}

// If new part has an action, add it
if (newPart.action != NULL) {
    // Action: Pick up nearby part
    var attack = scr_AI_switch_standard("new_attack", conf);
    var action = scr_AI_addAction(newPart.action);
    attack[? "action"] = action; 
    
    if (newPart.actionConf != NULL) {
        var key = ds_map_find_first(newPart.actionConf);
        for (var i = 0; i < ds_map_size(newPart.actionConf); i++) {
            var value = ds_map_find_value(newPart.actionConf, key);    
            action[? key] = value;
            key = ds_map_find_next(newPart.actionConf, key);
        }
    }
    
    if (newPart.attackConf != NULL) {
        var key = ds_map_find_first(newPart.attackConf);
        for (var i = 0; i < ds_map_size(newPart.attackConf); i++) {
            var value = ds_map_find_value(newPart.attackConf, key);    
            attack[? key] = value;
            key = ds_map_find_next(newPart.attackConf, key);
        }
    }
    
    actions[? partType] = action;
}

// Set new movement states based on leg part
if (partType == "legs") {
    scr_AI_movement_reset(newPart.walkRoam);
    scr_AI_movement_reset(newPart.walkStrafe);
    passiveRoaming[? "walkScript"] = newPart.walkRoam;
    activeApproach[? "walkScript"] = newPart.walkStrafe;
    activeHangback[? "walkScript"] = newPart.walkStrafe;
}

// Clear AI states
scr_AI_stateClearAll();

return detachedPart;
