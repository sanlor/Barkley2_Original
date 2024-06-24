var actor =  argument0;

if (predicate_AI_isWading(id)) {
    return false;
}

var target = actor.I_AI_target;
if (target > 0 and instance_exists(target)) {
    if (scr_statusEffect_getFromCombatActor(target, statusEffect_entangled) != -1) {
        return false;
    } else {
        return true;
    }
} else {
    return true;
}
