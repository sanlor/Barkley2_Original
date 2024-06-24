/// scr_enemy_junkbot_attachPartFromJunk(o_wasteland_junk_enemypart)

var part = argument0;

if (part.partObject == noone) {
    return 0;
}

var detachedPart = scr_enemy_junkbot_attachPart(part.partObject, part.partType);

if (detachedPart != noone and instance_exists(detachedPart)) {
    with (part) {
        partType = detachedPart.partType;
        partObject = detachedPart.partObject;
        pickupCooldown = detachedPart.pickupCooldown;
        scr_entity_animation_define(ANIMATION_DEFAULT, object_get_sprite(partObject), 0, 1, 0);
    }
    with (detachedPart) instance_destroy();
} else {
    with (part) instance_destroy();
}
